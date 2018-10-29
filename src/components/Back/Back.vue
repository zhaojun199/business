<template>
	<div class="back">
		<i class="iconfont icon-you"/>
		<!-- <div>{{title}}</div> -->
	</div>
</template>

<script>
export default {
	name: 'back',
	data() {
		const title = this.$route.meta ? this.$route.meta.title : '';
		return {
			title,
		};
	},
}
</script>

<style lang="less">
@import '../../../static/css/variable';
.back {
	transform: rotate(180deg);
	padding: 0.85rem;
	width: 3.8rem;
	top: 0;
	position: absolute;
	left: 0;
	background: @primary-color;
	color: #fff;
	.iconfont {
		font-size: 2.5rem;
	}
}
</style>
