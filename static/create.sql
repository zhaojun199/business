/*这里用的是ESC下边的反引号*/
CREATE DATABASE IF NOT EXISTS `business`;
USE `business`;
/*管理员表*/
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`(
	`admin_id` tinyint unsigned auto_increment,
	`username` varchar(20) not null,
	`password` char(32) not null,
	`email` varchar(50) not null,
	`update_time` datetime not null default current_timestamp on update current_timestamp comment '更新时间',
	`create_time` datetime not null default current_timestamp comment '创建时间',
	PRIMARY KEY (`admin_id`),
  	UNIQUE KEY `username` (`username`)
);
/*用户表*/
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`(
	`user_id` int unsigned auto_increment,
	`username` varchar(20) not null,
	`password` char(32) not null,
	`sex` tinyint(4) not null,
	`phone` varchar(20) not null,
	`point` int not null comment '积分',
	`email` varchar(50) not null,
	`user_img` varchar(50) not null comment '头像',
	`birthday` date not null comment '生日',
	`update_time` datetime not null default current_timestamp on update current_timestamp comment '更新时间',
	`create_time` datetime not null default current_timestamp comment '创建时间',
	PRIMARY KEY (`user_id`),
  	UNIQUE KEY `username` (`username`)
) comment = '用户信息表';

DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`(
	`goods_id` int unsigned auto_increment,
	`sn` varchar(20) not null comment 'sn编号',
	`goods_name` varchar(20) not null comment '名称',
	`goods_img` varchar(50) not null comment '图片',
	`goods_thums` varchar(50) not null comment '缩略图',
	`brand_id` int not null comment '品牌id',
	`shop_id` int not null comment '店铺id',
	`market_price` decimal(11, 2) not null default 0.00 comment '市场价格',
	`shop_price` decimal(11, 2) not null default 0.00 comment '店铺价格',
	`stock` int not null default 0 comment '库存',
	`sale_count` int not null default 0 comment '销售量',
	`goods_unit` varchar(10) not null comment '单位',
	`goods_spec` text not null comment '规格',
	`is_sale` tinyint not null default 1 comment '是否上架(0:否 1:是)',
	`is_best` tinyint not null default 1 comment '是否精品(0:否 1:是)',
	`is_hot` tinyint not null default 1 comment '是否热销产品(0:否 1:是)',
	`is_new` tinyint not null default 1 comment '是否新品(0:否 1:是)',
	`is_recommend` tinyint not null default 1 comment '是否推荐(0:否 1:是)',
	`goods_cate_id_1` int not null comment '商品一级分类id',
	`goods_cate_id_2` int not null comment '商品二级分类id',
	`goods_cate_id_3` int not null comment '商品三级分类id',
	`goods_desc` text not null comment '商品描述',
	`sale_time` datetime not null default current_timestamp comment '上架时间',
	`del_flag` tinyint not null default 1 comment '删除标志(-1:删除 1:有效)',
	`update_time` datetime not null default current_timestamp on update current_timestamp comment '更新时间',

	`create_time` datetime not null default current_timestamp comment '创建时间',
	PRIMARY KEY (`goods_id`)
) comment = '商品表';

DROP TABLE IF EXISTS `goods_cate`;
CREATE TABLE `goods_cate`(
	`cate_id` int unsigned auto_increment,
	`cate_level` tinyint not null comment '分类级别(一级/二级)',
	`cate_name` varchar(20) not null comment '分类名称',
	`sort` int not null comment '排序号',
	`parent_id` int unsigned comment '父级id',
	`update_time` datetime not null default current_timestamp on update current_timestamp comment '更新时间',
	`create_time` datetime not null default current_timestamp comment '创建时间',
	PRIMARY KEY (`cate_id`),
	CONSTRAINT `pid` FOREIGN KEY (parent_id) REFERENCES goods_cate (cate_id)
) comment = '商品分类表';