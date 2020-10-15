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

 // Bringing in Dependencies

const express = require('express');
require('dotenv').config({ silent: true });
//var ffmpeg = require('/usr/local/bin/ffmpeg');
var FfmpegCommand = require('fluent-ffmpeg');
const lngDetector = new (require('languagedetect'));
//const langDetector = new LanguageDetect();
var path = require('path');
const fs = require('fs');
var tmpdir = __dirname + '/tmpdir';

if (!fs.existsSync(tmpdir))
      fs.mkdirSync(tmpdir);




// starting up the application

const app = express();
const { IamTokenManager } = require('ibm-watson/auth');

// Bootstrap application settings
require('./config/express')(app);




//Initiating and configuring the Cloud Services
app.get('/', (req, res) => res.render('index'));


//const stt = require('watson-speech/speech-to-text')
const LanguageTranslatorV3 = require('ibm-watson/language-translator/v3');

const SpeechToTextV1 = require('ibm-watson/speech-to-text/v1');

const { IamAuthenticator } = require('ibm-watson/auth');



const multer = require('multer')
const cors = require('cors')
app.use(cors())

app.use(multer({dest:'./uploads/'}).any());


// const recognizeStream = speechToText.recognizeUsingWebSocket(params);
// fs.createReadStream(__dirname + '/resources/speech.wav').pipe(recognizeStream);

/*if (process.env.SPEECH_TO_TEXT_URL && process.env.SPEECH_TO_TEXT_IAM_APIKEY) {

}*/


const serviceUrl = process.env.SPEECH_TO_TEXT_URL;

const tokenManager = new IamTokenManager({
  apikey: process.env.SPEECH_TO_TEXT_IAM_APIKEY || '<iam_apikey>',
});

const auth = new IamAuthenticator({
  apikey: process.env.SPEECH_TO_TEXT_IAM_APIKEY || '<iam_apikey>',
  // httpsAgent, // not necessary if using Basic or BearerToken authentication
  proxy: false,
})

// create speech service
const speechToText = new SpeechToTextV1({
  // See: https://github.com/watson-developer-cloud/node-sdk#authentication
  authenticator: auth,
  url: process.env.SPEECH_TO_TEXT_URL,
  apikey: process.env.SPEECH_TO_TEXT_IAM_APIKEY || '<iam_apikey>'
});

//create language translator service
const translator = new LanguageTranslatorV3({
  //version: '2019-10-10',
  version: '2018-05-01',
  authenticator: new IamAuthenticator({
    apikey: process.env.LANGUAGE_TRANSLATOR_IAM_APIKEY,
  }),
  url: process.env.LANGUAGE_TRANSLATOR_URL
});


// Define the Speech to Text Params
 var genParams = function (extension, transcribed_file, converted_video_file) {
    if (extension == ".mp4") {
        convert(transcribed_file, converted_video_file, function(err){
        //convert(transcribed_file, __dirname + '/' + 'tmpdir' + '/' + 'stripped_audio.mp3', function(err){
        if(!err) {
          console.log('conversion complete');
          transcribed_file = converted_video_file;
          // run file through Speech to text API and send back the transcript
          const recognizeParams = {
            audio: fs.createReadStream(converted_video_file),
            //contentType: 'application/octet-stream',
            contentType: 'audio/mp3',
          }
          return recognizeParams
        }
        else {
          console.log('conversion error')
        }   
      });
    } else {
    // run file through Speech to text API and send back the transcript
    const recognizeParams = {
      audio: fs.createReadStream(transcribed_file),
      contentType: 'application/octet-stream',
    }
    return recognizeParams
  }
}


// Call for initiating the app
app.post('/transcribe', (req, res) => {
  let files = req.files
  let allResults = []

  



  // let languageModel = req.body.model || "en-US_BroadbandModel"
  console.log(req.headers)

  // find out what language the assets is written or spoken in
  if (Object.keys(req.headers).includes('x-language')) {
    var languageModel = req.headers['x-language']
  } else {
    var languageModel = "en-US_BroadbandModel"
  }
  console.log(`transcribing using model ${languageModel}`)


  // Transcribe the audio / video file
  files.map( (file, idx) => {
    // check if file is a video - if so we need to run it through tool to convert to .mp3
    let extension = path.extname(file.originalname);
    let basename = path.basename(file.originalname);
    var transcribed_file = __dirname + '/' + file.path;
    var converted_video_file = __dirname + '/' + 'tmpdir' + '/' + 'stripped_audio.mp3'

    if (extension == ".mp4") {
        convert(transcribed_file, converted_video_file, function(err){
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
    // Set up the parms for the STT API
    const recognizeParams = {
       audio: fs.createReadStream(transcribed_file),
       contentType: 'audio/mp3',
       model: languageModel,
       profanityFilter: true
    }
     
    // Convert from speech to text
    speechToText.recognize(recognizeParams)
        .then(speechRecognitionResults => {
          console.log(JSON.stringify(speechRecognitionResults, null, 2))
          console.log("actual results", speechRecognitionResults.result.results[0].alternatives[0].transcript);
    

          if (!(languageModel == "en-US_BroadbandModel")) {
            translateString = speechRecognitionResults.result.results[0].alternatives[0].transcript;

            // set up LanguageTranslation Params
            const translateParams = {
              text: translateString,
              target: 'en'
            }

            // Translate to English and update the speechrecognition results
            translator.translate(translateParams)
              .then(translationResult => {
                console.log(JSON.stringify(translationResult, null, 2));
                speechRecognitionResults.result.results[0].alternatives[0].transcript = translationResult.result.translations[0].translation;
              })
              .catch(err => {
                console.log('error:', err);
              });
          }
          else
            console.log("english");

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
