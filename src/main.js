import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import { Button, Cell } from 'mint-ui'

Vue.use(Button)
Vue.use(Cell)

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
