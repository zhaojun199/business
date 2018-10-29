import Goods from '@home/Goods/Goods.vue'
import GoodsAdd from '@home/Goods/Goods.vue'

export default [{
	path: '/goods',
	name: 'goods',
	component: Goods,
	meta: {
		title: '我的货物'
	},
}, {
	path: '/goods/add',
	name: 'goods-add',
	component: GoodsAdd,
	meta: {
		title: '进货'
	},
}]