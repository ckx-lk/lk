<%
' 后台公共头部
%>
<!--#include file="../includes/conn.asp"-->
<!--#include file="../includes/config.asp"-->
<!--#include file="../includes/functions.asp"-->
<!--#include file="admin_check.asp"-->
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= ADMIN_PAGE_TITLE %> - 后台管理</title>
    <link rel="stylesheet" href="../css/admin.css">
</head>
<body>
    <div class="admin-layout">
        <aside class="admin-sidebar">
            <div class="sidebar-header">
                <h3>兰凯律所</h3>
                <p>后台管理</p>
            </div>
            <nav class="sidebar-nav">
                <a href="admin_index.asp" class="<% If ADMIN_PAGE_ID="dashboard" Then %>active<% End If %>">&#128202; 控制台</a>
                <a href="admin_articles.asp" class="<% If ADMIN_PAGE_ID="articles" Then %>active<% End If %>">&#128196; 文章管理</a>
                <a href="admin_lawyers.asp" class="<% If ADMIN_PAGE_ID="lawyers" Then %>active<% End If %>">&#128100; 律师管理</a>
                <a href="admin_columns.asp" class="<% If ADMIN_PAGE_ID="columns" Then %>active<% End If %>">&#128193; 栏目管理</a>
                <a href="admin_settings.asp" class="<% If ADMIN_PAGE_ID="settings" Then %>active<% End If %>">&#9881; 网站设置</a>
            </nav>
            <div class="sidebar-footer">
                <a href="../index.asp" target="_blank">&#127760; 查看前台</a>
                <a href="login.asp?action=logout">&#128682; 退出登录</a>
            </div>
        </aside>
        <main class="admin-main">
            <div class="admin-topbar">
                <h2><%= ADMIN_PAGE_TITLE %></h2>
                <div class="admin-user">
                    <span>&#128100; <%= adminName %></span>
                </div>
            </div>
