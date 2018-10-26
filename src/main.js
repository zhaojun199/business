import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
// import '@static/js/iconfont-svg'	//	多色字体图标
import '@static/css/reset'	//	重置样式
import '@static/css/mint-ui-recover'	//	重写mint-ui样式
import '@static/css/basic'	//	基本样式
import {
	Button, Cell, Tabbar, TabItem, Swipe, SwipeItem, Search, Field,
	Popup, Picker, IndexList, IndexSection, CellSwipe
} from 'mint-ui'

Vue.component(Button.name, Button)
Vue.component(Cell.name, Cell)
Vue.component(Tabbar.name, Tabbar)
Vue.component(TabItem.name, TabItem)
Vue.component(Swipe.name, Swipe)
Vue.component(SwipeItem.name, SwipeItem)
Vue.component(Search.name, Search)
Vue.component(Field.name, Field)
Vue.component(Popup.name, Popup)
Vue.component(Picker.name, Picker)
Vue.component(IndexList.name, IndexList)
Vue.component(IndexSection.name, IndexSection)
Vue.component(CellSwipe.name, CellSwipe)

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
