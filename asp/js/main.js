/* 广东兰凯律师事务所 - 前端交互脚本 */

document.addEventListener('DOMContentLoaded', function () {

  // ========== 移动端菜单 ==========
  var menuToggle = document.getElementById('menuToggle');
  var navMenu = document.getElementById('navMenu');
  if (menuToggle && navMenu) {
    menuToggle.addEventListener('click', function () {
      navMenu.classList.toggle('nav-open');
      menuToggle.classList.toggle('active');
    });
    // 点击菜单项后自动关闭
    var navLinks = navMenu.querySelectorAll('a');
    navLinks.forEach(function (link) {
      link.addEventListener('click', function () {
        navMenu.classList.remove('nav-open');
        menuToggle.classList.remove('active');
      });
    });
  }

  // ========== Header 滚动效果 ==========
  var header = document.querySelector('.header');
  var lastScroll = 0;
  window.addEventListener('scroll', function () {
    var currentScroll = window.pageYOffset;
    if (header) {
      if (currentScroll > 100) {
        header.classList.add('header-scrolled');
      } else {
        header.classList.remove('header-scrolled');
      }
    }
    lastScroll = currentScroll;
  });

  // ========== 回到顶部按钮 ==========
  var backToTop = document.getElementById('backToTop');
  if (backToTop) {
    window.addEventListener('scroll', function () {
      if (window.pageYOffset > 400) {
        backToTop.classList.add('visible');
      } else {
        backToTop.classList.remove('visible');
      }
    });
    backToTop.addEventListener('click', function () {
      window.scrollTo({ top: 0, behavior: 'smooth' });
    });
  }

  // ========== 滚动淡入动画 ==========
  var fadeElements = document.querySelectorAll('.fade-in');
  if ('IntersectionObserver' in window) {
    var observer = new IntersectionObserver(function (entries) {
      entries.forEach(function (entry) {
        if (entry.isIntersecting) {
          entry.target.classList.add('fade-in-visible');
          observer.unobserve(entry.target);
        }
      });
    }, { threshold: 0.1, rootMargin: '0px 0px -50px 0px' });
    fadeElements.forEach(function (el) {
      observer.observe(el);
    });
  } else {
    // 降级处理：直接显示
    fadeElements.forEach(function (el) {
      el.classList.add('fade-in-visible');
    });
  }

  // ========== 新闻/研究列表项点击跳转 ==========
  var newsItems = document.querySelectorAll('.news-item[data-url]');
  newsItems.forEach(function (item) {
    item.style.cursor = 'pointer';
    item.addEventListener('click', function () {
      var url = item.getAttribute('data-url');
      if (url) window.location.href = url;
    });
  });

  // ========== 业务领域卡片点击 ==========
  var practiceCards = document.querySelectorAll('.practice-card[data-href]');
  practiceCards.forEach(function (card) {
    card.addEventListener('click', function () {
      var href = card.getAttribute('data-href');
      if (href) window.location.href = href;
    });
  });

  // ========== 数字递增动画 ==========
  var counters = document.querySelectorAll('.counter');
  if (counters.length > 0 && 'IntersectionObserver' in window) {
    var counterObserver = new IntersectionObserver(function (entries) {
      entries.forEach(function (entry) {
        if (entry.isIntersecting) {
          animateCounter(entry.target);
          counterObserver.unobserve(entry.target);
        }
      });
    }, { threshold: 0.5 });
    counters.forEach(function (counter) {
      counterObserver.observe(counter);
    });
  }

  function animateCounter(el) {
    var target = parseInt(el.getAttribute('data-target'), 10);
    var suffix = el.getAttribute('data-suffix') || '';
    var duration = 1500;
    var start = 0;
    var startTime = null;
    function step(timestamp) {
      if (!startTime) startTime = timestamp;
      var progress = Math.min((timestamp - startTime) / duration, 1);
      var eased = 1 - Math.pow(1 - progress, 3); // easeOutCubic
      var current = Math.floor(eased * target);
      el.textContent = current + suffix;
      if (progress < 1) {
        requestAnimationFrame(step);
      } else {
        el.textContent = target + suffix;
      }
    }
    requestAnimationFrame(step);
  }

  // ========== 律师卡片悬停效果增强 ==========
  var lawyerCards = document.querySelectorAll('.lawyer-card');
  lawyerCards.forEach(function (card) {
    card.addEventListener('mouseenter', function () {
      card.style.transform = 'translateY(-5px)';
    });
    card.addEventListener('mouseleave', function () {
      card.style.transform = 'translateY(0)';
    });
  });

  // ========== 页面当前导航高亮 ==========
  var currentPage = window.location.pathname.split('/').pop() || 'index.html';
  var navItems = document.querySelectorAll('.nav li a');
  navItems.forEach(function (item) {
    var href = item.getAttribute('href');
    if (href === currentPage) {
      item.classList.add('active');
    } else {
      item.classList.remove('active');
    }
  });

  // ========== 首页 Banner 文字动画 ==========
  var bannerContent = document.querySelector('.banner-content');
  if (bannerContent) {
    bannerContent.style.opacity = '0';
    bannerContent.style.transform = 'translateY(30px)';
    setTimeout(function () {
      bannerContent.style.transition = 'opacity 0.8s ease, transform 0.8s ease';
      bannerContent.style.opacity = '1';
      bannerContent.style.transform = 'translateY(0)';
    }, 200);
  }

  // ========== 内页 Banner 动画 ==========
  var pageBanner = document.querySelector('.page-banner > div');
  if (pageBanner) {
    pageBanner.style.opacity = '0';
    pageBanner.style.transform = 'translateY(20px)';
    setTimeout(function () {
      pageBanner.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
      pageBanner.style.opacity = '1';
      pageBanner.style.transform = 'translateY(0)';
    }, 100);
  }

});
