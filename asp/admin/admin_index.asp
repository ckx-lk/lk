<%
    ADMIN_PAGE_TITLE = "控制台"
    ADMIN_PAGE_ID = "dashboard"
%>
<!--#include file="includes/admin_header.asp"-->

            <div class="stat-cards">
                <div class="stat-card">
                    <div class="stat-icon">&#128196;</div>
                    <div class="stat-info">
                        <h3><%= GetRecordCount("articles") %></h3>
                        <p>文章总数</p>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon">&#128100;</div>
                    <div class="stat-info">
                        <h3><%= GetRecordCount("lawyers") %></h3>
                        <p>律师总数</p>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon">&#128193;</div>
                    <div class="stat-info">
                        <h3><%= GetRecordCount("columns") %></h3>
                        <p>栏目总数</p>
                    </div>
                </div>
            </div>

            <div style="margin-top:30px;">
                <h3 style="margin-bottom:15px;">最近文章</h3>
                <table class="data-table">
                    <thead>
                        <tr><th>标题</th><th>栏目</th><th>发布时间</th></tr>
                    </thead>
                    <tbody>
                    <%
                    Dim rsRecent
                    Set rsRecent = ExecuteQuery("SELECT TOP 5 a.*, c.column_name FROM articles a LEFT JOIN columns c ON a.column_id=c.id ORDER BY a.created_at DESC")
                    If rsRecent.EOF Then
                        Response.Write "<tr><td colspan='3' style='text-align:center;color:#999;'>暂无文章</td></tr>"
                    Else
                        Do While Not rsRecent.EOF
                    %>
                        <tr>
                            <td><%= HtmlEncode(rsRecent("title")) %></td>
                            <td><%= HtmlEncode(rsRecent("column_name")) %></td>
                            <td><%= FormatDate(rsRecent("created_at")) %></td>
                        </tr>
                    <%
                            rsRecent.MoveNext
                        Loop
                    End If
                    rsRecent.Close
                    Set rsRecent = Nothing
                    %>
                    </tbody>
                </table>
            </div>

            <div style="margin-top:30px;">
                <h3>快捷操作</h3>
                <div style="display:flex;gap:15px;margin-top:15px;">
                    <a href="admin_articles.asp?action=add" class="btn" style="padding:10px 20px;background:var(--primary-purple);color:#fff;text-decoration:none;">发布文章</a>
                    <a href="admin_lawyers.asp?action=add" class="btn" style="padding:10px 20px;background:var(--primary-purple);color:#fff;text-decoration:none;">添加律师</a>
                </div>
            </div>

<!--#include file="includes/admin_footer.asp"-->
