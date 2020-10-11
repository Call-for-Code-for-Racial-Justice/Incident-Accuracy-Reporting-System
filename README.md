
# Incident Accuracy Reporting System (IARS)


<img src="https://github.com/embrace-call-for-code/lions-of-justice/blob/master/design-assets/IARS_user_interface_design.png" alt="User Interface design"  class="inline"/>

This solution starter was created by technologists from IBM.

## Authors


* Abiola Asojo

* Kalonji Bankole

* Danny Belitz

* Laura Bennett

* Brandon Kravitz

* Monica Martinez

* Tunde Olokodana

* Osai Osaigbovo

* Lucia Ramos

* Debra Scott

* Shalisha Witherspoon

* Shonda Witherspoon

* Special Thanks Cedric Cook, Calvin Lawrence, Joseph Kozhaya


## Contents
   1. [Overview](#1-overview)
   2. [The idea](#2-the-idea)
   3. [How it works](#3-how-it-works)
   4. [Architecture](#4-architecture)
   5. [Documents](#5-documents)
   6. [Technology](#6-technology)
   7. [Getting started](#7-getting-started)
   8. [IARS-Recommendations for Enhancements of Capabilities](#8-iars-recommendations-for-enhancements-of-capabilities)
   9. [Resources](#9-resources)
   10. [License](#10-license)

## 1. Overview

### What is the problem?
We currently live in an environment where we are finding more instances where law enforcement agencies are racially biased and are conducting unlawful practices and policies (e.g. "dirty policing"). The practices and policies are shaping the methodology by which data is created which increases inaccurate, skewed or systemically biased information.  The lack of transparent and accurate data available to assess police behavioral infractions means, police reports can be falsified and covered up.

### How can technology help?

From traffic stops and arrests to sentencing and parole decisions, using technology leads to better analysis of real-world data, provides insights, and makes recommendations that will drive racial equality and reform across criminal justice and public safety.  Policing agencies should consider piloting technology to improve operational efficiencies and outcomes. Given that current times have led to decreased number of resources and increased public scrutiny of law enforcement activity, technology is a solution that could address these issues.  Internal affairs and civilians (such as witnesses) can both contribute to incident reports, creating a tamper-proof record with all accounts of the incident.

The intersection of IBM Watson APIs and Hyperledger Blockchain technology enables users to ensure consistency of information and a secure immutable permissioned ledger of documents. As more agencies are trying to show transparency and ensure that their officers are all operating above board; using AI and Blockchain can help to facilitate those objectives.


## 2. The Idea

The lack of faith in our policing system has citizens looking for justice and a need to regain faith in those who are paid to protect us.

With the Incident Accuracy Reporting System, law enforcement can once again build that faith by creating a platform where all those involved or witnesses can provide relevant documentation about an incident.

Specifically, the platform is a content management application for capturing statements, videos, and audio feeds from first-hand individuals relating to police incident reports.  It provides a(n):

* interface for first-hand individuals to input information or data related to incident report
* automated/manual flagging of inconsistencies and inaccuracies contained in initial incident reports based on collected data
* cross reference report data with officer history on misconduct
* mechanism for disputing claims in incident reports
* backend to a Blockchain instance that contains a hash to the actual document stored in Object Store

## 3. How It Works

* If a 911 call is made, the event’s address, date, and time is logged as an incident.

* An incident may or may not be given a case number
* Incidents reported via app can be linked by provided case number (if known), or by correlating the submitted metadata(location, date, and time)  with a logged incident from the police department
* If an event has not yet been logged as an incident by the police department (ex: occurring live at a protest), reported incidents submitted through app can be tagged as pending until a matching police incident can be linked once filed.

## 4. Architecture

Content Management application backed by artificial intelligence and a distributed ledger that holds immutable data in a secure and encrypted way that insures documents can never be altered

### The Component Model

<img src="https://github.com/embrace-call-for-code/lions-of-justice/blob/master/design-assets/IARS_component_model.png" width="100%" height="100%" alt="Component Model"  class="inline"/>

### The Operational Model

<img src="https://github.com/embrace-call-for-code/lions-of-justice/blob/master/design-assets/IARS_operational_model.png" width="100%" height="100%" alt="Operational Model"  class="inline"/>

## 5. Documents

* [Design Document](./documents/design-doc.md)

* [Prototyping Wireframe Document](./documents/wireframe-doc.md)


## 6. Technology

### IBM Technology

* [Watson Speech To Text](https://www.ibm.com/cloud/watson-speech-to-text):  This is an IBM Cloud service that converts human voice into written text. This application uses it to create written transcripts from audio recordings loaded by witnesses and victims.

* [Watson Language Translator](https://cloud.ibm.com/apidocs/language-translator): Translates text from one language to another

* [Cloudant](https://www.ibm.com/cloud/cloudant):  (lite Tier) is a distributed, document-oriented NoSQL database that is running on the IBM Cloud.

* [IBM Cloud Object Storage](https://cloud.ibm.com/docs/cloud-object-storage?topic=cloud-object-storage-getting-started-cloud-object-storage): (lite tier) stores encrypted and dispersed data. Documents(incident reports, videos, audios) are saved on IBM Cloud Object Storage.


### Open Source Technology

* [Vue.js](https://vuejs.org/): An open-source model-view-viewmodel front end JavaScript framework for building user interfaces and single-page applications

* [FFmpeg](https://ffmpeg.org/): an open source, cross-platform solution to record, convert and stream audio and videos. This was used to transcribe the audio portion of a video.

* [Blockchain](https://hyperledger-fabric.readthedocs.io/en/release-1.4/): Based on the open-soure enterprise grade permissioned distributed ledger; Hyperledger Fabric. The blockchain network is an immutable transaction ledger. This was used to ensure that the submitted reports and information from victims and witnesses are tamper-proof. Each stored document has a hash tag that is stored in the Blockchain. You can run the application without it.


### Technology Concepts

* Machine Learning - The application uses unsupervised k-Means Clustering. Features were first extracted from the various statements submitted by witnesses using the term-frequency inverse-document-frequency (TFIDF) technique before applying the clustering algorithm for consistency check.


## 7. Getting Started


### Prerequisites

* [Docker](https://www.docker.com/get-started) - Container-based software that standardizes a unit of software and enables developers to isolate their app from the environment

* [Node.js](https://nodejs.org/en/) - a JavaScript Framework

* [NPM](https://github.com/nvm-sh/nvm#install--update-script)

* Register for an [IBM Cloud](https://www.ibm.com/account/reg/us-en/signup?formid=urx-42793&eventid=cfc-2020?cm_mmc=OSocial_Blog-_-Audience+Developer_Developer+Conversation-_-WW_WW-_-cfc-2020-ghub-starterkit-cooperation_ov75914&cm_mmca1=000039JL&cm_mmca2=10008917) account.

* Install and configure [IBM Cloud CLI](https://cloud.ibm.com/docs/cli?topic=cloud-cli-getting-started#overview).

### Steps

1. [Clone the repo](#1-clone-the-repo)

2. [Provision Cloud Services](#2-provision-cloud-services)

3. [Provision Blockchain Ledger](#3-provision-blockchain-ledger)

4. [Start web application](#4-start-web-application)


### 1. Clone the repo

Clone this [repository](https://github.com/embrace-call-for-code/lions-of-justice) locally. In a terminal, run:

```bash
git clone https://github.com/embrace-call-for-code/lions-of-justice
```


### 2. Provision Cloud Services

Create a `.env` file by copying the `lions-of-justice/backend/STT-Audio/env.example` in the same directory.

Provision the following services:

* **Speech to Text**
* **Language Translator**


<details><summary><b>Instantiation IBM Cloud Services</b></summary>
<p>
<h5>Create the service instances</h5>
  <ul>
    <li>If you do not have an IBM Cloud account, register for a free trial account <a href="https://cloud.ibm.com/registration">here</a>.</li>
    <li>Click <a href="https://cloud.ibm.com/catalog/services/speech-to-text">here</a> to create a <b>Speech to Text</b> instance.</li>
    <li>Click <a href="https://cloud.ibm.com/catalog/services/language-translator">here</a> to create a <b>Language Translator</b> instance.</li>
    <li>Click <a href="https://cloud.ibm.com/catalog/services/cloud-object-storage">here</a> to create a <b>Object Storage</b> instance.</li>
  </ul>
<h5>Gather credentials</h5>
  <ol>
    <li>From the main navigation menu (☰), select <b>Resource list</b> to find your services under <b>Services</b>.</li>
    <li>Click on each service to find the <b>Manage</b> view where you can collect the <b>API Key</b> and <b>URL</b> to use for each service when you configure credentials.
  </ol>
</details>


Add the credentials for each respective service to the `.env` file you created earlier:

```

# Environment variables
SPEECH_TO_TEXT_IAM_APIKEY=
SPEECH_TO_TEXT_URL=

LANGUAGE_TRANSLATOR_IAM_APIKEY=
LANGUAGE_TRANSLATOR_URL=
```

### 3. Provision Blockchain Ledger

After provisioning the Object Storage,  Speech to Text and Language Translator services, we'll need to then deploy a blockchain ledger. This ledger will keep track of all digital assets that have been uploaded. There are two ways to deploy a ledger, either locally or in the cloud.  For this pattern, we will focus on deploying the Blockchain locally.

**Local Deployment**

This step will start the network in a series of docker images, create a network channel and join a peer.
```
cd lions-of-justice/backend/blockchain/local
./startFabric.sh
```

### 4. Deploy Blockchain App

Once the blockchain ledger is up and running, we'll deploy an application to track uploaded media on the ledger. This works by taking a hash of a file and storing it on the blockchain ledger. Then, the original file is placed in a Cloud Object Storage instance. If the file is tampered with in the Object Storage, it will no longer match the hash, and an alert will be generated.

```
git clone https://github.com/IBM/Blockchain-for-maintaining-Digital-Assets
```

Fill out configuration file as directed [here](https://github.com/IBM/Blockchain-for-maintaining-Digital-Assets#update-application-connection-profile)

<!-- **Local Deployment**
```

``` -->

<!-- **Cloud Deployment**
```

``` -->


### 5. Start web application

<!-- **Local Deployment** -->
```
cd embrace-lions-for-justice
```

Start frontend web app
```
cd frontend
npm install
npm run serve
```

Start backend
```
cd backend
npm start
```

## 8. IARS Recommendations for Enhancements of Capabilities

**Incident Accuracy Reporting System (IARS)**

### Ideas for Extending IARS Functionality
* Internal Affair access to unofficial Complaints investigation matched with available evidence in App
* Transparency of Police Chief action throughout a police misconduct investigation and recommendation outcome
* Collaboration of isolated systems with Internal Affairs investigation  evidence & recommendations
* Provide victim/witness of Police misconduct investigation outcomes and enable capability for victim to obtain reports


### Ideas for Extending IARS Technically

- Support for multi-cloud, multi-networks: deploying the application across any cloud platform or a multi-cloud platform. This is especially important if the system may want to be run across state lines and different Cloud platforms are used.  Also if different blockchain networks are used - it makes it easier to interconnect "mixed networks". Consider deploying on top of RH OpenShift.
- Add a Quantitative evaluation of the k-Means clustering algorithm, in addition to the qualitative approach of this project. Other machine learning or clustering techniques can also be explored.
- Adding mobile support
- Adding container security software: lifecycle vulnerability management for scanning containers (on RHM: Neuvector)


## 9. Resources
- [IBM Cloud](https://www.ibm.com/cloud)
- [IBM Cloudant](https://cloud.ibm.com/docs/Cloudant?topic=cloudant-overview)
- [Node.js](https://nodejs.org)
<!-- - [IBM Blockchain Platform](https://www.ibm.com/blockchain/platform) -->


## 10. License

This solution starter is made available under the [Apache 2 License](LICENSE).
