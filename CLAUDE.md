# CND TECH 웹사이트 — 작업 현황

## ⭐ 2026-07-24 지침: 타이틀에 영문 병기(괄호) 추가 시 줄바꿈 규칙
기술자료 타이틀에 영문 용어를 괄호로 병기해달라는 요청(예: "프레스 로드 모니터링 시스템 (Tonnage Monitoring System)")이 있을 때는 위치별로 다르게 처리할 것:
- `<title>` / `og:title` / `og:description` / JSON-LD `headline` 등 **일반 텍스트 컨텍스트**: 국문 제목 바로 뒤에 영문을 괄호로 병기하고 한 줄로 유지 (HTML 태그 삽입 불가한 위치이므로 줄바꿈 없음). 예: `프레스 로드 모니터링 시스템 (Tonnage Monitoring System) - 스트레인 트랜스듀서 기반 하중·상태진단 | 씨앤디테크`
- `<h1>` 등 **화면에 렌더링되는 헤딩**: 국문 제목과 영문 병기 사이에 `<br>`을 넣어 줄바꿈 처리 (큰 폰트에서 가독성 확보). 예: `프레스 로드 모니터링 시스템<br>(Tonnage Monitoring System)`
- `resources/index.html` 카드 `<h2>`: 짧게 한 줄로 유지 가능하면 `<br>` 없이 국영문 병기 (예: `프레스 로드 모니터링 시스템 (Tonnage Monitoring System)`), 카드 폭이 좁아 넘칠 경우에만 `<br>` 고려.
- 영문 용어는 `<meta name="keywords">`에도 소문자 그대로 추가 (예: `tonnage monitoring system`).
- 페이지 저장 후에는 항상 `grep -n "<영문용어>"`로 title/og:title/headline/H1/index.html 카드 전부에 일관되게 반영됐는지 확인하고, div 밸런스·`</html>` 종료 여부도 함께 재확인할 것.

## ⭐ 2026-07-13 완료: 홈페이지 hover 효과(스포트라이트) 전체 페이지 확대 + 파일 손상 2건 발견/복구
- 커서 스포트라이트(fx-spotlight) 색 강도 2배 진하게 조정(opacity 0.16→0.32, css/style.css).
- 테두리 드로잉(fx-border) 효과는 사용자 피드백으로 완전 제거(클래스+CSS 모두 삭제).
- 스포트라이트 효과를 index.html 외 about.html(stat-card/about-item/strength-card), products.html(area-card/prod-img-card), projects.html(proj-col), contact.html(contact-detail-card), resources/index.html(res-card)로 확대 적용. 각 페이지 하단 인라인 스크립트에 동일한 mousemove 핸들러 추가.
- 이미지 위주 갤러리 카드(about.html g-item)는 기존 zoom 효과와 중복되어 의도적으로 제외.
- ⚠️ **중요 발견**: resources/index.html이 `<footer>` 중간에서 파일이 통째로 잘려있었음(git HEAD에도 이미 커밋되어 라이브 상태로 배포되어 있던 버그 — footer 닫는 태그·모바일메뉴/언어전환/fade-in JS 스크립트 블록 전체가 없어서 이 페이지에서 모바일 메뉴·언어 전환이 작동하지 않고 있었음). 과거에도 동일 증상으로 "397d384 fix: resources/index.html footer 손상 복원" 커밋이 있었던 것으로 보아 재발한 것 — 신규 카드 추가 편집 중 파일 끝부분이 잘리는 사고가 반복되는 것으로 추정. footer·표준 스크립트 블록 전체 복원 완료.
- ⚠️ **추가 발견**: resources/strain-gauge-bonding.html의 마지막 줄이 `</html>`이 아니라 `</htm`(l자 하나 누락)으로 잘려있었음 — 수정 완료.
- **재발 방지**: 앞으로 파일 편집 후에는 `grep -c "</html>"` 등으로 파일이 정상적으로 닫혔는지 확인하는 습관 필요. 특히 리소스 카드 추가처럼 파일 끝부분(footer/script) 근처를 반복 편집하는 작업에서 이 사고가 발생하기 쉬움.

