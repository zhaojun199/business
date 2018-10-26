<template>
	<div class="member-add">
		<mt-field label="姓名" placeholder="请输入姓名" v-model="username"/>
		<div class="bs-form">
			<div class="bs-form-cell" @click="showSex">
				<label class="bs-form-label">性别</label>
				<div class="bs-form-value" style="text-align: right">
					{{ sex_text }}
					<i class="iconfont icon-you bs-more"/>
				</div>
			</div>
		</div>
		<mt-popup
			v-model="popupVisible"
			position="bottom"
			popup-transition="popup-fade"
		>
		<mt-picker :slots="sex_options" @change="chooseSex" valueKey="text"/>
		</mt-popup>
		<mt-field label="手机号" placeholder="请输入手机号" type="tel" v-model="phone"/>
		<mt-field label="生日" placeholder="请输入生日" type="date" v-model="birthday"/>
		<mt-field label="介绍人" placeholder="请输入介绍人" v-model="introducer"/>
		<mt-field label="备注" type="textarea" rows="4" v-model="remark"/>
	</div>
</template>

<script>
export default {
	name: 'member-add',
	components: {
	},
	data() {
		return {
			username: '',
			sex_text: '男',
			sex_value: 1,
			phone: '',
			birthday: '',
			introducer: '',
			remark: '',
			popupVisible: false,
			sex_options: [{
				flex: 1,
				values: [{
					value: 1,
					text: '男'
				}, {
					value: 2,
					text: '女'
				}, {
					value: 3,
					text: '保密'
				}],
			}],
		};
	},
	methods: {
		showSex() {
			this.popupVisible = true
		},
		chooseSex(picker, values) {
			const value = values[0]
			this.sex_text = value.text
			this.sex_value = value.value
			this.popupVisible = false
		},
	},
}
</script>

<style lang="less">
</style>
