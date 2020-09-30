/* eslint-disable */
<template>


<div id="app">

<head>
  <title>Lions of Justice</title>
  <!-- <script src="https://d3js.org/d3.v4.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.2.4/vue.min.js" ></script> -->

</head>

<!-- beginning bootstrap -->
<!-- Adding above bootstrap -->
    <cv-header style="background-color:#233554" aria-label="Carbon header">
      <cv-header-name style="color:white" href="javascript:void(0)" >
        Police Department
      </cv-header-name>

      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
    </cv-header>

    <cv-side-nav style="background-color:#233554;width:80px" id="side-nav" fixed expanded>
        <cv-side-nav-items>
          <cv-side-nav-link color="white" style="margin-bottom:25px" href="javascript:void(0)">
            <Home32 fill="white"/>
          </cv-side-nav-link >
          <cv-side-nav-link style="margin-bottom:25px" href="javascript:void(0)">
            <Police32 @click="changeUser('officer')" fill="white"/>
          </cv-side-nav-link>

          <cv-side-nav-link style="margin-bottom:25px" href="javascript:void(0)">
            <FolderShared32 @click="changeUser('detective')" fill="white"/>

          </cv-side-nav-link>

          <cv-side-nav-link style="margin-bottom:25px" href="javascript:void(0)">
            <ImproveRelevance32 @click="changeUser('witness')" fill="white"/>
          </cv-side-nav-link>

        </cv-side-nav-items>
    </cv-side-nav>


    <!-- Bootstrap -->

    <template v-if="user_type == 'officer'">
      <h2 style="position:relative;margin-left: 100px;margin-bottom:30px">Welcome, Srgt. Jeffords</h2>
      <div style="margin-left:8%;float: center;width:90%">
        <b-row cols="3" class="mb-4">
          <b-col>
            <b-card
              class="error"
              style="border:3px solid #D01A11; min-height: 84px;"
              title="">
              <CloseFilled32 style="float:left" fill="red"/>
              <b-card-text class="card-title">
                 (4) cases with severe inaccuracies need revision.
              </b-card-text>
            </b-card>
          </b-col>
          <b-col>
            <b-card
              class="warning"
              style="border:3px solid #D68700; min-height: 84px;"
              title="">
              <WarningFilled32 style="float:left" fill="#D68700"/>
              <b-card-text class="card-title">
                (4) cases with severe inaccuracies need revision.
              </b-card-text>
            </b-card>
          </b-col>
          <b-col>
            <b-card
              class="success"
              style="border:3px solid #6F8F56; min-height: 84px;"
              title="">
              <CheckmarkFilled32 style="float:left" fill="green" />
              <b-card-text class="card-title">
                (4) cases with severe inaccuracies need revision.
              </b-card-text>
            </b-card>
          </b-col>
        </b-row>

        <template v-if="user_type == 'officer'">

          <h5>Avaliable Sources For Analysis</h5>

          <b-row cols="6" class="mt-3 mb-3"">
            <b-col>
              <b-card class="source">
                <VideoFilled32 />
                <b-card-text class="card-title">
                  Videos Uploaded
                </b-card-text>
              </b-card>
            </b-col>
            <b-col>
              <b-card class="source">
                <Image32 />
                <b-card-text class="card-title">
                  Photos Uploaded
                </b-card-text>
              </b-card>
            </b-col>

            <b-col>
              <b-card class="source">
                <VideoFilled32 />
                <b-card-text class="card-title">
                  Officer's Bodycam
                </b-card-text>
              </b-card>
            </b-col>

            <b-col>
              <b-card class="source">
                <Folders32 />
                <b-card-text class="card-title">
                  Officer's Reports
                </b-card-text>
              </b-card>
            </b-col>

            <b-col>
              <b-card class="source">
                <ChartCustom32 />
                <b-card-text class="card-title">
                  Another source
                </b-card-text>
              </b-card>
            </b-col>

            <b-col>
              <b-card class="source">
                <ChartCustom32 />
                <b-card-text class="card-title">
                  Another source
                </b-card-text>
              </b-card>
            </b-col>
          </b-row>
        </template>

  <b-row>
      <b-col>
    <b-card>
        <h5>{{reports.length}} reports pending analysis</h5>
        <!-- {{bootstrap_reports}} -->
        <cv-data-table
          :zebra=true
          :columns="report_columns"
          :pagination="basicPagination" :overflow-menu="true" ref="table">
          <template v-if="use_htmlData" slot="data">
            <cv-data-table-row v-for="(row, rowIndex) in bootstrap_reports" :key="`${rowIndex}`" :value="`${rowIndex}`">
               <template v-if="row['status'] == 'error'">
                 <cv-data-table-cell><CloseFilled32 style="" fill="red"/></cv-data-table-cell>
               </template>
               <template v-else-if="row['status'] == 'warning'">
                 <cv-data-table-cell><WarningFilled32 style="" fill="#D68700"/></cv-data-table-cell>
               </template>
               <template v-else>
                 <cv-data-table-cell><CheckmarkFilled32 style="" fill="green"/></cv-data-table-cell>
               </template>

               <cv-data-table-cell><input type="text" :value="row['number']" style="border: none; background: none; width: 100%;"/></cv-data-table-cell>
               <cv-data-table-cell><input type="text" :value="row['case_officer']" style="border: none; background: none; width: 100%;"/></cv-data-table-cell>
               <cv-data-table-cell><input type="text" :value="row['case_date']" style="border: none; background: none; width: 100%;"/></cv-data-table-cell>
               <cv-data-table-cell><input type="text" :value="row['incident_type']" style="border: none; background: none; width: 100%;"/></cv-data-table-cell>
               <cv-data-table-cell>

                 <input type="text" :value="row['location']" style="border: none; background: none; width: 100%;"/>
                 <!-- <template v-if="Object.keys(row).includes('location')">
                   <input type="text" :value="row['location']" style="border: none; background: none; width: 100%;"/>
                 </template>
                 <template v-else-if="Object.keys(row).includes('location')">
                   <input type="text" :value="row['location']" style="border: none; background: none; width: 100%;"/>
                 </template> -->

               </cv-data-table-cell>
               <!--  incident_address incident_city incident_state -->
               <cv-data-table-cell>
                 <CvButton style="margin: 0px 10px; text-align: center" type="default" v-on:click="selected_report = row ; showModal({'name': 'show-report', 'title': 'Show Report', 'report': row})">Show Report Details</CvButton>
                 <!-- <input type="text" style="border: none; background: none; width: 100%;" value="View Report Details" /> -->
               </cv-data-table-cell>

            </cv-data-table-row>
        </template>
      </cv-data-table>
    </b-card>

    </b-col>
  </b-row>
      <!-- End of home view -->


      <!-- <ccv-pie-chart :data='chartData' :options='chartOptions'></ccv-pie-chart> -->
      <b-row cols="1" class="mt-3 mb-1">
        <h2>Statistics</h2>
      </b-row>
      <b-row>
        <b-col cols="12" md="8">
          <b-card>
            <!-- <ccv-simple-bar-chart :data='barChartData' :options='barChartOptions'></ccv-simple-bar-chart> -->
            <ccv-grouped-bar-chart :data='groupedBarChartData' :options='groupedBarChartOptions'></ccv-grouped-bar-chart>
          </b-card>
        </b-col>
        <b-col cols="6" md="4">
          <b-card>
            <ccv-donut-chart :data='chartData' :options='chartOptions'></ccv-donut-chart>
          </b-card>
        </b-col>

      </b-row>

      </div>
    </template>

    <template v-if="user_type == 'detective'">
      <h2 style="position:relative;margin-left: 100px;margin-bottom:30px">Welcome, Detective. Reynolds</h2>
      <div style="margin-left:8%;float: center;width:90%">

        <b-row cols="3" class="mb-4">
          <b-col>
            <b-card
              class="error"
              style="border:3px solid #D01A11; min-height: 84px;"
              title="">
              <CloseFilled32 style="float:left" fill="red"/>
              <b-card-text class="card-title">
                 (3) cases with severe inaccuracies need revision.
              </b-card-text>
            </b-card>
          </b-col>
          <b-col>
            <b-card
              class="warning"
              style="border:3px solid #D68700; min-height: 84px;"
              title="">
              <WarningFilled32 style="float:left" fill="#D68700"/>
              <b-card-text class="card-title">
                (6) cases with minor inaccuracies need revision.
              </b-card-text>
            </b-card>
          </b-col>
          <b-col>
            <b-card
              class="success"
              style="border:3px solid #6F8F56; min-height: 84px;"
              title="">
              <CheckmarkFilled32 style="float:left" fill="green" />
              <b-card-text class="card-title">
                (4) cases do not need any revision.
              </b-card-text>
            </b-card>
          </b-col>
        </b-row>

  <b-row>
      <b-col>
    <b-card>
        <h5>{{reports.length}} reports pending analysis</h5>
        <!-- {{bootstrap_reports}} -->
        <cv-data-table
          :zebra=true
          :columns="report_columns"
          :pagination="basicPagination" :overflow-menu="true" ref="table">
          <template v-if="use_htmlData" slot="data">
            <cv-data-table-row v-for="(row, rowIndex) in bootstrap_reports" :key="`${rowIndex}`" :value="`${rowIndex}`">
               <template v-if="row['status'] == 'error'">
                 <cv-data-table-cell><CloseFilled32 style="" fill="red"/></cv-data-table-cell>
               </template>
               <template v-else-if="row['status'] == 'warning'">
                 <cv-data-table-cell><WarningFilled32 style="" fill="#D68700"/></cv-data-table-cell>
               </template>
               <template v-else>
                 <cv-data-table-cell><CheckmarkFilled32 style="" fill="green"/></cv-data-table-cell>
               </template>

               <cv-data-table-cell><input type="text" :value="row['number']" style="border: none; background: none; width: 100%;"/></cv-data-table-cell>
               <cv-data-table-cell><input type="text" :value="row['case_officer']" style="border: none; background: none; width: 100%;"/></cv-data-table-cell>
               <cv-data-table-cell><input type="text" :value="row['case_date']" style="border: none; background: none; width: 100%;"/></cv-data-table-cell>
               <cv-data-table-cell><input type="text" :value="row['incident_type']" style="border: none; background: none; width: 100%;"/></cv-data-table-cell>
               <cv-data-table-cell><input type="text" :value="row['location']" style="border: none; background: none; width: 100%;"/></cv-data-table-cell>
               <cv-data-table-cell>
                 <CvButton style="margin: 0px 10px; text-align: center" type="default" v-on:click="selected_report = row ; showModal({'name': 'show-report', 'title': 'Show Report', 'report': row})">Show Report Details</CvButton>
                 <!-- <input type="text" style="border: none; background: none; width: 100%;" value="View Report Details" /> -->
               </cv-data-table-cell>

            </cv-data-table-row>
        </template>
      </cv-data-table>
    </b-card>

    </b-col>
  </b-row>
      <!-- End of home view -->


      <!-- <ccv-pie-chart :data='chartData' :options='chartOptions'></ccv-pie-chart> -->
      <b-row cols="1" class="mt-3 mb-1">
        <h2>Statistics</h2>
      </b-row>
      <b-row>
        <b-col cols="12" md="8">
          <b-card>
            <!-- <ccv-simple-bar-chart :data='barChartData' :options='barChartOptions'></ccv-simple-bar-chart> -->
            <ccv-grouped-bar-chart :data='groupedBarChartData' :options='groupedBarChartOptions'></ccv-grouped-bar-chart>
          </b-card>
        </b-col>
        <b-col cols="6" md="4">
          <b-card>
            <ccv-donut-chart :data='chartData' :options='chartOptions'></ccv-donut-chart>
          </b-card>
        </b-col>

      </b-row>

      </div>
    </template>

    <template v-else-if="user_type == 'witness'">
          <div style="margin-left:8%;float: center;width:90%">
              <h2 align="center"> Submit Witness Report </h2>
              <b-row class="mt-1">
                <b-col >
                  <cv-select label="Incident Type" v-model="incident_type">
                    <cv-select-option disabled selected hidden>Choose an incident type</cv-select-option>
                    <cv-select-option value="po_h">Police Harrassment</cv-select-option>
                    <cv-select-option value="po_b">Police Brutality</cv-select-option>
                  </cv-select>
                </b-col>
              </b-row>
              <b-row class="mt-1">
                <b-col>
                  <cv-text-input
                    label="Case Number (if applicable)"
                    placeholder="Case Number"
                    v-model="case_number">
                  </cv-text-input>
                </b-col>
              </b-row>
              <b-row class="mt-1">
                <b-col>
                  <cv-text-input
                    label="Officer Name/ Badge Number"
                    placeholder="Officer Name/ Badge Number"
                    v-model="case_officer">
                  </cv-text-input>
                </b-col>
              </b-row>
              <b-row class="mt-1">
                <b-col>
                  <cv-date-picker
                    v-model="case_date"
                    kind="single">
                  </cv-date-picker>
                </b-col>
              </b-row>
              <b-row class="mt-1">
                <b-col>
                  <cv-time-picker v-model="case_time">
                  </cv-time-picker>
                </b-col>
              </b-row>
              <b-row class="mt-1">
                <b-col>
                  <cv-text-area
                    label="Please describe incident"
                    v-model="incident_description"
                    placeholder="Incident Description">
                  </cv-text-area>
                </b-col>
              </b-row>

              <b-row class="mt-1">
                <b-col>
                  <cv-select label="Audio Language" v-model="language">
                    <cv-select-option selected value="en-US_BroadbandModel">English</cv-select-option>
                    <cv-select-option value="es-ES_BroadbandModel">Spanish</cv-select-option>
                    <cv-select-option value="fr-CA_BroadbandModel">French</cv-select-option>
                    <cv-select-option value="it-IT_BroadbandModel">Italian</cv-select-option>
                    <cv-select-option value="ja-JP_BroadbandModel">Japanese</cv-select-option>
                    <cv-select-option value="ja-JP_BroadbandModel">Japanese</cv-select-option>
                    <cv-select-option value="ko-KR_BroadbandModel">Korean</cv-select-option>
                  </cv-select>
                </b-col>
              </b-row>

              <b-row class="mt-2">
                <b-col class="col-md-3">
                  <cv-file-uploader
                    label="Upload Files (Audio, Video)"
                    helperText=""
                    :multiple=true
                    :removable=true
                    :accept="['.jpg', '.png', '.mp4', '.wmv', '.flac', '.mp3']"
                    ref="fileUploader">
                  </cv-file-uploader>
                </b-col>
              </b-row>

              <b-row class="mt-1">
                <b-col>
                  <cv-text-input
                    label="Street"
                    placeholder="Street"
                    v-model="incident_address">
                  </cv-text-input>
                </b-col>
              </b-row>

              <b-row class="mt-1">
                <b-col>
                  <cv-text-input
                    label="City"
                    placeholder="City"
                    v-model="incident_city">
                  </cv-text-input>
                </b-col>
              </b-row>

              <b-row class="mt-1">
                <b-col>
                  <cv-text-input
                    label="State"
                    placeholder="State"
                    v-model="incident_state">
                  </cv-text-input>
                </b-col>
              </b-row>

              <b-row class="mt-1">
                <b-col>
                  <cv-text-input
                    label="Zip Code"
                    placeholder="Zip Code"
                    v-model="incident_zip">
                  </cv-text-input>
                </b-col>
              </b-row>

              <b-row class="mt-1">
                <b-col>
                  <l-map></l-map>
                </b-col>
              </b-row>

              <b-row>
                <b-col>
                    <cv-button @click="submitReport">Submit</cv-button>
                </b-col>
              </b-row>
            <hr />
          </div>
    </template>

    <modal name="report-submitted" width="60%" height="200px" style="margin-top:50px">
      <div style="text-align:center;margin-top:15px">
        <h2 >Witness Report Submitted</h2>
      </div>
      <b-button style="position: absolute;bottom:5px;right:10px;" @click="hideModal('report-submitted')" class="ml-2">Close</b-button>
    </modal>

    <modal name="show-report" :scrollable="true" width="60%" height="auto" style="margin-top:50px">

      <h2 align="center"> Analysis results for case #1231451 </h2>
      <b-row cols="10" class="mt-5 ml-3">
        <b-col>
          <h5>Report Type</h5>
        </b-col>
        <b-col>
          <!-- <template v-if="selected_report && Object.keys(selected_report).includes(report_type)">
            <p>{{selected_report.report_type}}</p>
          </template>
          <template v-else>
            <p>Dolor, elementum</p>
          </template> -->
          <p>Dolor, elementum</p>
        </b-col>
        <b-col>
        </b-col>
      </b-row>

      <b-row cols="10" class="mt-1 ml-3">
        <b-col>
          <h5>Officer</h5>
        </b-col>
        <b-col>
          <p>Dolor, elementum</p>
        </b-col>
        <b-col>
        </b-col>
      </b-row>

      <b-row cols="10" class="mt-1 ml-3">
        <b-col>
          <h5>Victim</h5>
        </b-col>
        <b-col>
          <p>Dolor, elementum</p>
        </b-col>
        <b-col>
        </b-col>
      </b-row>

      <b-row cols="10" class="mt-1 ml-3">
        <b-col>
          <h5>Suspect</h5>
        </b-col>
        <b-col>
          <p>Dolor, elementum</p>
        </b-col>
        <b-col>
        </b-col>
      </b-row>
      <hr style="width:80%;border: 1px solid rgb(214,162,66)">

      <b-row cols="10" class="mt-1 ml-3 mb-3">
        <h5>Processed Elements</h5>
      </b-row>

      <b-row cols="10" class="mt-1 ml-3">
        <b-col>
          <h4>20</h4>
          <p>Photos</p>
        </b-col>
        <b-col>
          <h4>2</h4>
          <p>Videos</p>
        </b-col>
        <b-col>
          <h4>2hr</h4>
          <p>Bodycam Footage</p>
        </b-col>
        <b-col>
          <h4>1</h4>
          <p>Report</p>
        </b-col>
        <b-col>
          <h4>1</h4>
          <p>Audio Recording</p>
        </b-col>
      </b-row>

      <hr style="width:80%;border: 1px solid rgb(214,162,66)">

      <b-row cols="10" class="mt-1 ml-3">
        <h5>Inaccuracies Detected</h5>
      </b-row>

      <b-row cols="10" class="mt-1 ml-3">
        <b-col>
          <h4 style="float:left">(2)</h4><h5>Severe inaccuracies</h5>
        </b-col>
        <b-col class="col-md-8"></b-col>
      </b-row>

      <b-card >
        <b-card-sub-title class="mb-2">
          <CloseFilled16 fill="red"/>
          Footage of bodycam shows inaccuracies
        </b-card-sub-title>

        <b-card-text class="ml-3">
          Description of inaccuracies
        </b-card-text>
        <a href="#" class="card-link ml-3">Call to action</a>
      </b-card>
      <b-card >
        <b-card-sub-title class="mb-2">
          <CloseFilled16 fill="red"/>
          Audio from interviews shows inaccuracies
        </b-card-sub-title>
        <b-card-text class="ml-3">
          Description of inaccuracies
        </b-card-text>
        <a href="#" class="card-link ml-3">Call to action</a>
      </b-card>

      <b-row cols="10" class="mt-1 ml-3">
        <b-col>
          <h4 style="float:left">(11)</h4><h5>Warnings</h5>
        </b-col>
        <b-col class="col-md-8"></b-col>
      </b-row>

      <b-card >
        <b-card-sub-title class="mb-2"><WarningFilled16 fill="rgb(214,162,66)"/>Audio from interviews shows inaccuracies</b-card-sub-title>
        <b-card-text class="ml-3">
          Description of inaccuracies
        </b-card-text>
        <a href="#" class="card-link ml-3">Call to action</a>
      </b-card>

      <hr style="width:80%;border: 1px solid rgb(214,162,66)">

      <h5>Evidence</h5>

      <template v-if="(Object.keys(selected_report).includes('evidence')) && (selected_report.evidence.length > 0)">
        <div v-for="evidence in selected_report.evidence">
          {{e}}
        </div>
        <!-- {{selected_report.evidence.join(',')}} -->
      </template>

      <hr style="width:80%;border: 1px solid rgb(214,162,66)">

      <cv-text-area
        label="Additional Comments"
        placeholder="Additional Comments">
      </cv-text-area>

      <template v-if="user_type == 'officer'">
        <b-button @click="hideModal('show-report')" class="ml-2">Send Report</b-button>
      </template>

      <template v-else-if="user_type == 'detective'">
        <b-button @click="hideModal('show-report')" class="ml-2">Send Report</b-button>
        <b-button @click="hideModal('show-report')" class="ml-2">Reject</b-button>

      </template>


      <div style="margin-top:70px">

      </div>
      <!-- <b-row class="mt-10">

      </b-row> -->
    </modal>

    <modal name="submit-witness-report" height="auto">

      <h2 align="center"> Submit witness report </h2>

      <cv-form style="margin-left:20px;margin-right:20px" @submit.prevent="submitReport">

                  <cv-select label="Incident Type" v-model="incident_type">
                    <cv-select-option disabled selected hidden>Choose an incident type</cv-select-option>
                    <cv-select-option value="po_h">Police Harrassment</cv-select-option>
                    <cv-select-option value="po_b">Police Brutality</cv-select-option>
                  </cv-select>

                  <cv-text-input
                    label="Case Number"
                    placeholder="Case Number"
                    v-model="case_number">
                  </cv-text-input>
                  <cv-date-picker
                    v-model="case_date"
                    kind="single">
                  </cv-date-picker>

                  <cv-time-picker v-model="case_time">
                  </cv-time-picker>
                  <cv-text-area
                    label="Port"
                    v-model="incident_description"
                    placeholder="Incident Description">
                  </cv-text-area>
                  <cv-text-input
                    label="Address"
                    placeholder="Address"
                    v-model="incident_address">
                  </cv-text-input>
                  <cv-file-uploader
                    label="Upload Files"
                    helperText=""
                    :multiple=true
                    :removable=true
                    ref="fileUploader">
                  </cv-file-uploader>
                  <cv-button>Submit</cv-button>
            </cv-form>
    </modal>

    <hr />
    <!-- <CvButton type="default" v-on:click="showModal({'name': 'submit-witness-report', 'title': 'Submit Witness Report'})">Submit Witness Report</CvButton> -->


  </div>


