/* eslint-disable */
<template>

<div id="app">
</div>

</template>

<script>
  export default {
    name: 'app',
    created() {
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
          {status: "error", number: 1124124, name: "Mark", date: "12/12/2020", "report type": "", "location": "SF"},
          {status: "warning", number: 1124124, name: "Mark", date: "12/12/2020", "report type": "", "location": "SF"},
          {status: "success", number: 1124124, name: "Mark", date: "12/12/2020", "report type": "", "location": "SF"}
        ],
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
    },
    beforeMount() {
      // let recaptchaScript = document.createElement('link')
      // recaptchaScript.setAttribute('href', `${publicPath}/styles.css`)
      // recaptchaScript.setAttribute('rel', stylesheet)
      // document.head.appendChild(recaptchaScript)
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

<!-- <style lang="css" scoped>
  @import './../public/styles.css';
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
