import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import '@static/js/iconfont-svg'
import '@static/css/reset'	//	重置样式
import '@static/css/mint-ui-recover'	//	重写mint-ui样式
import '@static/css/basic'	//	基本样式
import { Button, Cell, Tabbar, TabItem, Swipe, SwipeItem, Search } from 'mint-ui'

Vue.component(Button.name, Button)
Vue.component(Cell.name, Cell)
Vue.component(Tabbar.name, Tabbar)
Vue.component(TabItem.name, TabItem)
Vue.component(Swipe.name, Swipe)
Vue.component(SwipeItem.name, SwipeItem)
Vue.component(Search.name, Search)

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
