import Member from '@home/Member/Add/Add.vue'
import Point from '@home/Member/Point/Point.vue'

export default [{
	path: '/member/add',
	name: 'member-add',
	component: Member,
	meta: {
		title: '添加会员'
	},
}, {
	path: '/member/:user/point',
	name: 'member-point',
	component: Point,
	meta: {
		title: '积分变更'
	},
}]