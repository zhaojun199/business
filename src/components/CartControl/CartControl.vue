<template>
	<div class="cart-control">
		<transition name="move">
			<div
				class="cc-decrease"
				v-show="!!good.count"
				@click="decreaseCart($event)"
			>
				<div class="cc-inner">
					<i class="iconfont icon-jianhao cc-icon"/>
				</div>
			</div>
		</transition>
		<div class="cc-count" v-show="!!good.count">{{good.count}}</div>
		<div class="cc-add" @click="addCart($event)">
			<i class="iconfont icon-jiahao1 cc-icon"/>
		</div>
	</div>
</template>

<script>
import Vue from 'vue'

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
	methods: {
		addCart(event) {
			// 非better-scroll派发的事件（浏览器原生事件）
			if (!event._constructed) {
				return
			}
			if (!this.good.count) {
				Vue.set(this.good, 'count', 1)
			} else {
				this.good.count++
			}
		},
		decreaseCart(event) {
			// 非better-scroll派发的事件（浏览器原生事件）
			if (!event._constructed) {
				return
			}
			if (this.good.count) {
				this.good.count--
			}
		}
	}
}
</script>

<style lang="less">
@import '../../../static/css/variable';
@transition: all 0.4s linear;
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
		opacity: 1;
		transition: @transition;
		transform: translate3d(0, 0, 0);
		.cc-inner {
			transition: @transition;
			transform: rotate(0deg);
		}
		&.move-enter, &.move-leave-active {
			opacity: 0;
			transform: translate3d(24px, 0, 0);
			.cc-inner {
				transform: rotate(180deg);
			}
		}
		.cc-icon {
			background: @active-bg-color;
			color: @active-text-color;
			border: 2px @active-text-color solid;
			box-sizing: border-box;
			padding: 1px;
		}
	}
	.cc-count {
		display: inline-block;
		vertical-align: top;
		width: 12px;
		padding-top: 2px;
		line-height: 24px;
		text-align: center;
		font-size: 12px;
		color: rgb(147, 153, 159);
	}
	.cc-add {
		display: inline-block;
		padding: 6px;
	}
}
</style>
