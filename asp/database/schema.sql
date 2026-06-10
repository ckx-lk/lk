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
INSERT INTO admins (username, password) VALUES ('admin', 'ckx753357');

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
INSERT INTO lawyers (name, position, specialties, photo, intro, sort_order) VALUES ('陈康祥', '合伙人律师', '企业法律顾问、民事诉讼、劳动争议、合同纠纷', 'images/chen_kangxiang.jpg', '陈康祥律师是广东兰凯律师事务所合伙人，有丰富的企业管理经验，担任多家企业及政府部门的法律顾问，主要执业领域包括企业法律顾问、民事诉讼、劳动争议、合同纠纷等。', 2);
INSERT INTO lawyers (name, position, specialties, photo, intro, sort_order) VALUES ('陈重维', '合伙人律师', '刑事辩护、债务债权、商品房买卖、保理合同', 'images/chen_chongwei.jpg', '陈重维律师深耕刑事辩护、债务债权处置、商品房买卖及保理合同纠纷，凭借扎实的法律功底与丰富实务经验，为当事人提供精准专业的解决方案；曾任职于公安机关法制科，熟悉司法机关办案流程与逻辑；现担任房地产、保理等多个行业企业的常年法律顾问，深谙企业法律风险防控与商业纠纷处理，致力于为客户提供兼具法律严谨性与商业可行性的服务。', 3);
INSERT INTO lawyers (name, position, specialties, photo, intro, sort_order) VALUES ('林琛策', '专职律师', '公司法律顾问、合同纠纷、劳动纠纷、债权债务、集体经济组织', 'images/lin_shence.jpg', '秉持"受人之托，忠人之事"的执业理念，依法维护当事人合法权益，业务涵盖公司法律顾问、合同纠纷、劳动纠纷、债权债务纠纷及集体经济组织纠纷等，善于以严谨逻辑与创新策略，通过谈判、诉讼、仲裁等方式高效合法化解争议，坚持诉讼性价比优先原则，让当事人合法权益最大化。', 4);

-- 默认网站设置
INSERT INTO settings (setting_key, setting_value) VALUES ('banner_title', '一流规模·一流管理·一流服务');
INSERT INTO settings (setting_key, setting_value) VALUES ('banner_subtitle', '专业 · 诚信 · 卓越');
INSERT INTO settings (setting_key, setting_value) VALUES ('banner_image', 'images/banner.jpg');
INSERT INTO settings (setting_key, setting_value) VALUES ('site_phone', '020-00000000');
INSERT INTO settings (setting_key, setting_value) VALUES ('site_address', '广州市天河区珠江新城花城大道20号远洋大厦14楼');
INSERT INTO settings (setting_key, setting_value) VALUES ('site_wechat', '广东兰凯律师事务所');
INSERT INTO settings (setting_key, setting_value) VALUES ('site_website', 'www.lankai.net');
