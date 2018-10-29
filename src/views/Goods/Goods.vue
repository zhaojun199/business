<template>
	<div class="member">
		<div class="clearfix back-search">
			<Back />
			<mt-search
				v-model="value"
				cancel-text="取消"
				placeholder="搜索">
			</mt-search>
		</div>
		<template v-if="Math.random() > 1 || list.length">
			
		</template>
		<div v-else class="bs-no-data">
			<svg class="iconfont" aria-hidden="true">
				<use xlink:href="#icon-huowujilu"/>
			</svg>
			<div class="bs-no-text">该条件下暂无货物</div>
			<mt-button
				type="primary"
				size="small"
				@click="addMemeber"
			>立即添加</mt-button>
		</div>
		<div class="bs-plus" @click="addMemeber">
			<i class="iconfont icon-jia"></i>
		</div>
	</div>
</template>

<script>
import Back from '@/components/Back/Back.vue';
export default {
	name: 'member',
	components: {
		Back,
	},
	data() {
		return {
			value: '',
			list: [],
			style: {
				del: { background: 'red', color: '#fff', padding: '0 1.7rem' },
				edit: { background: '#4983ec', color: '#fff', padding: '0 1.7rem' },
			}
		};
	},
	methods: {
		addMemeber() {
			this.$router.push('/goods/add')
		},
	}
}
</script>

<style lang="less">
.member-list {
	text-align: left;
}
</style>
