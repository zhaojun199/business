<template>
	<div class="member">
		<mt-search
			v-model="value"
			cancel-text="取消"
			placeholder="搜索">
		</mt-search>
		<template v-if="Math.random() < 1 || list.length">
			<mt-index-list class="member-list">
				<mt-index-section index="A">
					<mt-cell-swipe
						title="zhaojun2@douyu.tv"
						:right="[{
							content: '编辑',
							style: this.style.edit,
							handler: () => this.$messagebox('delete')
						}, {
							content: '删除',
							style: this.style.del,
							handler: () => this.$messagebox('delete')
						}]"
						is-link
						href="/#/member/zhaojun/point"
					>2 ∴</mt-cell-swipe>
					<mt-cell title="Aaron" value="2 ∴"/>
					<mt-cell title="Alden" value="24 ∴"/>
					<mt-cell title="Austin" value="21 ∴"/>
				</mt-index-section>
				<mt-index-section index="B">
					<mt-cell title="Baldwin" value="2213 ∴"/>
					<mt-cell title="Braden" value="42 ∴"/>
				</mt-index-section>
				<mt-index-section index="Z">
					<mt-cell title="Zack" value="2 ∴"/>
					<mt-cell title="Zane" value="52 ∴"/>
				</mt-index-section>
				<mt-index-section index="A">
					<mt-cell title="Aaron" value="2 ∴"/>
					<mt-cell title="Alden" value="24 ∴"/>
					<mt-cell title="Austin" value="21 ∴"/>
				</mt-index-section>
				<mt-index-section index="B">
					<mt-cell title="Baldwin" value="2213 ∴"/>
					<mt-cell title="Braden" value="42 ∴"/>
				</mt-index-section>
				<mt-index-section index="Z">
					<mt-cell title="Zack" value="2 ∴"/>
					<mt-cell title="Zane" value="52 ∴"/>
				</mt-index-section>
			</mt-index-list>
		</template>
		<div v-else class="member-no-data">
			<svg class="iconfont" aria-hidden="true">
				<use xlink:href="#icon-huiyuanguanli1"/>
			</svg>
			<div class="member-no-text">该条件下暂无会员</div>
			<div class="member-no-btn">
				<mt-button
					type="primary"
					size="small"
					@click="addMemeber"
				>立即添加</mt-button>
			</div>
		</div>
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
			list: [],
			style: {
				del: { background: 'red', color: '#fff', padding: '0 1.7rem' },
				edit: { background: '#4983ec', color: '#fff', padding: '0 1.7rem' },
			}
		};
	},
	methods: {
		addMemeber() {
			this.$router.push('/member/add')
		},
	}
}
</script>

<style lang="less">
@import '../../../static/css/variable';
.member-plus {
	position: fixed;
	right: 2.1rem;
	bottom: 8rem;
	color: @primary-color;
	filter: drop-shadow(0px 0px 2px @primary-color);
	.iconfont {
		font-size: 4.5rem;
	}
}
.member-no-data {
	.iconfont {
		@len: 8rem;
		width: @len;
		height: @len;
		margin-top: 20vh;
	}
	.member-no-text {
		color: #847777;
		padding: 2.8rem 0 1.8rem;
		font-size: 1.4rem;
	}
}
.member-list {
	text-align: left;
}
</style>
