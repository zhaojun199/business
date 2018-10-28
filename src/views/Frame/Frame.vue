<template>
	<div>
		<router-view/>
		<mt-tabbar v-model="selected">
			<mt-tab-item id="/home">
				<svg class="iconfont" aria-hidden="true">
					<use
						:xlink:href="selected === '/home' ? '#icon-shouye' : '#icon-shouye1'">
					</use>
				</svg>
				<div class="tab-title">首页</div>
			</mt-tab-item>
			<mt-tab-item id="/member">
				<svg class="iconfont" aria-hidden="true">
					<use
						:xlink:href="selected === '/member' ? '#icon-huiyuanguanli' : '#icon-huiyuan'">
					</use>
				</svg>
				<div class="tab-title">会员</div>
			</mt-tab-item>
			<mt-tab-item id="/goods">
				<svg class="iconfont" aria-hidden="true">
					<use
						:xlink:href="selected === '/goods' ? '#icon-shangpinguanli' : '#icon-shangpin'">
					</use>
				</svg>
				<div class="tab-title">商品</div>
			</mt-tab-item>
			<!-- <mt-tab-item id="我的">
				<img slot="icon" src="">
				我的
			</mt-tab-item> -->
		</mt-tabbar>
	</div>
</template>
<script>
export default {
	name: 'Frame',
	data() {
		return {
			selected: this.$route.path,
		};
	},
	watch: {
		selected(path) {
			this.$router.push(path)
		}
	},
}
</script>
<style lang="less">
.tab-title {
	padding: .1rem;
}
</style>
