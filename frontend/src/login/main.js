import Vue from 'vue'
import App from './Login.vue'

new Vue({
  render: h => h(App),

  data: function() {
    return {
      showModal: false
      // css: CssForBootstrap4
    }
  }
}).$mount('#app')
