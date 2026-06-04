<%
    PAGE_TITLE = "业务领域"
    PAGE_ID = "practice"
%>
<!--#include file="includes/header.asp"-->

    <section class="page-banner">
        <div class="banner-content">
            <h2>业务领域</h2>
            <p>专注法律服务 · 覆盖六大核心领域</p>
        </div>
    </section>

    <section class="section fade-in">
        <div class="container">
            <div class="section-title">
                <h2>执业领域</h2>
                <div class="title-line"></div>
            </div>
            <%
            Dim rsPractice
            Set rsPractice = ExecuteQuery("SELECT * FROM articles WHERE column_id=6 ORDER BY sort_order ASC, id ASC")
            Do While Not rsPractice.EOF
            %>
            <div class="practice-detail fade-in">
                <h3><%= HtmlEncode(rsPractice("title")) %></h3>
                <div class="practice-items">
                    <%= rsPractice("content") %>
                </div>
            </div>
            <%
                rsPractice.MoveNext
            Loop
            rsPractice.Close
            Set rsPractice = Nothing
            %>

            <!-- 静态业务领域展示（数据库无数据时显示） -->
            <div class="practice-detail fade-in">
                <h3>公司法律事务</h3>
                <div class="practice-items">
                    <p>公司设立与登记、股权转让与收购、公司治理与合规、并购重组、破产清算与重整、公司债券发行、股权激励方案设计、企业法律风险防控</p>
                </div>
            </div>
            <div class="practice-detail fade-in">
                <h3>房地产与建筑工程</h3>
                <div class="practice-items">
                    <p>土地开发与出让、房地产项目融资、建设工程合同、商品房买卖纠纷、物业管理纠纷、房屋征收与拆迁、工程索赔与结算</p>
                </div>
            </div>
            <div class="practice-detail fade-in">
                <h3>民商事争议解决</h3>
                <div class="practice-items">
                    <p>合同纠纷、债权债务纠纷、侵权责任纠纷、婚姻家事纠纷、劳动争议、物权纠纷、与公司有关的纠纷、保险纠纷</p>
                </div>
            </div>
            <div class="practice-detail fade-in">
                <h3>知识产权</h3>
                <div class="practice-items">
                    <p>商标注册与保护、专利申请与维权、著作权登记与保护、商业秘密保护、不正当竞争纠纷、特许经营合同、技术合同纠纷</p>
                </div>
            </div>
            <div class="practice-detail fade-in">
                <h3>刑事诉讼</h3>
                <div class="practice-items">
                    <p>刑事辩护、刑事代理、刑事申诉、刑事合规审查、取保候审申请、刑事自诉案件代理、刑事附带民事诉讼</p>
                </div>
            </div>
            <div class="practice-detail fade-in">
                <h3>行政法律事务</h3>
                <div class="practice-items">
                    <p>行政复议、行政诉讼、政府信息公开、行政许可纠纷、行政处罚申诉、行政赔偿、土地行政纠纷</p>
                </div>
            </div>
        </div>
    </section>

<!--#include file="includes/footer.asp"-->
