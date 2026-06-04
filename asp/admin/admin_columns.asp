<%
    ADMIN_PAGE_TITLE = "栏目管理"
    ADMIN_PAGE_ID = "columns"
    
    Dim msg3 : msg3 = ""
    
    ' 添加栏目
    If Request.Form("action") = "add" Then
        Dim colName : colName = SafeStr(Request.Form("column_name"))
        Dim colType : colType = SafeStr(Request.Form("column_type"))
        Dim colSort : colSort = CInt(Request.Form("sort_order"))
        If colName <> "" Then
            ExecuteUpdate "INSERT INTO columns (column_name, column_type, sort_order, is_system) VALUES ('" & colName & "', '" & colType & "', " & colSort & ", 0)"
            msg3 = "栏目添加成功"
        End If
    End If
    
    ' 删除栏目
    If Request.QueryString("action") = "delete" Then
        Dim delColId : delColId = CInt(Request.QueryString("id"))
        Dim rsCheck
        Set rsCheck = ExecuteQuery("SELECT is_system FROM columns WHERE id=" & delColId)
        If Not rsCheck.EOF Then
            If CInt(rsCheck("is_system")) = 1 Then
                msg3 = "系统栏目不可删除"
            Else
                ExecuteUpdate "DELETE FROM articles WHERE column_id=" & delColId
                ExecuteUpdate "DELETE FROM columns WHERE id=" & delColId
                msg3 = "栏目已删除"
            End If
        End If
        rsCheck.Close
        Set rsCheck = Nothing
    End If
    
    ' 排序
    If Request.QueryString("action") = "up" Then
        Dim sortId : sortId = CInt(Request.QueryString("id"))
        ExecuteUpdate "UPDATE columns SET sort_order=sort_order-1 WHERE id=" & sortId
        msg3 = "排序已更新"
    End If
    If Request.QueryString("action") = "down" Then
        sortId = CInt(Request.QueryString("id"))
        ExecuteUpdate "UPDATE columns SET sort_order=sort_order+1 WHERE id=" & sortId
        msg3 = "排序已更新"
    End If
%>
<!--#include file="includes/admin_header.asp"-->

    <% If msg3 <> "" Then %>
    <div class="toast show" style="background:#4CAF50;color:#fff;padding:12px 20px;margin-bottom:20px;"><%= msg3 %></div>
    <% End If %>

    <!-- 添加栏目表单 -->
    <div class="form-card" style="margin-bottom:30px;">
        <h3 style="margin-bottom:15px;">添加栏目</h3>
        <form method="post" action="admin_columns.asp">
            <input type="hidden" name="action" value="add">
            <div style="display:flex;gap:15px;align-items:end;">
                <div class="form-group" style="flex:1;margin:0;">
                    <label>栏目名称</label>
                    <input type="text" name="column_name" required style="width:100%;padding:8px;border:1px solid #ddd;">
                </div>
                <div class="form-group" style="flex:1;margin:0;">
                    <label>栏目类型</label>
                    <select name="column_type" style="width:100%;padding:8px;border:1px solid #ddd;">
                        <option value="news">新闻</option>
                        <option value="research">研究</option>
                        <option value="party">党建</option>
                        <option value="practice">业务</option>
                        <option value="other">其他</option>
                    </select>
                </div>
                <div class="form-group" style="width:80px;margin:0;">
                    <label>排序</label>
                    <input type="number" name="sort_order" value="0" style="width:100%;padding:8px;border:1px solid #ddd;">
                </div>
                <button type="submit" class="btn" style="padding:8px 20px;background:var(--primary-purple);color:#fff;border:none;cursor:pointer;">添加</button>
            </div>
        </form>
    </div>

    <!-- 栏目列表 -->
    <table class="data-table">
        <thead>
            <tr><th>ID</th><th>栏目名称</th><th>类型</th><th>排序</th><th>文章数</th><th>操作</th></tr>
        </thead>
        <tbody>
        <%
        Dim rsColumns
        Set rsColumns = ExecuteQuery("SELECT c.*, (SELECT COUNT(*) FROM articles WHERE column_id=c.id) AS article_count FROM columns c ORDER BY c.sort_order ASC, c.id ASC")
        Do While Not rsColumns.EOF
        %>
        <tr>
            <td><%= rsColumns("id") %></td>
            <td><%= HtmlEncode(rsColumns("column_name")) %><% If CInt(rsColumns("is_system"))=1 Then %><span style="color:#999;font-size:11px;"> [系统]</span><% End If %></td>
            <td><%= rsColumns("column_type") %></td>
            <td><%= rsColumns("sort_order") %></td>
            <td><%= rsColumns("article_count") %></td>
            <td class="actions">
                <a href="admin_columns.asp?action=up&id=<%= rsColumns("id") %>">上移</a>
                <a href="admin_columns.asp?action=down&id=<%= rsColumns("id") %>">下移</a>
                <% If CInt(rsColumns("is_system"))<>1 Then %>
                <a href="admin_columns.asp?action=delete&id=<%= rsColumns("id") %>" onclick="return confirm('删除栏目将同时删除其下所有文章，确定？')">删除</a>
                <% End If %>
            </td>
        </tr>
        <%
            rsColumns.MoveNext
        Loop
        rsColumns.Close
        Set rsColumns = Nothing
        %>
        </tbody>
    </table>

<!--#include file="includes/admin_footer.asp"-->
