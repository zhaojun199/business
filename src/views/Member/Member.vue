<template>
	<div class="member">
		<mt-search
			v-model="value"
			cancel-text="取消"
			placeholder="搜索">
		</mt-search>
		<div class="member-plus" @click="addMemeber">
			<i class="iconfont icon-jia"></i>
		</div>
	</div>
</template>

<script>

export default {
	name: 'member',
	components: {
	},
	data() {
		return {
			value: '',
		};
	},
	methods: {
		addMemeber() {
			this.$router.push('/member/add')
		}
	}
}
</script>

<style lang="less">
@import '../../../static/css/basic';
.member-plus {
	position: fixed;
    right: 3rem;
    bottom: 8rem;
    color: @primary-color;
    filter: drop-shadow(0px 0px 2px @primary-color);
    .iconfont {
    	font-size: 4.5rem;
    }
}
</style>
