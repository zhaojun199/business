import Frame from '@home/Frame/Frame.vue'
import Home from '@home/Home.vue'

export default [{
	path: '/',
	name: 'frame',
	component: Frame,
	meta: {
		title: '首页'
	},
	children: [
		{
			path: 'home',
			component: Home
		},
	]
}]