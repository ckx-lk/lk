<%
'=============================================
' 后台公共权限检查
'=============================================
If Session("admin_logged") <> True Then
    Response.Redirect "login.asp"
End If

Dim adminName : adminName = Session("admin_name")
%>
