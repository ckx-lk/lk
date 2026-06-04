# 广东兰凯律师事务所网站 - 部署说明

## 项目概述

本网站为广东兰凯律师事务所官方网站，采用经典 ASP（Classic ASP）技术栈开发，使用 Access 数据库（可升级为 MSSQL），前端为 HTML/CSS/JavaScript。

---

## 目录结构

```
lankai-law/
├── index.html          # HTML预览版首页
├── about.html          # HTML预览版关于我们
├── practice.html       # HTML预览版业务领域
├── team.html           # HTML预览版专业团队
├── news.html           # HTML预览版新闻中心
├── research.html       # HTML预览版兰凯研究
├── party.html          # HTML预览版兰凯党建
├── css/
│   ├── style.css       # 前台样式
│   └── admin.css       # 后台样式
├── js/
│   ├── main.js         # 前台交互脚本
│   └── admin.js        # 后台管理逻辑（HTML版）
├── images/             # 图片资源
├── data.json           # 结构化数据文件
├── admin/              # HTML版后台管理
│   ├── login.html
│   ├── dashboard.html
│   ├── articles.html
│   ├── lawyers.html
│   ├── columns.html
│   └── settings.html
│
└── asp/                # ★ ASP版本（部署用）
    ├── index.asp       # 首页
    ├── about.asp       # 关于我们
    ├── practice.asp    # 业务领域
    ├── team.asp        # 专业团队
    ├── news.asp        # 新闻中心
    ├── research.asp    # 兰凯研究
    ├── party.asp       # 兰凯党建
    ├── detail.asp      # 文章详情页
    ├── css/            # 样式文件
    ├── js/             # 前台JS
    ├── images/         # 图片资源
    ├── includes/       # 公共包含文件
    │   ├── conn.asp        # 数据库连接
    │   ├── config.asp      # 站点配置
    │   ├── header.asp      # 公共头部
    │   ├── footer.asp      # 公共底部
    │   ├── functions.asp   # 工具函数
    │   ├── admin_check.asp # 后台权限检查
    │   ├── admin_header.asp# 后台头部
    │   └── admin_footer.asp# 后台底部
    ├── admin/          # 后台管理
    │   ├── login.asp       # 登录页
    │   ├── admin_index.asp # 控制台
    │   ├── admin_articles.asp # 文章管理
    │   ├── admin_lawyers.asp   # 律师管理
    │   ├── admin_columns.asp   # 栏目管理
    │   └── admin_settings.asp  # 网站设置
    └── database/       # 数据库脚本
        └── schema.sql      # 建表SQL
```

---

## 环境要求

- **操作系统**：Windows Server 2008+ / Windows 7+
- **Web 服务器**：IIS 7.0+（需启用 ASP 经典）
- **数据库**：Access 2007+（.mdb 格式）或 MSSQL Server 2008+
- **浏览器**：Chrome / Firefox / Edge / Safari 最新版

---

## 部署步骤

### 一、安装 IIS 并启用 ASP

1. 打开"控制面板" → "程序" → "启用或关闭 Windows 功能"
2. 勾选"Internet Information Services"
3. 展开"万维网服务" → "应用程序开发功能"，勾选"ASP"
4. 确认安装

### 二、创建网站

1. 打开 IIS 管理器（inetmgr）
2. 右键"网站" → "添加网站"
   - 网站名称：LankaiLaw
   - 物理路径：指向 `asp/` 目录
   - 端口：80（或其他可用端口）
3. 确认创建

### 三、创建数据库

#### 方式A：使用 Access 数据库

1. 打开 Microsoft Access，创建空数据库 `lankai.mdb`
2. 执行 `database/schema.sql` 中的建表语句
3. 将 `lankai.mdb` 放置在 `database/` 目录下

#### 方式B：使用 MSSQL 数据库

1. 在 SQL Server Management Studio 中创建数据库 `lankai`
2. 执行 `database/schema.sql` 建表脚本
3. 修改 `includes/conn.asp` 中的连接字符串为 MSSQL 版本

### 四、配置数据库连接

编辑 `includes/conn.asp`：

**Access 版本（默认）：**
```vbscript
dbPath = Server.MapPath("/database/lankai.mdb")
connStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dbPath & ";"
```

**MSSQL 版本：**
```vbscript
connStr = "Provider=SQLOLEDB;Data Source=localhost;Initial Catalog=lankai;User ID=sa;Password=yourpassword;"
```

### 五、配置站点信息

编辑 `includes/config.asp`，修改以下常量：

```vbscript
Const SITE_NAME = "广东兰凯律师事务所"
Const SITE_PHONE = "020-00000000"
Const SITE_ADDRESS = "广州市天河区珠江新城花城大道20号远洋大厦14楼"
' ... 等
```

### 六、设置文件权限

1. 右键 `asp/` 目录 → 属性 → 安全
2. 给 IIS_IUSRS 用户添加"修改"权限（Access 数据库需要写入权限）
3. 特别确保 `database/` 目录有写入权限

### 七、验证部署

1. 浏览器访问 `http://localhost/` 查看前台首页
2. 访问 `http://localhost/admin/login.asp` 进入后台
3. 默认管理员账号：`admin` / 密码：`admin123`

---

## 后台管理功能

| 功能 | 页面 | 说明 |
|------|------|------|
| 登录 | admin/login.asp | 用户名密码验证 |
| 控制台 | admin/admin_index.asp | 统计概览、快捷操作 |
| 文章管理 | admin/admin_articles.asp | 发布/编辑/删除文章 |
| 律师管理 | admin/admin_lawyers.asp | 添加/编辑/删除律师 |
| 栏目管理 | admin/admin_columns.asp | 添加/删除/排序栏目 |
| 网站设置 | admin/admin_settings.asp | Banner/联系方式设置 |

---

## 本地预览（无需 IIS）

项目根目录下提供了纯 HTML 版本，可直接在浏览器中打开：

1. 在项目根目录启动 HTTP 服务器：
   ```bash
   node -e "require('http').createServer((req,res)=>{const fs=require('fs'),p=require('path');let f='.'+(req.url==='/'?'/index.html':req.url);fs.readFile(f,(e,d)=>{if(e){res.writeHead(404);res.end();return}const t={'.html':'text/html','.css':'text/css','.js':'application/javascript'};res.writeHead(200,{'Content-Type':t[p.extname(f)]||'application/octet-stream'});res.end(d)})}).listen(8765)"
   ```
2. 浏览器访问 `http://localhost:8765/`
3. 后台预览 `http://localhost:8765/admin/login.html`（数据存储在 localStorage）

---

## 注意事项

1. **安全**：部署后请立即修改管理员密码
2. **数据库**：生产环境建议使用 MSSQL 替代 Access
3. **备份**：定期备份数据库文件和上传的图片
4. **HTTPS**：建议配置 SSL 证书启用 HTTPS
5. **IIS 权限**：确保 IIS_IUSRS 对 database 目录有写入权限
6. **ASP 缓存**：开发阶段可在 IIS 中关闭 ASP 缓存便于调试

---

## 技术支持

如有问题，请联系：chenkangxiang@lankai.net
