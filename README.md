
# IARS

Incident Accuracy Reporting System

<img src="https://github.com/embrace-call-for-code/lions-of-justice/blob/master/design-assets/IARS_user_interface_design.png" alt="User Interface design"  class="inline"/>

This solution starter was created by technologists from IBM.

# Table of Content
   1. [Overview](#1-overview)
   2. [The idea](#2-the-idea)
   3. [How it works](#3-how-it-works)
   4. [Diagrams](#4-design)
   5. [Documents](#5-architecture)
   6. [The Team](#6-the-team)
   7. [Getting started](#7-getting-started)
   8. [IARS-Recommendations for Enhancements of Capabilities](#8-iars-recommendations-for-enhancements-of-capabilities)
   9. [Resources](#9-resources)
   10. [License](#10-license)

# 1. Overview
## Embrace Theme
### Police & Judicial Reform and Accountability:
From traffic stops and arrests to sentencing and parole decisions, use technology to better analyze real-world data, provide insights, and make recommendations that will drive racial equality and reform across criminal justice and public safety.

### Problem Statement:
The lack of transparent and accurate data available to assess police behavioral infractions means, police reports can be falsified and contain other inaccuracies.

This solution addresses the hill outlined below related to the problem statement above:

### Hill:
Internal affairs and civilians (such as witnesses) can both contribute to incident reports, creating a tamper-proof record with all accounts of the incident.

# 2. The Idea

A Content Management application for capturing statements from first-hand individuals relating to police incident reports.
* Interface for first-hand individuals to input information or data related to incident report
* Automated/Manual flagging of errors and inaccuracies contained in initial incident reports based on collected data
* Cross reference report data with officer history on misconduct
* Mechanism for disputing claims in incident reports

# 3. How It Works

## Solution:


### Consideration

* If a 911 call is made, the event’s address, date, and time is logged as an incident.

* An incident may or may not be given a case number
* Incidents reported via app can be linked by provided case number (if known), or by correlating the submitted metadata(location, date, and time)  with a logged incident from the police department
* If an event has not yet been logged as an incident by the police department (ex: occurring live at a protest), reported incidents submitted through app can be tagged as pending until a matching police incident can be linked once filed.  


### Included Technology Components

* Web Application: built using the Vue.js frontend framework. This can be run locally or on IBM Cloud. The web application provides the dashboard and is at the core of the solution.
* [Watson Speech To Text](https://www.ibm.com/cloud/watson-speech-to-text):  This is a IBM Cloud service that converts human voice into written text. This application uses it to create written transcripts from audio recordings loaded by witnesses and victims.
* [Cloudant](https://www.ibm.com/cloud/cloudant):  (lite Tier) is a distributed, document-oriented NoSQL database that is running on the IBM Cloud.
* [Blockchain](https://hyperledger-fabric.readthedocs.io/en/release-1.4/): Based on the open-soure enterprise grade permissioned disributed ledger; Hyperledger Fabric. The blockchain network is an immutable transaction ledger. This was used to ensure that the submitted reports and information from victims and witnesses are tamper-proof. Each stored document has a hash tag that is stored in the Blockchain. You can run the application without it.
* [IBM Cloud Object Storage](https://cloud.ibm.com/docs/cloud-object-storage?topic=cloud-object-storage-getting-started-cloud-object-storage): (lite tier) stores encrypted and dispersed data. Documents(incident reports, videos, audios) are  IBM Cloud Object Storage.
* [FFmpeg](https://ffmpeg.org/): an open source, cross-platform solution to record, converrt and stream audio and videos. This was used to transcribe the audio portion of a video.
* Machine Learning - K-Means Clustering

The diagram describes the application flow

<img src="https://github.com/embrace-call-for-code/lions-of-justice/blob/master/design-assets/IARS.png" width="100%" height="100%" alt="User Interface design"  class="inline"/>

The diagram below walks you through the dashboard flow

<img src="https://github.com/embrace-call-for-code/lions-of-justice/blob/master/design-assets/IARS_Dashboard_flow.png" width="100%" height="100%" alt="User Interface design"  class="inline"/>

# 4. Design

## Persona/ User
Engaging personas emphasise how stories can engage and bring the personas to life.

<img src="https://github.com/embrace-call-for-code/lions-of-justice/blob/master/design-assets/UserPersonas.png" width="100%" height="100%" alt="User Interface design"  class="inline"/>

## User journey: AS-IS Experience
As-is Scenario Maps help us to document collective understanding of user workflows and are best used as precursors to exploring new ideas or for finding the right problem to solve.

<img src="https://github.com/embrace-call-for-code/lions-of-justice/blob/master/design-assets/Journeys%20as%20is.png" width="70%" height="70%" alt="User Interface design"  class="inline"/>

## User journey: TO-BE Experience
To-be Scenario Maps can help the team envision a better future for our users. We use them as we’re coming up with potential solutions to see how our ideas would fit within our user’s world, and how they might address the their needs. A To-be Scenario Map is a great artifact to put in front of stakeholders and users to align on the team’s intent.

<img src="https://github.com/embrace-call-for-code/lions-of-justice/blob/master/design-assets/Journeys%20to%20be.png" width="70%" height="70%" alt="User Interface design"  class="inline"/>

# 5. Architecture

The Component Model

<img src="https://github.com/embrace-call-for-code/lions-of-justice/blob/master/design-assets/IARS_component_model.png" width="100%" height="100%" alt="Component Model"  class="inline"/>

The Operational Model

<img src="https://github.com/embrace-call-for-code/lions-of-justice/blob/master/design-assets/IARS_operational_model.png" width="100%" height="100%" alt="Operational Model"  class="inline"/>

# 6. The Team

* Product Managers: Osai Osaigbovo

* Architects: Laura Bennett, Abiola Asojo , Osai Osaigbovo , Shalisha Witherspoon

* Design: Lucia Ramos, Monica Martinez, Shonda Witherspoon

* User Research: Shonda Witherspoon, Debra Scott, Shalisha Witherspoon, Monica Martinez

* Development: Kalonji Bankole, Laura Bennett, Brandon Kravitz,  Tunde Olokodana, Danny Belitz

* IP Development Joseph Kozhaya

* Special Thanks Cedric Cook, Calvin Lawrence

# 7. Getting started

## Prerequisites
- [Docker](https://www.docker.com/get-started) - Container-based software that standardizes a unit of software and enables developers to isolate their app from the environmen
- [Node.js](https://nodejs.org/en/) - a JavaScript Framework
- [NPM](https://github.com/nvm-sh/nvm#install--update-script)
- Register for an [IBM Cloud](https://www.ibm.com/account/reg/us-en/signup?formid=urx-42793&eventid=cfc-2020?cm_mmc=OSocial_Blog-_-Audience+Developer_Developer+Conversation-_-WW_WW-_-cfc-2020-ghub-starterkit-cooperation_ov75914&cm_mmca1=000039JL&cm_mmca2=10008917) account.
- Install and configure [IBM Cloud CLI](https://cloud.ibm.com/docs/cli?topic=cloud-cli-getting-started#overview).



## Steps


1. [Clone the repo](#1-clone-the-repo)

2. [Provision Cloud Services](#2-provision-cloud-services)

3. [Provision Blockchain Ledger](#3-provision-blockchain-ledger)

4. [Start web application](#4-start-web-application)

5. [Start and configure the Blockchain application](#5-start-and-configure-the-blockchain-application)


#1. Clone the repo

- Clone the [repository](https://github.com/embrace-call-for-code/lions-of-justice).
Clone the [repository](https://github.com/embrace-call-for-code/lions-of-justice) locally. In a terminal, run:

```bash
$ git clone https://github.com/embrace-call-for-code/lions-of-justice
```

#2. Provision Cloud Services
Create a Speech to Text service [here](https://cloud.ibm.com/catalog/services/speech-to-text). Once the service is created, place your credentials in the `backend/STT-Audio/.env` file like so.

```
SPEECH_TO_TEXT_IAM_APIKEY=<>
SPEECH_TO_TEXT_URL=<>
```

Create an Object Storage service [here](https://cloud.ibm.com/catalog/services/cloud-object-storage)

#3. Provision Blockchain Ledger

After setting up the Object Storage and Speech to Text services, we'll need to then deploy a blockchain ledger. This ledger will keep track of all digital assets

*Local Deployment*
```
cd backend/blockchain/local
./startFabric.sh
```

*Cloud Deployment*
If you will be hosting this application in the cloud, you'll also need to deploy a blockchain ledger in the cloud. To do so, provision an [IBM Cloud Kubernetes Service](https://cloud.ibm.com/kubernetes/catalog/cluster). This may take up to 20 minutes to provision.

Once the Kubernetes cluster has been provisioned, next create a [IBM Blockchain Platform](https://cloud.ibm.com/catalog/services/blockchain-platform) service.


#4. Start web application

Then, configure the IBM Blockchain Platform as documented [here](https://github.com/kkbankol-ibm/Blockchain-for-maintaining-Digital-Assets?organization=kkbankol-ibm&organization=kkbankol-ibm#5-build-a-network)

*Local Deployment*
```
git clone https://github.ibm.com/kkbankol/embrace-lions-for-justice
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


#5. Start and configure the Blockchain application

*Local Deployment Model*

This step will start the network in a docker image, create a network channel and join a peer

```
cd backend/blockchain/local
./startFabric.sh
```

*Using the IBM Cloud Deployment Model*
Follow the instructions in the following pattern to start the Blockchain application

```
git clone https://github.com/IBM/Blockchain-for-maintaining-Digital-Assets
```

# 8. IARS Recommendations for Enhancements of Capabilities

**Incident Accuracy Reporting System (IARS)**

### Ideas for Extending IARS Functionality
xxxxxx

### Ideas for Extending IARS Technically

- Support for multi-cloud, multi-networks: deploying the application across any cloud platform or a multi-cloud platform. This is especially important if the system may want to be run across state lines and different Cloud platforms are used.  Also if different blockchain networks are used - it makes it easier to interconnect "mixed networks". Consider deploying on top of RH OpenShift.
- Adding mobile support
- Adding container security software: lifecycle vulnerability management for scanning containers (on RHM: Neuvector)


# 9. Resources
- [IBM Cloud](https://www.ibm.com/cloud)
- [IBM Cloudant](https://cloud.ibm.com/docs/Cloudant?topic=cloudant-overview)
- [Node.js](https://nodejs.org)
- [IBM Blockchain Platform](https://www.ibm.com/blockchain/platform)


# 10. License

This solution starter is made available under the [Apache 2 License](LICENSE).