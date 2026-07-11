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
- ⚠️ netlify.toml, _redirects — 실사용 안 함 (레거시 파일, 삭제 검토 대상. 실제 배포는 GitHub Pages)
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
- 전체 사이트 콘텐츠 업데이트 커밋 & GitHub 푸시 완료 ✅ (2026-06-15, GitHub Desktop 사용 → GitHub Pages 자동 배포)
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
- 도메인 오류 수정: cndtec.com → cndtec.co.kr ✅ (2026-06-22, Google Search Console 인증 중 발견. about/contact/index/products/projects의 og:url, robots.txt의 sitemap 경로, sitemap.xml 전체 <loc>, _redirects www 리다이렉트 규칙까지 전체 수정) — 커밋/푸시 필요
- SEO 전수 감사 및 수정 ✅ (2026-07-11) — searchfit-seo:seo-audit로 32개 페이지 전수 점검 후: ① custom-sensor.html sitemap.xml·resources/index.html 카드 누락 발견해 등록, ② 실제 콘텐츠 있는데 sitemap 누락된 6개 페이지(heat-treatment/peening/welding-residual-stress, pzt-tube-gauge, rotor-balancing, windturbine-stress) sitemap.xml 추가, ③ index/about/products/projects/contact/resources/index.html에 canonical 태그 신규 삽입 + og:url을 sitemap과 동일한 확장자 없는 형태로 통일(about.html→/about 등, 이전엔 .html 붙어있어 중복 콘텐츠 위험 있었음), ④ about.html/products.html/resources/rotor-balancing.html/resources/windturbine-stress.html 파일 끝 trailing NUL byte(최대 6971개) 제거 — 커밋/푸시 필요

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
├── CNAME                    ← GitHub Pages 커스텀 도메인 설정 (www.cndtec.co.kr)
├── netlify.toml             ← 미사용 레거시 파일
└── _redirects                ← 미사용 레거시 파일
```

## ⭐ 배포 방식: GitHub Pages (Netlify 아님 — 2026-07-11 정정)
- 배포 경로: GitHub 저장소 `cndtec/cndtec-website` main 브랜치 → GitHub Pages 자동 배포
- 커스텀 도메인: 루트의 `CNAME` 파일에 `www.cndtec.co.kr` 지정 → GitHub Pages가 이 값으로 서빙
- DNS/리다이렉트(비-www→www)는 Cloudflare에서 처리
- netlify.toml, _redirects 파일은 과거 검토 흔적이 남은 미사용 파일 — 실제 배포에 아무 영향 없음. 신뢰하지 말 것
- git remote: https://github.com/cndtec/cndtec-website.git (origin, main)

## 남은 작업
- 사진 실제 삽입 (assets/images/사진_배치_가이드.txt 참고)
- 기술자료 페이지 세부 내용 다듬기
- 도메인 전파 확인 (GitHub Pages Custom domain은 CNAME 파일로 이미 설정 완료)
- GitHub Pages 배포 확인 후 Google Search Console / 네이버 서치어드바이저에 sitemap.xml 제출 필요 (아직 미제출)

## ⭐ 2026-07-11 SEO 전수 감사 후 정정: custom-sensor.html은 스텁 아님
- custom-sensor.html은 실제 콘텐츠(title/desc/canonical/FAQ/footer 전부 완비)가 이미 작성되어 있었는데 resources/index.html·sitemap.xml에 누락되어 있던 것을 발견 → 2026-07-11 카드 추가 + sitemap 등록 완료. 아래 "다음 기술자료 후보" 목록에서 제거.
- vibration.html도 실제 콘텐츠 완비 상태(스텁 아님, sitemap에도 이미 등록되어 있었음).

## 다음 기술자료 후보 (제목·키워드 이미 세팅된 빈 스텁 페이지)
resources/field-service.html, sensors.html — 2개만 "// COMING SOON" 상태로 실제 콘텐츠 없음. 그래서 resources/index.html 목록에는 의도적으로 미노출, sitemap.xml에서도 제외, <meta name="robots" content="noindex, follow"> 추가해 둠 (저품질·중복 콘텐츠로 색인되는 것 방지).
- field-service.html → 현장 계측 용역 (시험 설계·설치·분석 원스톱)
- sensors.html → 센서 공급 (로드셀·토크·압력·변위, HBM·MMF·BD Sensors)
콘텐츠 작성 완료되면: noindex 메타태그 제거 → resources/index.html에 카드 추가 → sitemap.xml에 <url> 추가.

## ⭐ 신규 기술자료 페이지 만들 때마다 sitemap.xml 등록 여부 반드시 재확인할 것
- 2026-07-11 감사에서 실제 콘텐츠가 완성된 페이지 7개(custom-sensor, heat-treatment-residual-stress, peening-residual-stress, welding-residual-stress, pzt-tube-gauge, rotor-balancing, windturbine-stress)가 sitemap.xml에서 누락된 채 방치되어 있었음을 발견·수정. resources/index.html에 카드를 추가하는 체크리스트 항목(5번)만으로는 부족했던 것 — 카드 추가와 sitemap 추가를 별개 체크로 취급해 매번 둘 다 확인할 것.

## ⭐ 2026-07-11 신규 기술자료: 강관(파이프) 잔류응력 측정
- resources/pipe-residual-stress.html 신규 생성. 현대스틸파이프 LSAW 축관 잔류응력 성적서(CND-26-27, ASTM E837-13, API 5L X65M PSL2, 16채널 A/B/C/D × 미교정/0.04%/0.18%/0.27%)의 실측 데이터를 참조해 작성.
- 이미지는 assets/images/파이프 잔류응력측정/ 폴더 사용 (잔류응력측정 파이프.jpg, 잔류응력측정 스트레인게이지 부착_01·02.jpg, 잔류응력측정_01·02.jpg). 표준 헤더/모바일메뉴/footer 템플릿 적용 완료.
- resources/index.html에 카드 추가(용접부 잔류응력 카드 다음), sitemap.xml에 <url> 등록 완료.
- git add 시 신규 이미지 폴더(assets/images/파이프 잔류응력측정/) 반드시 함께 포함할 것.

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
7. ⭐ **FAQ 섹션 필수 포함** — `<details class="faq-item">` 패턴(global style.css 활용), 최소 5개 항목, CTA 섹션(문의하기 버튼) 앞에 삽입 (2026-07-05 추가)
   - 이미 FAQPage JSON-LD schema가 있어도 UI 섹션이 없으면 별도로 삽입
   - FAQ 없이 페이지를 만들면 안 됨 — 검색 노출·AI 검색 대응에 필수
8. ⭐ **CTA(문의하기) 섹션 필수 포함** — 페이지 최하단, FAQ 다음에 배치. 연락처(031-680-1225, wgjeon@cndtec.co.kr) 또는 contact.html 링크 버튼 포함 (2026-07-05 추가)

## 작업 지침 (세션 공통)
- 파일 전체 Read 금지 → grep으로 필요 라인만 찾고, Read는 offset/limit으로 해당 부분만
- Edit으로 정확히 그 부분만 교체
- 컨텍스트 절약을 위해 불필요한 파일 내용 출력 최소화
- 작업 완료 후 이 CLAUDE.md 업데이트
- ⭐ **파일 수정 후에는 사용자가 요청하지 않아도 항상 git add/commit/push 명령어를 안내할 것** (cmd.exe 기준, repo 경로로 cd 포함) — 2026-06-22 사용자 지시
- ⭐ **홈페이지(cndtec-website) 관련 파일을 수정할 때마다, 작업 완료 후 반드시 명령 프롬프트(cmd.exe)에서 실행할 PUSH 명령어를 구체적으로 알려줄 것** (cd 경로 포함, git add → commit → push 순서 전부) — 2026-06-24 사용자 지시
- ⛔ **sandbox(bash)에서 git 명령어(add/commit/push) 절대 실행 금지** → `.git/index.lock` 파일이 생성되어 사용자 터미널의 모든 git 작업이 차단됨. 발생 시 해결: `del "C:\Users\wgjeo\클로이드 폴더\cndtec-website\.git\index.lock"`. git 명령어는 반드시 사용자에게 cmd.exe 명령어로 전달할 것 — 2026-07-05 반복 실수 기록
- ⭐ **새 이미지 파일 추가할 때 반드시 HTML + 이미지 폴더를 git add에 함께 포함** — HTML만 커밋하고 이미지 누락 시 사이트에서 이미지 깨짐. 반드시 아래 형태로 한 줄 명령어 제공: `git add resources/파일.html "assets/images/새폴더/" && git commit -m "메시지" && git push origin main` — 2026-07-05 반복 실수 기록

## ⭐ 푸터 문구 (모든 페이지 필수 — 절대 변경 금지)
모든 HTML 페이지 하단에는 아래 문구를 **정확히** 삽입할 것 (사업자번호·대표자명 제외):

```html
<div class="footer-meta">
  <span>© 2026 CNDTECH (씨앤디테크) · 경기도 화성시 동탄영천동 131 코너원스마트타워 1018호 · TEL 031-680-1225 · wgjeon@cndtec.co.kr</span>
