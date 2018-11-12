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
										<span>
											月售{{food.sellCount}}份
										</span>
										<span>
											好评率{{food.rating}}%
										</span>
										<div class="price">
											<span>￥{{food.price}}</span>
											<span></span>
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
				padding: 0 12px;
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
		}
	}
}
</style>
