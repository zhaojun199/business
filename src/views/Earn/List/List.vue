<template>
	<div class="earn">
		<div class="clearfix back-wrapper">
			<Back />
			<mt-search
				v-model="value"
				cancel-text="取消"
				placeholder="搜索">
			</mt-search>
		</div>
		<div class="earn-screen">
			<span @click="selectDate('start')">起始日期</span>
			~
			<span @click="selectDate('end')">结束日期</span>
			<span class="earn-more">筛选♢</span>
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
		<div class="earn-screen">
			<span class="earn-label">销售额：</span>
			<span class="earn-field">100</span>
			<span class="earn-label">利润：</span>
			<span class="earn-field">200</span>
			<span class="earn-more">分析+</span>
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
	name: 'earn-list',
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
@import '../../../../static/css/variable';
.earn-screen {
	font-size: 1.6rem;
	background: @assistant-color;
	color: #fff;
	padding: .4rem;
}
.earn-label {
	font-weight: 700;
}
.earn-field {
	color: @primary-color;
	margin-right: 1rem;
}
.earn-more {
	float: right;
	font-size: 1.4rem;
	color: #fff;
	margin-right: 1rem;
	border: @primary-color .1rem dotted;
	border-radius: .3rem;
	padding: 0 .4rem;
}
</style>
