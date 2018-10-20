<template>
	<div class="member-add">
		<mt-field label="姓名" placeholder="请输入姓名" v-model="username"></mt-field>
		<mt-field label="性别" />
		</mt-field>
		<mt-popup
			v-model="popupVisible"
			position="bottom"
		>
		</mt-popup>
		<mt-field label="手机号" placeholder="请输入手机号" type="tel" v-model="phone"></mt-field>
		<mt-field label="生日" placeholder="请输入生日" type="date" v-model="birthday"></mt-field>
		<mt-field label="介绍人" placeholder="请输入介绍人" v-model="introducer"></mt-field>
		<mt-field label="备注" type="textarea" rows="4" v-model="remark"></mt-field>
	</div>
</template>

<script>
import HelloWorld from '@/components/HelloWorld.vue'

export default {
	name: 'member-add',
	components: {
		HelloWorld,
	},
	data() {
		return {
			username: '',
			sex: '',
			phone: '',
			birthday: '',
			introducer: '',
			remark: '',
			popupVisible: false,
		};
	},
}
</script>

<style lang="less">
</style>
