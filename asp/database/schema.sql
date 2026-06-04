-- ==============================================
-- 广东兰凯律师事务所 - 数据库建表脚本
-- 适用于 Access / MSSQL 数据库
-- ==============================================

-- 1. 管理员表
CREATE TABLE admins (
    id AUTOINCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(100) NOT NULL,
    created_at DATETIME DEFAULT Now()
);

-- 2. 栏目表
CREATE TABLE columns (
    id AUTOINCREMENT PRIMARY KEY,
    column_name VARCHAR(100) NOT NULL,
    column_type VARCHAR(50) DEFAULT 'other',
    sort_order INTEGER DEFAULT 0,
    is_system INTEGER DEFAULT 0
);

-- 3. 文章表
CREATE TABLE articles (
    id AUTOINCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    column_id INTEGER NOT NULL,
    summary TEXT,
    content MEMO,
    created_at DATETIME DEFAULT Now(),
    sort_order INTEGER DEFAULT 0
);

-- 4. 律师表
CREATE TABLE lawyers (
    id AUTOINCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    position VARCHAR(100),
    specialties VARCHAR(500),
    photo VARCHAR(200),
    intro TEXT,
    sort_order INTEGER DEFAULT 0
);

-- 5. 网站设置表
CREATE TABLE settings (
    id AUTOINCREMENT PRIMARY KEY,
    setting_key VARCHAR(100) NOT NULL UNIQUE,
    setting_value TEXT
);

-- ==============================================
-- 初始化数据
-- ==============================================

-- 管理员账号
INSERT INTO admins (username, password) VALUES ('admin', 'admin123');

-- 系统栏目
INSERT INTO columns (column_name, column_type, sort_order, is_system) VALUES ('新闻中心', 'news', 1, 1);
INSERT INTO columns (column_name, column_type, sort_order, is_system) VALUES ('兰凯研究', 'research', 2, 1);
INSERT INTO columns (column_name, column_type, sort_order, is_system) VALUES ('兰凯党建', 'party', 3, 1);
INSERT INTO columns (column_name, column_type, sort_order, is_system) VALUES ('业务领域', 'practice', 4, 1);
INSERT INTO columns (column_name, column_type, sort_order, is_system) VALUES ('专业团队', 'team', 5, 1);
INSERT INTO columns (column_name, column_type, sort_order, is_system) VALUES ('关于我们', 'about', 6, 1);
INSERT INTO columns (column_name, column_type, sort_order, is_system) VALUES ('首页', 'home', 7, 1);

-- 律师数据
INSERT INTO lawyers (name, position, specialties, photo, intro, sort_order) VALUES ('彭大成', '合伙人律师', '民商事诉讼、合同纠纷、公司法务', 'images/peng_dacheng.jpg', '广东兰凯律师事务所合伙人，具有丰富的诉讼实务经验，擅长处理复杂民商事争议。', 1);
INSERT INTO lawyers (name, position, specialties, photo, intro, sort_order) VALUES ('陈康祥', '合伙人律师', '民事诉讼、劳动争议、交通事故', 'images/chen_kangxiang.jpg', '广东兰凯律师事务所合伙人，广东财经大学信息学院校友，执业领域以民事诉讼为主，代理案件涵盖合同纠纷、劳动争议、交通事故赔偿等多个领域。', 2);
INSERT INTO lawyers (name, position, specialties, photo, intro, sort_order) VALUES ('陈重维', '合伙人律师', '婚姻家庭、继承纠纷、知识产权', 'images/chen_chongwei.jpg', '广东兰凯律师事务所合伙人，擅长婚姻家庭、继承纠纷、知识产权等领域，工作细致认真，深受客户信赖。', 3);

-- 默认网站设置
INSERT INTO settings (setting_key, setting_value) VALUES ('banner_title', '一流规模·一流管理·一流服务');
INSERT INTO settings (setting_key, setting_value) VALUES ('banner_subtitle', '专业 · 诚信 · 卓越');
INSERT INTO settings (setting_key, setting_value) VALUES ('banner_image', 'images/banner.jpg');
INSERT INTO settings (setting_key, setting_value) VALUES ('site_phone', '020-00000000');
INSERT INTO settings (setting_key, setting_value) VALUES ('site_address', '广州市天河区珠江新城花城大道20号远洋大厦14楼');
INSERT INTO settings (setting_key, setting_value) VALUES ('site_wechat', '广东兰凯律师事务所');
INSERT INTO settings (setting_key, setting_value) VALUES ('site_website', 'www.lankai.net');
