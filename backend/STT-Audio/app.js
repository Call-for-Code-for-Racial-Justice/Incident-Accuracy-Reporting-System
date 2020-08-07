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
const fs = require('fs');
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
  files.map( (file) => {
    const recognizeParams = {
      audio: fs.createReadStream(__dirname + '/' + file.path),
      contentType: 'audio/mp3',
    }
    speechToText.recognize(recognizeParams)
      .then(speechRecognitionResults => {
        console.log(JSON.stringify(speechRecognitionResults, null, 2));
        res.send(speechRecognitionResults)
      })
      .catch(err => {
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

// Send message to SalesForce - REST API setup
/* app.post('/send_audio_message', (req, res) => {
    if (!req.body) return res.sendStatus(400);
    console.log(req.body, "body");
    res.send('welcome, ' + req.body.username)
});*/

module.exports = app;
