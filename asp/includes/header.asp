<%
'=============================================
' 广东兰凯律师事务所 - 公共头部
'=============================================
' SEO：按 PAGE_ID 输出差异化标题、描述与关键词
Dim SEO_TITLE, SEO_DESC, SEO_KEYWORDS, SEO_CANONICAL, SEO_BASE, SEO_OG_TYPE
SEO_BASE = "https://www.lankai.net/"
SELECT CASE PAGE_ID
    CASE "home"
        SEO_TITLE = "广东兰凯律师事务所 - 广州综合性律师事务所 | 官方网站 www.lankai.net"
        SEO_DESC = "广东兰凯律师事务所（简称兰凯律师事务所、兰凯律所）是经广东省司法厅批准设立的综合性律师事务所，位于广州市天河区珠江新城花城大道20号远洋大厦14楼。业务涵盖公司法律事务、房地产法律事务、民商事争议解决、知识产权、刑事诉讼、行政法律事务、劳动法律事务及法律顾问服务。官方网站：www.lankai.net。"
        SEO_KEYWORDS = "广东兰凯,广东兰凯律师事务所,兰凯律师事务所,兰凯律所,兰凯,广州律师事务所,广州律师,广东律师事务所,广州天河律师事务所,法律顾问,民商事诉讼,www.lankai.net"
        SEO_CANONICAL = SEO_BASE
    CASE "about"
        SEO_TITLE = "关于我们 - 广东兰凯律师事务所简介 | 兰凯律师事务所"
        SEO_DESC = "广东兰凯律师事务所（兰凯律师事务所）是经广东省司法厅批准设立的大型综合性律师事务所，由多名各领域杰出律师共同创办，位于广州市天河区珠江新城花城大道20号远洋大厦14楼，以'一流规模、一流管理、一流服务'为办所理念，以勤勉守信、高效务实为服务宗旨。"
        SEO_KEYWORDS = "广东兰凯,广东兰凯律师事务所,兰凯律师事务所,兰凯律所,兰凯律师事务所简介,广州律师事务所,广东律师事务所,律师团队,www.lankai.net"
        SEO_CANONICAL = SEO_BASE & "about.asp"
    CASE "practice"
        SEO_TITLE = "业务领域 - 广东兰凯律师事务所 | 公司、房地产、民商事、知识产权、刑事、劳动"
        SEO_DESC = "广东兰凯律师事务所（兰凯律师事务所）业务领域涵盖公司法律事务、房地产法律事务、民商事争议解决、知识产权法律事务、刑事诉讼、行政法律事务、劳动法律事务及法律顾问服务，为行政机关、企事业单位、集体经济组织及个人提供全方位法律服务。"
        SEO_KEYWORDS = "广东兰凯,广东兰凯律师事务所,兰凯律师事务所,兰凯律所,公司法律事务,房地产法律事务,民商事争议解决,知识产权,刑事诉讼,劳动法律事务,法律顾问,www.lankai.net"
        SEO_CANONICAL = SEO_BASE & "practice.asp"
    CASE "team"
        SEO_TITLE = "专业团队 - 广东兰凯律师事务所律师 | 兰凯律所合伙人及专职律师"
        SEO_DESC = "广东兰凯律师事务所（兰凯律师事务所）专业团队由彭大成、陈康祥、陈重维等合伙人律师及林琛策、宏敏莹、余光统、王永玉等专职律师组成，专业领域覆盖民商事诉讼、刑事辩护、企业法律顾问、涉外法律、婚姻家庭与财产继承、劳动人事、知识产权等。"
        SEO_KEYWORDS = "广东兰凯,广东兰凯律师事务所,兰凯律师事务所,兰凯律所,兰凯律师,广州律师,律师团队,合伙人律师,专职律师,www.lankai.net"
        SEO_CANONICAL = SEO_BASE & "team.asp"
    CASE "news"
        SEO_TITLE = "新闻中心 - 广东兰凯律师事务所动态 | 兰凯律所资讯"
        SEO_DESC = "广东兰凯律师事务所（兰凯律师事务所）新闻中心，发布本所最新动态、重大案件代理成果、行业资讯与公益活动信息。"
        SEO_KEYWORDS = "广东兰凯,广东兰凯律师事务所,兰凯律师事务所,兰凯律所,兰凯新闻,律所动态,法律行业资讯,www.lankai.net"
        SEO_CANONICAL = SEO_BASE & "news.asp"
    CASE "research"
        SEO_TITLE = "兰凯研究 - 广东兰凯律师事务所法律实务研究 | 兰凯律师事务所"
        SEO_DESC = "广东兰凯律师事务所（兰凯律师事务所）兰凯研究栏目，分享民商事诉讼、劳动争议、公司法律事务、房地产与建设工程、知识产权等领域的法律实务研究成果与专业文章。"
        SEO_KEYWORDS = "广东兰凯,广东兰凯律师事务所,兰凯律师事务所,兰凯律所,兰凯研究,法律实务,民商事诉讼研究,劳动争议研究,www.lankai.net"
        SEO_CANONICAL = SEO_BASE & "research.asp"
    CASE "party"
        SEO_TITLE = "兰凯党建 - 广东兰凯律师事务所党建工作 | 兰凯律师事务所"
        SEO_DESC = "广东兰凯律师事务所（兰凯律师事务所）兰凯党建栏目，展示本所党组织建设、党员律师风采、主题党日活动及党建与业务融合发展成果。"
        SEO_KEYWORDS = "广东兰凯,广东兰凯律师事务所,兰凯律师事务所,兰凯律所,兰凯党建,律所党建,党员律师,www.lankai.net"
        SEO_CANONICAL = SEO_BASE & "party.asp"
    CASE ELSE
        SEO_TITLE = PAGE_TITLE & " - " & SITE_NAME
        SEO_DESC = SITE_NAME & "（" & SITE_WEBSITE & "）是经广东省司法厅批准设立的综合性律师事务所，位于" & SITE_ADDRESS & "，提供公司、房地产、民商事、知识产权、刑事、劳动等全方位法律服务。"
        SEO_KEYWORDS = "广东兰凯,广东兰凯律师事务所,兰凯律师事务所,兰凯律所,广州律师事务所,法律顾问,www.lankai.net"
        SEO_CANONICAL = SEO_BASE & LCase(Replace(Request.ServerVariables("URL"), "/", ""))
