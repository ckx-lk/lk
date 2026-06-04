<%
'=============================================
' 广东兰凯律师事务所 - 工具函数库
'=============================================

' HTML 转义（防 XSS）
Function HtmlEncode(str)
    If IsNull(str) Then
        HtmlEncode = ""
    Else
        Dim s
        s = CStr(str)
        s = Replace(s, "&", "&amp;")
        s = Replace(s, "<", "&lt;")
        s = Replace(s, ">", "&gt;")
        s = Replace(s, """", "&quot;")
        s = Replace(s, "'", "&#39;")
        HtmlEncode = s
    End If
End Function

' 截取字符串
Function CutStr(str, len)
    If IsNull(str) Then
        CutStr = ""
    ElseIf Len(str) <= len Then
        CutStr = str
    Else
        CutStr = Left(str, len) & "..."
    End If
End Function

' 格式化日期
Function FormatDate(d)
    If IsNull(d) Then
        FormatDate = ""
    Else
        FormatDate = Year(d) & "-" & Right("0" & Month(d), 2) & "-" & Right("0" & Day(d), 2)
    End If
End Function

' 分页导航
Function GetPagination(page, totalPages, urlPattern)
    Dim html, i
    html = "<div class=""pagination"">"
    If page > 1 Then
        html = html & "<a href=""" & Replace(urlPattern, "{page}", page-1) & """>&laquo; 上一页</a>"
    End If
    For i = 1 To totalPages
        If CInt(i) = CInt(page) Then
            html = html & "<span class=""current"">" & i & "</span>"
        Else
            html = html & "<a href=""" & Replace(urlPattern, "{page}", i) & """>" & i & "</a>"
        End If
    Next
    If page < totalPages Then
        html = html & "<a href=""" & Replace(urlPattern, "{page}", page+1) & """>下一页 &raquo;</a>"
    End If
    html = html & "</div>"
    GetPagination = html
End Function

' 获取文章列表（通用）
Function GetArticleList(columnId, pageSize, pageNo)
    Dim sql, rs
    sql = "SELECT TOP " & pageSize & " * FROM articles "
    If columnId <> "" Then
        sql = sql & "WHERE column_id=" & CInt(columnId) & " "
    End If
    sql = sql & "ORDER BY created_at DESC"
    Set GetArticleList = ExecuteQuery(sql)
End Function
%>
