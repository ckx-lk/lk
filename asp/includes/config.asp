<%
'=============================================
' 广东兰凯律师事务所 - 站点配置文件
'=============================================

' 站点基本信息
Const SITE_NAME = "广东兰凯律师事务所"
Const SITE_NAME_EN = "GUANGDONG LANKAI LAW FIRM"
Const SITE_SLOGAN = "一流规模、一流管理、一流服务"
Const SITE_ESTABLISHED = 2022
Const SITE_ADDRESS = "广州市天河区珠江新城花城大道20号远洋大厦14楼"
Const SITE_WEBSITE = "www.lankai.net"
Const SITE_WECHAT = "广东兰凯律师事务所"
Const SITE_LICENSE = "24401201410056905"

' Banner 设置
Const BANNER_TITLE = "一流规模·一流管理·一流服务"
Const BANNER_SUBTITLE = "专业 · 诚信 · 卓越"
Const BANNER_IMAGE = "images/banner.jpg"

' 管理员设置
Const ADMIN_USER = "admin"
Const ADMIN_PASS = "admin123"

' 分页设置
Const PAGE_SIZE = 10

' 获取站点设置（从数据库读取，如无则使用默认值）
Function GetSiteSetting(key)
    Dim rs
    On Error Resume Next
    Set rs = ExecuteQuery("SELECT setting_value FROM settings WHERE setting_key='" & SafeStr(key) & "'")
    If Not rs.EOF Then
        GetSiteSetting = rs("setting_value")
    Else
        GetSiteSetting = ""
    End If
    rs.Close
    Set rs = Nothing
    On Error GoTo 0
End Function
%>
