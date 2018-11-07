<template>
	<div class="earn">
		<keep-alive>
			<router-view v-if ="$route.meta.keep_alive"/> 
		</keep-alive>
		<router-view v-if ="!$route.meta.keep_alive"/> 
	</div>
</template>