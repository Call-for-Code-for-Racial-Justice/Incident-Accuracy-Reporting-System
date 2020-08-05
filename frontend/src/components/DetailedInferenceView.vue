<head>
</head>

<template>
  <div id="inference">
    <p> placeholder </p>
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
    name: 'inference',
    created() {
      zip = new this.JSZip();
    },
    data() {
      return {
        isHidden: false,
        form: {
          function: '',
          args: ''
        },
        args: [],
        ledgerState: {},
        products: [],
        inferences: [],
        inference_data: {},
        fields: [],
        user_fields: [],
        user_type: '',
        user_input: [],
        input: [],
        username: '',
        password: '',
        url: '',
        func: '',
        title: '',
        files: [],
        filenames: []
        // gridData: [{
        //   name: 'Chuck Norris',
        //   power: Infinity
        // }, {
        //   name: 'Bruce Lee',
        //   power: 9000
        // }, {
        //   name: 'Jackie Chan',
        //   power: 7000
        // }, {
        //   name: 'Jet Li',
        //   power: 8000
        // }]
        // gridData: [{"id":"product1","quantity":"300","countryId":"US"},{"id":"product2","quantity":"350","countryId":"US"}]
      }
    },
    components: {
      Form,
      FormItem,
      // DemoLoginModal,
      [Input.name]: Input,
      [Button.name]: Button
    },
    beforeMount(){
       this.login()
    },
    mounted(){
      this.getInferences()
    },
    methods: {
      dragOverHandler(ev) {
         console.log('File(s) in drop zone');
         ev.preventDefault();
      },
      getModels() {
        var options = {
          method: "GET",
          headers: {
            "X-Auth-Token": this.$data.token,
          }
        }
        fetch(this.$data.url + "/trained-models", options).then((res) => {
          console.log("models received")
          console.log(res)
          res.json().then((models) => {
            this.$data.models = models
          })
        })
      },
      submitInference() {
        // post to powerai when user clicks "upload"
        this.$data.files.map( (file) => {
          var options = {
            method: "POST",
            body: formData,
            headers: {
              "X-Auth-Token": this.$data.token,
              // "Content-Type": "multipart/form-data"
            }
          }
          console.log("adding file: " + file.name)
          var formData = new FormData().append('blob', file)
          fetch(this.$data.url + "/dlapis/" + this.$data.selectedModel, options).then((res) => {
            console.log("api call complete")
            // this.$modal.hide('invoke-modal');
            // console.log(res.text())
            console.log(res)
          })
        } )
      },
      compressFiles() {
        console.log("zip")
        var zip = new this.$JSZip();
        console.log(zip)
        console.log("files")
        console.log(this.$data.files)
        zip.file("Hello.", "hello.txt")
        this.$data.files.map( (file) => {
          console.log("adding file: " + file.name)
          zip.file(file, file.name)
        } )
        // console.log(zip.files)
        zip.generateAsync({type:'blob'}).then( (zippedData) => {
          console.log(zippedData)
          var formData = new FormData().append('blob', zippedData)
          // post to powerai
          var options = {
            method: "POST",
            body: formData,
            headers: {
              "X-Auth-Token": this.$data.token,
              "Content-Type": "multipart/form-data"
            }
          }
          fetch(this.$data.url + "/datasets/import", options).then((res) => {
            console.log("api call complete")
            // this.$modal.hide('invoke-modal');
            // console.log(res.text())
            console.log(res)
          })
        })
        // zip.file("Hello.", "hello.txt")
        // zip.generateAsync({type:"blob"}).then(function(content) {
        //     // saveAs(content, "example.zip");
        //     console.log(content)
        // })
      },
      dropHandler(ev) {
        console.log('File(s) dropped');
        // Prevent default behavior (Prevent file from being opened)
        ev.preventDefault();
        this.$data.filenames = []
        if (ev.dataTransfer.items) {
          // Use DataTransferItemList interface to access the file(s)
          for (var i = 0; i < ev.dataTransfer.items.length; i++) {
            // If dropped items aren't files, reject them
            if (ev.dataTransfer.items[i].kind === 'file') {
              var file = ev.dataTransfer.items[i].getAsFile();
              console.log('... file[' + i + '].name = ' + file.name);
              this.$data.filenames.push(file.name)
              this.$data.files.push(file)
              console.log(file)
            }
          }
        } else {
          // Use DataTransfer interface to access the file(s)
          for (var i = 0; i < ev.dataTransfer.files.length; i++) {
            console.log('... file[' + i + '].name = ' + ev.dataTransfer.files[i].name);
          }
        }
      },
      login() {
        console.log("requesting token")
        // console.log(this.$data.input)
        // console.log(this.$data)
        this.$data.url = this.$data.input[0]
        this.$data.username = this.$data.input[1]
        this.$data.password = this.$data.input[2]
        var options = {
          method: "GET",
        }
        fetch("http://localhost:30000/token", options).then((res) => {
          console.log("api call complete")
          // this.$modal.hide('invoke-modal');
          // console.log(res.text())
          res.text().then( (token) => {
              console.log("in text promise")
              this.$data.token = token
              // temp use localStorage for other views
              localStorage.getItem('token', token)
              console.log(token)
          }).catch( (err) => {
            console.log("err")
            console.log(err)
          })
        })
      },
      inputFile: function (newFile, oldFile) {
            if (newFile && oldFile && !newFile.active && oldFile.active) {
              // Get response data
              console.log('response', newFile.response)
              if (newFile.xhr) {
                //  Get the response status code
                console.log('status', newFile.xhr.status)
              }
            }
      },
      inputFilter: function (newFile, oldFile, prevent) {
            if (newFile && !oldFile) {
              // Filter non-image file
              if (!/\.(jpeg|jpe|jpg|gif|png|webp)$/i.test(newFile.name)) {
                return prevent()
              }
            }

            // Create a blob field
            newFile.blob = ''
            let URL = window.URL || window.webkitURL
            if (URL && URL.createObjectURL) {
              newFile.blob = URL.createObjectURL(newFile.file)
            }
      },
      getInferences() {
        var options = {
          method: "GET",
          // body: JSON.stringify({
          //   method: "query",
          //   params: {
          //     ctorMsg: {
          //       function: "read_everything",
          //       args: []
          //     }
          //   }
          // }),
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
          }
        }
        fetch("http://localhost:30000/inferences", options).then((response) => {
          response.json().then((json) => {
            this.$data.inferences = json //.map( s =>  ({ Id: s._id }) ) // json
            localStorage.setItem('inferences', inferences)
          })

        })
      },
      showInvokeModal(config) {
        console.log("opening modal")
        // console.log(fields)
        this.$data.input = []
        console.log(config.function)
        console.log(config.fields)
        this.$data.func = config.function
        this.$data.fields = config.fields
        this.$data.title = config.title
        this.$data.user_fields = []
        this.$data.user_type = ''
        this.$modal.show('invoke-modal', {
          "fields": config.fields
        });
      },
      showModal(config) {
        console.log("opening modal")
        this.$data.fields = config.fields
        this.$data.title = config.title
        // console.log(fields)
        // this.$data.input = []
        this.$modal.show(config.name, {
          "fields": config.fields
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
      addFields() {
        this.$data.input.push(this.$data.user_type)
        if (this.user_type == "supplier") {
          this.$data.user_fields.push('Country Id')
          this.$data.user_fields.push('Org Id')
        } else {
          this.$data.user_fields = []
        }
      }

    },
    filters: {
      pretty: function(value) {
        return JSON.stringify(value, null, 2);
      }
    }


  }
</script>
