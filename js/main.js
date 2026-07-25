// ── 맨 위로 이동 버튼 (Scroll-to-top button) ──
// 사이트 전역 공통 스크립트. 아래로 일정 거리 스크롤하면 우측 하단에 버튼이 나타나고,
// 클릭하면 페이지 최상단으로 부드럽게 스크롤합니다.
(function () {
  var btn = document.createElement('button');
  btn.className = 'scroll-top-btn';
  btn.type = 'button';
  btn.setAttribute('aria-label', '맨 위로 이동');
  btn.innerHTML = '<svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M12 19V5M5 12l7-7 7 7"/></svg>';
  document.body.appendChild(btn);

  var toggleVisibility = function () {
    if (window.scrollY > 400) {
      btn.classList.add('show');
    } else {
      btn.classList.remove('show');
    }
  };
  window.addEventListener('scroll', toggleVisibility, { passive: true });
  toggleVisibility();

  btn.addEventListener('click', function () {
    window.scrollTo({ top: 0, behavior: 'smooth' });
  });
})();
