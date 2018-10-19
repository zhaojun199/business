import Frame from '@home/Frame/Frame'
import Home from '@home/Home/Home'
import Member from '@home/Member/Member'

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
			component: Home,
			meta: {
				title: '首页'
			},
		},
		{
			path: 'member',
			component: Member,
			meta: {
				title: '会员'
			},
		},
		{
			path: 'goods',
			component: Home,
			meta: {
				title: '商品'
			},
		},
	]
}]