END SELECT
%>
<!--#include file="conn.asp"-->
<!--#include file="config.asp"-->
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= SEO_TITLE %></title>
    <meta name="description" content="<%= SEO_DESC %>">
    <meta name="keywords" content="<%= SEO_KEYWORDS %>">
    <meta name="author" content="<%= SITE_NAME %>">
    <meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1">
    <link rel="canonical" href="<%= SEO_CANONICAL %>">
    <meta name="theme-color" content="#660874">
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="<%= SITE_NAME %>">
    <meta property="og:title" content="<%= SEO_TITLE %>">
    <meta property="og:description" content="<%= SEO_DESC %>">
    <meta property="og:url" content="<%= SEO_CANONICAL %>">
    <meta property="og:image" content="<%= SEO_BASE %>images/logo.png">
    <meta property="og:locale" content="zh_CN">
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:title" content="<%= SEO_TITLE %>">
    <meta name="twitter:description" content="<%= SEO_DESC %>">
    <meta name="twitter:image" content="<%= SEO_BASE %>images/logo.png">
    <link rel="stylesheet" href="css/style.css">
    <script type="application/ld+json">
    {
      "@context": "https://schema.org",
      "@type": "LegalService",
      "@id": "https://www.lankai.net/#organization",
      "name": "广东兰凯律师事务所",
      "alternateName": ["广东兰凯", "兰凯律师事务所", "兰凯律所", "Lankai Law Firm"],
      "url": "https://www.lankai.net/",
      "logo": "https://www.lankai.net/images/logo.png",
      "slogan": "一流规模 · 一流管理 · 一流服务",
      "address": {
        "@type": "PostalAddress",
        "streetAddress": "珠江新城花城大道20号远洋大厦14楼",
        "addressLocality": "广州市",
        "addressRegion": "广东省",
        "addressCountry": "CN"
      },
      "areaServed": { "@type": "AdministrativeArea", "name": "广东省" },
      "knowsLanguage": ["zh-CN", "en"],
      "identifier": "执业许可证号：<%= SITE_LICENSE %>"
    }
    </script>
</head>
<body>
    <header class="header">
        <div class="container">
            <div class="header-main">
                <div class="logo">
                    <img src="images/logo.png" alt="<%= SITE_NAME %>">
                    <div class="logo-text">
                        <h1><%= SITE_NAME %></h1>
                        <p><%= SITE_NAME_EN %></p>
                    </div>
                </div>
                <button class="menu-toggle" id="menuToggle" aria-label="菜单">
                    <span></span>
                    <span></span>
                    <span></span>
                </button>
                <nav>
                    <ul class="nav" id="navMenu">
                        <li><a href="index.asp" class="<% If PAGE_ID="home" Then %>active<% End If %>">首页</a></li>
                        <li><a href="about.asp" class="<% If PAGE_ID="about" Then %>active<% End If %>">关于我们</a></li>
                        <li><a href="practice.asp" class="<% If PAGE_ID="practice" Then %>active<% End If %>">业务领域</a></li>
                        <li><a href="team.asp" class="<% If PAGE_ID="team" Then %>active<% End If %>">专业团队</a></li>
                        <li><a href="news.asp" class="<% If PAGE_ID="news" Then %>active<% End If %>">新闻中心</a></li>
                        <li><a href="research.asp" class="<% If PAGE_ID="research" Then %>active<% End If %>">兰凯研究</a></li>
                        <li><a href="party.asp" class="<% If PAGE_ID="party" Then %>active<% End If %>">兰凯党建</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </header>
