<template>
	<div class="cost">
		<div class="clearfix back-wrapper">
			<Back />
			<div class="back-title">{{$route.meta.title}}</div>
		</div>
		<div class="goods">
			<div class="cate-wrapper">
				
			</div>
			<div class="goods-wrapper">
				
			</div>
		</div>
	</div>
</template>

<script>
import Back from '@/components/Back/Back.vue';

export default {
	name: 'member-cost',
	components: {
		Back,
	},
	data() {
		return {};
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
		}
		.goods-wrapper {
			flex: 1;
			background: #fff;
		}
	}
}
</style>
