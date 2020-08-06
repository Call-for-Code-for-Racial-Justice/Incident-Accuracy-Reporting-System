import Vue from 'vue'
import App from './App.vue'
import VFC from 'vfc'
import DataTable from 'v-data-table'
import VModal from 'vue-js-modal'
// import Modal from './components/Modal.vue'
// import card from 'vue-card'
import vSelect from 'vue-select'

import 'vfc/dist/vfc.css'
import './dist/json-tree.css'

import TreeView from "vue-json-tree-view"
import Vuetable from 'vuetable-2/src/components/Vuetable'
import VuetablePagination from 'vuetable-2/src/components/VuetablePagination'
import VuetablePaginationInfo from 'vuetable-2/src/components/VuetablePaginationInfo'
import VCardElement from 'vue-card-element'
import Vuetify from 'vuetify'
// import 'vuetify/dist/vuetify.min.css'
// import vuetify from './plugins/vuetify';
// Vue.use(Vuetify)
// import 'vuetify/dist/vuetify.min.css'


import { MdButton, MdContent, MdTabs, MdCard, MdField, MdInput, MdTable, MdRipple } from 'vue-material/dist/components'
// import {MdSelect, MdOption} from 'vue-material/src/components/MdField/MdSelect'
// import 'vue-material/src/components/MdField'


import 'vue-material/dist/vue-material.min.css'
import 'vue-material/dist/theme/default.css'
// import VueMaterial from 'vue-material'
const VueUploadComponent = require('vue-upload-component')
// Vue.use(VueMaterial)
import { Plotly } from 'vue-plotly'
import JSZip from 'jszip'
import jsPDF from 'jspdf'
// import jsmpeg from './assets/jsmpeg.min.js' //'jsmpeg'
import JSMpeg from '@cycjimmy/jsmpeg-player';




import DetailedInferenceView from './components/DetailedInferenceView'
import Drag from './components/Drag'
import Router from 'vue-router'

import SuiVue from 'semantic-ui-vue';
import SemanticUI from 'semantic-ui-vue';
import 'semantic-ui-css/semantic.min.css';
// import 'vue-select/dist/vue-select.css';

// /*
// import { CvButton } from '@carbon/vue/src/components/button';

import "carbon-components/css/carbon-components.min.css";
import CarbonComponentsVue from '@carbon/vue';
// let carbonLibs = ["CvList", "CvModal", "CvSelect", "CvFileUploader", "CvDataTable", "CvDataTableCell", "CvDataTableRow", "CvAccordion", "CvAccordionItem", "CvButton", "CvTag", "CvStructuredList"]
Vue.use(CarbonComponentsVue, ["CvTextArea", "CvDropDown", "CvDatePicker", "CvTimePicker", "CvHeader", "CvHeaderName", "CvSideNavLink", "CvSideNav", "CvSideNavItems", "CvSideNavMenu", "CvSideNavMenuItem", "CvModal", "CvTag", "CvTile", "CvSelect", "CvMultiSelect","CvSelectOption", "CvSelectOptGroup", "CvFileUploader", "CvDataTable", "CvDataTableCell", "CvDataTableRow", "CvButton", "CvForm", "CvTextArea", "CvTextInput"]);


// import AddIcon from '@carbon/icons'
import { CarbonIconsVue } from '@carbon/icons-vue';
import VideoFilled32 from '@carbon/icons-vue/es/video/32';
import Image32 from '@carbon/icons-vue/es/image/32';
import CameraAction32 from '@carbon/icons-vue/es/camera--action/32';
import Folders32 from '@carbon/icons-vue/es/folders/32';
import ChartCustom32 from '@carbon/icons-vue/es/chart--custom/32';
import CloseFilled32 from '@carbon/icons-vue/es/close--filled/32';
import CloseFilled16 from '@carbon/icons-vue/es/close--filled/16';
import Home32 from '@carbon/icons-vue/es/home/32';
import ChartClusterBar32 from '@carbon/icons-vue/es/chart--cluster-bar/32';
import FolderShared32 from '@carbon/icons-vue/es/folder--shared/32';
import WarningFilled32 from '@carbon/icons-vue/es/warning--filled/32';
import WarningFilled16 from '@carbon/icons-vue/es/warning--filled/16';
import CheckmarkFilled32 from '@carbon/icons-vue/es/checkmark--filled/32';

import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'
Vue.use(BootstrapVue)
Vue.use(IconsPlugin)
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

Vue.use(CarbonIconsVue, {
  components: {
    WarningFilled32,
    WarningFilled16,
    CheckmarkFilled32,
    VideoFilled32,
    Image32,
    CameraAction32,
    Folders32,
    ChartCustom32,
    CloseFilled32,
    Home32,
    ChartClusterBar32,
    FolderShared32,
    CloseFilled16
  },
});


// charts
import "@carbon/charts/styles.css";
import chartsVue from "@carbon/charts-vue";
Vue.use(chartsVue);


/*
import {CvModal, CvList, CvSelect, CvFileUploader, CvDataTable, CvAccordion, CvAccordionItem, CvButton} from "@carbon/vue"
, */

// */

// import InfTable from './components/InfTable.vue';
// Vue.use(InfTable)
// Vue.component('inf-table', InfTable)

Vue.use(Drag)
Vue.component('drag', Drag)
Vue.use(DataTable)

// Vue.use(MdButton)
// Vue.use(MdContent)
// Vue.use(MdCard)
// Vue.use(MdTabs)
// Vue.use(MdField)
// Vue.use(MdRipple)
// Vue.use(MdTable)
Vue.component('v-select', vSelect)

Vue.component("vuetable", Vuetable);
Vue.component("vuetable-pagination", VuetablePagination);
// Vue.component("vuetable-pagination-dropdown", VuetablePaginationDropDown);
Vue.component("vuetable-pagination-info", VuetablePaginationInfo);

Vue.config.productionTip = false

Vue.use(VFC)
Vue.use(VModal)
Vue.use(Router)
Vue.component('Plotly', Plotly)
Vue.use(SuiVue);

Object.defineProperty(Vue.prototype, '$JSZip', { value: JSZip });
Object.defineProperty(Vue.prototype, '$jsPDF', { value: jsPDF });

// Object.defineProperty(Vue.prototype, '$JSMpeg', { value: JSMpeg });

import * as d3 from 'd3'


new Vue({
  render: h => h(App),

  data: function() {
    return {
      showModal: false
      // css: CssForBootstrap4
    }
  },
  created() {
    this.d3 = d3
  }
}).$mount('#app')

// const router = new Router({
//   routes: [
//     // {
//     //   path: '/inference/:inferenceId',
//     //   name: 'inference',
//     //   component: DetailedInferenceView
//     // },
//     {
//       path: '/',
//       name: 'app',
//       component: App
//     }
//   ]
// })
//
// new Vue({
//   render: h => h(App),
//
//   router,
//   // vuetify,
//   // components: {FileUpload: VueUploadComponent},
//   // data: function() {
//   //   return {
//   //     showModal: false
//   //   }
//   // }
// }).$mount('#app')