</template>

<script>
  import Chart from "./components/Chart";
  import 'vfc/dist/vfc.css'
  import {
    Input
  } from 'vfc'
  import {
    Form
  } from 'vfc'
  import {
    FormItem
  } from 'vfc'
  import {
    Button
  } from 'vfc'

  export default {
    name: 'app',
    created() {
    },

    data() {
      return {

        columns: [
          "Name",
          "Protocol",
          "Port",
          "Rule",
          "Attached Groups",
          "Status"
        ],
        language: "",
        basicPagination: false,
        use_htmlData: true,
        user_type: "officer",
        selected_report: {},
        badge_number: "",
        incident_type: "",
        incident_city: "",
        incident_state: "",
        incident_zip: "",
        case_date: "",
        case_time: "",
        case_location: "",
        case_number: "",
        case_officer: "",
        incident_description: "",
        case_time: "",
        incident_address: "",
        isHidden: false,
        form: {
          function: '',
          args: ''
        },
        selectedReport: {},
        args: [],
        products: [],
        report: {},
        inferences: [],
        renderInferences: [],
        inference_data: {},
        fields: [],
        inference_rows: [],
        inference_rows_original: [],
        inference_rows_filtered: [],
        query: '',
        tableData: [],
        selectedModel: {},
        captures: [],
        video: {},
        canvas: {},
        input: [],
        func: '',
        title: '',
        src: '',
        selectedInference: '',
        models: [],
        files: [],
        selected_good_labels: [],
        selected_bad_labels: [],
        filenames: [],
        inference: {},
        inferenceDetails: {},
        lineGraphData: [],
        circleGraphData: [],
        activeFilters: {},
        sortAscending: true, //
        url: (localStorage['paiv_url'] || process.env.VUE_APP_URL),
        username: (localStorage['paiv_user'] || process.env.VUE_APP_USER),
        password: (localStorage['paiv_password'] || process.env.VUE_APP_PASSWORD),
        css: {
          table: {
            tableWrapper: '',
            tableHeaderClass: 'fixed',
            tableBodyClass: 'vuetable-semantic-no-top fixed',
            tableClass: 'ui blue selectable unstackable celled table',
            loadingClass: 'loading',
            ascendingIcon: 'blue chevron up icon',
            descendingIcon: 'blue chevron down icon',
            ascendingClass: 'sorted-asc',
            descendingClass: 'sorted-desc',
            sortableIcon: 'grey sort icon',
            handleIcon: 'grey sidebar icon'
          }
        },
        selected_compare: "",
        selected_header: "",
        value: "",
        filter_header: "",
        filter_value: "",
        filter_compare_type: "",
        search_query: "",
        inference_results: {},
        csv_type: "",
        good_labels: [],
        bad_labels: [],
        categories: [],
        sources: ['Officers body cams recordings', "Witness interviews audio recordings", "Witness interviews audio recordings"],
        report_columns: ['Status','Report Number', 'Officer', 'Date', 'Report Type', 'Location'],
        bootstrap_reports: [
          {status: "error", incident_type: "Harrassment", number: 9122134, case_officer: "Mark", case_date: "12/12/2020", "report type": "", "location": "SF", evidence: []},
          {status: "warning", incident_type: "Harrassment", number: 1325124, case_officer: "Mark", case_date: "12/12/2020", "report type": "", "location": "SF", evidence: []},
          {status: "success", incident_type: "Negligence", number: 3124524, case_officer: "Mark", case_date: "12/12/2020", "report type": "", "location": "SF", evidence: []}
        ],
        reports: [
         ["1124124", "Mark", "12/12/2020", "Dui praesent eu", "Dui praesent eu"],
         ["1124124", "Mark", "12/12/2020", "Dui praesent eu", "Dui praesent eu"],
         ["1124124", "Mark", "12/12/2020", "Dui praesent eu", "Dui praesent eu"]
        ],
        chartData: [
        		{ "group": "Error", "value": 25000},
            { "group": "Warning", "value": 12000},
            { "group": "Success", "value": 12000}
        ],
        barChartData: [
            { "group": "Error", "value": 25000},
            { "group": "Warning", "value": 12000},
            { "group": "Success", "value": 12000}
        ],
        groupedBarChartData: [
      		{
      				"group": "Error",
      				"key": "Q1",
      				"value": 29123
      		},
          {
      				"group": "Success",
      				"key": "Q1",
      				"value": 24123
      		},
          {
      				"group": "Success",
      				"key": "Q2",
      				"value": 24123
      		},
      		{
      				"group": "Error",
      				"key": "Q2",
      				"value": 35213
      		},
          {
      				"group": "Error",
      				"key": "Q2",
      				"value": 35213
      		},
          {
      				"group": "Warning",
      				"key": "Q2",
      				"value": 35213
      		},
      		{
      				"group": "Warning",
      				"key": "Q3",
      				"value": 51213
      		}],
        groupedBarChartOptions: {
        		"title": "Grouped bar (discrete)",
        		"axes": {
        				"left": {
        						"mapsTo": "value"
        				},
        				"bottom": {
        						"scaleType": "labels",
        						"mapsTo": "key"
        				}
        		},
        		"height": "400px"
        },
    		chartOptions: {
      		"title": "Reports by status",
      		"resizable": true,
      		"donut": {
      				"center": {
      						"label": "Reports"
      				}
      		},
      		"height": "400px"
        },
        barChartOptions: {
        		"title": "Reports by time",
        		"axes": {
        				"left": {
        						"mapsTo": "value"
        				},
        				"bottom": {
        						"mapsTo": "group",
        						"scaleType": "labels"
        				}
        		},
        		"height": "400px"
        },
        mobile_inference_headers: [
          "Thumbnail",
          "DataSetName",
          'Class',
          'Score',
          'Type',
          'FormattedDate',
          'Location'
        ],
        mapping: {
          "Class": "Metadata0",
          "Score": "Metadata1",
          "Heatmap/Boxes": "Metadata4",
          "ImageURL": "Thumbnail"
        },
        inference_headers: [
          "ImageURL",
          "InferenceType",
          "Heatmap/Boxes",
          'Class',
          'Score',
          'Time'
        ],
        lineGraphLayout: {
          title: 'Objects Time Series',
          xaxis: {
            title: 'Seconds',
            showgrid: false,
            zeroline: false,
            tickmode: 'linear'
          },
          yaxis: {
            title: 'Objects',
            showline: false,
            dtick: 1
          }
        },
        rtsp_url: '',
        rtsp_port: '',
        rtsp_username: '',
        rtsp_password: '',
        stream: false
      }
    },
    components: {
      Form,
      FormItem,
      // DemoLoginModal,
      [Input.name]: Input,
      [Button.name]: Button
    },
    beforeMount() {
      // let recaptchaScript = document.createElement('link')
      // recaptchaScript.setAttribute('href', `/styles.css`)
      // recaptchaScript.setAttribute('rel', stylesheet)
      // document.head.appendChild(recaptchaScript)

      let recaptchaScript = document.createElement('link')
      recaptchaScript.setAttribute('link', `https://d3js.org/d3.v4.min.js`)
      document.head.appendChild(recaptchaScript)
    },
    mounted() {

      var that = this;
      var j = [{
          "name": "John",
          "age": 30,
          "city": "New York"
      },
      {
          "name": "Jane",
          "age": 20,
          "city": "San Francisco"
      }];
    },
    methods: {
      changeUser(type) {
        this.$data.user_type = type
      },
      uploadFile(file) {
        return new Promise( (resolve, reject) => {
          const form = new FormData();
          const headers = new Headers();
          if (this.$data.language) {
            headers.append('X-Language', this.$data.language)
          }
          form.append('file', file);
          let that = this
          let options = {
            method: "POST",
            body: form,
            headers: headers
          }

          var reportsIdx = that.$data.bootstrap_reports.length //- 1

          // if file.type.includes()
          // Send to STT if audio
          // if ()
          fetch("http://localhost:3000/transcribe", options).then((r) => {

            console.log(r)
            r.json().then( (tResult) => {
              console.log(tResult)
              tResult.map( (payload) => {
                if (Object.keys(payload).includes('result')) {
                  // let transcript = payload.result.results[0].alternatives[0].transcript
                  let transcript = payload.result.results[0].alternatives[0].transcript
                  console.log(transcript)
                  if ( Object.keys(that.$data.bootstrap_reports[reportsIdx]).includes('evidence')) {
                    console.log()
                    that.$data.bootstrap_reports[reportsIdx].evidence.push(transcript)
                  } else {
                    that.$data.bootstrap_reports[reportsIdx].evidence = [transcript]
                  }
                } else {
                  console.log("no result received")
                }
              })
            }).catch(err => console.log(`error parsing json ${err}`))
          }).catch(err => console.log(`error posting file ${err}`))
          // /*

          // Store file in blockchain
          let reader = new FileReader();
          reader.readAsDataURL(file);
          reader.onload = () => {
            console.log("posting to ledger")
            let blockchainPayload = {
              digitalAssetFileName: file.name,
              digitalAssetFileType: file.type,
              digitalAssetFileBuffer: reader.result,
              emailAddress: "foo@bar.net",
            }
            let blockchainOptions = {
              method: "POST",
              body: JSON.stringify(blockchainPayload),
              headers: {
                'Content-Type': 'application/json'
              }
            }
            fetch("http://localhost:8081/createDigitalAsset", blockchainOptions).then((r) => {
              console.log("file posted to json")
              r.json().then((payload) => {
                console.log(payload)
                resolve(payload)
              }).catch(err => console.log(`error parsing json ${err}`))
            }).catch(err => console.log(`error posting file ${err}`))
          }
        })
      },
      submitReport() {
        //
        let reportNumber = Math.floor(Math.random() * Math.floor(999999))
        this.showModal({'name': 'report-submitted'})
        // {status: "error", number: 1124124, name: "Mark", date: "12/12/2020", "report type": "", "location": "SF"},
        let files = this.$refs.fileUploader.internalFiles
        files.map((file, idx) => {
          var result = this.uploadFile(file.file)
          console.log(result)
          if (idx == (files.length - 1)) {
            var fileIds = []
            var incident_address = this.$data.incident_address
            var incident_city = this.$data.incident_city
            var incident_state = this.$data.incident_state
            var incident_zip = this.$data.incident_zip

            var location = `${incident_address}, ${incident_city}, ${incident_state} ${incident_zip}`
            this.$data.bootstrap_reports.push({
              number: reportNumber,
              incident_type: this.$data.incident_type,
              case_number: this.$data.case_number,
              case_date: this.$data.case_date,
              case_time: this.$data.case_time,
              // badge_number: this.$data.badge_number,
              // name: "Mark",
              case_officer: this.$data.case_officer,
              status: "pending_review",
              location: location,
              incident_description: this.$data.incident_description,
              incident_address: this.$data.incident_address
            })
          }
        })

      },
      formatLine(inferenceId) {
        if (this.$data.inferenceDetails) {
        console.log("generating line graph for " + inferenceId)
        console.log(this.$data.inferenceDetails[inferenceId])
        var detections = this.$data.inferenceDetails[inferenceId]
        var objects = Object.keys(detections)
        var d = []
        objects.map((o) => {
          var x = Array.from(Array(detections[o].length + 1).keys())
          d.push({
            x: [0].concat(x),
            y: [0].concat(detections[o]),
            mode: 'lines',
            type: 'scatter',
            name: o
          })
          console.log(d)
        })

        this.$data.lineGraphData = d
        console.log("this.$data.lineGraphData")
        console.log(this.$data.lineGraphData)
        }
      },
      formatCircle() {
        if (this.$data.inference_rows_filtered.length > 0) {
          var rows = this.$data.inference_rows_filtered
        } else {
          var rows = this.$data.inference_rows
        }
        console.log("generating line graph")
        var d = {
          values: [],
          labels: [],
          type: "pie",
          textinfo: "label+value",
          textposition: "outside",
          // automargin: true,
          showlegend: true
        }

        var count = {}
        rows.map( (r, idx) => {

          if (Object.keys(count).includes(r['Class'])) {
            count[r['Class']] += 1
          } else {
            count[r['Class']] = 1
          }

          if (idx == (rows.length - 1) ) {
            console.log("finished looping rows, format pie data")
            d['labels'] = Object.keys(count)
            Object.keys(count).map((l, l_idx) => {
              d['values'].push( count[l] )
              console.log("d")
              console.log(d)
              if (l_idx  == (Object.keys(count).length - 1 ) ) {
                this.$data.circleGraphData = [d]
                console.log("this.$data.circleGraphData")
                console.log(this.$data.circleGraphData)
              }
            })
            // d['values'] =
            // d['values']
            // d['labels'].push(r['Class'])

          }
        })

        // objects.map((o) => {
        //   d['values'].push(detections[o].reduce((a, b) => a + b, 0))
        //   d['labels'].push(o)
        //   console.log(d)
        // })

      },
      showModal(config) {
        console.log("opening modal")
        console.log(Object.keys(config))
        this.$data.selectedReport = config.report
        // this.$data.fields = config.fields
        this.$data.title = config.title
        this.$modal.show(config.name, {
          // "fields": config.fields
          // "report": config.report
        });
      },
      hideModal(config) {
        this.$modal.hide(config.name);
        console.log("hiding modal: " + config.name)
        // this.$data.user_fields = []
        // this.$data.user_type = ''
      },
      getFormValues() {
        console.log("getting form vals")
        console.log(this.$data.input)
        // this.output = this.$refs.my_input.value
        // console.log(this.$refs.my_input.value)
      },
      goHome() {
        this.$data.selectedInference = null
        this.$data.renderInferences = this.$data.inferences
      },
    },
    filters: {
      pretty: function(value) {
        return JSON.stringify(value, null, 2);
      }
    }


  }
