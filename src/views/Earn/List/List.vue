<template>
	<div class="member">
		<div class="clearfix back-wrapper">
			<Back />
			<mt-search
				v-model="value"
				cancel-text="取消"
				placeholder="搜索">
			</mt-search>
		</div>
		<div>
			<span @click="selectDate('start')">起始日期</span>
			~
			<span @click="selectDate('end')">结束日期</span>
			<span>筛选</span>
			<mt-datetime-picker
				ref="start_picker"
				type="date"
				v-model="start_time"
			>
			</mt-datetime-picker>
			<mt-datetime-picker
				ref="end_picker"
				type="date"
				v-model="end_time"
			>
			</mt-datetime-picker>
		</div>
		<div>
			<span>销售额</span>
			<span>100</span>
			<span>利润</span>
			<span>200</span>
			<span>分析</span>
		</div>
		<template v-if="Math.random() < 1 || list.length">
			<List
				:title="'title'"
				:subTitle="'subTitle'"
				:content="'content'"
				:subContent="'subContent'"
				:extra="'extra'"
				@click.native="toDetail(1)"
			></List>
			<List
				:title="'title'"
				:subTitle="'subTitle'"
				:content="'content'"
				:subContent="'subContent'"
				:extra="'extra'"
				is-actived
			></List>
		</template>
		<div v-else class="bs-no-data">
			<svg class="iconfont" aria-hidden="true">
				<use xlink:href="#icon-huowujilu"/>
			</svg>
			<div class="bs-no-text">该条件下暂无收益</div>
		</div>
	</div>
</template>

<script>
import Back from '@/components/Back/Back.vue';
import List from '@/components/List/List.vue';
export default {
	name: 'goods-list',
	components: {
		Back,
		List,
	},
	data() {
		return {
			start_time: '',
			end_time: '',
			value: '',
			list: [],
			style: {
				del: { background: 'red', color: '#fff', padding: '0 1.7rem' },
				edit: { background: '#4983ec', color: '#fff', padding: '0 1.7rem' },
			}
		};
	},
	methods: {
		selectDate(type) {
			this.$refs[`${type}_picker`].open();
		},
		toDetail(id) {
			this.$router.push(`/goods/detail/${id}`)
		}
	}
}
</script>

<style lang="less">
.member-list {
	text-align: left;
}
</style>
