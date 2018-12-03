<template>
	<transition name="move">
		<div v-show="show_flag" class="good">
			<div class="good-content">
				<div class="good-image-header">
					<img :src="good.image">
				</div>
			</div>
		</div>
	</transition>
</template>

<script>

export default {
	name: 'good',
	props: {
		good: {
			type: Object,
			default: () => ({}),
		},
	},
	data() {
		return {
			show_flag: false,
		}
	},
	methods: {
		show() {
			this.show_flag = !this.show_flag
		}
	},
}
</script>

<style lang="less">
.good {
	position: fixed;
	left: 0;
	top: 0;
	bottom: 48px;
	width: 100%;
	background: #555;
	z-index: 10;
	transition: all 0.2s linear;
	&.move-enter, &.move-leave-active {
		transform: translate3d(0, -100%, 0);
	}
}
</style>
