import Goods from '@home/Goods/Goods.vue'
import List from '@home/Goods/List/List.vue'
import Add from '@home/Goods/Add/Add.vue'
import Classify from '@home/Classify/Classify.vue'
import Detail from '@home/Goods/Add/Add.vue'

export default [{
	path: '/goods',
	name: 'goods',
	component: Goods,
	children: [
		{
			path: 'list',
			component: List,
			meta: {
				title: '我的货物',
				keep_alive: true,
			},
		},
		{
			path: 'add',
			component: Add,
			meta: {
				title: '添加商品',
				keep_alive: true,
			},
		},
		{
			path: 'classify',
			component: Classify,
			meta: {
				title: '类目选择',
			},
		},
		{
			path: 'detail/:id',
			component: Detail,
			meta: {
				title: '商品详情',
			},
		},
	]
}]