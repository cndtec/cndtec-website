# CND TECH 웹사이트 — 작업 현황

## 완료된 작업 전체
- style.css ✅
- index.html ✅
- about.html ✅
- products.html ✅
- projects.html ✅
- contact.html ✅
- JSON-LD 구조화 데이터 ✅
- FAQ 섹션 ✅
- Netlify 설정 ✅ (netlify.toml, _redirects)
- SVG 로고 제작 및 HTML 교체 ✅
- 파비콘 교체 ✅
- 커스텀 도메인 Cloudflare 설정 ✅
- og:image 메타태그 ✅
- 모바일 메뉴·언어전환 JS 복구 ✅
- Formspree 문의폼 연동 ✅ (mrednazk / wgjeon@cndtec.co.kr)
- HBK 로고 투명배경 교체 ✅
- 히어로 문구 개선 ✅ (MEASURE WHAT MATTERS)
- 모바일 헤더 로고·패딩 조정 ✅
- 기술자료 섹션 추가 ✅ (resources/ 6개 페이지)
- Google Analytics 삽입 ✅ (G-B25Y10FQK1)
- 스트레인게이지 부착 가이드 페이지 추가 ✅ (resources/strain-gauge-bonding.html, 사진 10장 포함)
- 전체 사이트 콘텐츠 업데이트 커밋 & GitHub 푸시 완료 ✅ (2026-06-15, GitHub Desktop 사용 → Netlify 자동 배포)
- strain-gauge-bonding.html STEP06/07 콘텐츠 수정 및 SEO 타이틀 변경 ✅ (2026-06-15, "스트레인게이지 부착법 (Strain Gauge Installation)"로 title/meta/JSON-LD/H1 통일, STEP07을 "표면 세정"으로 개명)
- strain-gauge-bonding.html 설명 글씨 크기 확대 ✅ (2026-06-15, STEP01~10 설명 문단 font-size 15px→16px)
- daq-system.html 제품명 "CND GTDL" → "GTDL"로 전체 수정 ✅ (2026-06-15, title/meta/JSON-LD/H1/alt/본문/모델명 10곳, "CND TECH" 회사명은 그대로 유지)
- resources/index.html 부착법 카드 영문명 통일 및 설명 SEO 보완 ✅ (2026-06-15, "(Bonding Procedure)" → "(Strain Gauge Installation)", 설명을 "스트레인게이지 부착·설치 방법 — ... 그림으로 보는 10단계 스트레인게이지 부착 가이드"로 변경) — 커밋/푸시 필요
- projects.html 분야별 주요 실적 전면 개편 ✅ (2026-06-18, 14개 분야 카드 + 축력 볼트 센서 납품 실적 별도 섹션, 소개 문구 교체, 대우조선해양→한화오션 전체 치환) — 커밋/푸시 필요
- LINE ICON 시리즈 PNG 8개로 사진 부재 보완 ✅ (2026-06-21, assets/images/LINE ICON *.png 8종 — about.html 갤러리 5칸 전체 교체, resources/index.html 카드 7개에 썸네일 추가, projects.html SG부착·PCB 카테고리 2곳에 아이콘 추가) — 커밋/푸시 필요
  - 보유 아이콘: DAQ, 스트레인게이지, 잔류응력측정, 진동측정, 커스텀센서(볼트), 현장계측, PCB STRAIN, TELEMETRY SYSTEM
  - projects.html 14개 카테고리 중 12개는 아이콘 미보유 — 추가 생성 시 같은 방식으로 반영 필요
