import Member from '@home/Member/Add/Add.vue'
import Information from '@home/Member/Information/Information.vue'
import Point from '@home/Member/Point/Point.vue'
// import Cost from '@home/Member/Cost/Cost.vue'

export default [{
	path: '/member/add',
	name: 'member-add',
	component: Member,
	meta: {
		title: '添加会员'
	},
}, {
	path: '/member/:user/information',
	name: 'member-information',
	component: Information,
	meta: {
		title: '会员信息'
	},
}, {
	path: '/member/:user/point',
	name: 'member-point',
	component: Point,
	meta: {
		title: '积分变更'
	},
}, {
	path: '/member/:user/cost',
	name: 'member-cost',
	component: () => import('@home/Member/Cost/Cost'),
	meta: {
		title: '消费'
	},
}]