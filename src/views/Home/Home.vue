<template>
	<div class="home">
		<mt-swipe :auto="0" :show-indicators="false">
			<mt-swipe-item>
				<img :src="require('@static/img/home.jpg')" width="100%" height="100%">
			</mt-swipe-item>
		</mt-swipe>
		<div class="item-group">
			<div class="item-cell">
				<svg class="iconfont" aria-hidden="true">
					<use
						xlink:href="#icon-shouye1">
					</use>
				</svg>
			</div>
			<div class="item-cell">
				<svg class="iconfont" aria-hidden="true">
					<use
						xlink:href="#icon-shouye1">
					</use>
				</svg>
			</div>
			<div class="item-cell">
				<svg class="iconfont" aria-hidden="true">
					<use
						xlink:href="#icon-shouye1">
					</use>
				</svg>
			</div>
		</div>
		<div class="item-group">
			<div class="item-cell">
				<svg class="iconfont" aria-hidden="true">
					<use
						xlink:href="#icon-shouye1">
					</use>
				</svg>
			</div>
			<div class="item-cell">
				<svg class="iconfont" aria-hidden="true">
					<use
						xlink:href="#icon-shouye1">
					</use>
				</svg>
			</div>
			<div class="item-cell">
				<svg class="iconfont" aria-hidden="true">
					<use
						xlink:href="#icon-shouye1">
					</use>
				</svg>
			</div>
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
.home {
	height: 180px;
}
.item-group {
	display: flex;
	background: #fff;
	.item-cell {
		flex: 1;
		display: flex;
		height: 6rem;
		line-height: 6rem;
		vertical-align: middle;
		align-items: center;
		justify-content: center;
		.iconfont {
			width: 3.2rem;
			height: 3.2rem;
		}
	}
}
</style>
