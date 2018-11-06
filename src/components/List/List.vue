<template>
	<div class="bs-list" :class="isActived ? 'bs-list-active' : ''">
		<div class="bs-list-icon">
			<img src="../../../static/img/home.jpg"/>
		</div>
		<div class="bs-list-wrapper">
			<div class="bs-list-title">
				<div class="bs-list-title-primary">{{title}}</div>
				<div class="bs-list-title-sub">{{subTitle}}</div>
			</div>
			<div class="bs-list-content">
				<div class="bs-list-content-primary">{{content}}</div>
				<div class="bs-list-content-sub">{{subContent}}</div>
			</div>
			<div class="bs-list-extra">
				<div class="bs-list-extra-primary">{{extra}}</div>
				<div class="bs-list-extra-sub">{{subExtra}}</div>
			</div>
		</div>
	</div>
</template>

<script>
export default {
	name: 'list',
	props: {
		icon: String,
		title: String,
		subTitle: String,
		content: String,
		subContent: String,
		extra: String,
		subExtra: String,
		isActived: Boolean,
	},
	data() {
		return {
		};
	},
}
</script>

<style lang="less">
@import '../../../static/css/variable';
.bs-list {
	display: flex;
	background: @bg-color;
	justify-content: center;
	&.bs-list-active {
		background: @grey-color;
	}
	.bs-list-icon {
		margin: .7rem .7rem .7rem 1.5rem;
		display: flex;
		align-items: center;
		border-radius: .6rem;
		overflow: hidden;
		img {
			width: 4.8rem;
			height: 4.2rem;
		}
	}
	.bs-list-wrapper {
		background-image: linear-gradient(180deg, #d9d9d9, #d9d9d9 50%, transparent 50%);
		background-size: 120% 1px;
		background-repeat: no-repeat;
		background-position: top left;
		background-origin: content-box;
		box-sizing: border-box;
		display: flex;
		min-height: inherit;
		overflow: hidden;
		padding: 0 1rem;
		width: 100%;
		justify-content: space-between;
		.bs-list-title {
			flex: 3;
			max-width: 9rem;
			.bs-list-title-primary {
				font-size: 2rem;
				height: 50%;
				padding-top: .8rem;
				.ellipsis();
			}
			.bs-list-title-sub {
				font-size: 1.6rem;
				padding-top: .5rem;
				color: @primary-color;
				.ellipsis();
			}
		}
		.bs-list-content {
			flex: 3;
			max-width: 12rem;
			margin: 0 1rem;
			.bs-list-content-primary {
				height: 50%;
				padding-top: 1rem;
				.ellipsis();
			}
			.bs-list-content-sub {
				padding-top: .5rem;
				color: @sub-black-color;
				.ellipsis();
			}
		}
		.bs-list-extra {
			flex: 1;
			max-width: 2rem;
			.bs-list-extra-primary {
				height: 50%;
				padding-top: 1.2rem;
				.ellipsis();
			}
			.bs-list-extra-sub {
				padding-top: .7rem;
				color: @sub-black-color;
				.ellipsis();
			}
		}
	}
}
</style>
