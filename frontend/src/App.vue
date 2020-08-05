/* eslint-disable */
<template>


<div id="app">

<head>
  <title>Lions of Justice</title>

  <link href=`${publicPath}/styles.css` rel="stylesheet">

  <link href=`${publicPath}/vendor/bootstrap/css/bootstrap.min.css` rel="stylesheet">
  <link href=`${publicPath}/vendor/bootstrap/js/bootstrap.bundle.min.css` rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href=`${publicPath}/vendor/fontawesome/css/all.css` rel="stylesheet">
  <script src=`${publicPath}/vendor/jquery/jquery.min.js`></script>

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

        <template slot="left-panels" v-if="areLeftPanels">
        </template>
        <template slot="right-panels" v-if="areRightPanels">
        </template>
    </cv-header>





    <cv-side-nav style="background-color:#233554;width:80px" id="side-nav" fixed expanded>
        <cv-side-nav-items>
          <cv-side-nav-link color="white" style="margin-bottom:25px" href="javascript:void(0)">
            <Home32 fill="white"/>
            <!-- <p style="color:white">
              Home
            </p> -->
          </cv-side-nav-link >
          <cv-side-nav-link style="margin-bottom:25px" href="javascript:void(0)">
            <ChartClusterBar32 fill="white" />
            <!-- <p style="color:white">
              Run Analysis
            </p> -->
          </cv-side-nav-link>
          <cv-side-nav-link style="margin-bottom:25px" href="javascript:void(0)">
            <FolderShared32 fill="white"/>
            <!-- <p style="color:white">
              Run Analysis
            </p> -->
          </cv-side-nav-link>



        </cv-side-nav-items>
    </cv-side-nav>


    <!-- Bootstrap -->
    <!-- <div class="d-flex" id="wrapper">
      <div class="color-blue border-right" id="sidebar-wrapper">
        <div class="sidebar-heading text-white">Police Department</div>
        <div class="list-group list-group-flush">
          <a href="#" class="list-group-item list-group-item-action color-blue text-white active"><i class="fa fa-home"></i>Home</a>
          <a href="#" class="list-group-item list-group-item-action color-blue text-white"><i class="fa fa-chart-line"></i>Run analysis</a>
          <a href="#" class="list-group-item list-group-item-action color-blue text-white"><i class="fa fa-diagnoses"></i>Other option</a>
        </div>
      </div>
    </div> -->

    <h2 style="position:relative;margin-left: 100px;margin-bottom:30px">Welcome, Srgt. Jeffords</h2>
    <div style="margin-left:10%;float: center;width:90%">
      <!-- <CvButton style="margin: 0px 10px; text-align: center" type="default" v-on:click="showModal({'name': 'show-report', 'title': 'Submit Report'})">Show Report Details</CvButton> -->
      <!-- <h4>Last analysis run: 11/11/2020</h4> -->

      <div>

        <div style="display:flex; margin-bottom:20px">
          <div style="margin-left:10px">
            <cv-tile style="background-color:white; border: 2px solid red; border-radius: 5px;" kind="standard">
            <!-- <div style="border: 2px solid red; border-radius: 5px;"> -->
              <CloseFilled32 style="float:left;margin-right:10px" fill="red"/>
              <p style="text-align:left;font-weight: bold;">(4) Cases with severe innacuracies need revision</p>
              <p style="font-style: italic;float:right;bottom:10px;position:relative"><a>View Reports</a></p>
            <!-- </div> -->

            </cv-tile>
          </div>
          <div style="margin-left:10px">
            <cv-tile style="border: 2px solid yellow; background-color:white; border-radius: 5px;" kind="standard">
              <p style="text-align:left;font-weight: bold;">(11) Cases with moderate innacuracies need revision</p>
              <p style="font-style: italic;float:right;bottom:10px;position:relative"><a>View Reports</a></p>
            </cv-tile>
          </div>
          <div style="margin-left:10px">
            <cv-tile style="border: 2px solid green; background-color:white; border-radius: 5px;" kind="standard">
              <p style="text-align:left;font-weight: bold;">(20) Cases need no further revision</p>
              <p style="font-style: italic;float:right;bottom:10px;position:relative"><a>View Reports</a></p>
            </cv-tile>
          </div>

        </div>



        <!-- <CvButton style="margin: 0px 10px; text-align: center" type="danger" v-on:click="showModal({'name': 'login-modal', 'title': 'Login'})">(4) Cases with innacuracies</CvButton> -->
        <!-- <CvButton style="margin: 0px 10px; text-align: center" type="tertiary" v-on:click="showModal({'name': 'configure-model-modal', 'title': 'Configure Model'})">(4) Cases with warnings</CvButton> -->
        <!-- <CvButton style="margin: 0px 10px; text-align: center" type="default" v-on:click="showModal({'name': 'configure-stream-modal', 'title': 'Stream RTSP'})">(14) Cases 100% Correct</CvButton> -->


      </div>

      <h5>Avaliable Sources For Analysis</h5>
      <div style="display:flex; align-items: center;justify-content: center; margin-bottom:30px">
        <cv-tile kind="clickable" style="margin-left:10px;margin-right:10px;border-radius: 5px;">
          <VideoFilled32 />
          <p style="font-size: 12px;">
            Videos Uploaded
          </p>
        </cv-tile>
        <cv-tile kind="clickable" style="margin-left:10px;margin-right:10px;border-radius: 5px;">
          <Image32 />
          <p style="font-size: 12px;">
            Photos Uploaded
          </p>
        </cv-tile>

        <cv-tile kind="clickable" style="margin-left:10px;margin-right:10px;border-radius: 5px;">
          <CameraAction32 />
          <p style="font-size: 12px;">
            Officer's bodycam
          </p>

        </cv-tile>

        <cv-tile kind="clickable" style="margin-left:10px;margin-right:10px;border-radius: 5px;">
          <Folders32 />
          <p style="font-size: 12px;">
            Officer's reports
          </p>
        </cv-tile>


        <cv-tile kind="clickable" style="margin-left:10px;margin-right:10px;border-radius: 5px;">
          <ChartCustom32 />
          <p style="font-size: 12px;">
            Another source
          </p>
        </cv-tile>

        <cv-tile kind="clickable" style="margin-left:10px;margin-right:10px;border-radius: 5px;">
          <ChartCustom32 />
          <p style="font-size: 12px;">
            Another source
          </p>
        </cv-tile>

        <cv-tile kind="clickable" style="margin-left:10px;margin-right:10px;border-radius: 5px;">
          <ChartCustom32 />
          <p style="font-size: 12px;">
            Another source
          </p>
        </cv-tile>


      </div>


      <!-- <h2>Reports</h2> -->
      <h5>{{reports.length}} reports pending analysis</h5>
      <cv-data-table
        :zebra=true
        :columns="report_columns"
        :pagination="basicPagination"   :overflow-menu="true" ref="table">
        <template v-if="use_htmlData" slot="data">
          <cv-data-table-row v-for="(row, rowIndex) in reports" :key="`${rowIndex}`" :value="`${rowIndex}`">
             <cv-data-table-cell><input type="text" :value="row[0]" style="border: none; background: none; width: 100%;"/></cv-data-table-cell>
             <cv-data-table-cell><input type="text" :value="row[1]" style="border: none; background: none; width: 100%;"/></cv-data-table-cell>
             <cv-data-table-cell><input type="text" :value="row[2]" style="border: none; background: none; width: 100%;"/></cv-data-table-cell>
             <cv-data-table-cell><input type="text" :value="row[3]" style="border: none; background: none; width: 100%;"/></cv-data-table-cell>
             <cv-data-table-cell><input type="text" :value="row[4]" style="border: none; background: none; width: 100%;"/></cv-data-table-cell>
             <cv-data-table-cell>
               <CvButton style="margin: 0px 10px; text-align: center" type="default" v-on:click="showModal({'name': 'show-report', 'title': 'Show Report', 'report': row})">Show Report Details</CvButton>
             </cv-data-table-cell>

          </cv-data-table-row>
      </template></cv-data-table>
      <h2>Statistics</h2>

    </div>

    <modal name="show-report" :scrollable="true" height="auto" style="margin-top:40px">

      <h2 align="center"> Analysis results for case #1231451 </h2>

      <cv-tile
        >
        <h5>Details Placeholder</h5>
        <p>Officer</p>
        <p>Victim</p>
        <p>Category</p>
      </cv-tile>
      <hr>

      <cv-tile
        >
        <h5>Video</h5><p>Footage of bodycam shows innacuracies</p>
      </cv-tile>
      <hr>
      <cv-tile
        >
        <h5>Audio</h5><p>Audio from witness interview needs revision</p>
      </cv-tile>
      <hr>

      <cv-tile
        >
        <h5>Inaccuracies Detected:</h5><p></p>

      </cv-tile>

      <cv-tile
        >
        <h5>Written Statement</h5><p></p>

      </cv-tile>
      <hr>
      <cv-text-area
        placeholder="Additional Comments">
      </cv-text-area>
    </modal>

    <modal name="submit-witness-report" height="auto">

      <h2 align="center"> Submit witness report </h2>

      <cv-form style="margin-left:20px;margin-right:20px" @submit.prevent="stream">

                  <cv-select label="Incident Type">
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
                    kind="single">
                  </cv-date-picker>

                  <cv-time-picker>
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



                  <!-- <cv-select label="Example select label">
                    <cv-select-option disabled selected hidden>Choose an option</cv-select-option>
                    <cv-select-optgroup label="Category 1">
                      <cv-select-option value="cv-select-option1">cv-select-option 1</cv-select-option>
                      <cv-select-option value="cv-select-option2">cv-select-option 2</cv-select-option>
                    </cv-select-optgroup>
                    <cv-select-optgroup label="Category 2">
                      <cv-select-option value="cv-select-option3">cv-select-option 3</cv-select-option>
                      <cv-select-option value="cv-select-option4">cv-select-option 4</cv-select-option>
                    </cv-select-optgroup>
                  </cv-select> -->
                  <cv-button >Submit</cv-button>
            </cv-form>
    </modal>

    <hr />
    <CvButton  type="default" v-on:click="showModal({'name': 'submit-witness-report', 'title': 'Submit Witness Report'})">Submit Witness Report</CvButton>


  </div>


