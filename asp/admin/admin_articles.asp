<%
    ADMIN_PAGE_TITLE = "文章管理"
    ADMIN_PAGE_ID = "articles"
    
    Dim act : act = Request.QueryString("action")
    Dim msg : msg = ""
    
    ' 删除文章
    If act = "delete" Then
        Dim delId : delId = CInt(Request.QueryString("id"))
        ExecuteUpdate "DELETE FROM articles WHERE id=" & delId
        msg = "文章已删除"
        act = ""
    End If
    
    ' 保存文章（新增/编辑）
    If Request.Form("action") = "save" Then
        Dim artId, artTitle, artColumnId, artSummary, artContent
        artId = Request.Form("id")
        artTitle = SafeStr(Request.Form("title"))
        artColumnId = CInt(Request.Form("column_id"))
        artSummary = SafeStr(Request.Form("summary"))
        artContent = Request.Form("content")
        
        If artId = "" Then
            ' 新增
            ExecuteUpdate "INSERT INTO articles (title, column_id, summary, content, created_at) VALUES ('" & artTitle & "', " & artColumnId & ", '" & artSummary & "', '" & artContent & "', Now())"
            msg = "文章发布成功"
        Else
            ' 编辑
            ExecuteUpdate "UPDATE articles SET title='" & artTitle & "', column_id=" & artColumnId & ", summary='" & artSummary & "', content='" & artContent & "' WHERE id=" & CInt(artId)
            msg = "文章更新成功"
        End If
        act = ""
    End If
%>
<!--#include file="includes/admin_header.asp"-->

    <% If msg <> "" Then %>
    <div class="toast show" style="background:#4CAF50;color:#fff;padding:12px 20px;margin-bottom:20px;"><%= msg %></div>
    <% End If %>

    <% If act = "add" Or act = "edit" Then %>
    <!-- 编辑表单 -->
    <%
        Dim editId : editId = Request.QueryString("id")
        Dim artTitle2, artColumnId2, artSummary2, artContent2
        artTitle2 = "" : artColumnId2 = 1 : artSummary2 = "" : artContent2 = ""
        
        If act = "edit" And editId <> "" Then
            Dim rsEdit
            Set rsEdit = ExecuteQuery("SELECT * FROM articles WHERE id=" & CInt(editId))
            If Not rsEdit.EOF Then
                artTitle2 = rsEdit("title")
                artColumnId2 = CInt(rsEdit("column_id"))
                artSummary2 = rsEdit("summary")
                artContent2 = rsEdit("content")
            End If
            rsEdit.Close
            Set rsEdit = Nothing
        End If
    %>
    <div class="form-card">
        <form method="post" action="admin_articles.asp">
            <input type="hidden" name="action" value="save">
            <% If act = "edit" Then %>
            <input type="hidden" name="id" value="<%= editId %>">
            <% End If %>
            <div class="form-group">
                <label>文章标题</label>
                <input type="text" name="title" value="<%= HtmlEncode(artTitle2) %>" required style="width:100%;padding:10px;border:1px solid #ddd;">
            </div>
            <div class="form-group">
                <label>所属栏目</label>
                <select name="column_id" style="width:100%;padding:10px;border:1px solid #ddd;">
                    <%
                    Dim rsCols
                    Set rsCols = ExecuteQuery("SELECT * FROM columns ORDER BY sort_order ASC")
                    Do While Not rsCols.EOF
                    %>
                    <option value="<%= rsCols("id") %>" <% If CInt(rsCols("id")) = artColumnId2 Then %>selected<% End If %>><%= HtmlEncode(rsCols("column_name")) %></option>
                    <%
                        rsCols.MoveNext
                    Loop
                    rsCols.Close
                    Set rsCols = Nothing
                    %>
                </select>
            </div>
            <div class="form-group">
                <label>文章摘要</label>
                <textarea name="summary" rows="3" style="width:100%;padding:10px;border:1px solid #ddd;"><%= HtmlEncode(artSummary2) %></textarea>
            </div>
            <div class="form-group">
                <label>文章内容</label>
                <textarea name="content" rows="15" style="width:100%;padding:10px;border:1px solid #ddd;"><%= HtmlEncode(artContent2) %></textarea>
            </div>
            <div style="display:flex;gap:10px;">
                <button type="submit" class="btn" style="padding:10px 30px;background:var(--primary-purple);color:#fff;border:none;cursor:pointer;">保存</button>
                <a href="admin_articles.asp" class="btn" style="padding:10px 30px;background:#999;color:#fff;text-decoration:none;">取消</a>
            </div>
        </form>
    </div>

    <% Else %>
    <!-- 文章列表 -->
    <div style="margin-bottom:20px;">
        <a href="admin_articles.asp?action=add" class="btn" style="padding:8px 20px;background:var(--primary-purple);color:#fff;text-decoration:none;">+ 发布文章</a>
    </div>
    <table class="data-table">
        <thead>
            <tr><th>ID</th><th>标题</th><th>栏目</th><th>发布时间</th><th>操作</th></tr>
        </thead>
        <tbody>
        <%
        Dim rsList
        Set rsList = ExecuteQuery("SELECT a.*, c.column_name FROM articles a LEFT JOIN columns c ON a.column_id=c.id ORDER BY a.created_at DESC")
        If rsList.EOF Then
            Response.Write "<tr><td colspan='5' style='text-align:center;color:#999;'>暂无文章</td></tr>"
        Else
            Do While Not rsList.EOF
        %>
            <tr>
                <td><%= rsList("id") %></td>
                <td><%= HtmlEncode(rsList("title")) %></td>
                <td><%= HtmlEncode(rsList("column_name")) %></td>
                <td><%= FormatDate(rsList("created_at")) %></td>
                <td class="actions">
                    <a href="admin_articles.asp?action=edit&id=<%= rsList("id") %>">编辑</a>
                    <a href="admin_articles.asp?action=delete&id=<%= rsList("id") %>" onclick="return confirm('确定删除此文章？')">删除</a>
                </td>
            </tr>
        <%
                rsList.MoveNext
            Loop
        End If
        rsList.Close
        Set rsList = Nothing
        %>
        </tbody>
    </table>
    <% End If %>

<!--#include file="includes/admin_footer.asp"-->
