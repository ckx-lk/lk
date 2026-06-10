/* 广东兰凯律师事务所 - 后台管理系统核心逻辑 */
/* 数据存储基于 localStorage，模拟ASP后端数据操作 */

(function () {
  'use strict';

  // ========== 数据存储层 ==========
  var DB = {
    get: function (key) {
      try {
        var data = localStorage.getItem('lankai_' + key);
        return data ? JSON.parse(data) : null;
      } catch (e) {
        return null;
      }
    },
    set: function (key, value) {
      try {
        localStorage.setItem('lankai_' + key, JSON.stringify(value));
      } catch (e) {
        showToast('存储空间不足，请清理数据', 'error');
      }
    },
    remove: function (key) {
      localStorage.removeItem('lankai_' + key);
    }
  };

  // ========== 默认初始数据 ==========
  var DEFAULT_COLUMNS = [
    { id: 'col_1', name: '首页', slug: 'index', sort: 1, system: true },
    { id: 'col_2', name: '关于我们', slug: 'about', sort: 2, system: true },
    { id: 'col_3', name: '业务领域', slug: 'practice', sort: 3, system: true },
    { id: 'col_4', name: '专业团队', slug: 'team', sort: 4, system: true },
    { id: 'col_5', name: '新闻中心', slug: 'news', sort: 5, system: false },
    { id: 'col_6', name: '兰凯研究', slug: 'research', sort: 6, system: false },
    { id: 'col_7', name: '兰凯党建', slug: 'party', sort: 7, system: false }
  ];

  var DEFAULT_ARTICLES = [
    { id: 'art_1', title: '广东财经大学与兰凯律师事务所实践基地授牌仪式隆重举行', category: '新闻中心', date: '2026-05-21', content: '2026年5月21日，广东财经大学信息学院与广东兰凯律师事务所实践教学基地授牌仪式在本所隆重举行。双方将在人才培养、实践教学、科研合作等方面开展深入合作，共同培养高素质法律人才。', summary: '本所与广东财经大学信息学院正式建立实践教学基地合作关系。' },
    { id: 'art_2', title: '兰凯律师事务所成功代理重大合同纠纷案件', category: '新闻中心', date: '2026-04-15', content: '本所律师团队成功代理宽大公司诉中铁九局合同纠纷案，经过充分的证据准备和专业的法律论证，最终为客户挽回重大经济损失，获得客户高度认可。', summary: '成功代理宽大公司诉中铁九局合同纠纷案。' },
    { id: 'art_3', title: '本所开展劳动法专题培训活动', category: '新闻中心', date: '2026-03-10', content: '为提升律师团队专业水平，本所组织劳动法专题培训，深入研讨劳动争议热点问题，包括未签劳动合同双倍工资、违法解除赔偿金等实务问题。', summary: '深入研讨劳动争议热点问题。' },
    { id: 'art_4', title: '本所成功调解一起复杂离婚纠纷案件', category: '新闻中心', date: '2026-02-28', content: '本所律师成功调解一起涉及家庭暴力、财产分割、子女抚养等复杂问题的离婚纠纷案件，通过专业的法律服务和耐心的沟通调解，最终促成双方达成和解。', summary: '成功调解复杂离婚纠纷案件。' },
    { id: 'art_5', title: '本所召开2025年度工作总结暨2026年工作部署会议', category: '新闻中心', date: '2026-01-15', content: '本所召开年度工作总结会议，回顾2025年工作成果，部署2026年工作计划。会议总结了过去一年在案件代理、团队建设、业务拓展等方面取得的成绩。', summary: '回顾2025年工作成果，部署2026年工作计划。' },
    { id: 'art_6', title: '关于未签劳动合同双倍工资的法律实务分析', category: '兰凯研究', date: '2026-05-20', content: '本文结合《劳动合同法》及相关司法解释，对未签劳动合同双倍工资的构成要件、计算方式、仲裁时效等实务问题进行深入分析，并结合典型案例探讨实践中的疑难问题。', summary: '深入分析未签劳动合同双倍工资的实务问题。' },
    { id: 'art_7', title: '离婚纠纷中胁迫证据的效力认定研究', category: '兰凯研究', date: '2026-04-12', content: '本文以民事诉讼证据规则为基础，结合司法实践，对离婚纠纷中胁迫取得证据的质证策略与效力认定进行系统研究，为实务操作提供参考。', summary: '研究胁迫取得证据的质证策略与效力认定。' },
    { id: 'art_8', title: '交通事故赔偿项目详细计算指引', category: '兰凯研究', date: '2026-03-05', content: '本文系统梳理交通事故赔偿的各个项目，包括死亡赔偿金、丧葬费、被扶养人生活费、精神损害抚慰金等，详细列明计算标准和依据，并附计算示例。', summary: '系统梳理交通事故赔偿项目与计算标准。' },
    { id: 'art_9', title: '竞业限制协议的效力边界与利益冲突分析', category: '兰凯研究', date: '2026-02-18', content: '本文从劳动法角度，对竞业限制协议的签订条件、补偿标准、违约责任等进行法律分析，探讨用人单位与劳动者之间的利益平衡问题。', summary: '分析竞业限制协议的效力边界。' },
    { id: 'art_10', title: '退休工人聘用中的劳务合同与工伤责任边界', category: '兰凯研究', date: '2026-01-10', content: '本文针对退休工人再就业的法律关系认定、劳务合同与劳动合同的区别、工伤责任承担等实务问题进行研究，为企业用工提供法律风险防范建议。', summary: '研究退休工人聘用的劳务合同与工伤责任。' },
    { id: 'art_11', title: '本所组织学习民法典专题党课', category: '兰凯党建', date: '2026-06-01', content: '本所党支部组织全体党员律师开展民法典专题学习活动，深入研读民法典各编内容，结合实务案例进行研讨交流，提升党员律师的专业素养和服务能力。', summary: '组织民法典专题学习活动。' },
    { id: 'art_12', title: '本所开展公益法律咨询活动', category: '兰凯党建', date: '2026-05-20', content: '为践行社会责任，本所组织党员律师走进社区，开展免费法律咨询服务活动，为社区居民解答婚姻家庭、房产纠纷、劳动争议等常见法律问题。', summary: '组织党员律师开展社区公益咨询。' },
    { id: 'art_13', title: '本所党支部召开组织生活会', category: '兰凯党建', date: '2026-04-10', content: '本所党支部召开年度组织生活会，开展批评与自我批评，总结党建工作成效，查找不足，制定改进措施，进一步提升党支部的凝聚力和战斗力。', summary: '召开年度组织生活会。' },
    { id: 'art_14', title: '本所党员律师参与学雷锋志愿服务活动', category: '兰凯党建', date: '2026-03-05', content: '在学雷锋纪念日来临之际，本所组织党员律师开展志愿服务活动，为困难群众提供法律援助，以实际行动践行雷锋精神，传递法治温暖。', summary: '开展学雷锋志愿服务活动。' }
  ];

  var DEFAULT_LAWYERS = [
    { id: 'law_1', name: '彭大成', position: '合伙人律师', photo: 'images/peng_dacheng.jpg', intro: '擅长民事诉讼、合同纠纷、公司法务等领域，拥有丰富的办案经验。', specialties: ['民事诉讼', '合同纠纷', '公司法务'] },
    { id: 'law_2', name: '陈康祥', position: '合伙人律师', photo: 'images/chen_kangxiang.jpg', intro: '丰富的企业管理经验，专注于企业法律顾问、民事诉讼、劳动争议、合同纠纷等领域。', specialties: ['企业法律顾问', '民事诉讼', '劳动争议', '合同纠纷'] },
    { id: 'law_3', name: '陈重维', position: '合伙人律师', photo: 'images/chen_chongwei.jpg', intro: '陈重维律师深耕刑事辩护、债务债权处置、商品房买卖及保理合同纠纷，凭借扎实的法律功底与丰富实务经验，为当事人提供精准专业的解决方案；曾任职于公安机关法制科，熟悉司法机关办案流程与逻辑；现担任房地产、保理等多个行业企业的常年法律顾问，深谙企业法律风险防控与商业纠纷处理，致力于为客户提供兼具法律严谨性与商业可行性的服务。', specialties: ['刑事辩护', '债务债权', '商品房买卖', '保理合同'] },
    { id: 'law_4', name: '林琛策', position: '专职律师', photo: 'images/lin_shence.jpg', intro: '秉持"受人之托，忠人之事"的执业理念，依法维护当事人合法权益，业务涵盖公司法律顾问、合同纠纷、劳动纠纷、债权债务纠纷及集体经济组织纠纷等。', specialties: ['公司法律顾问', '合同纠纷', '劳动纠纷', '债权债务', '集体经济组织'] }
  ];

  var DEFAULT_SETTINGS = {
    bannerTitle: '一流规模 · 一流管理 · 一流服务',
    bannerSubtitle: '经广东省司法厅批准设立的大型综合性律师事务所\n以勤勉守信、高效务实为服务宗旨',
    bannerImage: '',
    siteAddress: '广州市天河区珠江新城花城大道20号远洋大厦14楼',
    siteWechat: '广东兰凯律师事务所',
    siteUrl: 'www.lankai.net'
  };

  // ========== 初始化数据 ==========
  function initData() {
    if (!DB.get('columns')) DB.set('columns', DEFAULT_COLUMNS);
    if (!DB.get('articles')) DB.set('articles', DEFAULT_ARTICLES);
    if (!DB.get('lawyers')) DB.set('lawyers', DEFAULT_LAWYERS);
    if (!DB.get('settings')) DB.set('settings', DEFAULT_SETTINGS);
  }

  // ========== 生成ID ==========
  function genId(prefix) {
    return prefix + '_' + Date.now() + '_' + Math.random().toString(36).substr(2, 6);
  }

  // ========== 消息提示 ==========
  window.showToast = function (msg, type) {
    type = type || 'success';
    var toast = document.createElement('div');
    toast.className = 'toast toast-' + type;
    toast.textContent = msg;
    document.body.appendChild(toast);
    setTimeout(function () { toast.classList.add('show'); }, 10);
    setTimeout(function () {
      toast.classList.remove('show');
      setTimeout(function () { toast.remove(); }, 300);
    }, 2500);
  };

  // ========== 确认弹窗 ==========
  window.showConfirm = function (title, message, onConfirm) {
    var overlay = document.createElement('div');
    overlay.className = 'modal-overlay';
    overlay.innerHTML = '<div class="modal-box">' +
      '<h4>' + title + '</h4>' +
      '<p>' + message + '</p>' +
      '<div class="modal-actions">' +
      '<button class="btn btn-secondary" id="modalCancel">取消</button>' +
      '<button class="btn btn-danger" id="modalConfirm">确认删除</button>' +
      '</div></div>';
    document.body.appendChild(overlay);
    document.getElementById('modalCancel').onclick = function () { overlay.remove(); };
    document.getElementById('modalConfirm').onclick = function () {
      overlay.remove();
      onConfirm();
    };
    overlay.onclick = function (e) { if (e.target === overlay) overlay.remove(); };
  };

  // ========== 登录检查 ==========
  window.checkLogin = function () {
    if (localStorage.getItem('adminLoggedIn') !== 'true') {
      window.location.href = 'login.html';
    }
  };

  // ========== 退出登录 ==========
  window.logout = function () {
    localStorage.removeItem('adminLoggedIn');
    window.location.href = 'login.html';
  };

  // ==========================================================
  //  控制台
  // ==========================================================
  window.initDashboard = function () {
    var articles = DB.get('articles') || [];
    var lawyers = DB.get('lawyers') || [];
    var columns = DB.get('columns') || [];

    document.getElementById('articleCount').textContent = articles.length;
    document.getElementById('lawyerCount').textContent = lawyers.length;
    document.getElementById('menuCount').textContent = columns.length;

    // 最新文章列表
    var tbody = document.querySelector('#recentArticles tbody');
    if (tbody) {
      var recent = articles.slice().sort(function (a, b) { return b.date.localeCompare(a.date); }).slice(0, 5);
      tbody.innerHTML = recent.map(function (a) {
        return '<tr><td>' + escHtml(a.title) + '</td><td><span class="tag">' + escHtml(a.category) + '</span></td><td>' + a.date + '</td></tr>';
      }).join('');
    }
  };

  // ==========================================================
  //  文章管理
  // ==========================================================
  var editingArticleId = null;

  window.initArticles = function () {
    initData();
    renderArticles();

    // 检查URL参数是否自动打开发布表单
    var params = new URLSearchParams(window.location.search);
    if (params.get('action') === 'add') {
      showArticleForm();
    }
  };

  function renderArticles(category, keyword) {
    var articles = DB.get('articles') || [];
    if (category) articles = articles.filter(function (a) { return a.category === category; });
    if (keyword) {
      var kw = keyword.toLowerCase();
      articles = articles.filter(function (a) { return a.title.toLowerCase().indexOf(kw) > -1; });
    }
    articles.sort(function (a, b) { return b.date.localeCompare(a.date); });

    var tbody = document.querySelector('#articlesTable tbody');
    if (!tbody) return;

    if (articles.length === 0) {
      tbody.innerHTML = '<tr><td colspan="4" class="empty-state"><div class="empty-icon">&#128196;</div><p>暂无文章</p></td></tr>';
      return;
    }

    tbody.innerHTML = articles.map(function (a) {
      return '<tr>' +
        '<td>' + escHtml(a.title) + '</td>' +
        '<td><span class="tag">' + escHtml(a.category) + '</span></td>' +
        '<td>' + a.date + '</td>' +
        '<td class="actions">' +
        '<button onclick="editArticle(\'' + a.id + '\')">编辑</button>' +
        '<button class="btn-delete" onclick="deleteArticle(\'' + a.id + '\')">删除</button>' +
        '</td></tr>';
    }).join('');
  }

  window.showArticleForm = function (id) {
    editingArticleId = id || null;
    var form = document.getElementById('articleForm');
    var formTitle = document.getElementById('formTitle');
    form.style.display = 'block';

    if (id) {
      formTitle.textContent = '编辑文章';
      var articles = DB.get('articles') || [];
      var art = articles.find(function (a) { return a.id === id; });
      if (art) {
        document.getElementById('articleTitle').value = art.title;
        document.getElementById('articleCategory').value = art.category;
        document.getElementById('articleDate').value = art.date;
        document.getElementById('articleContent').value = art.content;
        if (document.getElementById('articleSummary')) {
          document.getElementById('articleSummary').value = art.summary || '';
        }
      }
    } else {
      formTitle.textContent = '发布文章';
      document.getElementById('articleTitle').value = '';
      document.getElementById('articleCategory').value = '新闻中心';
      document.getElementById('articleDate').value = new Date().toISOString().split('T')[0];
      document.getElementById('articleContent').value = '';
      if (document.getElementById('articleSummary')) {
        document.getElementById('articleSummary').value = '';
      }
    }
  };

  window.hideArticleForm = function () {
    document.getElementById('articleForm').style.display = 'none';
    editingArticleId = null;
  };

  window.saveArticle = function () {
    var title = document.getElementById('articleTitle').value.trim();
    var category = document.getElementById('articleCategory').value;
    var date = document.getElementById('articleDate').value;
    var content = document.getElementById('articleContent').value.trim();
    var summaryEl = document.getElementById('articleSummary');
    var summary = summaryEl ? summaryEl.value.trim() : '';

    if (!title) { showToast('请输入文章标题', 'error'); return; }
    if (!date) { showToast('请选择发布日期', 'error'); return; }
    if (!content) { showToast('请输入文章内容', 'error'); return; }

    var articles = DB.get('articles') || [];

    if (editingArticleId) {
      var idx = articles.findIndex(function (a) { return a.id === editingArticleId; });
      if (idx > -1) {
        articles[idx].title = title;
        articles[idx].category = category;
        articles[idx].date = date;
        articles[idx].content = content;
        articles[idx].summary = summary;
      }
      showToast('文章已更新');
    } else {
      articles.push({
        id: genId('art'),
        title: title,
        category: category,
        date: date,
        content: content,
        summary: summary
      });
      showToast('文章发布成功');
    }

    DB.set('articles', articles);
    hideArticleForm();
    renderArticles();
  };

  window.editArticle = function (id) {
    showArticleForm(id);
  };

  window.deleteArticle = function (id) {
    showConfirm('删除文章', '确定要删除这篇文章吗？此操作不可撤销。', function () {
      var articles = DB.get('articles') || [];
      articles = articles.filter(function (a) { return a.id !== id; });
      DB.set('articles', articles);
      renderArticles();
      showToast('文章已删除');
    });
  };

  window.filterArticles = function () {
    var category = document.getElementById('filterCategory').value;
    var keyword = document.getElementById('searchKeyword').value;
    renderArticles(category, keyword);
  };

  window.searchArticles = function () {
    var category = document.getElementById('filterCategory').value;
    var keyword = document.getElementById('searchKeyword').value;
    renderArticles(category, keyword);
  };

  // ==========================================================
  //  律师管理
  // ==========================================================
  var editingLawyerId = null;

  window.initLawyers = function () {
    initData();
    renderLawyers();

    var params = new URLSearchParams(window.location.search);
    if (params.get('action') === 'add') {
      showLawyerForm();
    }
  };

  function renderLawyers() {
    var lawyers = DB.get('lawyers') || [];
    var tbody = document.querySelector('#lawyersTable tbody');
    if (!tbody) return;

    if (lawyers.length === 0) {
      tbody.innerHTML = '<tr><td colspan="5" class="empty-state"><div class="empty-icon">&#128100;</div><p>暂无律师</p></td></tr>';
      return;
    }

    tbody.innerHTML = lawyers.map(function (l) {
      var photoDisplay = l.photo ? '<img src="../' + l.photo + '" style="width:40px;height:40px;object-fit:cover;border-radius:50%;" alt="' + escHtml(l.name) + '">' : '无照片';
      var specialties = (l.specialties || []).map(function (s) { return '<span class="tag" style="margin:2px;">' + escHtml(s) + '</span>'; }).join(' ');
      return '<tr>' +
        '<td><strong>' + escHtml(l.name) + '</strong></td>' +
        '<td>' + escHtml(l.position) + '</td>' +
        '<td>' + specialties + '</td>' +
        '<td>' + photoDisplay + '</td>' +
        '<td class="actions">' +
        '<button onclick="editLawyer(\'' + l.id + '\')">编辑</button>' +
        '<button class="btn-delete" onclick="deleteLawyer(\'' + l.id + '\')">删除</button>' +
        '</td></tr>';
    }).join('');
  }

  window.showLawyerForm = function (id) {
    editingLawyerId = id || null;
    var form = document.getElementById('lawyerForm');
    var formTitle = document.getElementById('lawyerFormTitle');
    form.style.display = 'block';

    if (id) {
      formTitle.textContent = '编辑律师';
      var lawyers = DB.get('lawyers') || [];
      var law = lawyers.find(function (l) { return l.id === id; });
      if (law) {
        document.getElementById('lawyerName').value = law.name;
        document.getElementById('lawyerPosition').value = law.position;
        document.getElementById('lawyerPhoto').value = law.photo || '';
        document.getElementById('lawyerIntro').value = law.intro || '';
        // 设置专长标签
        var tagsInput = document.getElementById('lawyerSpecialties');
        if (tagsInput) {
          tagsInput.value = (law.specialties || []).join('、');
        }
        renderSpecialtyTags(law.specialties || []);
      }
    } else {
      formTitle.textContent = '添加律师';
      document.getElementById('lawyerName').value = '';
      document.getElementById('lawyerPosition').value = '';
      document.getElementById('lawyerPhoto').value = '';
      document.getElementById('lawyerIntro').value = '';
      var tagsInput = document.getElementById('lawyerSpecialties');
      if (tagsInput) tagsInput.value = '';
      renderSpecialtyTags([]);
    }
  };

  window.hideLawyerForm = function () {
    document.getElementById('lawyerForm').style.display = 'none';
    editingLawyerId = null;
  };

  window.saveLawyer = function () {
    var name = document.getElementById('lawyerName').value.trim();
    var position = document.getElementById('lawyerPosition').value.trim();
    var photo = document.getElementById('lawyerPhoto').value.trim();
    var intro = document.getElementById('lawyerIntro').value.trim();
    var tagsInput = document.getElementById('lawyerSpecialties');
    var specialties = tagsInput ? tagsInput.value.split(/[、,，]/).map(function (s) { return s.trim(); }).filter(Boolean) : [];

    if (!name) { showToast('请输入律师姓名', 'error'); return; }
    if (!position) { showToast('请输入律师职位', 'error'); return; }

    var lawyers = DB.get('lawyers') || [];

    if (editingLawyerId) {
      var idx = lawyers.findIndex(function (l) { return l.id === editingLawyerId; });
      if (idx > -1) {
        lawyers[idx].name = name;
        lawyers[idx].position = position;
        lawyers[idx].photo = photo;
        lawyers[idx].intro = intro;
        lawyers[idx].specialties = specialties;
      }
      showToast('律师信息已更新');
    } else {
      lawyers.push({
        id: genId('law'),
        name: name,
        position: position,
        photo: photo,
        intro: intro,
        specialties: specialties
      });
      showToast('律师添加成功');
    }

    DB.set('lawyers', lawyers);
    hideLawyerForm();
    renderLawyers();
  };

  window.editLawyer = function (id) {
    showLawyerForm(id);
  };

  window.deleteLawyer = function (id) {
    showConfirm('删除律师', '确定要删除该律师信息吗？此操作不可撤销。', function () {
      var lawyers = DB.get('lawyers') || [];
      lawyers = lawyers.filter(function (l) { return l.id !== id; });
      DB.set('lawyers', lawyers);
      renderLawyers();
      showToast('律师已删除');
    });
  };

  // 专长标签渲染
  function renderSpecialtyTags(tags) {
    var container = document.getElementById('specialtyTagsDisplay');
    if (!container) return;
    container.innerHTML = tags.map(function (t) {
      return '<span class="tag-item">' + escHtml(t) + ' <span class="remove-tag" onclick="removeSpecialty(this, \'' + escHtml(t) + '\')">&times;</span></span>';
    }).join('');
  }

  window.removeSpecialty = function (el, tag) {
    var tagsInput = document.getElementById('lawyerSpecialties');
    if (!tagsInput) return;
    var tags = tagsInput.value.split(/[、,，]/).map(function (s) { return s.trim(); }).filter(function (s) { return s && s !== tag; });
    tagsInput.value = tags.join('、');
    renderSpecialtyTags(tags);
  };

  // ==========================================================
  //  栏目管理
  // ==========================================================
  window.initColumns = function () {
    initData();
    renderColumns();
  };

  function renderColumns() {
    var columns = DB.get('columns') || [];
    columns.sort(function (a, b) { return a.sort - b.sort; });

    var articles = DB.get('articles') || [];

    var list = document.getElementById('columnList');
    if (!list) return;

    if (columns.length === 0) {
      list.innerHTML = '<div class="empty-state"><div class="empty-icon">&#128193;</div><p>暂无栏目</p></div>';
      return;
    }

    list.innerHTML = columns.map(function (c) {
      var count = articles.filter(function (a) { return a.category === c.name; }).length;
      var countHtml = count > 0 ? '<span class="column-count">' + count + ' 篇文章</span>' : '';
      var sysHtml = c.system ? '<span class="tag tag-green">系统栏目</span>' : '<span class="tag">自定义栏目</span>';
      var actionsHtml = '';
      if (!c.system) {
        actionsHtml = '<button class="btn btn-sm btn-secondary" onclick="editColumn(\'' + c.id + '\')">编辑</button>' +
          '<button class="btn btn-sm btn-danger" onclick="deleteColumn(\'' + c.id + '\')">删除</button>';
      } else {
        actionsHtml = '<span style="color:#999;font-size:12px;">系统栏目不可修改</span>';
      }

      var upDisabled = c.sort <= 1 ? ' disabled' : '';
      var downDisabled = c.sort >= columns.length ? ' disabled' : '';

      return '<div class="column-item" data-id="' + c.id + '">' +
        '<div class="column-info">' +
        '<span class="column-drag">&#9776;</span>' +
        '<span class="column-name">' + escHtml(c.name) + '</span>' +
        sysHtml +
        countHtml +
        '<span class="column-slug">/' + escHtml(c.slug) + '</span>' +
        '</div>' +
        '<div class="column-actions">' +
        '<button class="btn btn-sm btn-secondary" onclick="moveColumn(\'' + c.id + '\', -1)"' + upDisabled + '>&#9650;</button>' +
        '<button class="btn btn-sm btn-secondary" onclick="moveColumn(\'' + c.id + '\', 1)"' + downDisabled + '>&#9660;</button>' +
        actionsHtml +
        '</div></div>';
    }).join('');
  }

  window.showColumnForm = function () {
    var name = prompt('请输入栏目名称：');
    if (!name || !name.trim()) return;
    var slug = prompt('请输入栏目URL标识（英文，如 news）：');
    if (!slug || !slug.trim()) return;

    var columns = DB.get('columns') || [];
    var maxSort = columns.reduce(function (max, c) { return Math.max(max, c.sort); }, 0);

    columns.push({
      id: genId('col'),
      name: name.trim(),
      slug: slug.trim().replace(/[^a-zA-Z0-9_-]/g, ''),
      sort: maxSort + 1,
      system: false
    });

    DB.set('columns', columns);
    renderColumns();
    showToast('栏目添加成功');
  };

  window.editColumn = function (id) {
    var columns = DB.get('columns') || [];
    var col = columns.find(function (c) { return c.id === id; });
    if (!col) return;

    var name = prompt('请输入栏目名称：', col.name);
    if (!name || !name.trim()) return;

    col.name = name.trim();
    DB.set('columns', columns);
    renderColumns();
    showToast('栏目已更新');
  };

  window.deleteColumn = function (id) {
    var columns = DB.get('columns') || [];
    var col = columns.find(function (c) { return c.id === id; });
    if (!col) return;

    var articles = DB.get('articles') || [];
    var count = articles.filter(function (a) { return a.category === col.name; }).length;
    var msg = '确定要删除栏目"' + col.name + '"吗？';
    if (count > 0) msg += '\n该栏目下有 ' + count + ' 篇文章，删除后文章仍保留但栏目归属将丢失。';

    showConfirm('删除栏目', msg, function () {
      columns = columns.filter(function (c) { return c.id !== id; });
      // 重新排序
      columns.sort(function (a, b) { return a.sort - b.sort; });
      columns.forEach(function (c, i) { c.sort = i + 1; });
      DB.set('columns', columns);
      renderColumns();
      showToast('栏目已删除');
    });
  };

  window.moveColumn = function (id, direction) {
    var columns = DB.get('columns') || [];
    columns.sort(function (a, b) { return a.sort - b.sort; });

    var idx = columns.findIndex(function (c) { return c.id === id; });
    if (idx < 0) return;

    var targetIdx = idx + direction;
    if (targetIdx < 0 || targetIdx >= columns.length) return;

    // 交换排序值
    var tempSort = columns[idx].sort;
    columns[idx].sort = columns[targetIdx].sort;
    columns[targetIdx].sort = tempSort;

    DB.set('columns', columns);
    renderColumns();
  };

  // ==========================================================
  //  网站设置
  // ==========================================================
  window.initSettings = function () {
    initData();
    var settings = DB.get('settings') || DEFAULT_SETTINGS;

    document.getElementById('bannerTitle').value = settings.bannerTitle || '';
    document.getElementById('bannerSubtitle').value = settings.bannerSubtitle || '';
    document.getElementById('bannerImage').value = settings.bannerImage || '';
    document.getElementById('siteAddress').value = settings.siteAddress || '';
    document.getElementById('siteWechat').value = settings.siteWechat || '';
    document.getElementById('siteUrl').value = settings.siteUrl || '';
  };

  window.saveSettings = function () {
    var settings = {
      bannerTitle: document.getElementById('bannerTitle').value.trim(),
      bannerSubtitle: document.getElementById('bannerSubtitle').value.trim(),
      bannerImage: document.getElementById('bannerImage').value.trim(),
      siteAddress: document.getElementById('siteAddress').value.trim(),
      siteWechat: document.getElementById('siteWechat').value.trim(),
      siteUrl: document.getElementById('siteUrl').value.trim()
    };
    DB.set('settings', settings);
    showToast('设置已保存');
  };

  // ========== 工具函数 ==========
  function escHtml(str) {
    if (!str) return '';
    return str.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
  }

  // ========== 暴露数据访问接口（供前台页面使用） ==========
  window.LankaiData = {
    getArticles: function (category) {
      var articles = DB.get('articles') || [];
      if (category) articles = articles.filter(function (a) { return a.category === category; });
      return articles.sort(function (a, b) { return b.date.localeCompare(a.date); });
    },
    getLawyers: function () {
      return DB.get('lawyers') || [];
    },
    getColumns: function () {
      return (DB.get('columns') || []).sort(function (a, b) { return a.sort - b.sort; });
    },
    getSettings: function () {
      return DB.get('settings') || DEFAULT_SETTINGS;
    }
  };

})();
