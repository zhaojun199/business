<template>
	<div class="header-back" @click="$router.go(-1)">
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
.header-back {
	transform: rotate(180deg);
	padding: 0.85rem;
	width: 3.8rem;
	top: 0;
	position: absolute;
	left: 0;
	background: @primary-color;
	color: #fff;
	z-index: 9;
	.iconfont {
		font-size: 2.5rem;
	}
}
</style>