- about.html 갤러리 클리핑 버그 수정 + 링크화 ✅ (2026-06-22, .g-img min-height:0 추가로 캡션 잘림 해결, 소개문구 삭제, 카드 hover 효과(translateY+이미지 scale) 추가, 5개 카드 전부 <a> 링크화 — DAQ·축력볼트→products.html, 현장계측·잔류응력·진동측정→projects.html) — 커밋/푸시 필요
- 리뉴얼 안내 팝업(renewalPopup) 전체 사이트 제거 ✅ (2026-06-22, about/contact/index/products/projects + resources 7개 파일 총 12곳에서 팝업 HTML+script 삭제)
- projects.html 14개 카테고리 중 SG부착·PCB 카드에 추가했던 LINE ICON 2개 제거 ✅ (2026-06-22, 사용자 요청으로 주요 실적 섹션은 아이콘 없이 텍스트만 유지)
- index.html 히어로 이미지 4개 테두리 제거·크기 확대 ✅ (2026-06-22, hv-card 배경 #FAFAF7→#FFFFFF로 이미지와 통일, background-size contain→92%, 카드 높이 클램프 확대) — 커밋/푸시 필요
- about.html 갤러리 캡션 글자 확대 ✅ (2026-06-22, 한글 12.5px→16px·영문 10px→12px, 굵게) — 커밋/푸시 필요
- resources/index.html 스트레인게이지 카드 설명·배지 수정 ✅ (2026-06-22, "TML·MM"→"HBM·TML", 설명을 "원리·선정·부착·결선·브릿지회로·HBM·TML 제품가이드"로 변경) — 커밋/푸시 필요
- sitemap.xml, robots.txt 신규 생성 ✅ (2026-06-22, 콘텐츠 있는 13페이지 등록, robots.txt에 sitemap 경로 포함) — 커밋/푸시 + Search Console 제출 필요
- 고립된 4개 기술자료 스텁 페이지 처리 ✅ (2026-06-22, custom-sensor/field-service/sensors/vibration이 전부 "준비 중" 빈 페이지임을 확인 → noindex 메타태그 추가, sitemap 제외, resources/index.html 미노출 유지. 콘텐츠 작성 시 풀어줄 다음 기술자료 후보로 CLAUDE.md에 기록) — 커밋/푸시 필요
- 기술자료 신규 페이지 자동 체크리스트 + sitemap 자동 업데이트 지침 추가 ✅ (2026-06-22, CLAUDE.md에 "⭐ 기술자료 신규 페이지 작업 시 자동 체크리스트" 섹션 신설 — 앞으로 기술자료 요청 시 sitemap.xml 추가를 별도 요청 없이 항상 수행)

## 프로젝트 구조
```
cndtec-website/
├── index.html
├── about.html
├── products.html
├── projects.html
├── contact.html
├── resources/
│   ├── index.html          ← 기술자료 목록
│   ├── residual-stress.html
│   ├── strain-gauge.html
│   ├── bolt-tension.html
│   ├── pcb-stress.html
│   ├── telemetry.html
│   ├── daq-system.html
│   └── strain-gauge-bonding.html
├── css/style.css
├── assets/images/
├── netlify.toml
└── _redirects
```

## 남은 작업
- 사진 실제 삽입 (assets/images/사진_배치_가이드.txt 참고)
- 기술자료 페이지 세부 내용 다듬기
- 도메인 전파 확인 후 GitHub Pages Custom domain 설정
- Netlify 배포 후 Google Search Console / 네이버 서치어드바이저에 sitemap.xml 제출 필요 (아직 미제출)

## 다음 기술자료 후보 (제목·키워드 이미 세팅된 빈 스텁 페이지)
resources/custom-sensor.html, field-service.html, sensors.html, vibration.html — 4개 모두 "// COMING SOON" 상태로 실제 콘텐츠 없음. 그래서 resources/index.html 목록에는 의도적으로 미노출, sitemap.xml에서도 제외, <meta name="robots" content="noindex, follow"> 추가해 둠 (저품질·중복 콘텐츠로 색인되는 것 방지).
- custom-sensor.html → 커스텀 센서 제작 (축력측정 볼트·토크 측정 시스템)
- field-service.html → 현장 계측 용역 (시험 설계·설치·분석 원스톱)
- sensors.html → 센서 공급 (로드셀·토크·압력·변위, HBM·MMF·BD Sensors)
- vibration.html → 진동·소음 측정 (MMF 가속도계·마이크로폰, IEPE/Charge)
콘텐츠 작성 완료되면: noindex 메타태그 제거 → resources/index.html에 카드 추가 → sitemap.xml에 <url> 추가.

## sitemap.xml / robots.txt ✅ (2026-06-22 생성)
- 루트에 sitemap.xml(실제 콘텐츠 있는 13페이지만 등록), robots.txt(sitemap 경로 포함) 생성 완료 — 커밋/푸시 필요
- 위 4개 스텁 페이지는 콘텐츠 작성 전까지 sitemap 제외

## ⭐ 기술자료 신규 페이지 작업 시 자동 체크리스트 (사용자가 매번 말 안 해도 항상 적용)
사용자가 "기술자료/블로그/가이드 페이지 만들어줘" 류의 요청을 하면, 별도 지시가 없어도 아래를 전부 자동으로 수행할 것:
1. resources/index.html "기술자료 목록"에 카드 추가 (아이콘 보유 시 매칭, 없으면 텍스트만)
2. `<script type="application/ld+json">` 구조화 데이터 삽입 (Article 또는 HowTo, 기존 strain-gauge-bonding.html 패턴 참고)
3. title / meta description / H1 — 타겟 키워드 1개에 집중해서 작성
4. 이미지 파일명·alt 텍스트는 영문 키워드로 (예: hbm-mx1615b-strain-gauge-setup.webp) — 사진 운영 규칙 섹션 참고
5. **sitemap.xml에 `<url>` 블록 자동 추가** (loc, lastmod=작업일, changefreq=monthly, priority=0.7) — 사용자가 요청하지 않아도 항상 추가
6. CLAUDE.md "완료된 작업 전체" 목록에 로그 한 줄 추가

## 작업 지침 (세션 공통)
- 파일 전체 Read 금지 → grep으로 필요 라인만 찾고, Read는 offset/limit으로 해당 부분만
- Edit으로 정확히 그 부분만 교체
- 컨텍스트 절약을 위해 불필요한 파일 내용 출력 최소화
- 작업 완료 후 이 CLAUDE.md 업데이트

## 파일 위치
- 웹사이트: C:\Users\wgjeo\클로이드 폴더\cndtec-website\
- bash 경로: /sessions/lucid-zealous-goldberg/mnt/클로이드 폴더/cndtec-website/

## 주요 연동 서비스
- Formspree: https://formspree.io/f/mrednazk
- Google Analytics: G-B25Y10FQK1
- GitHub: https://github.com/cndtec/cndtec-website

## 홈페이지 & 콘텐츠 마케팅 전략 지침
### 1. 검색 채널별 전략
- 네이버: 단기 핵심 (블로그 SEO + 파워링크)
- 구글: 중장기 (티스토리 + 홈페이지)
- 유튜브: 6개월 후 기술 영상 시작
- AI 검색: 1년 후 구조화 콘텐츠 대응
- 현재 트렌드: 네이버/구글 모두 블로그보다
  공식 웹사이트 우선 노출로 알고리즘 변화 중

### 2. 홈페이지 전략 (최우선)
현재 상태: 90% 완성, Netlify 배포 예정
추가 작업 목록:
- /services/residual-stress
- /services/noise-measurement
- /services/astm-e837
- /products/hbm-daq
- /tech/
- /cases/
SEO 적용사항:
- 서비스 페이지마다 타겟 키워드 1개 집중
- Schema Markup 적용
- 파일명/ALT태그 키워드 포함 필수

### 3. 콘텐츠 차별화
- 홈페이지: 짧고 전문적, 구매 유도, CTA 명확
- 네이버 블로그: 길고 친근하게, 정보 제공
- 티스토리: 네이버 글 재편집, 구글 SEO 최적화
- 사진은 동일 사용, 글만 플랫폼별 다르게

### 4. 사진 운영
보정 앱: Lightroom Mobile (메인), Snapseed
변환 도구: Squoosh.app (WebP 변환 + 압축)
플랫폼별 스펙:
- 홈페이지: WebP 1920px, 500KB 이하
- 블로그: JPG 1200px, 1MB 이하
- 썸네일: JPG 800px
파일명 규칙: 영문 키워드로
예) hbm-mx1615b-strain-gauge-setup.webp
촬영 체크리스트:
- 조명 > 구도 > 후보정 순서
- 삼각대 거치, 가로 방향, 3~5장 연속
- Lightroom 보정 → Squoosh 변환 → 업로드
