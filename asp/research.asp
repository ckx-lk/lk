<%
    PAGE_TITLE = "兰凯研究"
    PAGE_ID = "research"
%>
<!--#include file="includes/header.asp"-->

    <section class="page-banner">
        <div class="banner-content">
            <h2>兰凯研究</h2>
            <p>法律研究 · 专业视角</p>
        </div>
    </section>

    <section class="section fade-in">
        <div class="container" style="max-width:900px;">
            <div class="section-title">
                <h2>法律研究</h2>
                <div class="title-line"></div>
            </div>
            <div class="news-list">
                <%
                Dim rsResearch
                Set rsResearch = ExecuteQuery("SELECT * FROM articles WHERE column_id=2 ORDER BY created_at DESC")
                If rsResearch.EOF Then
                    Response.Write "<p style='text-align:center;color:#999;padding:40px 0;'>暂无研究文章</p>"
                Else
                    Do While Not rsResearch.EOF
                %>
                <div class="news-item">
                    <div class="news-date">
                        <span class="day"><%= Day(rsResearch("created_at")) %></span>
                        <span class="month"><%= Year(rsResearch("created_at")) %>-<%= Right("0" & Month(rsResearch("created_at")), 2) %></span>
                    </div>
                    <div class="news-content">
                        <h3><a href="research_detail.asp?id=<%= rsResearch("id") %>"><%= HtmlEncode(rsResearch("title")) %></a></h3>
                        <p class="news-summary"><%= HtmlEncode(rsResearch("summary")) %></p>
                    </div>
                </div>
                <%
                        rsResearch.MoveNext
                    Loop
                End If
                rsResearch.Close
                Set rsResearch = Nothing
                %>
            </div>
        </div>
    </section>

<!--#include file="includes/footer.asp"-->
