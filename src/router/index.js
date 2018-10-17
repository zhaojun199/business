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

export default new Router({ routes })
