var path = require('path')

function resolve(dir) {
	return path.join(__dirname, dir)
}

module.exports = {
	lintOnSave: false,
	// webpack配置
	// see https://github.com/neutrinojs/webpack-chain
	chainWebpack: config => {
		// config
		// 	.resolve
		// 	.alias
		// 	.set('@home', resolve('src/views')) // key,value自行定义，比如.set('@@', resolve('src/components'))
	},
	configureWebpack: config => {
		config.resolve = {
			extensions: ['.js', '.vue', '.json',".css"],
			alias: {
				'@': resolve('src'),
				'@home': resolve('src/views'),
			}
		}
	}
}
