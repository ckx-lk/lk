<%
'=============================================
' 广东兰凯律师事务所 - 公共头部
'=============================================
%>
<!--#include file="conn.asp"-->
<!--#include file="config.asp"-->
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= PAGE_TITLE & " - " & SITE_NAME %></title>
    <link rel="stylesheet" href="css/style.css">
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
