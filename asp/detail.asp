<%
    Dim articleId : articleId = CInt(Request.QueryString("id"))
    If articleId = 0 Then Response.Redirect "news.asp"
    
    Dim rsArticle
    Set rsArticle = ExecuteQuery("SELECT a.*, c.column_name FROM articles a LEFT JOIN columns c ON a.column_id=c.id WHERE a.id=" & articleId)
    If rsArticle.EOF Then
        Response.Redirect "news.asp"
    End If
    
    PAGE_TITLE = rsArticle("title")
    Dim colId : colId = CInt(rsArticle("column_id"))
    Select Case colId
        Case 1: PAGE_ID = "news"
        Case 2: PAGE_ID = "research"
        Case 3: PAGE_ID = "party"
        Case Else: PAGE_ID = "news"
    End Select
%>
<!--#include file="includes/header.asp"-->

    <section class="page-banner">
        <div class="banner-content">
            <h2><%= rsArticle("column_name") %></h2>
        </div>
    </section>

    <section class="section">
        <div class="container" style="max-width:800px;">
            <article class="article-detail">
                <h1 style="font-size:24px;color:#333;margin-bottom:15px;"><%= HtmlEncode(rsArticle("title")) %></h1>
                <div style="color:#999;font-size:13px;margin-bottom:25px;padding-bottom:15px;border-bottom:1px solid #eee;">
                    <span>发布时间：<%= FormatDate(rsArticle("created_at")) %></span>
                    <span style="margin-left:20px;">栏目：<%= HtmlEncode(rsArticle("column_name")) %></span>
                </div>
                <div style="line-height:1.9;color:#555;font-size:15px;">
                    <%= rsArticle("content") %>
                </div>
            </article>
            <div style="margin-top:40px;padding-top:20px;border-top:1px solid #eee;">
                <a href="javascript:history.back()" style="color:var(--primary-purple);">← 返回列表</a>
            </div>
        </div>
    </section>

<%
    rsArticle.Close
    Set rsArticle = Nothing
%>
<!--#include file="includes/footer.asp"-->
