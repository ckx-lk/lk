<%
    PAGE_TITLE = "首页"
    PAGE_ID = "home"
%>
<!--#include file="includes/header.asp"-->

    <!-- Banner -->
    <section class="banner">
        <div class="banner-content">
            <h2><%= BANNER_TITLE %></h2>
            <p><%= BANNER_SUBTITLE %></p>
        </div>
    </section>

    <!-- 关于我们预览 -->
    <section class="section fade-in">
        <div class="container">
            <div class="section-title">
                <h2>关于我们</h2>
                <div class="title-line"></div>
            </div>
            <div class="about-content">
                <div class="about-text">
                    <p>广东兰凯律师事务所成立于<%= SITE_ESTABLISHED %>年，是经广东省司法厅批准设立的综合性律师事务所。本所坐落于广州市珠江新城CBD核心区域，拥有现代化的办公环境和专业的法律服务团队。</p>
                    <p>本所以"一流规模、一流管理、一流服务"为办所理念，以勤勉守信、高效务实为服务宗旨，以扎实的法学理论功底和丰富的司法实践经验，为客户提供优质法律解决方案。</p>
                    <a href="about.asp" class="btn">了解更多</a>
                </div>
                <div class="about-stats">
                    <div class="stat-item">
                        <div class="stat-number">4+</div>
                        <div class="stat-label">年执业经验</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">6大</div>
                        <div class="stat-label">业务领域</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">数十名</div>
                        <div class="stat-label">专业律师</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 业务领域 -->
    <section class="section section-alt fade-in">
        <div class="container">
            <div class="section-title">
                <h2>业务领域</h2>
                <div class="title-line"></div>
                <p>专注法律服务，覆盖六大核心领域</p>
            </div>
            <div class="practice-grid">
                <div class="practice-card">
                    <div class="practice-icon">&#9878;</div>
                    <h3>公司法律事务</h3>
                    <p>公司设立、股权转让、公司治理、并购重组等</p>
                </div>
                <div class="practice-card">
                    <div class="practice-icon">&#127968;</div>
                    <h3>房地产与建筑工程</h3>
                    <p>土地开发、项目融资、工程合同、物业纠纷等</p>
                </div>
                <div class="practice-card">
                    <div class="practice-icon">&#9878;</div>
                    <h3>民商事争议解决</h3>
                    <p>合同纠纷、债权债务、侵权责任、婚姻家事等</p>
                </div>
                <div class="practice-card">
                    <div class="practice-icon">&#128274;</div>
                    <h3>知识产权</h3>
                    <p>商标、专利、著作权、商业秘密保护及维权等</p>
                </div>
                <div class="practice-card">
                    <div class="practice-icon">&#9878;</div>
                    <h3>刑事诉讼</h3>
                    <p>刑事辩护、刑事代理、刑事合规审查等</p>
                </div>
                <div class="practice-card">
                    <div class="practice-icon">&#128220;</div>
                    <h3>行政法律事务</h3>
                    <p>行政复议、行政诉讼、政府信息公开等</p>
                </div>
            </div>
        </div>
    </section>

    <!-- 专业团队预览 -->
    <section class="section fade-in">
        <div class="container">
            <div class="section-title">
                <h2>专业团队</h2>
                <div class="title-line"></div>
                <p>汇聚精英律师，打造专业团队</p>
            </div>
            <div class="team-grid">
                <%
                Dim rsLawyers
                Set rsLawyers = ExecuteQuery("SELECT TOP 3 * FROM lawyers ORDER BY sort_order ASC, id ASC")
                Do While Not rsLawyers.EOF
                %>
                <div class="lawyer-card">
                    <div class="lawyer-photo">
                        <% If rsLawyers("photo") <> "" Then %>
                        <img src="<%= rsLawyers("photo") %>" alt="<%= HtmlEncode(rsLawyers("name")) %>">
                        <% Else %>
                        <div class="lawyer-placeholder">&#128100;</div>
                        <% End If %>
                    </div>
                    <div class="lawyer-info">
                        <h3><%= HtmlEncode(rsLawyers("name")) %></h3>
                        <p class="position"><%= HtmlEncode(rsLawyers("position")) %></p>
                        <p class="intro"><%= CutStr(rsLawyers("intro"), 60) %></p>
                    </div>
                </div>
                <%
                    rsLawyers.MoveNext
                Loop
                rsLawyers.Close
                Set rsLawyers = Nothing
                %>
            </div>
            <div style="text-align:center;margin-top:30px;">
                <a href="team.asp" class="btn">查看全部团队</a>
            </div>
        </div>
    </section>

    <!-- 新闻动态预览 -->
    <section class="section section-alt fade-in">
        <div class="container">
            <div class="section-title">
                <h2>新闻动态</h2>
                <div class="title-line"></div>
            </div>
            <div class="news-grid">
                <%
                Dim rsNews
                Set rsNews = ExecuteQuery("SELECT TOP 3 a.*, c.column_name FROM articles a LEFT JOIN columns c ON a.column_id=c.id WHERE a.column_id=1 ORDER BY a.created_at DESC")
                Do While Not rsNews.EOF
                %>
                <div class="news-card">
                    <% If InStr(rsNews("title"), "实践基地") > 0 Then %>
                    <div class="news-image">
                        <img src="images/guocai_ceremony.jpg" alt="实践基地授牌仪式">
                    </div>
                    <% End If %>
                    <div class="news-content">
                        <div class="news-date">
                            <span class="day"><%= Day(rsNews("created_at")) %></span>
                            <span class="month"><%= Year(rsNews("created_at")) %>-<%= Right("0" & Month(rsNews("created_at")), 2) %></span>
                        </div>
                        <h3><a href="news_detail.asp?id=<%= rsNews("id") %>"><%= HtmlEncode(rsNews("title")) %></a></h3>
                        <p><%= CutStr(rsNews("summary"), 80) %></p>
                    </div>
                </div>
                <%
                    rsNews.MoveNext
                Loop
                rsNews.Close
                Set rsNews = Nothing
                %>
            </div>
            <div style="text-align:center;margin-top:30px;">
                <a href="news.asp" class="btn">查看更多新闻</a>
            </div>
        </div>
    </section>

<!--#include file="includes/footer.asp"-->
