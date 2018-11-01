<template>
	<div class="classify">
		<div class="clearfix back-wrapper">
			<Back />
			<div class="back-title">{{$route.meta.title}}</div>
		</div>
		<div class="classify-content">
			<div class="classify-root">
				<mt-cell title="大分类" is-link value="50种"/>
				<mt-cell class="classify-active" title="大分类" is-link value="50种"/>
				<mt-cell title="大分类" is-link value="50种"/>
			</div>
			<div class="classify-sub">
				<mt-cell title="小分类"/>
				<mt-cell title="小分类"/>
				<mt-cell title="小分类"/>
				<mt-cell title="小分类"/>
				<mt-cell title="小分类"/>
			</div>
		</div>
	</div>
</template>

<script>
import Back from '@/components/Back/Back.vue';
export default {
	name: 'classify',
	components: {
		Back,
	},
	data() {
		return {};
	},
}
</script>

<style lang="less">
@import '../../../static/css/variable';
.classify-content {
	display: flex;
	vertical-align:text-top;
}
.classify-root {
	flex: 2;
	.mint-cell {
		background: @grey-color;
	}
}
.classify-sub {
	flex: 3;
}
.classify-active {
	&, &.mint-cell {
		background: @active-bg-color;
		color: @active-text-color;
	}
	&:before {
		content: '';
		width: .3rem;
		height: 100%;
		position: absolute;
		background: @primary-color;
	}
}
</style>
