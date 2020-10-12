---
# Related publishing issue: https://github.ibm.com/IBMCode/Code-Tutorials/issues/4710
draft: 		#Required=true (true|false) - If false, the content is published. If true, the content is in draft state on our staging server.
ignore_prod: 		#Required=false (true|false) - If true, the changes to the content do not show on the live site. If false, the changes are published to the live site.
display_in_listing: 		#Required=false (true|false) - If set to true (the default value), nothing happens. If set to false, the page will exist but it won't be displayed in hubs, archives, or search. Set this to false when you use the page_links_to metadata.
title: 		#Required=true - Title of the content. In general, use task-oriented phrases. Use fewer than 55 characters, including spaces. Front-load with SEO keywords. Include product and service names here, if length allows.
subtitle: 		#Required=true - Subtitle of the content. Use fewer than 140 characters, including spaces. Make it tweetable. Include product and service names here. For component hub pages, this should be a short phrase that defines the component.
meta_title: 		#Required=false - This is the title used for SEO purposes. Front-load with SEO keywords. If none is specified, the title is used.
authors: 		#Required=false - List the authors who contributed to writing the content. The author listed first is the primary author, who is responsible for maintaining the content. If no authors are specified, the author defaults to "IBM Developer Staff".
  - name: 		Laura Bennett
    email: 		lbenn@us.ibm.com
  - name: 		Abiola Asojo
    email: 		Abiola.Asojo@ibm.com
  - name: 		Kalonji Bankole
    email: 		kkbankol@us.ibm.com
  - name: 		Danny Belitz
    email: 		Danny.Belitz-CIC.Netherlands@ibm.com
  - name: 		Brandon Kravitz
    email: 		Brandon.Kravitz@ibm.com
  - name: 		Monica Martinez
    email: 		martimon@us.ibm.com
  - name: 		Tunde Olokodana
    email: 		Tunde.Olokodana@ibm.com
  - name: 		Osai Osaigbovo
    email: 		ooosaigb@us.ibm.com
  - name: 		Lucia Ramos
    email: 		Silvia.Ramos@ibm.com
  - name: 		Debra Scott
    email: 		scottdc@us.ibm.com
  - name: 		Shalisha Witherspoon
    email: 		Shalisha.Witherspoon@ibm.com
  - name: 		Shonda Witherspoon
    email: 		Shonda.Adena.Witherspoon@ibm.com

completed_date: 		#Required=true - This date is when the content was originally published. The date format is YYYY-MM-DD.
last_updated: 		#Required=false - This date is when the content was significantly updated. The date format is YYYY-MM-DD.
archive_date: 		#Required=false - This date is when the content was archived. The date format is YYYY-MM-DD.
check_date: 		#Required=false - This date is when in the future the content should be re-checked. The date format is YYYY-MM-DD
time_to_read: 		#Required=false - Specify the amount of time (in minutes or hours) it takes to read or use the content.
excerpt: 		#Required=true - 1-2 short sentences (fewer than 155 characters including spaces) that summarize the content. Can duplicate the subtitle, or expand upon the subtitle. Start with a strong verb, give a glimpse of what the reader can do, show what the reader will get out of the content.
meta_description: 		#Required=false - This is a description used for SEO purposes. Use fewer than 155 characters, including spaces. Front-load with SEO keywords. Start with a strong verb, give a glimpse of what the reader can do, show what the reader will get out of the content.
meta_keywords: 		#Required=false - This is a set of keywords used for SEO purposes. Specify a comma separated list of keywords. Choose keywords that answer questions that readers are asking. Specify 3-5 keywords.
primary_tag: 		#Required=true - Select the 1 tag that represents the primary focus for the content. You can specify additional tags on the "tags:" element. (Primary tags can only be the slugs from either the https://github.ibm.com/IBMCode/Definitions/blob/master/tags.yml file or the https://github.ibm.com/IBMCode/Definitions/blob/master/components.yml file.)
tags: 		#Required=false - Select the 1 or more tags that represent what the content is about. Do not duplicate what you specify for the "primary_tag:". Less is more. (Tags can only be the slugs from the https://github.ibm.com/IBMCode/Definitions/blob/master/tags.yml file.)
components: 		#Required=false - Select the 1 or more components that represent what the content is about. Do not duplicate what you specify for the "primary_tag:". Less is more. (Components can only be the slugs from the https://github.ibm.com/IBMCode/Definitions/blob/master/components.yml file.)
services: 		#Required=false - Select the 1 or more services that are specifically in use by the content. Less is more. (Services can only be the slugs from the https://github.ibm.com/IBMCode/Definitions/blob/master/services.yml file.)
runtimes: 		#Required=false - Select the 1 or more runtimes that are specifically in use by the content. Less is more. (Runtimes can only be the slugs from the https://github.ibm.com/IBMCode/Definitions/blob/master/runtimes.yml file.)
related_content: 		#Required=false - Specify 1 to 6 pieces of closely related content.
  - type: 		#Required=true announcements|articles|blogs|collections|events|models|patterns|podcast_episodes|podcasts|series|tutorials|videos|link_cards|conferences
    slug: 		#Required=true
  - type: 		#Required=true announcements|articles|blogs|collections|events|models|patterns|podcast_episodes|podcasts|series|tutorials|videos|link_cards|conferences
    slug: 		#Required=true

