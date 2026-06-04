<%
    PAGE_TITLE = "新闻中心"
    PAGE_ID = "news"
    Dim newsPage : newsPage = CInt(Request.QueryString("page"))
    If newsPage < 1 Then newsPage = 1
%>
<!--#include file="includes/header.asp"-->

    <section class="page-banner">
        <div class="banner-content">
            <h2>新闻中心</h2>
            <p>律所动态 · 行业资讯</p>
        </div>
    </section>

    <section class="section fade-in">
        <div class="container" style="max-width:900px;">
            <div class="section-title">
                <h2>新闻动态</h2>
                <div class="title-line"></div>
            </div>
            <div class="news-list">
                <%
                Dim rsNewsList
                Set rsNewsList = ExecuteQuery("SELECT a.*, c.column_name FROM articles a LEFT JOIN columns c ON a.column_id=c.id WHERE a.column_id=1 ORDER BY a.created_at DESC")
                If rsNewsList.EOF Then
                    Response.Write "<p style='text-align:center;color:#999;padding:40px 0;'>暂无新闻动态</p>"
                Else
                    Do While Not rsNewsList.EOF
                %>
                <div class="news-item">
                    <div class="news-date">
                        <span class="day"><%= Day(rsNewsList("created_at")) %></span>
                        <span class="month"><%= Year(rsNewsList("created_at")) %>-<%= Right("0" & Month(rsNewsList("created_at")), 2) %></span>
                    </div>
                    <div class="news-content">
                        <h3><a href="news_detail.asp?id=<%= rsNewsList("id") %>"><%= HtmlEncode(rsNewsList("title")) %></a></h3>
                        <p class="news-summary"><%= HtmlEncode(rsNewsList("summary")) %></p>
                    </div>
                </div>
                <%
                        rsNewsList.MoveNext
                    Loop
                End If
                rsNewsList.Close
                Set rsNewsList = Nothing
                %>
            </div>
        </div>
    </section>

<!--#include file="includes/footer.asp"-->