</div>
```

- 클래스명은 반드시 `footer-meta` 사용 (footer-bottom, footer-text 등 다른 이름 사용 금지)
- "CND TECH" 아님 → "CNDTECH" (붙여쓰기)
- 사업자등록번호, 대표자명 삽입 금지
- CSS 서체: Noto Sans KR, font-size: 13.5px (style.css .footer-meta 따름)
— 2026-07-01 사용자 지시

## 파일 위치
- 웹사이트: C:\Users\wgjeo\클로이드 폴더\cndtec-website\
- bash 경로: /sessions/epic-zen-euler/mnt/클로이드 폴더/cndtec-website/ (세션마다 mount 이름이 바뀌므로 매 세션 시작 시 재확인 필요)

## ⚠️ 실제 도메인: https://www.cndtec.co.kr (canonical, www 포함!)
- 2026-06-22 확인: Google Search Console DNS 인증 화면에서 실제 운영 도메인이 cndtec.co.kr임을 확인
- 같은 날 실제 배포 사이트를 fetch로 직접 확인한 결과, Cloudflare 단에서 비-www(cndtec.co.kr) → www(www.cndtec.co.kr)로 301 리다이렉트되고 있음 → **실제 canonical은 www 포함 버전**
- og:url·og:image·twitter:image, sitemap.xml 전체 <loc>, robots.txt의 sitemap 경로를 전부 `https://www.cndtec.co.kr`로 통일
- _redirects의 기존 규칙(www→non-www)은 실제 리다이렉트 방향과 반대였음 → "non-www → www 정규화"로 수정
- 앞으로 도메인 관련 작업/신규 메타태그·sitemap 추가 시 반드시 `https://www.cndtec.co.kr` (www 포함) 사용할 것

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
현재 상태: 90% 완성, GitHub Pages 배포 완료 (main 브랜치 자동 배포)
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
