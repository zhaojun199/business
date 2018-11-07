<template>
	<div class="home">
		<mt-swipe :auto="0" :show-indicators="false">
			<mt-swipe-item>
				<img :src="require('@static/img/home.jpg')" width="100%" height="100%">
				<!-- <img :src="require('@/assets/logo.png')" width="100%" height="100%"> -->
			</mt-swipe-item>
		</mt-swipe>
		<div class="item-group">
			<router-link class="item-cell" to="/goods/list">
				<div class="item-body">
					<div class="item-icon">
						<i class="iconfont icon-huoliutongzhi"></i>
					</div>
					<div class="item-title">进货</div>
				</div>
			</router-link>
			<router-link class="item-cell" to="/goods/list">
				<div class="item-body">
					<div class="item-icon">
						<i class="iconfont icon-kucun"></i>
					</div>
					<div class="item-title">库存</div>
				</div>
			</router-link>
			<router-link class="item-cell" to="/goods/list">
				<div class="item-body">
					<div class="item-icon">
						<i class="iconfont icon-3"></i>
					</div>
					<div class="item-title">流水</div>
				</div>
			</router-link>
			<router-link class="item-cell" to="/earn/list">
				<div class="item-body">
					<div class="item-icon">
						<i class="iconfont icon-qunfengzijintixian"></i>
					</div>
					<div class="item-title">收益</div>
				</div>
			</router-link>
		</div>
		<div style="height: 10px"></div>
		<div class="item-group">
			<div class="item-cell">1</div>
			<div class="item-cell">2</div>
			<div class="item-cell">3</div>
		</div>
		<div class="item-group">
			<div class="item-cell">4</div>
			<div class="item-cell">5</div>
			<div class="item-cell">6</div>
		</div>
	</div>
</template>

<script>

export default {
	name: 'home',
	components: {
	},
	data() {
		return {};
	},
}
</script>

<style lang="less">
// @import '../../../static/css/variable';
.home {
	height: 180px;
}
.item-group {
	display: flex;
	flex-wrap: wrap;
	background: #fff;
	text-align: center;
	.item-cell {
		flex: 1;
		display: flex;
		@wid: 50%;
		width: @wid;
		max-width: @wid;
		min-width: @wid;
		height: 4.8rem;
		line-height: 1rem;
		margin: .8rem 0 1.3rem;
		vertical-align: middle;
		align-items: center;
		justify-content: center;
		.item-icon {
			padding: .8rem;
			.iconfont {
				@len: 2.8rem;
				font-size: @len;
				width: @len;
				height: @len;
				line-height: @len;
				&:first {
					color: orange;
				}
			}
		}
		.item-title {
			width: 100%;
			font-size: 1.4rem;
			margin-top: .2rem;
		}
		&:nth-child(1) {
			.iconfont {
				color: #e0a1a1;
			}
		}
		&:nth-child(2) {
			.iconfont {
				color: #9876ce;
			}
		}
		&:nth-child(3) {
			.iconfont {
				color: #6ad5d6;
			}
		}
		&:nth-child(4) {
			.iconfont {
				color: orange;
			}
		}
	}
}
</style>
