import Vue from 'vue'
import Router from 'vue-router'

let routes = []
const context = require
	.context('./', true, /\.js$/)
context
	.keys()
	.forEach(it => {
		const module = context(it).default
		if (it !== './index.js' && Array.isArray(module)) {
			routes = [...routes, ...(context(it).default)]
		}
	})

Vue.use(Router)

const router = new Router({ routes })
router.beforeEach((to, from, next) => {
	const { title } = to.meta
	if (title) {
		document.title = `${title} - 依家布艺`
	}
	next()
})
export default router
