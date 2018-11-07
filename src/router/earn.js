import Earn from '@home/Earn/Earn.vue'
import List from '@home/Earn/List/List.vue'

export default [{
	path: '/earn',
	name: 'earn',
	component: Earn,
	children: [
		{
			path: 'list',
			component: List,
			meta: {
				title: '我的收益',
				keep_alive: true,
			},
		},
	]
}]