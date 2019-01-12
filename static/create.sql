/*这里用的是ESC下边的反引号*/
DROP DATABASE business;
CREATE DATABASE IF NOT EXISTS `business`;
USE `business`;
/*管理员表*/
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`(
	`admin_id` tinyint unsigned auto_increment,
	`username` varchar(20) not null,
	`password` char(32) not null,
	`email` varchar(50) not null,
	`update_time` datetime not null default current_timestamp on update current_timestamp COMMENT '更新时间',
	`create_time` datetime not null default current_timestamp COMMENT '创建时间',
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
	`point` int not null COMMENT '积分',
	`email` varchar(50) not null,
	`user_img` varchar(50) not null COMMENT '头像',
	`birthday` date not null COMMENT '生日',
	`update_time` datetime not null default current_timestamp on update current_timestamp COMMENT '更新时间',
	`create_time` datetime not null default current_timestamp COMMENT '创建时间',
	PRIMARY KEY (`user_id`),
  	UNIQUE KEY `username` (`username`)
) COMMENT = '用户信息表';

DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`(
	`goods_id` int unsigned auto_increment,
	`sn` varchar(20) not null COMMENT 'sn编号',
	`goods_name` varchar(20) not null COMMENT '名称',
	`goods_img` varchar(50) not null COMMENT '图片',
	`goods_thums` varchar(50) not null COMMENT '缩略图',
	`brand_id` int not null COMMENT '品牌id',
	`shop_id` int not null COMMENT '店铺id',
	`market_price` decimal(11, 2) not null default 0.00 COMMENT '市场价格',
	`shop_price` decimal(11, 2) not null default 0.00 COMMENT '店铺价格',
	`stock` int not null default 0 COMMENT '库存',
	`sale_count` int not null default 0 COMMENT '销售量',
	`goods_unit` varchar(10) not null COMMENT '单位',
	`goods_spec` text not null COMMENT '规格',
	`is_sale` tinyint not null default 1 COMMENT '是否上架(0:否 1:是)',
	`is_best` tinyint not null default 1 COMMENT '是否精品(0:否 1:是)',
	`is_hot` tinyint not null default 1 COMMENT '是否热销产品(0:否 1:是)',
	`is_new` tinyint not null default 1 COMMENT '是否新品(0:否 1:是)',
	`is_recommend` tinyint not null default 1 COMMENT '是否推荐(0:否 1:是)',
	`goods_cate_id_1` int not null COMMENT '商品一级分类id',
	`goods_cate_id_2` int not null COMMENT '商品二级分类id',
	`goods_cate_id_3` int not null COMMENT '商品三级分类id',
	`goods_desc` text not null COMMENT '商品描述',
	`sale_time` datetime not null default current_timestamp COMMENT '上架时间',
	`del_flag` tinyint not null default 1 COMMENT '删除标志(-1:删除 1:有效)',
	`update_time` datetime not null default current_timestamp on update current_timestamp COMMENT '更新时间',
	`create_time` datetime not null default current_timestamp COMMENT '创建时间',
	PRIMARY KEY (`goods_id`)
) COMMENT = '商品表';

DROP TABLE IF EXISTS `goods_cate`;
CREATE TABLE `goods_cate`(
	`cate_id` int unsigned auto_increment,
	`cate_level` tinyint not null COMMENT '分类级别(一级/二级)',
	`cate_name` varchar(20) not null COMMENT '分类名称',
	`sort` int not null COMMENT '排序号',
	`parent_id` int unsigned COMMENT '父级id',
	`update_time` datetime not null default current_timestamp on update current_timestamp COMMENT '更新时间',
	`create_time` datetime not null default current_timestamp COMMENT '创建时间',
	PRIMARY KEY (`cate_id`),
	CONSTRAINT `pid` FOREIGN KEY (parent_id) REFERENCES goods_cate (cate_id)
) COMMENT = '商品分类表';

/*店铺表*/
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop`(
	`shop_id` int unsigned auto_increment,
	`shop_sn` int not null COMMENT '店铺编号',
	`user_id` int unsigned COMMENT '店铺所有人ID',
	`shop_name` varchar(30) not null COMMENT '店铺名称',
	`shop_phone` int not null COMMENT '店铺电话',
	`shop_img` text not null COMMENT '店铺图片',
	`shop_QQ` int not null COMMENT '店铺QQ',
	`shop_add` text not null COMMENT '店铺地址',
	`del_flag` tinyint not null default 1 COMMENT '删除标志(-1:删除 1:有效)',
	`update_time` datetime not null default current_timestamp on update current_timestamp COMMENT '更新时间',
	`create_time` datetime not null default current_timestamp COMMENT '创建时间',
	PRIMARY KEY (`shop_id`),
	CONSTRAINT `shop_user_id` FOREIGN KEY (user_id) REFERENCES user (user_id)
) COMMENT = '店铺表';

/*订单表*/
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`(
	`order_id` int unsigned auto_increment,
	`order_no` varchar(20) not null COMMENT '订单号',
	`shop_id` int unsigned COMMENT '店铺ID',
	`user_id` int unsigned COMMENT '用户ID',
	`order_status` tinyint not null COMMENT '订单状态(-3:用户拒收 -2:未付款的订单 -1：用户取消 0:待发货 1:配送中 2:用户确认收货)',
	`goods_money` decimal not null COMMENT '商品总金额(未进行任何折扣的总价格,不包括运费)',
	`deliver_type` tinyint not null COMMENT '收货方式(0:送货上门 1:自提)',
	`deliver_money` decimal not null default 0.00 COMMENT '运费',
	`total_money` decimal not null default 0.00 COMMENT '订单总金额，包括运费',
	`real_total_money` decimal not null default 0.00 COMMENT '实际订单总金额，折扣之后的金额',
	`pay_type` tinyint not null COMMENT '支付方式(0:货到付款 1:在线支付)',
	`pay_from` int not null COMMENT '支付来源(1:支付宝，2:微信)',
	`is_pay` tinyint not null COMMENT '是否已支付(0:未支付 1:已支付)',
	`user_name` varchar(20) not null COMMENT '收货人名称',
	`user_address` varchar(255) not null COMMENT '收件人地址',
	`user_phone` int not null COMMENT '收件人手机',
	`order_score` int not null default 0 COMMENT '订单积分',
	`is_closed` tinyint not null COMMENT '是否已完结(0:未完结 1:已完结)',
	`receiveTime` datetime COMMENT '收货时间',
	`deliveryTime` datetime COMMENT '发货时间',
	`express_id` int unsigned not null COMMENT '快递公司ID',
	`express_name` varchar(20) not null COMMENT '快递公司名称',
	`express_no` varchar(20) not null COMMENT '快递号',
	`del_flag` tinyint not null default 1 COMMENT '删除标志(-1:删除 1:有效)',
	`update_time` datetime not null default current_timestamp on update current_timestamp COMMENT '更新时间',
	`create_time` datetime not null default current_timestamp COMMENT '创建时间',
	PRIMARY KEY (`order_id`),
	CONSTRAINT `order_shop_id` FOREIGN KEY (shop_id) REFERENCES shop (shop_id),
	CONSTRAINT `order_user_id` FOREIGN KEY (user_id) REFERENCES user (user_id)
	-- CONSTRAINT `order_shop_id` FOREIGN KEY (shop_id) REFERENCES shop (shop_id),
) COMMENT = '订单表';

/*收货地址表*/
DROP TABLE IF EXISTS `delivery_address`;

/*快递公司表*/
DROP TABLE IF EXISTS `express`;
