<%
    ADMIN_PAGE_TITLE = "律师管理"
    ADMIN_PAGE_ID = "lawyers"
    
    Dim act2 : act2 = Request.QueryString("action")
    Dim msg2 : msg2 = ""
    
    ' 删除律师
    If act2 = "delete" Then
        Dim delLawyerId : delLawyerId = CInt(Request.QueryString("id"))
        ExecuteUpdate "DELETE FROM lawyers WHERE id=" & delLawyerId
        msg2 = "律师已删除"
        act2 = ""
    End If
    
    ' 保存律师
    If Request.Form("action") = "save" Then
        Dim lId, lName, lPosition, lSpecialties, lPhoto, lIntro
        lId = Request.Form("id")
        lName = SafeStr(Request.Form("name"))
        lPosition = SafeStr(Request.Form("position"))
        lSpecialties = SafeStr(Request.Form("specialties"))
        lPhoto = SafeStr(Request.Form("photo"))
        lIntro = SafeStr(Request.Form("intro"))
        
        If lId = "" Then
            ExecuteUpdate "INSERT INTO lawyers (name, position, specialties, photo, intro, sort_order) VALUES ('" & lName & "', '" & lPosition & "', '" & lSpecialties & "', '" & lPhoto & "', '" & lIntro & "', 0)"
            msg2 = "律师添加成功"
        Else
            ExecuteUpdate "UPDATE lawyers SET name='" & lName & "', position='" & lPosition & "', specialties='" & lSpecialties & "', photo='" & lPhoto & "', intro='" & lIntro & "' WHERE id=" & CInt(lId)
            msg2 = "律师信息已更新"
        End If
        act2 = ""
    End If
%>
<!--#include file="includes/admin_header.asp"-->

    <% If msg2 <> "" Then %>
    <div class="toast show" style="background:#4CAF50;color:#fff;padding:12px 20px;margin-bottom:20px;"><%= msg2 %></div>
    <% End If %>

    <% If act2 = "add" Or act2 = "edit" Then %>
    <%
        Dim lName2, lPosition2, lSpecialties2, lPhoto2, lIntro2
        lName2 = "" : lPosition2 = "" : lSpecialties2 = "" : lPhoto2 = "" : lIntro2 = ""
        
        If act2 = "edit" Then
            Dim rsLEdit
            Set rsLEdit = ExecuteQuery("SELECT * FROM lawyers WHERE id=" & CInt(Request.QueryString("id")))
            If Not rsLEdit.EOF Then
                lName2 = rsLEdit("name")
                lPosition2 = rsLEdit("position")
                lSpecialties2 = rsLEdit("specialties")
                lPhoto2 = rsLEdit("photo")
                lIntro2 = rsLEdit("intro")
            End If
            rsLEdit.Close
            Set rsLEdit = Nothing
        End If
    %>
    <div class="form-card">
        <form method="post" action="admin_lawyers.asp">
            <input type="hidden" name="action" value="save">
            <% If act2 = "edit" Then %>
            <input type="hidden" name="id" value="<%= Request.QueryString("id") %>">
            <% End If %>
            <div class="form-group">
                <label>姓名</label>
                <input type="text" name="name" value="<%= HtmlEncode(lName2) %>" required style="width:100%;padding:10px;border:1px solid #ddd;">
            </div>
            <div class="form-group">
                <label>职位</label>
                <input type="text" name="position" value="<%= HtmlEncode(lPosition2) %>" style="width:100%;padding:10px;border:1px solid #ddd;" placeholder="如：合伙人、执业律师">
            </div>
            <div class="form-group">
                <label>专长领域（用顿号分隔）</label>
                <input type="text" name="specialties" value="<%= HtmlEncode(lSpecialties2) %>" style="width:100%;padding:10px;border:1px solid #ddd;" placeholder="如：民商事诉讼、合同纠纷、劳动法">
            </div>
            <div class="form-group">
                <label>照片路径</label>
                <input type="text" name="photo" value="<%= HtmlEncode(lPhoto2) %>" style="width:100%;padding:10px;border:1px solid #ddd;" placeholder="如：images/lawyer_name.jpg">
            </div>
            <div class="form-group">
                <label>个人简介</label>
                <textarea name="intro" rows="5" style="width:100%;padding:10px;border:1px solid #ddd;"><%= HtmlEncode(lIntro2) %></textarea>
            </div>
            <div style="display:flex;gap:10px;">
                <button type="submit" class="btn" style="padding:10px 30px;background:var(--primary-purple);color:#fff;border:none;cursor:pointer;">保存</button>
                <a href="admin_lawyers.asp" class="btn" style="padding:10px 30px;background:#999;color:#fff;text-decoration:none;">取消</a>
            </div>
        </form>
    </div>

    <% Else %>
    <div style="margin-bottom:20px;">
        <a href="admin_lawyers.asp?action=add" class="btn" style="padding:8px 20px;background:var(--primary-purple);color:#fff;text-decoration:none;">+ 添加律师</a>
    </div>
    <table class="data-table">
        <thead>
            <tr><th>ID</th><th>姓名</th><th>职位</th><th>专长</th><th>操作</th></tr>
        </thead>
        <tbody>
        <%
        Dim rsLList
        Set rsLList = ExecuteQuery("SELECT * FROM lawyers ORDER BY sort_order ASC, id ASC")
        If rsLList.EOF Then
            Response.Write "<tr><td colspan='5' style='text-align:center;color:#999;'>暂无律师</td></tr>"
        Else
            Do While Not rsLList.EOF
        %>
            <tr>
                <td><%= rsLList("id") %></td>
                <td><strong><%= HtmlEncode(rsLList("name")) %></strong></td>
                <td><%= HtmlEncode(rsLList("position")) %></td>
                <td><%= HtmlEncode(rsLList("specialties")) %></td>
                <td class="actions">
                    <a href="admin_lawyers.asp?action=edit&id=<%= rsLList("id") %>">编辑</a>
                    <a href="admin_lawyers.asp?action=delete&id=<%= rsLList("id") %>" onclick="return confirm('确定删除此律师？')">删除</a>
                </td>
            </tr>
        <%
                rsLList.MoveNext
            Loop
        End If
        rsLList.Close
        Set rsLList = Nothing
        %>
        </tbody>
    </table>
    <% End If %>

<!--#include file="includes/admin_footer.asp"-->
