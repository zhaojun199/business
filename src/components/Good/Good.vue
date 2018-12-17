<template>
	<transition name="move">
		<div v-show="show_flag" class="good" ref="good">
			<div>
				<div class="good-content">
					<div class="good-image-header" @click="hide">
						<div class="back">
							<i class="iconfont icon-guanbi1"/>
						</div>
						<img :src="good.image">
					</div>
					<div class="good-body">
						<h1 class="good-title">{{good.name}}</h1>
						<div class="good-detail">
							<span class="good-sell-count">月售{{good.sellCount}}份</span>
							<span class="good-rating">好评率{{good.rating}}%</span>
						</div>
						<div class="good-price">
							<span class="good-price-now">￥{{good.price}}</span>
							<span
								class="good-price-old"
								v-show="good.oldPrice"
							>￥{{good.oldPrice}}</span>
						</div>
					</div>
					<div class="cartcontrol-wrapper">
						<CartControl :good="good"/>
					</div>
					<div class="good-buy" @click="addFirst($event)" v-show="!good.count">加入购物车</div>
				</div>
				<Split v-show="good.info" />
				<div class="good-info" v-show="good.info">
					<h1 class="good-title">商品信息</h1>
					<p class="good-text">{{good.info}}</p>
				</div>
			</div>
		</div>
	</transition>
</template>

<script>
import Vue from 'Vue'
import BScroll from 'better-scroll'
import CartControl from '@/components/CartControl/CartControl'
import Split from '@/components/Split/Split'

export default {
	name: 'good',
	components: {
		CartControl,
		Split,
	},
	props: {
		good: {
			type: Object,
			default: () => ({}),
		},
	},
	data() {
		return {
			show_flag: false,
		}
	},
	methods: {
		show() {
			this.show_flag = !this.show_flag
			this.$nextTick(() => {
				if (!this.scroll) {
					this.scroll = new BScroll(this.$refs.good, { click: true })
				} else {
					this.scroll.refresh()
				}
			})
		},
		hide() {
			this.show_flag = !this.show_flag
		},
		addFirst(event) {
			// 非better-scroll派发的事件（浏览器原生事件）
			if (!event._constructed) {
				return
			}
			Vue.set(this.good, 'count', 1)
		}
	},
}
</script>

<style lang="less">
@import '../../../static/css/variable';
.good {
	position: fixed;
	left: 0;
	top: 0;
	bottom: 48px;
	width: 100%;
	background: #fff;
	z-index: 10;
	transition: all 0.2s linear;
	&.move-enter, &.move-leave-active {
		transform: translate3d(0, -100%, 0);
	}
	.good-content {
		position: relative;
		.good-image-header {
			position: relative;
			padding-top: 100%;
			height: 0;
			width: 100%;
			.back {
				position: absolute;
				top: 10px;
				left: 10px;
				color: @primary-color;
				z-index: 1;
				.iconfont {
					font-size: 25px;
				}
			}
			img {
				position: absolute;
				top: 0;
				left: 0;
				width: 100%;
				height: 100%;
			}
		}
		.good-body {
			padding: 18px;
			.good-title {
				font-size: 18px;
				margin-bottom: 8px;
				font-weight: 700;
				color: @primary-color;
			}
			.good-detail {
				margin-bottom: 10px;
				line-height: 18px;
				font-size: 0;
				color: rgb(147, 153, 159);
				.good-sell-count {
					font-size: 14px;
					margin-right: 12px;
				}
				.good-rating {
					font-size: 14px;
				}
			}
			.good-price {
				font-weight: 700;
				line-height: 24px;
				.good-price-now {
					margin-right: 8px;
					font-size: 14px;
					color: rgb(240, 20, 20);
				}
				.good-price-old {
					text-decoration: line-through;
					font-size: 10px;
					color: rgb(147, 153, 159);
				}
			}
		}
		.pos() {
			right: 18px;
			bottom: 20px;
		}
		.cartcontrol-wrapper {
			position: absolute;
			.pos();
		}
		.good-buy {
			@len: 16px;
			position: absolute;
			.pos();
			height: @len * 2;
			line-height: @len * 2;
			padding: 0 @len;
			box-sizing: border-box;
			font-size: 12px;
			border-radius: @len;
			color: #fff;
			background: @primary-color;
		}
	}
	.good-info {
		padding: 18px;
		.good-title {
			line-height: 14px;
			margin-bottom: 6px;
			font-size: 16px;
			color: rgb(7, 17, 27);
		}
		.good-text {
			line-height: 24px;
			padding: 0 8px;
			font-size: 13px;
		}
	}
}
</style>
