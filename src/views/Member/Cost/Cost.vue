<template>
	<div class="cost">
		<div class="clearfix back-wrapper">
			<Back />
			<div class="back-title">{{$route.meta.title}}</div>
		</div>
		<div class="goods">
			<div class="cate-wrapper">
				<ul>
					<li v-for="item in goods" class="cate-item">
						<span class="goods-text">
							{{item.name}}
						</span>
					</li>
				</ul>
			</div>
			<div class="goods-wrapper">
				<ul>
					<li v-for="item in goods" class="goods-list">
						<h1 class="goods-title">{{item.name}}</h1>
						<ul>
							<li v-for="food in item.foods" class="goods-item">
								<div class="goods-icon">
									<img :src="food.icon" alt=""/>
								</div>
								<div class="goods-content">
									<h2 class="goods-name">{{food.name}}</h2>
									<p class="goods-desc">{{food.description}}</p>
									<div class="goods-extra">
										<span class="goods-count">
											月售{{food.sellCount}}份
										</span>
										<span>
											好评率{{food.rating}}%
										</span>
										<div class="goods-price">
											<span class="goods-price-now">￥{{food.price}}</span>
											<span class="goods-price-old"></span>
										</div>
									</div>
								</div>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>
</template>

<script>
import BScroll from 'better-scroll'
import Back from '@/components/Back/Back.vue'
import goods from '@static/goods.json'

export default {
	name: 'member-cost',
	components: {
		Back,
	},
	data() {
		log(goods)
		return {
			goods: goods.goods,
		}
	},
	methods: {
		initScroll() {

		}
	}
}
</script>

<style lang="less">
@import '../../../../static/css/variable';
.cost {
	.goods {
		display: flex;
		position: absolute;
		top: 174px;
		bottom: 46px;
		width: 100%;
		overflow: hidden;
		.cate-wrapper {
			flex: 0 0 80px;
			width: 80px;
			background: @bg-color;
			.cate-item {
				display: table;
				height: 54px;
				line-height: 14px;
    			margin: 12px;
				.border();
				.goods-text {
					display: table-cell;
					height: 54px;
					width: 56px;
					vertical-align: middle;
					font-size: 12px;
				}
			}
		}
		.goods-wrapper {
			flex: 1;
			background: #fff;
			.goods-title {
				padding-left: 14px;
				height: 26px;
				line-height: 26px;
				border-left: 2px solid #d9dde1;
				font-size: 12px;
				color: rgb(147, 153, 159);
				background: #f3f5f7
			}
			.goods-item {
				display: flex;
				margin: 18px;
				padding-bottom: 18px;
				.border();
				&:last-child {
					.border-none();
					margin-bottom: 0px;
				}
				.goods-icon {
					flex: 0 0 57px;
					margin-right: 10px;
				}
				.goods-content {
					flex: 1;
					.goods-name {
						margin: 2px 0 8px 0;
						height: 14px;
						line-height: 14px;
						font-size: 14px;
						font-weight: 600;
						color: rgb(7, 17, 27);
					}
					.goods-desc, .goods-extra {
						line-height: 10px;
						font-size: 10px;
						color: rgb(147, 157, 159);
					}
					.goods-desc {
						margin-bottom: 8px;
					}
					.goods-extra {
						& .goods-count {
							margin-right: 12px;
						}
					}
					.goods-price {
						font-weight: 700;
						line-height: 24px;
						.goods-price-now {
							margin-right: 8px;
							font-size: 14px;
							color: rgb(240, 20, 20);
						}
						.goods-price-old {
							text-decoration: line-through;
							font-size: 10px;
							color: rgb(147, 153, 159);
						}
					}
				}
			}
		}
	}
}
</style>