related_links: 		#Required=false - Specify 1 or more links to external content (that does not appear on IBM Developer). The description does not display of the link does NOT display on the page.
  - title: 		#Required=true
    url: 		#Required=true
    description: 		#Required=false
  - title: 		#Required=true
    url: 		#Required=true
    description: 		#Required=false

cities: 		#Required=false - Optionally, select 1 or more cities where the content is used. (Cities can only be the slugs from the https://github.ibm.com/IBMCode/Definitions/blob/master/cities.yml file.)
collections: 		#Required=false - Select the 1 or more collections that you want the content to appear in. (Collections can only be the slugs from the https://github.ibm.com/IBMCode/Definitions/blob/master/collections.yml file.)
meta_tags: 		#Required=false - Ignore this. Do not use this. This is a comma separated list of tags used for SEO purposes. Only our SEO person will add these tags.
social_media_meta: 		#Required=false - This is a description that goes in the social media description. Duplicate the meta_description.
private_portals: 		#Required=false - Will this content be served directly to a private portal?
content_tags: 		#Required=false - This is used to feature content on collections pages or on the community page. Only the editors of collections pages or the community page should use this metadata. Full list at https://github.ibm.com/IBMCode/Definitions/blob/master/content_tags.yml
page_links_to: 		#Required=false - Provide a full URL of a piece of content or a page that you want this content to redirect to. If you specify a URL here, this content will not be displayed.
---
## Markdown goes here and below

## Incident Accuracy Reporting System (IARS)

<img src="https://github.com/embrace-call-for-code/lions-of-justice/blob/master/design-assets/IARS_user_interface_design.png" alt="User Interface design"  class="inline"/>

This solution starter was created by technologists from IBM.
We currently live in an environment where we are finding more instances where law enforcement agencies are racially biased and are conducting unlawful practices and policies (e.g. "dirty policing"). The practices and policies are shaping the methodology by which data is created which increases inaccurate, skewed or systemically biased information.  The lack of transparent and accurate data available to assess police behavioral infractions means, police reports can be falsified and covered up.

This tutorial shows you how to create a content management application that captures statements, videos, and audio feeds from first-hand individuals relating to police incident reports.  It provides a(n):

* interface for first-hand individuals to input information or data related to incident report
* automated/manual flagging of inconsistencies and inaccuracies contained in initial incident reports based on collected data
* cross reference report data with officer history on misconduct
* mechanism for disputing claims in incident reports
* backend to a Blockchain instance that contains a hash to the actual document stored in Object Store

## Learning objectives

In this tutorial, you will:

* Provision the following Cloud services:  1) Watson Speech to Text 2) Watson Language Translator 3) IBM Cloud Object Storage

* Install and configure a local instance of Hyperledger Blockchain

* Initiate the Backend server

* Initite the Frontend application

## Prerequisites

Register for an [IBM Cloud](https://www.ibm.com/account/reg/us-en/signup?formid=urx-42793&eventid=cfc-2020?cm_mmc=OSocial_Blog-_-Audience+Developer_Developer+Conversation-_-WW_WW-_-cfc-2020-ghub-starterkit-cooperation_ov75914&cm_mmca1=000039JL&cm_mmca2=10008917) account.

[Get the code](https://github.com/embrace-call-for-code/lions-of-justice)

## Estimated time

Completing this tutorial should take about 45 minutes.

## Architecture diagram

<img src="https://github.com/embrace-call-for-code/lions-of-justice/blob/master/design-assets/IARS_component_model.png" width="100%" height="100%" alt="Component Model"  class="inline"/>

## Steps

### Provision your Cloud Services

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

### Provision Blockchain Ledger

After provisioning the Object Storage,  Speech to Text and Language Translator services, we'll need to then deploy a blockchain ledger. This ledger will keep track of all digital assets that have been uploaded. There are two ways to deploy a ledger, either locally or in the cloud.  For this pattern, we will focus on deploying the Blockchain locally.

**Local Deployment**

This step will start the network in a series of docker images, create a network channel and join a peer.
```
cd lions-of-justice/backend/blockchain/local
./startFabric.sh
```

### Deploy Blockchain App

Once the blockchain ledger is up and running, we'll deploy an application to track uploaded media on the ledger. This works by taking a hash of a file and storing it on the blockchain ledger. Then, the original file is placed in a Cloud Object Storage instance. If the file is tampered with in the Object Storage, it will no longer match the hash, and an alert will be generated.

```
git clone https://github.com/IBM/Blockchain-for-maintaining-Digital-Assets
```

Fill out configuration file as directed [here](https://github.com/IBM/Blockchain-for-maintaining-Digital-Assets#update-application-connection-profile)


### Start the web application

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

## Summary

You now know how to integate AI with Blockchain technologies to build an intelligent content management system that ensures consistency and security for uploaded content.  Now you might want to consider how to extend the application by adding support for mobile devices. Additonally, given that law enforcement agencies might consider using different cloud platforms, consider how to deploy the application across a multi-platform environment.

## License

This solution starter is made available under the [Apache 2 License](LICENSE).
