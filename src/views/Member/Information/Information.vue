<template>
	<div class="info">
		<div>基本信息</div>
		<div>消费记录</div>
		<div>积分信息</div>
		<div class="bs-fixed">
			<div class="info-btn">
				<mt-button
					type="primary"
					size="large"
					@click="toMemberCost"
				>会员消费</mt-button>
			</div>
		</div>
	</div>
</template>

<script>
export default {
	name: 'info',
	data() {
		return {};
	},
	methods: {
		toMemberCost() {
			const { user } = this.$route.params;
			this.$router.push(`/member/${user}/cost`);
		}
	}
}
</script>

<style lang="less">
@import '../../../../static/css/variable';
.info {
	.info-btn {
		margin: 1rem 1rem 1.5rem;
	}
}
.bs-fixed {
	background: @bg-color;
	position: fixed;
	bottom: 0;
	width: 100%;
}
</style>
