/**
 * Copyright 2015 IBM Corp. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

const express = require('express');
//var ffmpeg = require('/usr/local/bin/ffmpeg');
var FfmpegCommand = require('fluent-ffmpeg');
var path = require('path');
const fs = require('fs');
var tmpdir = __dirname + '/tmpdir';

if (!fs.existsSync(tmpdir))
      fs.mkdirSync(tmpdir);


//var converted_video_file = fs.openSync(__dirname + '/' + 'tmpdir' + '/' + 'stripped_audio.mp3', 'w');  //temporary file for converting videos

const app = express();
const { IamTokenManager } = require('ibm-watson/auth');

// Bootstrap application settings
require('./config/express')(app);

const serviceUrl = process.env.SPEECH_TO_TEXT_URL;

const tokenManager = new IamTokenManager({
  apikey: process.env.SPEECH_TO_TEXT_IAM_APIKEY || '<iam_apikey>',
});


app.get('/', (req, res) => res.render('index'));

require('dotenv').config({ silent: true });
const stt = require('watson-speech/speech-to-text')

const SpeechToTextV1 = require('ibm-watson/speech-to-text/v1');

const { IamAuthenticator } = require('ibm-watson/auth');


// const recognizeStream = speechToText.recognizeUsingWebSocket(params);
// fs.createReadStream(__dirname + '/resources/speech.wav').pipe(recognizeStream);

const auth = new IamAuthenticator({
  apikey: process.env.SPEECH_TO_TEXT_IAM_APIKEY,
  // httpsAgent, // not necessary if using Basic or BearerToken authentication
  proxy: false,
})

const speechToText = new SpeechToTextV1({
  // See: https://github.com/watson-developer-cloud/node-sdk#authentication
  authenticator: auth,
  url: process.env.SPEECH_TO_TEXT_URL,
  apikey: process.env.SPEECH_TO_TEXT_IAM_APIKEY
});

const params = {
  contentType: 'audio/mp3',
  objectMode: true,
};

const multer = require('multer')
const cors = require('cors')
app.use(cors())

// var upload = multer({ dest: 'uploads/' }).single('audio')
app.use(multer({dest:'./uploads/'}).any());

// app.use(multer({dest:'./uploads/'}))
// app.use(upload);

app.post('/transcribe', (req, res) => {
  let files = req.files
  let allResults = []
  files.map( (file, idx) => {

    // check if file is a video - if so we need to run it through tool to convert to .mp3
    let extension = path.extname(file.originalname);
    let basename = path.basename(file.originalname);
    var transcribed_file = __dirname + '/' + file.path;
    var converted_video_file = __dirname + '/' + 'tmpdir' + '/' + 'stripped_audio.mp3'

    if (extension == ".mp4") {
        convert(transcribed_file, converted_video_file, function(err){
        //convert(transcribed_file, __dirname + '/' + 'tmpdir' + '/' + 'stripped_audio.mp3', function(err){
        if(!err) {
          console.log('conversion complete');
          transcribed_file = converted_video_file;
        }
        else {
          console.log('conversion error')
        }
      });
    }

    // run file through Speech to text API and send back the transcript
    const recognizeParams = {
      audio: fs.createReadStream(transcribed_file),
      contentType: 'application/octet-stream',
    }
    speechToText.recognize(recognizeParams)
      .then(speechRecognitionResults => {
        console.log(JSON.stringify(speechRecognitionResults, null, 2))
        allResults.push(speechRecognitionResults)
        if (idx == (files.length - 1)) {
          res.send(allResults)
        }
      })
      .catch(err => {
        res.send(500)
        console.log('error:', err);
    });
  })
})

// Get credentials using your credentials
app.get('/api/v1/credentials', async (req, res, next) => {
  try {
    const accessToken = await tokenManager.getToken();
    res.json({
      accessToken,
      serviceUrl,
    });
  } catch (err) {
    next(err);
  }
});


// Use the Ffmpeg library to convert a video to audio
function convert(input, output, callback) {

    FfmpegCommand(input)
        .output(output)
        .on('end', function() {
            console.log('conversion ended');
            callback(null);
        }).on('error', function(err){
            console.log('error: ', e.code, e.msg);
            callback(err);
        }).run();
}


module.exports = app;
