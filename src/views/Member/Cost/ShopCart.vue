<template>
	<div class="shopcart">
		<div class="st-content">
			<div class="st-content-left">
				<div class="st-logo-wrapper">
					<div class="st-logo">
						<i class="iconfont icon-ai-cart st-icon-shopping-cart"></i>
					</div>
				</div>
				<div class="st-price">￥100</div>
				<div class="st-desc"></div>
			</div>
			<div class="st-content-right"></div>
		</div>
	</div>
</template>

<script>
export default {
	name: 'shopcart',
	components: {
	},
	data() {
		return {}
	},
}
</script>

<style lang="less">
@import '../../../../static/css/variable';
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
					background: #2b343c;
					.st-icon-shopping-cart {
						line-height: 44px;
						font-size: 26px;
						color: #80858a;
						&.st-icon-shopping-cart-active {
							color: red;
						}
					}
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
			}
			.st-desc {
				display: inline-block;
			}
		}
		.st-content-right {
			flex: 0 0 105px;
			width: 105px;
		}
	}
}
</style>
