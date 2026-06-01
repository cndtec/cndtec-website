# CND TECH 웹사이트 — 작업 현황

## 현재 진행 상황
- style.css ✅
- index.html ✅  
- about.html ✅
- products.html ✅
- projects.html ✅
- contact.html ✅
- JSON-LD 구조화 데이터 ✅
- FAQ 섹션 ✅
- Netlify 설정 ✅

## 완료된 Netlify 설정 파일
- `netlify.toml` — 빌드 설정, 보안 헤더(CSP 포함), 캐시 정책
- `_redirects` — www → non-www 정규화, 확장자 없는 URL 라우팅

## 프로젝트 구조
```
cndtec-website/
├── index.html
├── about.html
├── products.html
├── projects.html
├── contact.html
├── css/style.css
├── assets/images/
│   ├── cnd-logo*.png
│   └── logos/logo-*.{png,svg}
├── netlify.toml        ← Netlify 배포 설정
└── _redirects          ← URL 리다이렉트 규칙
```

- SVG 로고 제작 및 HTML 교체 ✅

## 완료된 SVG 로고
- `assets/images/cnd-logo.svg` — 기본 (검정+오렌지, 라이트 배경용)
- `assets/images/cnd-logo-white.svg` — 화이트 버전 (다크 배경/푸터용)
- 5개 HTML 파일 img src 모두 PNG → SVG로 교체 완료
- og:image는 PNG 유지 (소셜 미디어 SVG 미지원 대비)

## 다음 작업 후보
- 사진 실제 삽입 (assets/images/사진_배치_가이드.txt 참고)
- 커스텀 도메인 연결 (cndtec.com)
- og:image 메타태그 이미지 추가 ✅
