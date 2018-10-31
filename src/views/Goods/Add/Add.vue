<template>
	<div class="member-add">
		<div class="clearfix back-wrapper">
			<Back />
			<div class="back-title">{{$route.meta.title}}</div>
		</div>
		<mt-field label="编号" placeholder="请输入编号" v-model="g_id"/>
		<mt-field label="商品名" placeholder="请输入商品名" v-model="name"/>
		<div class="bs-form">
			<div class="bs-form-cell" @click="toClassify">
				<label class="bs-form-label">商品分类</label>
				<div class="bs-form-value" style="text-align: right">
					{{ classify_name }}
					<i class="iconfont icon-you bs-more"/>
				</div>
			</div>
		</div>
		<mt-field label="进价" placeholder="0.00" v-model="purchase_price"/>
		<mt-field label="售价" placeholder="0.00" v-model="selling_price"/>
		<mt-field label="货源" v-model="source"/>
		<mt-field label="库存" placeholder="0" type="number" v-model="inventory"/>
		<mt-field label="备注" v-model="remark"/>
	</div>
</template>

<script>
import Back from '@/components/Back/Back.vue';
export default {
	name: 'goods-add',
	components: {
		Back,
	},
	data() {
		return {
			g_id: '',
			name: '',
			classify_name: '',
			classify_id: 0,
			purchase_price: '',
			selling_price: '',
			inventory: 0,
			source: '',
			remark: '',
		};
	},
	methods: {
		toClassify() {
			this.$router.push('/goods/classify')
		},
	},
}
</script>

<style lang="less">
</style>
