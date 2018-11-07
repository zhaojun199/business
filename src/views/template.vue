<template>
	<div class="home">
		<div class="clearfix back-wrapper">
			<Back />
			<div class="back-title">{{$route.meta.title}}</div>
		</div>
		<HelloWorld msg="Welcome to Your Vue.js App"/>
	</div>
</template>

<script>
import Back from '@/components/Back/Back.vue';
import HelloWorld from '@/components/HelloWorld.vue'

export default {
	name: 'member',
	components: {
		Back,
		HelloWorld,
	},
	data() {
		return {};
	},
}
</script>

<style lang="less">
</style>
