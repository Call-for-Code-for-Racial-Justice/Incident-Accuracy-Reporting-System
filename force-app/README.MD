# Lions for Justice Salesforce CRM

## Introduction

> Lions for Justice wanted to explore area where we could show scalability for non-profit and government organizations. Whether choosing Salesforce CRM as a platform or  we integrated salesforce sites and forms to proliferate to communities users. Using vanilla carbon we imported the design system and created form inputs so users can input additional media for our personas to upload. 


## Code Samples

Expanding IBM Watson API's to Salesforce can allow for scalability and ingestion of data from more sources:
```
//Watson Tone Analyzer
String service_url = 'https://api.us-south.tone-analyzer.watson.cloud.ibm.com/instances/8ac7dee3-e3ba-4388-8790-ae7f1294854e';
String username = '_Y2jF4P5QUvWFSplmfZ1gEt7imyU7KkbFUsOlKEbSm0W ';
String password = '_Y2jF4P5QUvWFSplmfZ1gEt7imyU7KkbFUsOlKEbSm0W ';
IBMToneAnalyzerV3 toneAnalyzer = new IBMToneAnalyzerV3('2017-09-21');
toneAnalyzer.setEndPoint(service_url);
toneAnalyzer.setUsernameAndPassword(username, password);
//TODO: Create Query to Batch all non processed audio files
IBMToneAnalyzerV3Models.ToneOptions options = new IBMToneAnalyzerV3Models.ToneOptionsBuilder()
    .text(BATCH_AUDIO_FILE)
    .addTones('social')
    .sentences(false)
    .contentLanguage('en')
    .acceptLanguage('en')
    .build();
IBMToneAnalyzerV3Models.ToneAnalysis resp = toneAnalyzer.tone(options);
System.debug('IBMToneAnalyzerV3FTest.testTone(): ' + resp);
```
Salesforce makes it easy to store, combine audio with video recognition in Watson Visual.
```
//Watson Visual Recognition
String service_url = 'https://gateway-a.watsonplatform.net/visual-recognition/api/';
String api_key = 'gEe0y5XYtAE2QkppnjIPTtmxJsHG6fCNDiXcky8o8Yc1';
IBMWatsonAuthenticator authenticator = new IBMWatsonIAMAuthenticator(api_key);
//TODO: Create Query to Batch all non processed video files
IBMVisualRecognitionV3 visualRecognition = new IBMVisualRecognitionV3('2019-04-30', authenticator);

String parameters = BATCH_VIDEO_FILE;
IBMVisualRecognitionV3Models.ClassifyOptions options = new IBMVisualRecognitionV3Models.ClassifyOptionsBuilder()
  .parameters(parameters)
  .build();
IBMVisualRecognitionV3Models.ClassifiedImages resp = visualRecognition.classify(options);
System.debug('IBMVisualRecognitionV3FTest.testClassify(): ' + resp);
```
Finally, create scheduled jobs to have either near real time or daily sends:
```
//Create An Apex Scheduled Job
global class SendWatsonMedia implements Schedulable {
    global void execute(SchedulableContext ctx) {
        List<Case> cases = [SELECT Id, Incident_Media__c 
            FROM Case 
            WHERE Status = 'New';
        // Create a batch to be processed by Watson
        // Update cases to status: in progress
    }
    
}
//Set The CRON Job
SendWatsonMedia newcasecreation = new SendWatsonMedia();
String sch = '20 30 8 10 2 ?';
String jobID = System.schedule('Watson Media Send', sch, reminder);
```

## Installation

> Installation with SalesforceDX allows for Salesforce Developers or nodeJS Developers to easily update and continuously integrate with our pre-packaged solution. 
> References: https://developer.ibm.com/patterns/integrate-watson-ai-into-salesforce-apps/
