<template>
	<div class="split">
		<div class="split-header" />
		<div class="split-body" />
	</div>
</template>

<script>
import Back from '@/components/Back/Back.vue'

export default {
	name: 'split',
	data() {
		return {}
	},
}
</script>

<style lang="less">
@import '../../../static/css/variable';
.split {
	width: 100%;
	height: 16px;
	.border();
	.split-header {
		height: 1px;
		.border();
	}
	.split-body {
		height: 14px;
		background: @bg-color;
	}
}
</style>
