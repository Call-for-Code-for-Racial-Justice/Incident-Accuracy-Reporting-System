
# IARS

Incident Accuracy Reporting System

<img src="https://github.com/embrace-call-for-code/lions-of-justice/blob/master/design-assets/IARS_user_interface_design.png" alt="hi" class="inline"/>


This solution starter was created by technologists from IBM.

# Authors
Osai Osaigbovo,Kalonji Bankole, Shonda Witherspoon, Abiola Asojo, Lucia Ramos, Brandon Kravitz, Danny Belitz, Laura Bennett, Tunde Olokodana, Debra Scott, Shalisha Witherspoon, Monica Martinez

# Table of Content
   1. Overview
   2. The idea
   3. How it works
   4. Diagrams
   5. Documents
   6. Technology
   7. Getting started
   8. Recommendations for Enhancements of Capabilities
   9. Resources
   10. License

# 1. Overview
## Embrace Theme 
### Police & Judicial Reform and Accountability: 
From traffic stops and arrests to sentencing and parole decisions, use technology to better analyze real-world data, provide insights, and make recommendations that will drive racial equality and reform across criminal justice and public safety.
### Problem Statement: 
The lack of transparent and accurate data available to assess police behavioral infractions means, police reports can be falsified and contain other inaccuracies.
### Hills: 
Internal affairs and civilians (such as witnesses) can both contribute to incident reports, creating a tamper-proof record with all accounts of the incident.

# 2. The Idea

A Content Management application for capturing statements from first-hand individuals relating to police incident reports. 
* Interface for first-hand individuals to input information or data related to incident report
* Automated/Manual flagging of errors and inaccuracies contained in initial incident reports based on collected data
* Cross reference report data with officer history on misconduct
* Mechanism for disputing claims in incident reports
 


# Getting started

## Prereqs
Install node and NPM (suggest using NVM https://github.com/nvm-sh/nvm#install--update-script )

## Run application
```
git clone https://github.ibm.com/kkbankol/embrace-lions-for-justice
cd embrace-lions-for-justice
cd frontend
npm install
npm run serve
```

## Start Blockchain
```
cd backend/blockchain/local
./startFabric.sh

git clone https://github.com/IBM/Blockchain-for-maintaining-Digital-Assets
```
