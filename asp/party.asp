<%
    PAGE_TITLE = "兰凯党建"
    PAGE_ID = "party"
%>
<!--#include file="includes/header.asp"-->

    <section class="page-banner">
        <div class="banner-content">
            <h2>兰凯党建</h2>
            <p>党建引领 · 凝心聚力</p>
        </div>
    </section>

    <section class="section fade-in">
        <div class="container" style="max-width:900px;">
            <div class="section-title">
                <h2>党建工作</h2>
                <div class="title-line"></div>
            </div>
            <div style="background:var(--bg-light);padding:30px;border-left:4px solid var(--primary-purple);margin-bottom:40px;" class="fade-in">
                <p style="font-size:15px;line-height:1.8;color:#555;">广东兰凯律师事务所党支部坚持"党建引领所建，所建促进党建"的工作思路，把党的建设融入律所管理的各个环节，通过开展形式多样的党建活动，增强党员律师的政治意识、大局意识、核心意识、看齐意识，推动律所健康持续发展。</p>
            </div>
            <div class="news-list fade-in">
                <%
                Dim rsParty
                Set rsParty = ExecuteQuery("SELECT * FROM articles WHERE column_id=3 ORDER BY created_at DESC")
                If rsParty.EOF Then
                    Response.Write "<p style='text-align:center;color:#999;padding:40px 0;'>暂无党建活动</p>"
                Else
                    Do While Not rsParty.EOF
                %>
                <div class="news-item">
                    <div class="news-date">
                        <span class="day"><%= Day(rsParty("created_at")) %></span>
                        <span class="month"><%= Year(rsParty("created_at")) %>-<%= Right("0" & Month(rsParty("created_at")), 2) %></span>
                    </div>
                    <div class="news-content">
                        <h3><a href="party_detail.asp?id=<%= rsParty("id") %>"><%= HtmlEncode(rsParty("title")) %></a></h3>
                        <p class="news-summary"><%= HtmlEncode(rsParty("summary")) %></p>
                    </div>
                </div>
                <%
                        rsParty.MoveNext
                    Loop
                End If
                rsParty.Close
                Set rsParty = Nothing
                %>
            </div>
        </div>
    </section>

<!--#include file="includes/footer.asp"-->