</script>

<style>
  #app {
    font-family: 'Avenir', Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    color: #2c3e50;
    margin-top: 60px;
  }

  #drop_zone {
    /* border: 2px dashed #eaecee; */
    /* width: 400px; */
    /* height: 300px; */
    margin: auto;
  }

  li {
    /* background: #cce5ff; */
    /* margin: 5px; */
    margin: 0;
    padding: 0;
    list-style-type: none;
  }

  select {
    margin: 50px;
    padding: 5px 35px 5px 5px;
    font-size: 16px;
    border: 1px solid #666666;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
  }

</style>

<style lang="css" scoped>
  @import './../public/styles.css';
</style>

<!-- <script type="text/javascript" src="localhost:30000/scripts/jsmpeg.min.js"></script> -->




<!-- <style lang="scss" scoped>
  .md-card {
    width: 320px;
    margin: 40px;
    display: inline-block;
    vertical-align: top;
  }
</style> -->


<style>
  @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap');

  body{
  	font-family: 'Inter', sans-serif;
  	font-size:13px;
  }
   #wrapper {
  	 min-height:100vh;
      overflow-x: hidden;
   }
   .color-blue{
  	 background-color:#1D3557;
   }
   .h2, h2 {
       font-size: 1.8em;
   }
   .container-fluid, .container-lg, .container-md, .container-sm, .container-xl {
       width: 100%;
       padding-right: 30PX;
       padding-left: 30PX;
       margin-right: auto;
       margin-left: auto;
   }
  #sidebar-wrapper {
    min-height: 100vh;
    margin-left: -15rem;
    -webkit-b-transition: margin .25s ease-out;
    -moz-b-transition: margin .25s ease-out;
    -o-b-transition: margin .25s ease-out;
    b-transition: margin .25s ease-out;
  }

  #sidebar-wrapper .sidebar-heading {
    padding: 0.875rem 1.25rem;
    font-size: 1.2rem;
  }

  #sidebar-wrapper .list-group {
    width: 15rem;
  }

  #page-content-wrapper {
    min-width: 100vw;
  }

  #wrapper.toggled #sidebar-wrapper {
    margin-left: 0;
  }
  @media (max-width: 768px) {
  	.no-marpad{
  		display:none;
  	}
  	  }

  @media (min-width: 768px) {
    #sidebar-wrapper {
      margin-left: 0;
    }

    #page-content-wrapper {
      min-width: 0;
      width: 100%;
    }

    #wrapper.toggled #sidebar-wrapper {
      margin-left: -15rem;
    }
  }
  /****** BOOTSb-trAP RE-WRITE */
  .list-group-item {
  	border:none;
  	font-size:1.2em;
  	}
  .list-group-item:hover{
  	background-color:#9FA2B4;
  }
  	.btn-primary {
  	    color: #333333;
  		    font-weight: bold;
  			font-size:1em;
  	    background-color: #E3B059;
  	    border-color: #E3B059;
  	}
  	.btn-primary:hover {
  	    color: #ffffff;
  		    font-weight: bold;
  	    background-color: #1D3557;
  	    border-color: #1D3557;
  	}

  	.list-group-item.active {
  	    z-index: 2;
  	    color: #fff;
  	    background-color: #9FA2B4;
  	    border-color: #9FA2B4;
  	}
  .list-group-item i{
  	margin-right:5px;
  }

  .fa-user{
  	color: #E3B059;
  }
  .fa-sun{
  	color: #ffffff;
  }
  .logo{
  	width:50px;
  }
  .no-marpad {
  	padding-right:0px;
  }

  .login{
      margin-top: 3px;
      margin-bottom: 9px;
  }
  .form-conb-trol {
      display: block;
      width: 100%;
      height: calc(1.5em + .75rem + 2px);
      padding: .375rem .75rem;
      font-size: 1em;
      font-weight: 400;
      line-height: 1.5;
      color: #333333;
      background-color: b-transparent;
      background-clip: padding-box;
  	border:none;
      border-bottom:3px solid #2C2F3D;
  	border-radius:0px;
      b-transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
  }

  .form-conb-trol:-moz-focusring {
    color: b-transparent;
    text-shadow: none;
  }

  .form-conb-trol:focus {
    color: #495057;
    background-color: b-transparent;
  	border:none;
    border-bottom:3px solid #80bdff;
    border-color: ;
    outline: 0;
    box-shadow: none;
  }

  .img-fluid {
      max-width: 100%;
      height: 100%;
  }
  .total-width{
  	width:100%;
  }
  label{
  	font-weight:bold;
  	font-size:1em;
  }

  .btn-link {
      font-weight: bold;
      color: #1D3557;
      text-decoration: underline;
  				font-size:1em;

  }

  .btn-link:hover {
    color: #0056b3;
    text-decoration: underline;
  }

  .btn-link:focus, .btn-link.focus {
    text-decoration: underline;
  }

  .btn-link:disabled, .btn-link.disabled {
    color: #6c757d;
    pointer-events: none;
  }
  #login{
  	padding:20px;

  }

  .card-title{
  	font-size:16px;
  	 margin-bottom: 0rem;
  	font-weight:bold;
  }

  .error{
  	border:3px solid #D01A11;
  	    min-height: 84px;
  }
  .warning-icon{
  	margin-right:5px;
  	color:#D68700;
  	float:left;
  }
  .success-icon{
  	margin-right:5px;
  	color:#6F8F56;
  	float:left;
  }
  .error-icon{
  	margin-right:5px;
  	color:#D01A11;
  	float:left;
  }
  .warning{
  	border:3px solid #D68700;
      min-height: 84px;
  }
  .success{
  	border:3px solid #6F8F56;
  	    min-height: 84px;
  }
  	.loading-overlay {
  	  display: none;
  	  background: rgba(255, 255, 255, 0.7);
  	  position: fixed;
  	  bottom: 0;
  	  left: 0;
  	  right: 0;
  	  top: 0;
  	  z-index: 9998;
  	  align-items: center;
  	  justify-content: center;
  	}

  	.loading-overlay.is-active {
  	  display: flex;
  	}

  	.code {
  	  font-family: monospace;
  	/*   font-size: .9em; */
  	  color: #dd4a68;
  	  background-color: rgb(238, 238, 238);
  	  padding: 0 3px;
  	}

  	.source-icon{
  		margin-bottom:4px;
  		color:#282B39;
  	}
  	.source .card-title{
  		font-style: normal;
  		font-weight: normal;
  		font-size: 14px;
  		line-height: 16px;
  		text-align:center;
  	}
  	.source{
  		text-align:center;
  		background: #E9E9EA;
  		border: 1px solid rgba(40, 43, 57, 0.3);
  		box-sizing: border-box;
  		border-radius: 10px;
  	}


  	@media (max-width: 575.98px) {
  		b-table-simple {
  		    border: 0;
          display: flex;
          flex-direction: row;
  		  }

  		  b-table-simple caption {
  		    font-size: 1.3em;
  		  }

  		  b-table-simple b-thead {
  		    border: none;
  		    clip: rect(0 0 0 0);
  		    height: 1px;
  		    margin: -1px;
  		    overflow: hidden;
  		    padding: 0;
  		    position: absolute;
  		    width: 1px;
  		  }

  		  b-table-simple b-tr {
  		    border-bottom: 3px solid #ddd;
  		    display: block;
  		    margin-bottom: .625em;
  		  }

  		  b-table-simple b-td {
  		    border-bottom: 1px solid #ddd;
  		    display: block;
  		    font-size: .8em;
  		    text-align: right;
  		  }

  		  b-table-simple b-td::before {
  		    /*
  		    * aria-label has no advantage, it won't be read inside a b-table-simple
  		    content: atb-tr(aria-label);
  		    */
  		    content: atb-tr(data-label);
  		    float: left;
  		    font-weight: bold;
  		    text-b-transform: uppercase;
  		  }
  		  b-td.text-center{
  		  	text-align:right !important;
  		  }
  		  b-table-simple b-td:last-child {
  		    border-bottom: 0;
  		  }

  	 }

</style>
