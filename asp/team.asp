<%
    PAGE_TITLE = "专业团队"
    PAGE_ID = "team"
%>
<!--#include file="includes/header.asp"-->

    <section class="page-banner">
        <div class="banner-content">
            <h2>专业团队</h2>
            <p>汇聚精英律师 · 打造专业团队</p>
        </div>
    </section>

    <section class="section fade-in">
        <div class="container">
            <div class="section-title">
                <h2>我们的团队</h2>
                <div class="title-line"></div>
                <p>兰凯律师事务所汇聚了一批理论功底扎实、实务经验丰富的优秀律师，以专业化分工与团队协作相结合的模式，为客户提供全方位法律服务。</p>
            </div>

            <!-- 合伙人 -->
            <div class="section-subtitle" style="text-align:center;margin:30px 0 20px;">
                <h3 style="color:var(--primary-purple);font-size:20px;">合伙人</h3>
            </div>
            <div class="team-grid fade-in">
                <%
                Dim rsTeam
                Set rsTeam = ExecuteQuery("SELECT * FROM lawyers WHERE position LIKE '%合伙人%' ORDER BY sort_order ASC, id ASC")
                Do While Not rsTeam.EOF
                %>
                <div class="lawyer-card">
                    <div class="lawyer-photo">
                        <% If rsTeam("photo") <> "" Then %>
                        <img src="<%= rsTeam("photo") %>" alt="<%= HtmlEncode(rsTeam("name")) %>">
                        <% Else %>
                        <div class="lawyer-placeholder">&#128100;</div>
                        <% End If %>
                    </div>
                    <div class="lawyer-info">
                        <h3><%= HtmlEncode(rsTeam("name")) %></h3>
                        <p class="position"><%= HtmlEncode(rsTeam("position")) %></p>
                        <p class="intro"><%= HtmlEncode(rsTeam("intro")) %></p>
                        <% If rsTeam("specialties") <> "" Then %>
                        <div class="specialty-tags">
                            <% Dim specs, spec
                            specs = Split(rsTeam("specialties"), "、")
                            For Each spec In specs %>
                            <span class="specialty-tag"><%= Trim(HtmlEncode(spec)) %></span>
                            <% Next %>
                        </div>
                        <% End If %>
                    </div>
                </div>
                <%
                    rsTeam.MoveNext
                Loop
                rsTeam.Close
                Set rsTeam = Nothing
                %>
            </div>

            <!-- 执业律师 -->
            <div class="section-subtitle" style="text-align:center;margin:40px 0 20px;">
                <h3 style="color:var(--primary-purple);font-size:20px;">执业律师</h3>
            </div>
            <div class="team-grid fade-in">
                <%
                Set rsTeam = ExecuteQuery("SELECT * FROM lawyers WHERE position NOT LIKE '%合伙人%' ORDER BY sort_order ASC, id ASC")
                Do While Not rsTeam.EOF
                %>
                <div class="lawyer-card">
                    <div class="lawyer-photo">
                        <% If rsTeam("photo") <> "" Then %>
                        <img src="<%= rsTeam("photo") %>" alt="<%= HtmlEncode(rsTeam("name")) %>">
                        <% Else %>
                        <div class="lawyer-placeholder">&#128100;</div>
                        <% End If %>
                    </div>
                    <div class="lawyer-info">
                        <h3><%= HtmlEncode(rsTeam("name")) %></h3>
                        <p class="position"><%= HtmlEncode(rsTeam("position")) %></p>
                        <p class="intro"><%= HtmlEncode(rsTeam("intro")) %></p>
                        <% If rsTeam("specialties") <> "" Then %>
                        <div class="specialty-tags">
                            <%
                            specs = Split(rsTeam("specialties"), "、")
                            For Each spec In specs %>
                            <span class="specialty-tag"><%= Trim(HtmlEncode(spec)) %></span>
                            <% Next %>
                        </div>
                        <% End If %>
                    </div>
                </div>
                <%
                    rsTeam.MoveNext
                Loop
                rsTeam.Close
                Set rsTeam = Nothing
                %>
            </div>

            <!-- 团队优势 -->
            <div class="about-features fade-in" style="margin-top:50px;">
                <div class="feature-item">
                    <div class="number">&#127891;</div>
                    <h4>专业化分工</h4>
                    <p>每位律师均有专注的执业领域，确保专业深度</p>
                </div>
                <div class="feature-item">
                    <div class="number">&#129309;</div>
                    <h4>密切协作</h4>
                    <p>跨领域案件组建专项团队，协同高效处理</p>
                </div>
                <div class="feature-item">
                    <div class="number">&#128218;</div>
                    <h4>持续学习</h4>
                    <p>定期培训研讨，紧跟法律前沿动态</p>
                </div>
                <div class="feature-item">
                    <div class="number">&#127775;</div>
                    <h4>复合型背景</h4>
                    <p>法学+财经/工程/管理，多维度解决客户问题</p>
                </div>
            </div>
        </div>
    </section>

<!--#include file="includes/footer.asp"-->
