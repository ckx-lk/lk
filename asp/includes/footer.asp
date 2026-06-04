<%
'=============================================
' 广东兰凯律师事务所 - 公共底部
'=============================================
%>
    <footer class="footer">
        <div class="container">
            <div class="footer-grid">
                <div class="footer-brand">
                    <h3><%= SITE_NAME %></h3>
                    <p>本所以"一流规模、一流管理、一流服务"为办所理念，以勤勉守信、高效务实为服务宗旨，竭诚为客户提供优质法律解决方案。</p>
                </div>
                <div class="footer-contact">
                    <h4>联系方式</h4>
                    <ul>
                        <li>地址：<%= SITE_ADDRESS %></li>
                        <li>微信：<%= SITE_WECHAT %></li>
                        <li>网址：<%= SITE_WEBSITE %></li>
                    </ul>
                </div>
                <div class="footer-qr">
                    <h4>关注我们</h4>
                    <div style="width:120px;height:120px;background:#f0f0f0;display:flex;align-items:center;justify-content:center;color:#999;font-size:12px;">微信公众号</div>
                </div>
            </div>
            <div class="footer-bottom">
                <p>版权所有 <%= SITE_NAME %> | 粤ICP备XXXXXXXX号 | 执业许可证号：<%= SITE_LICENSE %></p>
            </div>
        </div>
    </footer>
    <button id="backToTop" aria-label="回到顶部">&#9650;</button>
    <script src="js/main.js"></script>
<%
    Call CloseDB()
%>
</body>
</html>