</template>

<script>
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
  // import DemoLoginModal       from './components/modals/DemoLoginModal.vue'

  // import 'vue-js-modal'
  // import { Card } from 'v-card'
  // import { DataTable } from 'v-data-table'
  // import { Button } from 'vfc'



  export default {
    name: 'app',
    created() {
      var zip = new this.JSZip();
      var pdf = new this.jsPDF()
      var JSMpeg = new this.JSMpeg()
    },

    directives: {
      overlayImage: function(canvasElement, inference, url, opacity=1.0) {
          // Get canvas context
          console.log("inference")
          console.log(inference)
          console.log("loading overlay")
          console.log("inference.value")
          console.log(inference.value)
          console.log(Object.keys(inference.value))
          var ctx = canvasElement.getContext("2d");
          var can_w = ctx.canvas.width
          var can_h = ctx.canvas.height
          var colors = ['red', 'blue', 'green', 'yellow', 'purple']
          var heatmap = new Image
          heatmap.id = "heatmap"
          console.log('_id')
          var i = new Image
          i.id = "image"
          i.onload = function() {
              console.log("creating thumbnail canvas image")
              var img_w = this.width
              var img_h = this.height
              var can_w = ctx.canvas.width //= 400
              var can_h = ctx.canvas.height //= 500
              // var hRatio = canvasElement.width / img_w    ;
              // var vRatio = canvasElement.height / img_h  ;
              console.log(`img_h ${img_h} img_w ${img_w} can_w ${can_w} can_h ${can_h}`)
              var vRatio = 1
              var hRatio = 1

              ctx.canvas.width = img_w
              ctx.canvas.height = img_h
              console.log(`img_h ${img_h} img_w ${img_w} can_w ${ctx.canvas.width} can_h ${ctx.canvas.height}`)
              var ratio = Math.min ( hRatio, vRatio )
              console.log('ratio')
              console.log(ratio)
              ctx.globalAlpha = 0.9;
              var centerShift_x = 0//( canvasElement.width - hRatio*img_w ) / 2;
              var centerShift_y = 0//( canvasElement.height - vRatio*img_h ) / 2;
              ctx.drawImage(i, 0, 0, img_w, img_h)//, centerShift_x,centerShift_y,img_w, img_h ) //, 100, 100 * imageObj.height / imageObj.width)
              if (inference.value['analysis_type'] == 'object_detection') {
                console.log("drawing boxes")
                inference.value['classified'].map( (o, idx) => {
                  // context.rect(x,y,width,height)
                  // ctx.rect(20, 20, 150, 100);
                  // var ratio = 0.5 // 0.7220216606498195
                  // var y_offset = -150

                  var tl_x = o['xmin'] * hRatio
                  var tl_y = (o['ymin'] * vRatio)

                  var w = (o['xmax'] - o['xmin']) * hRatio
                  var h = (o['ymax'] - o['ymin']) * vRatio
                  ctx.lineWidth = "6";
                  ctx.strokeStyle = colors[idx % colors.length];
                  ctx.fillStyle = colors[idx % colors.length];
                  // ctx.strokeStyle = "blue";
                  console.log(`xmin ${o['xmin']}, ymax ${o['ymax']}, hRatio ${hRatio} vRatio ${vRatio}`)
                  console.log(`w ${w}, h ${h}, tl_x ${tl_x}, tl_y ${tl_y} ` )
                  ctx.beginPath()
                  ctx.font = "30px Arial";
                  ctx.fillText(o['label'], o['xmin'] + 20, o['ymin'] + 20)
                  ctx.rect( tl_x, tl_y, w, h )
                  // ctx.rect( tl_x + centerShift_x, tl_y + centerShift_y, w, h )
                  // ctx.rect( tl_x + centerShift_x, tl_y + centerShift_y + y_offset, w, h )
                  ctx.stroke()
                })
              } else {
                heatmap.onload = function() {
                    console.log("drawing heatmap")
                    var img_w = this.width
                    var img_h = this.height
                    var hRatio = canvasElement.width / img_w    ;
                    var vRatio = canvasElement.height / img_h  ;
                    var ratio  = Math.max ( hRatio, vRatio )
                    ctx.globalAlpha = 0.4;
                    ctx.drawImage(heatmap, 0, 0, img_w, img_h, 0,0,img_w*ratio, img_h*ratio ) //, 100, 100 * imageObj.height / imageObj.width)
                    console.log("dims")
                    console.log(this.width)
                    console.log(this.height)
                    // TODO, add text based on class
                    // canvasElement.width = this.width
                    // canvasElement.height = this.height
                }
                heatmap.style.opacity = 0.1
                heatmap.style['z-index'] = 100
                console.log("inference['value']")
                console.log(inference['value'])
                // if (inference['value']['ImageURL']) {
                //   var s = inference['value']['ImageURL'].split('.')
                //   var image_type = s[s.length - 1]
                // }
                // heatmap.src = 'data:image/' + image_type + ';base64,' + inference['value']['Heatmap/Boxes']
                heatmap.src = inference['value']['heatmap']
              }
          }
          // if (Object.keys(inference['value']).includes('ImageURL')) {
          //   i.src = inference['value']['ImageURL']
          // } else {
            console.log("writing thumbnail")
            // console.log('data:image/' + 'png' + ';base64,' + inference['value']['Thumbnail'])
            // i.src = 'data:image/' + 'png' + ';base64,' + inference['value']['Thumbnail']
            // i.src = url + inference['value']['thumbnail_path']
            i.src = inference['value']['url'] + inference['value']['thumbnail_path']
          // }

          // console.log(`drawing image at ${inference['value']['ImageURL']}` )
          console.log(`canvasElement.width ${canvasElement.width}` )
          console.log(`canvasElement.height ${canvasElement.height}` )
      }
    },

    data() {
      return {
        "columns": [
          "Name",
          "Protocol",
          "Port",
          "Rule",
          "Attached Groups",
          "Status"
        ],
        "basicPagination": false,
        "use_htmlData": true,
        case_number: "",
        incident_description: "",
        publicPath: process.env.BASE_URL,
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
        // token: (localStorage['token'] || ''),
        // user_fields: [],
        // user_type: '',
        // user_input: [],
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
        report_columns: ['Report Number', 'Officer', 'Date', 'Report Type', 'Location'],
        reports: [
         ["1124124", "Mark", "12/12/2020", "Dui praesent eu", "Dui praesent eu"],
         ["1124124", "Mark", "12/12/2020", "Dui praesent eu", "Dui praesent eu"],
         ["1124124", "Mark", "12/12/2020", "Dui praesent eu", "Dui praesent eu"]
        ],
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
        // inference_headers: [],
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

      // this.$data.selectedInference = "foobar"
      // this.getInferences()
      this.$data.token = localStorage.getItem('token')
      this.$data.url = localStorage.getItem('url')

      let recaptchaScript = document.createElement('script')
      recaptchaScript.setAttribute('src', 'http://localhost:30000/scripts/jsmpeg.min.js')
      document.head.appendChild(recaptchaScript)

    },
    mounted() {

    },
    methods: {

      formatLine(inferenceId) {
        if (this.$data.inferenceDetails) {
        console.log("generating line graph for " + inferenceId)
        console.log(this.$data.inferenceDetails[inferenceId])
        var detections = this.$data.inferenceDetails[inferenceId]
        var objects = Object.keys(detections)
        var d = []
        objects.map((o) => {
          var x = Array.from(Array(detections[o].length + 1).keys())
          // d['data'].push({
          d.push({
            x: [0].concat(x),
            y: [0].concat(detections[o]),
            mode: 'lines',
            type: 'scatter',
            name: o
            // mode:"lines+markers"
          })
          console.log(d)
        })

        this.$data.lineGraphData = d
        console.log("this.$data.lineGraphData")
        console.log(this.$data.lineGraphData)
        // detections.map( (detection) )
        }
        // this.$data.lineGraph =
        // this.$data.circleGraph =
      },
      formatCircle() {
        // console.log(this.$data.inferenceDetails)
        if (this.$data.inference_rows_filtered.length > 0) {
          var rows = this.$data.inference_rows_filtered
        } else {
          var rows = this.$data.inference_rows
        }

        console.log("generating line graph")
        // var detections = this.$data.inferenceDetails[inferenceId]
        // var objects = Object.keys(detections)
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
      /*
      login() {
        console.log("requesting token")
        console.log(this.$data.input)
        if (this.$data.input.length > 0) {
          // localStorage.setItem('paiv_url', this.$data.input[0])
          // localStorage.setItem('paiv_user', this.$data.input[1])
          // localStorage.setItem('paiv_password', this.$data.input[2])
          this.$data.url = this.$data.input[0]
          this.$data.username = this.$data.input[1]
          this.$data.password = this.$data.input[2]
        }
        var options = {
          method: "POST",
          headers: {
            "Content-Type": "application/json"
          },
          body: JSON.stringify({
            username: username,
            password: password,
            grant_type: "password"
          })
        }
        console.log("token options")
        console.log(options)
        console.log("fetching from: " + url + "/api/tokens")
        fetch(url + "/api/tokens", options).then((r) => {
          r.json().then((t) => {
            console.log("token received: " + t.token)
            token = t.token
            tokenRefreshTime = Date.now()
            resolve(t.token)
          })
        }).catch((err) => {
          console.log("error finding token")
          console.log(err)
          reject(err)
        })
      },*/
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

<!-- TODO, finish modal -->
<!-- <script type="text/x-template" id="modal-template">
  <transition name="modal">
    <div class="modal-mask">
      <div class="modal-wrapper">
        <div class="modal-container">

          <div class="modal-header">
            <slot name="header">
              default header
            </slot>
          </div>

          <div class="modal-body">
            <slot name="body">
              default body
            </slot>
          </div>

          <div class="modal-footer">
            <slot name="footer">
              default footer
              <button class="modal-default-button" @click="$emit('close')">
                OK
              </button>
            </slot>
          </div>
        </div>
      </div>
    </div>
  </transition>
</script> -->


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


<!-- <style lang="scss">
@import "./styles/carbon";
</style> -->

<!-- <script type="text/javascript" src="localhost:30000/scripts/jsmpeg.min.js"></script> -->




<!-- <style lang="scss" scoped>
  .md-card {
    width: 320px;
    margin: 40px;
    display: inline-block;
    vertical-align: top;
  }
</style> -->
