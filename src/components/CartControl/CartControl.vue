<template>
	<div class="cart-control">
		<div class="cc-decrease" v-show="!good.count">
			<i class="iconfont icon-jianhao cc-icon"/>
		</div>
		<div class="cc-count" v-show="!!good.count">{{good.count}}</div>
		<div class="cc-add">
			<i class="iconfont icon-jiahao1 cc-icon"/>
		</div>
	</div>
</template>

<script>
export default {
	name: 'cart-control',
	props: {
		good: {
			type: Object,
			default() {
				return {}
			}
		},
	},
	data() {
		return {}
	},
	created() {
		log(this.good)
	}
}
</script>

<style lang="less">
@import '../../../static/css/variable';
.cart-control {
	font-size: 0;
	.cc-icon {
		font-size: 16px;
		border-radius: 50%;
		padding: 3px;
		background: @active-text-color;
		color: @active-bg-color;
	}
	.cc-decrease {
		display: inline-block;
		padding: 6px;
		.cc-icon {
			background: @active-bg-color;
			color: @active-text-color;
			border: 1px @active-text-color solid;
			box-sizing: border-box;
			padding: 2px;
		}
	}
	.cc-count {
		display: inline-block;
	}
	.cc-add {
		display: inline-block;
		padding: 6px;
	}
}
</style>
