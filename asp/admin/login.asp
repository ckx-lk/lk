<%
'=============================================
' 后台登录验证
'=============================================
If Request.Form("action") = "login" Then
    Dim username, password
    username = SafeStr(Request.Form("username"))
    password = SafeStr(Request.Form("password"))
    
    Dim rsAdmin
    Set rsAdmin = ExecuteQuery("SELECT * FROM admins WHERE username='" & username & "' AND password='" & password & "'")
    If Not rsAdmin.EOF Then
        Session("admin_id") = rsAdmin("id")
        Session("admin_name") = rsAdmin("username")
        Session("admin_logged") = True
        rsAdmin.Close
        Set rsAdmin = Nothing
        Response.Redirect "admin_index.asp"
    Else
        rsAdmin.Close
        Set rsAdmin = Nothing
        loginError = "用户名或密码错误"
    End If
End If
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>后台登录 - 广东兰凯律师事务所</title>
    <link rel="stylesheet" href="../css/admin.css">
</head>
<body class="login-page">
    <div class="login-container">
        <div class="login-card">
            <div class="login-header">
                <h2>广东兰凯律师事务所</h2>
                <p>后台管理系统</p>
            </div>
            <% If loginError <> "" Then %>
            <div class="login-error"><%= loginError %></div>
            <% End If %>
            <form method="post" action="login.asp">
                <input type="hidden" name="action" value="login">
                <div class="form-group">
                    <label>用户名</label>
                    <input type="text" name="username" required placeholder="请输入用户名">
                </div>
                <div class="form-group">
                    <label>密码</label>
                    <input type="password" name="password" required placeholder="请输入密码">
                </div>
                <button type="submit" class="btn-login">登 录</button>
            </form>
            <div style="text-align:center;margin-top:15px;">
                <a href="../index.asp" style="color:#999;font-size:13px;">← 返回前台首页</a>
            </div>
        </div>
    </div>
</body>
</html>
