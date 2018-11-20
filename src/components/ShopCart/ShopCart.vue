<template>
	<div class="shopcart">
		<div class="st-content">
			<div class="st-content-left">
				<div class="st-logo-wrapper">
					<div class="st-logo" :class="{'st-logo-active': !!totalPrice}">
						<span class="st-num" v-show="!!totalCount">{{totalCount}}</span>
						<i class="iconfont icon-ai-cart st-icon-shopping-cart"/>
					</div>
				</div>
				<div class="st-price" :class="{'st-price-active': !!totalPrice}">￥{{totalPrice}}</div>
				<div class="st-desc">{{payDesc}}</div>
			</div>
			<div class="st-content-right">
				<div class="st-pay" :class="{'st-pay-active': !!totalPrice}">去结算</div>
			</div>
		</div>
	</div>
</template>

<script>
export default {
	name: 'shopcart',
	props: {
		selectGoods: {
			type: Array,
			default() {
				// return [{count: 1, price: 5, name: '十米長部'}, {count: 2, price: 5, name: '百米長部'}]
				return []
			},
		},
	},
	data() {
		return {}
	},
	computed: {
		totalPrice() {
			return this.selectGoods
				.reduce((pre, cur) => (pre + cur.price * cur.count), 0)
		},
		totalCount() {
			return this.selectGoods
				.reduce((pre, cur) => (pre + cur.count), 0)
		},
		payDesc() {
			const last = this.selectGoods[this.selectGoods.length - 1]
			return last ? last.name : '依家布藝'
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
	z-index: 1;
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
}
</style>
