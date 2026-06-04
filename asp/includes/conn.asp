<%
'=============================================
' 广东兰凯律师事务所 - 数据库连接文件
' 使用 Access 数据库（可升级为 MSSQL）
'=============================================

' 数据库路径
Dim dbPath, connStr
dbPath = Server.MapPath("/database/lankai.mdb")

' Access 连接字符串
connStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dbPath & ";"

' 如果使用 MSSQL，请替换为以下连接字符串：
' connStr = "Provider=SQLOLEDB;Data Source=localhost;Initial Catalog=lankai;User ID=sa;Password=yourpassword;"

' 创建连接对象
Dim conn
Set conn = Server.CreateObject("ADODB.Connection")

' 打开数据库连接
On Error Resume Next
conn.Open connStr
If Err.Number <> 0 Then
    Response.Write "<div style='padding:20px;color:red;font-size:14px;'>数据库连接失败：" & Err.Description & "</div>"
    Response.End
End If
On Error GoTo 0

' 关闭数据库连接的子过程
Sub CloseDB()
    If Not conn Is Nothing Then
        If conn.State = 1 Then conn.Close
        Set conn = Nothing
    End If
End Sub

' 执行 SQL 查询并返回 Recordset
Function ExecuteQuery(sql)
    Dim rs
    Set rs = Server.CreateObject("ADODB.Recordset")
    rs.Open sql, conn, 1, 1  ' adOpenKeyset, adLockReadOnly
    Set ExecuteQuery = rs
End Function

' 执行 SQL 更新（INSERT/UPDATE/DELETE）
Sub ExecuteUpdate(sql)
    On Error Resume Next
    conn.Execute sql
    If Err.Number <> 0 Then
        Response.Write "<div style='padding:20px;color:red;'>操作失败：" & Err.Description & "</div>"
    End If
    On Error GoTo 0
End Sub

' 防止 SQL 注入 - 过滤危险字符
Function SafeStr(str)
    If IsNull(str) Then
        SafeStr = ""
    Else
        SafeStr = Replace(Replace(Replace(Replace(CStr(str), "'", "''"), ";", ""), "--", ""), "exec", "")
    End If
End Function

' 获取表中的记录数
Function GetRecordCount(tableName)
    Dim rs, cnt
    Set rs = ExecuteQuery("SELECT COUNT(*) AS cnt FROM " & tableName)
    cnt = rs("cnt")
    rs.Close
    Set rs = Nothing
    GetRecordCount = cnt
End Function
%>