## ⭐ 2026-07-12 완료: 현장계측용역(고온 스트레인게이지) 기술자료
- resources/field-service.html을 티스토리 포스팅(candj.tistory.com/126, "고온용 스트레인게이지 부착,측정, 해석") 참조하여 "준비 중" 스텁에서 정식 콘텐츠로 전환 완료. noindex 메타 제거, title/desc/canonical/og/JSON-LD(TechArticle+FAQPage 6문항)/FAQ UI 섹션/CTA 모두 반영.
- resources/index.html에 카드 추가(풍력터빈 카드 다음, "LINE ICON 현장계측.png" 아이콘 재사용), sitemap.xml에 <url> 등록 완료(field-service.html을 스텁 제외 주석에서 제거).
- 원문에 고객사명·특정 프로젝트 식별 정보가 없어(방법론 소개 글) 별도 익명화 불필요했음 — 단 "해외 발전소 프로젝트"라는 특정 사례 지칭 표현은 일반화하여 "발전소·플랜트 등 고온 설비 현장" 식으로 표현.
- 이미지 3장(고온스트레인게이지_부착.jpg, _30채널측정.jpg, _응력측정.jpg)은 카카오CDN(blog.kakaocdn.net)이 샌드박스 네트워크 allowlist에 없어 자동 다운로드 불가 → 사용자가 직접 저장 완료. assets/images/현장계측용역 고온스트레인게이지/ 폴더에 정상 저장 확인(3000x4000 JPEG).
- ⚠️ 참고: 티스토리(candj.tistory.com)/카카오CDN(blog.kakaocdn.net) 도메인은 샌드박스 bash·web_fetch 모두 접근 불가. 향후 티스토리 포스팅 참조 작업 시 이미지는 사용자에게 직접 저장 요청할 것.

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
- 자동차 언더커버 스트레인게이지+3D스캐닝 기술자료 페이지 신규 생성 ✅ (2026-07-24, resources/car-undercover-strain.html, sitemap.xml·resources/index.html 카드 등록 포함) 후 사용자 요청으로 "TPO 2.5T / PP(Recycle) 2.0T" 재질 스펙 문구 및 "왜 언더커버 변형을 측정하는가" 표현 전체 제거·일반화 — 커밋/푸시 필요
- 프레스 로드 모니터링 시스템 기술자료 페이지 신규 생성 ✅ (2026-07-24, resources/press-load-monitoring.html — candj.tistory.com/63 자사 블로그 + HBM 백서를 참고하되 문구는 원본 재구성, sitemap.xml·resources/index.html 카드 등록 포함, 타이틀에 영문 "Tonnage Monitoring System" 병기) 이어서 업로드된 "단조 프레스 strain gauge 측정 자료" 문서의 "02 타이로드 게이지 부착 상세도"(4-게이지 풀브릿지, 벤딩모멘트 상쇄+자동 온도보상, 250~300°C, 접착형 게이지로 충분) 내용을 신규 03번 섹션으로 추가하고, 전 섹션 번호를 04~07로 재조정. 사용자가 새로 만든 로컬 이미지 폴더 `assets/images/Press monitoring system/` 실사진 9장(Main image, HBM FORCE/PIEZO SENSOR, Bolt on sensor, strain gage_bolt on sensor install, 교정 검증 그래프 1장, 노후 프레스 상태진단 사진 2장+그래프 1장)을 히어로·섹션 02·03·04·05·07에 반영 — HBM 브랜드/모델명(SLB700, CST/300 등)은 캡션에서 노출하지 않고 "포스 트랜스듀서", "압전(피에조) 트랜스듀서" 등 일반 명칭만 사용. 교정 검증 그래프 2장 중 데이터 이상(SLB700 계열이 첫 포인트 이후 0으로 평탄화)이 있는 "Total Load Data" 그래프는 제외하고 "P4 Load Data" 그래프만 채택 — 커밋/푸시 필요 (새 이미지 폴더 `assets/images/Press monitoring system/` 포함해서 커밋해야 함). 이후 모바일 반응형 CSS 보강(진단·모드카드 썸네일 600px 이하에서 세로 스택 전환), 션트방식(Method 2) 카드에 Bolt on sensor 이미지 추가, HBM 센서 캡션을 사용자 명시 요청에 따라 "HBM 포스 트랜스듀서"/"HBM 압전(피에조) 트랜스듀서"로 브랜드명 명시 복원(이 페이지에 한해 예외 적용), 노후 프레스 진단 사진 3장 캡션을 candj.tistory.com/63의 "노후 프레스 상태 진단 시스템" 섹션 맥락에 맞춰 재작성 — 커밋 완료 (7cba780 이후 추가 커밋 필요)
- 선박 진동 측정 시스템(ISO 20283-5) 기술자료 페이지 신규 생성 ✅ (2026-07-25, resources/ship-vibration-iso20283.html — candj.tistory.com/49 참조, ISO 20283-5(구 ISO 6954) 개요·측정방법(균일조건 4가지)·평가방법·추천 시스템(MMF VM31 + 3축 가속도센서 KS823B)·선박용 설치 모듈(스크류형 베이스 729/마그네틱 베이스 508) 구성. 최초 작업 시엔 로컬에 전용 사진이 없어 vibration-sensor.html 등에서 쓰던 범용 이미지(KS943L 라벨 센서, 마그네틱 베이스 규격표)를 임시로 재사용했으나, 작업 중 사용자가 `assets/images/SHIP VIBRATION/` 폴더에 전용 실사진 6장을 업로드해 전면 교체함: `ISO 20283-5 TABLE.png`(승무원/승객 구역별 실제 가이드라인 값 표 — 이제 이미지로 원본 그대로 제시, 본문 텍스트에는 수치 재기재 안 함), `GRAPH.png`(ISO 8041 Wm 필터 허용범위 vs VM31 실측 응답 그래프, 02번 섹션), `VIBRATION SENSOR_01.jpg`(KS823B 각인이 실제로 찍힌 정품 사진으로 교체, 04번 섹션), `DAQ SET.jpg`(마운팅 액세서리 키트, 04번 섹션), `VIBRATION SENSOR PACKAGE.jpg`(수평계+KS823B가 장착된 선박 갑판용 마운팅 플레이트 실물, 05번 섹션 메인 이미지로 교체). 히어로·04번 섹션의 VM31 사진은 기존 검증된 `Portable vibration/vm31.png` 유지. 이후 `SHIP VIBRATION MAIN IMAGE.png`(선체+진동 파형 합성 히어로 배너, 실제 선박명 "DAEHO SUNNY" 각인 있으나 캡션·본문에서는 특정 선박명 언급하지 않고 일반 개념도로만 소개)가 추가 업로드되어 히어로 섹션 상단 배너로 반영. ⚠️ 참고: 기존 vibration.html의 VM 비교표에는 VM31이 "1채널"로 기재되어 있으나, candj.tistory.com/49 블로그 본문은 VM31을 "4채널"로 소개함 — 두 소스가 서로 다른 채널 수를 주장하는 불일치가 있어 신규 페이지는 채널 수를 특정하지 않고 "다채널 측정 채널 지원"으로 완곡하게 표현함. 필요 시 원문 확인 후 vibration.html 또는 신규 페이지 중 하나를 정정할 것. sitemap.xml·resources/index.html 카드(진동측정 카테고리) 등록 포함 — 커밋 필요 (`assets/images/SHIP VIBRATION/` 폴더 포함해서 커밋해야 함)
- resources/multicon-controller.html SIMEX 실사진으로 전면 교체 ✅ (2026-07-25, ⚠️ 작업 중 발견: 기존 페이지의 이미지 6개가 전부 존재하지 않는 `assets/images/multicon/` 폴더를 참조하고 있었고, `onerror`로 조용히 숨겨지는 처리 때문에 그동안 이미지가 하나도 노출되지 않은 채로 배포되고 있었음. 사용자가 새로 만든 `assets/images/SIMEX/` 폴더의 SIMEX MultiCon 실사진 10장으로 전량 교체: `CMC-99.jpg`(01번 섹션, 4채널 컨트롤러 뷰 화면), `CMC-141 DISPLAY.jpg`(02번 섹션, SCADA 스타일 정유플랜트 화면), `MULTICON GRAPH.jpg`+`MultiCon_CMC-141.jpg`(02번 섹션 듀오, 다채널 게이지 대시보드 + 온도 모니터링 대시보드), `CMC BACK CONNECTION.png`+`INPUT BOARD_01.png`(PS42 전원모듈)+`INPUT BOARD_02.png`(U16 입력모듈)+`INPUT BOARD_03.png`(S8·S16 출력모듈) 4장을 신규 `.rs-img-quad`(4열/모바일 2열) 그리드로 03번 섹션에 배치, `SOFTWARE_02.png`(트렌드 그래프)+`SOFTWARE.png`(채널 설정) 듀오를 04번 섹션에 배치. sitemap.xml lastmod 갱신 포함 — 커밋 필요 (`assets/images/SIMEX/` 폴더 포함해서 커밋해야 함)
- products.html 센서 공급 카드 링크 변경 + 커서 스포트라이트 효과 전면 제거 ✅ (2026-07-25, (1) products.html P-04 "센서 공급" 카드가 준비 중 스텁 페이지 `resources/sensors.html`(sitemap 제외 대상)로 연결되고 있던 것을 `resources/pressure-sensor.html`(압력센서 기술자료)로 변경. (2) 사용자 요청으로 `.fx-spotlight` 클래스의 "커서 따라다니는 원형 스포트라이트" 효과(radial-gradient + JS mousemove로 --mx/--my 갱신)를 site-wide로 제거 — css/style.css의 `.fx-spotlight::before` 규칙을 삭제하고, 대신 기술자료(resources/index.html `.res-card:hover`)와 동일한 톤으로 `.fx-spotlight:hover { border-color: var(--accent-deep); box-shadow: 0 0 0 2px var(--accent-deep), var(--shadow-md); }`로 교체(박스 테두리가 진하게 표시됨). index.html·about.html·projects.html·products.html·contact.html 5개 파일에 중복 삽입되어 있던 "커서 스포트라이트" JS mousemove 리스너 블록도 전부 삭제(더 이상 사용하지 않는 --mx/--my 커스텀 프로퍼티 설정 코드라 죽은 코드였음). 각 카드의 이미지 확대(scale) hover 효과는 그대로 유지 — 커밋 필요
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

## ⭐ 2026-07-11 Search Console 오류 수정: products.html Product 스니펫 오류
- Google Search Console URL 검사에서 products.html이 "제품 스니펫 잘못된 항목 3개", "판매자 목록 잘못된 항목 3개"로 감지됨.
- 원인: JSON-LD ItemList의 상위 3개 항목이 `"@type": "Product"` + `offers`(가격·통화·재고 없음)로 되어 있어 Google 쇼핑 리치 리절트 검증 요건(price/priceCurrency/availability 등) 미충족.
- CND TECH는 정가 판매가 아닌 견적 기반 B2B이므로, 가짜 가격을 넣는 대신 4개 항목 전부(DAQ 시스템/스트레인게이지/로드셀·토크센서·압력센서 + 기존 잔류응력측정)를 `"@type": "Service"` + `provider`로 통일하여 Product/Merchant 리스팅 검증 대상에서 제외. `offers` 필드 전체 삭제.
- 다른 페이지에는 `"@type": "Product"` 스키마 사용된 곳 없음 (grep 확인 완료, products.html이 유일).
- 커밋/푸시 후 Search Console에서 "다시 요청"으로 재검사 필요.

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
- ⚠️ (2026-07-11 후속 수정) 최초 작성 시 고객사명·정확한 규격·교정율·측정 결과 수치를 그대로 노출했었음 — 사용자 요청으로 전면 익명화/일반화 완료(고객사명 삭제, "12M 강관"으로 일반화, "4개의 교정 조건"/"4개의 원주 위치"로 표현, 측정 결과 수치·비교표·POSITION 섹션 전체 삭제). resources/index.html 카드 설명도 동일하게 수정. CLAUDE.md에 "기술자료(사례) 페이지 정보 노출 정책" 섹션 신설하여 향후 모든 기술자료 페이지에 기본 적용.

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

## ⭐ 기술자료(사례) 페이지 정보 노출 정책 — 반드시 준수 (2026-07-11 사용자 지시)
실측 사례를 소개하는 기술자료 페이지를 작성할 때는 아래 원칙을 처음부터 적용할 것. 별도 요청 없이도 항상 적용:
- 고객사명(회사명) 절대 노출 금지. "OO 강관 제조 라인" 등 익명화된 표현만 사용.
- 정확한 제품 규격(치수·소재 등급·기계적 물성 수치) 노출 금지. "12M 강관"처럼 일반화된 표현만 사용.
- 정확한 공정 파라미터(예: 교정율 %) 노출 금지. "4개의 교정 조건"처럼 개수만 언급.
- 측정 위치도 각도·상세 라벨 없이 "4개의 원주 위치"처럼 개수만 언급.
- 측정 결과(수치, 경향, 비교표, 그래프 등) 노출 금지 — 방법론·서비스 소개 목적의 정성적 설명만 포함.
- 성적서 번호 등 특정 건을 식별할 수 있는 참조 표기도 넣지 말 것.
- 이유: 기술문서에 과도한 정보 노출은 좋지 않고, 고객사 입장에서도 원치 않을 수 있음.
- (2026-07-11 파이프 잔류응력측정 페이지 최초 작성 시 고객 성적서 데이터를 과도하게 그대로 노출했다가 사용자 요청으로 전면 익명화/일반화함. 앞으로 모든 신규 기술자료(사례) 페이지 작성 시 처음부터 이 정책 적용할 것.)

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
