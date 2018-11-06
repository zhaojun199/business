<template>
	<div class="info">
		<div>基本信息</div>
		<div>消费记录</div>
		<div>积分信息</div>
		<div class="bs-fixed">
			<mt-button type="primary" size="large">会员消费</mt-button>
		</div>
	</div>
</template>

<script>
export default {
	name: 'info',
	data() {
		return {};
	},
}
</script>

<style lang="less">
@import '../../../../static/css/variable';
.bs-fixed {
	background: @bg-color;
}
</style>
