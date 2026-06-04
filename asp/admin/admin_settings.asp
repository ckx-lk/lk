<%
    ADMIN_PAGE_TITLE = "网站设置"
    ADMIN_PAGE_ID = "settings"
    
    Dim msg4 : msg4 = ""
    
    ' 保存设置
    If Request.Form("action") = "save" Then
        Dim settingKeys, settingValues, i
        settingKeys = Array("banner_title", "banner_subtitle", "banner_image", "site_address", "site_wechat", "site_website")
        settingValues = Array(SafeStr(Request.Form("banner_title")), SafeStr(Request.Form("banner_subtitle")), SafeStr(Request.Form("banner_image")), SafeStr(Request.Form("site_address")), SafeStr(Request.Form("site_wechat")), SafeStr(Request.Form("site_website")))
        
        For i = 0 To UBound(settingKeys)
            Dim rsCheck2
            Set rsCheck2 = ExecuteQuery("SELECT id FROM settings WHERE setting_key='" & settingKeys(i) & "'")
            If rsCheck2.EOF Then
                ExecuteUpdate "INSERT INTO settings (setting_key, setting_value) VALUES ('" & settingKeys(i) & "', '" & settingValues(i) & "')"
            Else
                ExecuteUpdate "UPDATE settings SET setting_value='" & settingValues(i) & "' WHERE setting_key='" & settingKeys(i) & "'"
            End If
            rsCheck2.Close
            Set rsCheck2 = Nothing
        Next
        msg4 = "设置已保存"
    End If
%>
<!--#include file="includes/admin_header.asp"-->

    <% If msg4 <> "" Then %>
    <div class="toast show" style="background:#4CAF50;color:#fff;padding:12px 20px;margin-bottom:20px;"><%= msg4 %></div>
    <% End If %>

    <form method="post" action="admin_settings.asp">
        <input type="hidden" name="action" value="save">
        
        <div class="form-card">
            <h3 style="margin-bottom:20px;">Banner 设置</h3>
            <div class="form-group">
                <label>Banner 标题</label>
                <input type="text" name="banner_title" value="<%= HtmlEncode(GetSiteSetting("banner_title")) %>" style="width:100%;padding:10px;border:1px solid #ddd;" placeholder="<%= BANNER_TITLE %>">
            </div>
            <div class="form-group">
                <label>Banner 副标题</label>
                <input type="text" name="banner_subtitle" value="<%= HtmlEncode(GetSiteSetting("banner_subtitle")) %>" style="width:100%;padding:10px;border:1px solid #ddd;" placeholder="<%= BANNER_SUBTITLE %>">
            </div>
            <div class="form-group">
                <label>Banner 背景图</label>
                <input type="text" name="banner_image" value="<%= HtmlEncode(GetSiteSetting("banner_image")) %>" style="width:100%;padding:10px;border:1px solid #ddd;" placeholder="images/banner.jpg">
            </div>
        </div>

        <div class="form-card" style="margin-top:20px;">
            <h3 style="margin-bottom:20px;">联系方式</h3>
            <div class="form-group">
                <label>地址</label>
                <input type="text" name="site_address" value="<%= HtmlEncode(GetSiteSetting("site_address")) %>" style="width:100%;padding:10px;border:1px solid #ddd;" placeholder="<%= SITE_ADDRESS %>">
            </div>
            <div class="form-group">
                <label>微信公众号</label>
                <input type="text" name="site_wechat" value="<%= HtmlEncode(GetSiteSetting("site_wechat")) %>" style="width:100%;padding:10px;border:1px solid #ddd;" placeholder="<%= SITE_WECHAT %>">
            </div>
            <div class="form-group">
                <label>网站地址</label>
                <input type="text" name="site_website" value="<%= HtmlEncode(GetSiteSetting("site_website")) %>" style="width:100%;padding:10px;border:1px solid #ddd;" placeholder="<%= SITE_WEBSITE %>">
            </div>
        </div>

        <div style="margin-top:20px;">
            <button type="submit" class="btn" style="padding:10px 30px;background:var(--primary-purple);color:#fff;border:none;cursor:pointer;">保存设置</button>
        </div>
    </form>

<!--#include file="includes/admin_footer.asp"-->
