<template>
	<div class="shopcart">
		<div class="st-content">
			<div class="st-content-left" @click="toggleList">
				<div class="st-logo-wrapper">
					<div class="st-logo" :class="{'st-logo-active': !!totalPrice}">
						<span class="st-num" v-show="!!totalCount">{{totalCount}}</span>
						<i class="iconfont icon-ai-cart st-icon-shopping-cart"/>
					</div>
				</div>
				<div class="st-price" :class="{'st-price-active': !!totalPrice}">￥{{totalPrice}}</div>
				<div class="st-desc">{{payDesc}}</div>
			</div>
			<div class="st-content-right" @click="toPay">
				<div class="st-pay" :class="{'st-pay-active': !!totalPrice}">去结算</div>
			</div>
		</div>
		<transition name="fold">
			<div class="st-list" v-show="listShow">
				<div class="st-list-header">
					<h1 class="st-title">购物车</h1>
					<span class="st-empty" @click="empty">清空</span>
				</div>
				<div class="st-list-content" ref="listContent">
					<ul>
						<li class="st-goods" v-for="goods in select_goods">
							<span class="st-name">{{goods.name}}</span>
							<div class="st-price">
								<span class="">￥{{goods.price * goods.count}}</span>
							</div>
							<div class="cart-control-wrapper">
								<CartControl :good="goods" />
							</div>
						</li>
					</ul>
				</div>
			</div>
		</transition>
	</div>
</template>
<script>
import BScroll from 'better-scroll'
import CartControl from '@/components/CartControl/CartControl.vue'
export default {
	name: 'shopcart',
	components: {
		CartControl,
	},
	props: {
		select_goods: {
			type: Array,
			default() {
				return []
			},
		},
	},
	data() {
		return {
			fold: true,	//	购物车折叠状态
		}
	},
	computed: {
		totalPrice() {
			return this.select_goods
				.reduce((pre, cur) => (pre + cur.price * cur.count), 0)
		},
		totalCount() {
			return this.select_goods
				.reduce((pre, cur) => (pre + cur.count), 0)
		},
		payDesc() {
			// TODO
			return ' '
		},
		listShow() {
			if (!this.totalCount) {
				this.fold = true
				return false
			}
			if (!this.fold) {
				this.$nextTick(() => {
					if (!this.scroll) {
						this.scroll = new BScroll(this.$refs.listContent, {
							click: true,
						})
					} else {
						this.scroll.refresh()
					}
				})
			}
			return !this.fold
		}
	},
	methods: {
		toggleList() {
			if (!this.totalCount) {
				return;
			}
			this.fold = !this.fold
		},
		async empty() {
			let res = await this
				.$messageBox({
					title: '提示',
					message: '确定清空购物车?',
					showCancelButton: true,
				})
			if (res === 'confirm') {
				this.select_goods
					.forEach(good => good.count = 0)
			} else if (res === 'cancel') {
				// do nothing
			}
		},
		toPay() {
			this
				.$messageBox({
					title: '结算金额',
					message: this.totalPrice,
				})
			// TODO
			// 进入结算页
		}
	}
}
</script>

<style lang="less">
@import '../../../static/css/variable';
.shopcart {
	position: fixed;
	left: 0;
	bottom: 0;
	z-index: 20;
	width: 100%;
	height: 48px;
	.st-content {
		display: flex;
		background: @shopcart-bg;
		font-size: 0;
		color: rgba(255, 255, 255, 0.4);
		.st-content-left {
			flex: 1;
			.st-logo-wrapper {
				display: inline-block;
				position: relative;
				top: -10px;
				margin: 0 12px;
				padding: 6px;
				width: 56px;
				height: 56px;
				box-sizing: border-box;
				vertical-align: top;
				border-radius: 50%;
				background: @shopcart-bg;
				.st-logo {
					width: 100%;
					height: 100%;
					border-radius: 50%;
					text-align: center;
					color: #80858a;
					background: #2b343c;
					&.st-logo-active {
						color: @active-bg-color;
						background: @active-text-color;
					}
					.st-icon-shopping-cart {
						line-height: 44px;
						font-size: 20px;
					}
				}
				.st-num {
					position: absolute;
					top: 0;
					right: 0;
					width: 24px;
					height: 16px;
					line-height: 18px;
					text-align: center;
					border-radius: 16px;
					font-size: 9px;
					font-weight: 700;
					color: #fff;
					background: rgb(240, 20, 20);
					box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.4);
				}
			}
			.st-price {
				display: inline-block;
				vertical-align: top;
				margin-top: 12px;
				line-height: 24px;
				padding-right: 12px;
				box-sizing: border-box;
				border-right: 1px solid rgba(255, 255, 255, 0.1);
				font-size: 16px;
				font-weight: 700;
				// color: rgba(255, 255, 255, 0.1);
				&.st-price-active {
					color: @active-text-color;
				}
			}
			.st-desc {
				display: inline-block;
				font-size: 14px;
				line-height: 48px;
				text-align: center;
				margin-left: 20px;
			}
		}
		.st-content-right {
			flex: 0 0 105px;
			width: 105px;
			.st-pay {
				background: #333;
				font-size: 14px;
				line-height: 48px;
				text-align: center;
				&.st-pay-active {
					background: @active-text-color;
					color: #fff;
				}
			}
		}
	}
	.st-list {
		position: absolute;
		left: 0;
		bottom: 100%;
		z-index: -1;
		width: 100%;
		opacity: 1;
		filter: drop-shadow(0px 5px 20px #ccc);
		transition: all 0.5s;
		transform: translate3d(0, 0, 0);
		&.fold-enter, &.fold-leave-active {
			transform: translate3d(0, 100%, 0);
		}
		.st-list-header {
			height: 40px;
			line-height: 40px;
			padding: 0 18px;
			background: #f3f5f7;
			border-bottom: 1px solid rgba(7, 17, 27, .1);
			.st-title {
				float: left;
				font-size: 14px;
				color: rgb(7, 17, 27);
			}
			.st-empty {
				float: right;
				font-size: 14px;
				color: @primary-color;
			}
		}
		.st-list-content {
			padding: 0 18px;
			max-height: 217px;
			overflow: hidden;
			background: #fff;
			.st-goods {
				position: relative;
				padding: 12px 0;
				box-sizing: border-box;
				.border();
				.st-name {
					line-height: 24px;
					font-size: 14px;
					color: rgb(7, 17, 27);
				}
				.st-price {
					position: absolute;
					right: 90px;
					bottom: 12px;
					line-height: 24px;
					font-size: 14px;
					font-weight: 700;
					color: rgb(240, 20, 20);
				}
				.cart-control-wrapper {
					position: absolute;
					right: 0;
					bottom: 9px;
				}
			}
		}
	}
}
</style>
