# CND TECH 웹사이트 — 작업 현황

## ⭐ 2026-07-25 완료: 카드 호버 테두리 과하게 진했던 문제 수정 (전역 .fx-spotlight)
- 사용자가 스크린샷으로 지적한 카드("데이터 계측"/"센서·트랜스듀서"/"특수 목적 측정" — products.html의 `.area-card`)는 이전에 수정한 `.prod-img-card:hover`가 아니라, `css/style.css`에 정의된 **전역 공용 클래스** `.fx-spotlight:hover`가 적용된 것이었음(about.html·contact.html·index.html·products.html·projects.html의 블로그 카드·프로젝트 카드·영역 카드·제품 카드 등 다수 요소가 공유).
- `.fx-spotlight:hover`를 `border-color: var(--accent-deep)`(진한 갈색-오렌지) + `box-shadow 2px` → `border-color: var(--accent)`(중간 오렌지) + `box-shadow 1px`로 완화 — 사이트 전역에 동일하게 적용되어 일관되게 더 연해짐.
- products.html의 `.prod-img-card:hover`(직전 작업에서 추가했던 `border-color:var(--accent); box-shadow:0 0 0 1.5px`)는 이제 완화된 공용 `.fx-spotlight:hover`와 중복·상충되므로 제거하고 `transform: translateY(-4px)`만 남김 — 취급 제품 카드도 공용 클래스의 연한 톤을 그대로 따르도록 단순화.
- 검증: products.html div 밸런스(71/71), `</html>` 정상 종료, 새 hover 값 grep으로 확인.

## ⭐ 2026-07-25 완료: products.html 취급 제품 카드 → 기술자료 라이브러리 카테고리 목록으로 연결 + 호버 테두리 강조
- products.html "취급 제품 라인업" 섹션의 8개 카드(P-01~P-08) 링크를 개별 기술자료 페이지 1개(예: `resources/pressure-sensor.html`) 대신 **기술자료 라이브러리의 해당 카테고리 목록**(`resources/index.html#카테고리`)으로 연결하도록 변경. 매핑: P-01 DAQ·데이터로거→`#daq`, P-02 스트레인게이지 공급→`#strain`, P-03 잔류응력 측정→`#stress`, P-04 센서 공급→`#sensor`, P-05 커스텀 센서 제작→`#strain`, P-06 텔레메트리 시스템→`#daq`, P-07 진동·소음 측정→`#vibration`, P-08 현장 계측 용역→`#field` (각 카드가 이전에 링크하던 개별 페이지가 resources/index.html에서 속한 데이터-cat 값 그대로 사용해 결정, 임의 매핑 아님).
- resources/index.html의 각 `<h3 class="res-cat-heading">`에 `id="센서|잔류응력측정|...(data-cat-heading 값과 동일)"`를 추가해 해시(`#daq` 등) 타겟팅 가능하게 함.
- resources/index.html 하단 스크립트를 리팩터링: 기존 필터 버튼 클릭 로직을 `goToResCategory(f, behavior)` 함수로 추출하고, 페이지 로드 시 URL 해시(`location.hash`)가 유효한 카테고리와 일치하면 해당 목록으로 스크롤 + 필터 버튼 active 처리(클릭했을 때와 동일한 동작). products.html 등 외부에서 `resources/index.html#daq`처럼 들어와도 자연스럽게 목록으로 이동.
- products.html `.prod-img-card:hover` 테두리를 더 진하게 변경: `border-color: var(--orange-line)`(연한 살구색) → `var(--accent)`(진한 오렌지), 추가로 `box-shadow: 0 0 0 1.5px var(--accent)` 링을 얹어 테두리가 살짝 두꺼워 보이는 효과(레이아웃 흔들림 없이 box-shadow로만 구현).
- 검증: resources/index.html div 밸런스(76/76), 하단 `<script>` 블록 `node --check`로 문법 검증 통과, 7개 카테고리 heading 전부 id 부여 확인. products.html div 밸런스(71/71), `</html>` 정상 종료, 8개 카드 href 전부 `resources/index.html#...` 형태로 변경 확인, hover CSS 변경 확인.

## ⭐ 2026-07-25 완료: 기술자료 라이브러리 필터·카테고리 글자 크기 확대 + RPM 라인아이콘 적용
- resources/index.html `.res-filter-btn`(전체/센서/잔류응력측정/스트레인게이지·힘측정 등 필터 버튼) font-size 16px→18px, padding 12px 22px→13px 24px로 확대. 모바일(700px 이하)도 14px→15px로 비례 확대.
- `.res-cat-heading`(각 섹션 제목: 센서/잔류응력 측정/스트레인게이지·힘 측정 등) font-size 14px→20px로 확대(가장 작았던 요소), letter-spacing은 2px→1.2px로 축소해 커진 글자 크기에서도 답답해 보이지 않게 조정. 모바일 전용 17px 규칙 신규 추가.
- 사용자가 준비한 `assets/images/LINE ICON  RPM센서.png`(파일명에 공백 2칸 포함, 정확히 일치시켜 참조)를 "센서" 카테고리의 tachometer-sensor.html 카드에 적용 — 기존에는 진동측정 아이콘을 임시로 재사용 중이었음.
- 검증: div 밸런스(76/76), `</html>` 정상 종료, 신규 폰트 크기·아이콘 경로 grep으로 확인.
- ⚠️ git add 시 신규 이미지 `assets/images/LINE ICON  RPM센서.png` 포함 필요.

## ⭐ 2026-07-25 완료: 온도 라인아이콘 적용 + MMF 차지앰프 타이틀 변경
- 사용자가 준비한 `assets/images/LINE ICON 온도측정.png`를 resources/index.html "센서" 카테고리의 ir-temperature-sensor.html 카드에 적용(기존에는 아이콘 이미지가 없어 인라인 SVG만 있었음 — 이제 다른 카테고리(압력측정·진동측정 등)와 동일하게 실제 라인아이콘 PNG + onerror 시 인라인 SVG 폴백 패턴으로 통일).
- resources/mmf-signal-conditioner.html 타이틀을 "MMF 차지앰프 (신호처리 앰프)" → "진동·차지 앰프 (IEPE/차지 앰프)"로 변경. `<title>`/`og:title`/JSON-LD `headline`/`<h1>` 4곳 모두 반영, resources/index.html 카드 `<h2>`도 동일하게 맞춤. 본문 설명(meta description/keywords, 섹션 h2, FAQ 등)의 "신호처리 앰프" 표현은 이번 요청 범위(타이틀만)를 벗어나 변경하지 않음.
- `<h1>` 줄바꿈: `진동·차지 앰프<br>(IEPE/차지 앰프)` — 기존 2026-07-24 지침(타이틀-부가설명 사이 `<br>`) 그대로 적용. 두 줄 글자수(8자 vs 12자, 영문 IEPE는 폭이 좁아 실제 시각적으로는 더 비슷)를 비교해 균형 확인.
- ⚠️ **지침 업데이트**: 위 "2026-07-24 지침"을 "영문 병기"에서 "괄호 부가설명 전반(영문 번역이든 약칭/기술용어든)"으로 일반화하고, 줄바꿈 균형을 확인하는 절차를 명시적으로 추가함(자세한 내용은 아래 지침 항목 참고). 앞으로 기술문서 타이틀을 만들거나 바꿀 때마다 이 확장된 규칙을 적용할 것.
- 검증: mmf-signal-conditioner.html div 밸런스(157/157), JSON-LD 파싱 성공 + FAQ 6개/visible details 6개 일치, headline 값 확인. resources/index.html div 밸런스(76/76), 신규 아이콘 파일 존재 확인.

## ⭐ 2026-07-25 완료: "센서" 카테고리 카드 교체 (진동센서원리 → MMF 가속도센서)
- resources/index.html "센서" 섹션에서 vibration-sensor.html(진동센서 원리·선택·설치 가이드) 카드를 제거하고, mmf-accelerometer.html(MMF 가속도센서) 카드로 교체.
- vibration-sensor.html은 "소음·진동 측정" 섹션에는 그대로 유지되어 있어 결과적으로 원래 위치로 단일 노출 복귀. 대신 mmf-accelerometer.html이 "소음·진동 측정"과 "센서" 두 카테고리에 중복 노출(사용자가 원래 진동센서에 요구했던 이중노출 패턴을 그대로 mmf-accelerometer.html에 적용).
- 검증: div 밸런스(76/76), href 카운트 확인(vibration-sensor.html 1회, mmf-accelerometer.html 2회, 나머지 센서 3종 각 1회).

## ⭐ 2026-07-25 완료: 전 페이지 공통 "맨 위로 이동" 버튼 추가 + js/main.js 최초 생성
- ⚠️ **발견한 기존 버그**: 최근 생성된 7개 리소스 페이지(tachometer-sensor.html, ir-temperature-sensor.html, mmf-accelerometer.html, mmf-signal-conditioner.html, pressure-sensor.html, field-service.html, sensors.html)가 `<script src="../js/main.js">`를 참조하고 있었지만, 실제로는 `js/main.js` 파일이 저장소에 한 번도 존재한 적이 없어 전부 404 상태였음(모바일 메뉴·언어토글 등이 각 페이지에 인라인으로 없어 해당 기능 미동작 상태였음). 이번 작업으로 `js/main.js`를 신규 생성해 이 버그가 함께 해결됨(back-to-top 기능만 포함, 기존 인라인 스크립트와의 충돌 방지를 위해 모바일 네비·언어토글 로직은 포함하지 않음).
- `js/main.js` 신규 생성: 스크롤 400px 이상 시 우측 하단에 원형 버튼이 fade-in, 클릭 시 `window.scrollTo({top:0, behavior:'smooth'})`로 최상단 이동. 버튼 엘리먼트는 JS가 동적으로 생성해 `document.body`에 append하므로 각 HTML 파일의 본문(body) 마크업은 건드리지 않음.
- `css/style.css`에 `.scroll-top-btn` 스타일 추가(우측 24px·하단 24px 고정, 48px 원형, `var(--charcoal)` 배경/`var(--accent)` 호버, z-index 120, 모바일 640px 이하에서 44px·16px 여백으로 축소).
- 사이트 전체 46개 HTML 파일 중 39개(루트 페이지 6개 + design-preview 2개 + resources 31개)에 `<script src="js/main.js">` 또는 `<script src="../js/main.js">`를 `</body>` 직전에 자동 삽입(경로 깊이에 따라 상대경로 자동 계산). 기존에 이미 참조하던 7개 페이지는 파일이 새로 생겨 자동으로 정상 작동.
- 검증: 46개 전체 페이지가 js/main.js를 참조함을 확인, `node --check js/main.js` 문법 검증 통과, 각 파일에 `</body>` 중복 없음 확인.
- ⚠️ git add 시 신규 폴더 `js/` (main.js) 및 수정된 css/style.css, 그리고 39개 HTML 파일 전체 포함 필요.

## ⭐ 2026-07-25 완료: 기술자료 라이브러리에 "센서" 카테고리 신설
- resources/index.html에 새 필터 카테고리 신설: `<button data-filter="sensor">센서</button>` (전체 다음, 잔류응력측정 앞) + `<h3 data-cat-heading="sensor">센서</h3>` 섹션을 그리드 최상단(잔류응력측정 섹션 바로 앞)에 추가.
- 센서 섹션에 4개 카드 배치: ① tachometer-sensor.html(RPM 센서) — 기존 "소음·진동 측정" 섹션에서 이동, ② ir-temperature-sensor.html(온도센서) — 기존 "DAQ·계측 시스템" 섹션에서 이동, ③ pressure-sensor.html(압력센서) — 기존 "DAQ·계측 시스템" 섹션에서 이동, ④ vibration-sensor.html(진동센서) — 사용자 지침에 따라 "소음·진동 측정" 섹션의 원본 카드는 그대로 두고 센서 섹션에 카드를 복제 추가(진동센서만 두 카테고리에 중복 노출).
- RPM·온도·압력 3개는 이전 위치의 카드를 완전히 제거하고 센서 섹션으로 단일 이동(중복 노출 아님). 진동센서만 유일하게 data-cat="vibration"과 data-cat="sensor" 두 곳에 각각 존재.
- 필터 스크립트(하단 `<script>`)는 `.res-filter-btn`/`.res-cat-heading`을 범용적으로 순회하는 구조라 별도 JS 수정 없이 새 카테고리가 자동으로 동작함(클릭 시 해당 섹션으로 스크롤).
- 검증: div 밸런스(75/75), `</html>` 정상 종료, 필터 버튼 8개/헤딩 8개 일치 확인, href별 중복 카운트 확인(vibration-sensor.html만 2회, 나머지는 1회).

## ⭐ 2026-07-25 완료: 비접촉식 적외선(IR) 온도센서 기술자료 페이지 신규 생성
- resources/ir-temperature-sensor.html 신규 생성. candj.tistory.com/91(비접촉 온도 측정 모니터링 — 오토닉스 KN-2000W 인디게이터 연동 실납품 사례, 300°C급 대상) + 사용자가 업로드한 USB형 IR 온도센서 PDF 데이터시트 참조.
- 2개 제품 카테고리로 구성: ① RS485·아날로그(0-10V, 4-20mA) 출력형(0~1200°C, 초고온 특별버전) — tistory 실제 사례 기반, ② USB 인터페이스형(-20~1000°C, Modbus RTU/가상 COM, IP65, M16×1mm, 45mm, 1.5m 케이블, 85g) — 업로드 PDF 데이터시트 기반.
- ⚠️ **사용자 지침**: 업로드된 USB형 PDF의 제조사·제품 브랜드명("Calex"/"PyroMiniUSB" 등)을 본문·메타태그·이미지 파일명 어디에도 노출하지 말 것 — "USB 인터페이스형"이라는 일반 명칭으로 작성, 실측 스펙만 인용.
- 제품 사진이 없는 USB형 이미지는 업로드 PDF 1페이지를 300dpi로 렌더링(pdftoppm) 후 브랜드 로고·텍스트가 없는 제품 사진 영역만 PIL로 크롭해 `assets/images/비접촉식 온도센서/usb-type-ir-sensor.png`로 저장(브랜드 텍스트가 페이지 하단에만 있어 크롭 영역에는 포함되지 않음을 렌더링 이미지로 사전 확인).
- RS485형은 tistory 사례의 실제 인디게이터 브랜드(오토닉스 KN-2000W)를 그대로 인용 — 이 브랜드에 대해서는 사용자 지침이 없었고, pressure-sensor.html 등 기존 페이지도 실제 벤더명을 인용하는 관례를 따름.
- 사용자가 준비한 assets/images/비접촉식 온도센서/ 폴더의 실사진 6장 중 5장 사용(IR 온도센서.jpg, IR 온도센서_02.jpg, Main-02.jpg, 온도센서 케이블 연결.jpg, 적외선온도센서3.png). Indicator.png·적외선온도센서4.png는 이번 페이지에서 미사용.
- sitemap.xml에 <url> 등록, resources/index.html — "온도" 전용 필터 카테고리가 없어 pressure-sensor.html과 동일하게 data-cat="daq"로 등록(선행 사례 준수), pressure-sensor.html 카드 바로 다음에 배치. footer는 기존 4개 링크 유지(미변경).
- 검증: div 밸런스(91/91), `</html>` 정상 종료, JSON-LD 파싱 성공 + FAQ 6개/visible details 6개 일치, 이미지 참조 전부 디스크 존재 확인, "calex"/"pyro" 문자열 본문에 없음(grep -i) 확인, resources/index.html div 밸런스(74/74)도 재확인.
- ⚠️ git add 시 새 이미지 폴더 `assets/images/비접촉식 온도센서/` 포함 필요(PDF에서 크롭한 usb-type-ir-sensor.png 포함).

## ⭐ 2026-07-25 완료: 비접촉식 RPM 측정센서(타코미터) 기술자료 페이지 신규 생성
- resources/tachometer-sensor.html 신규 생성. monarchinstrument.com/product-category/remote-speed-sensors/ 8개 제품(ROS, ROSM, ROLS, RLS, GE200-HP, IRS, ROS-HT-W-25, CSLS) + candj.tistory.com/72(비접촉 RPM 측정 센서/타코미터) 참조.
- ⚠️ **사용자 지침**: 브랜드명(Monarch/Monarch Instrument)을 본문·이미지 파일명 어디에도 노출하지 말 것 — 8개 제품을 방식(가시광 LED 옵티컬 / 변조 LED 옵티컬 / 가시광 레이저 / 방수형(IP67) 러기드 레이저 / 유도형 스파크플러그 / 적외선 / 고온형 광학 / 스마트 디지털 레이저) 기준의 일반 명칭으로 재구성해 작성. 실측 스펙(속도범위·작동거리·전원·출력)은 공식 제품페이지에서 그대로 인용.
- 이미지 파일명에 "Monarch-Instrument"가 포함되어 있던 것을 발견해 `assets/images/Tachometer/ros-ht-w-25-high-temp-sensor.jpg`로 리네임 후 참조 수정(브랜드명 URL 노출 방지, pressure-sensor.html의 bdsensors.de 제거 사례와 동일 원칙).
- 사용자가 준비한 assets/images/Tachometer/ 폴더의 실사진 6장 사용(IRS·ROS-HT-W-25는 정확히 일치하는 실제 제품사진, 나머지 LED/레이저/방수형 카테고리는 housing이 동일한 사진을 방식별로 재사용). 유도형·스마트 디지털 레이저 2개 카테고리는 매칭되는 사진이 없어 텍스트만 구성(MMF 액세서리 카드와 동일 패턴). 폴더 내 "펄스미터.png"(Autonics 브랜드 별도 제품, 다운스트림 디지털 카운터/펄스미터)는 이번 페이지에서는 사용하지 않음.
- sitemap.xml에 <url> 등록, resources/index.html "소음·진동 측정" 카테고리에 rotor-balancing.html 카드 바로 다음 카드 추가, footer는 기존 4개 링크 유지(미변경).
- 검증: div 밸런스(111/111), `</html>` 정상 종료, JSON-LD 파싱 성공 + FAQ 6개/visible details 6개 일치, 이미지 참조 전부 디스크 존재 확인, "Monarch" 문자열 본문에 없음(grep -i) 확인, resources/index.html div 밸런스(72/72)도 재확인.
- ⚠️ git add 시 새 이미지 폴더 `assets/images/Tachometer/` 포함 필요(리네임된 파일 포함).

## ⭐ 2026-07-25 완료: MMF 신호처리 앰프(Signal Conditioner) 기술자료 페이지 신규 생성
- resources/mmf-signal-conditioner.html 신규 생성. mmf.de/en/product-category/signal-conditioners/ 22개 제품(M29, M33, IEPE100, M72A1/B1/A3/B3, M72S1/S8/R1/R8, M208A/B, M14, M12, MQ20, MQ40, FB2, FB3, FBV, FBD, M29/33DIN) + 기존 카탈로그 PDF 참조.
- 타이틀 "MMF 차지앰프 (신호처리 앰프)" — 2026-07-25 지침(완전가이드 금지) 준수. 제품을 7개 카테고리(IEPE 공급·증폭 모듈 / 1채널 데스크탑 / 3채널 데스크탑 / 랙 모듈형 8채널 / 8채널 표준형 / 진동 상시감시 모듈 / 액세서리)로 그룹핑, 22개 카드 + 22행 비교표 + 7개 적용분야 카드 + FAQ 6문항(JSON-LD TechArticle+FAQPage 동기화).
- 사용자가 준비한 assets/images/Signal conditioner/ 폴더의 실사진 16장 사용(FB2·FB3·FBV·FBD·M29/33DIN 5개 액세서리는 실사진 없어 이미지 없이 텍스트만 구성, MQ40은 MQ20과 동일 사진 재사용 — MMF 공식 사이트도 동일 정책).
- sitemap.xml에 <url> 등록, resources/index.html "소음·진동 측정" 카테고리에 mmf-accelerometer.html 카드 바로 다음 카드 추가, footer는 기존 4개 링크 유지(미변경).
- 검증: div 밸런스(157/157), `</html>` 정상 종료, JSON-LD 파싱 성공 + FAQ 6개/visible details 6개 일치, 이미지 참조 19개 전부 디스크 존재 확인, resources/index.html div 밸런스(70/70)도 재확인.
- ⚠️ git add 시 새 이미지 폴더 `assets/images/Signal conditioner/` 포함 필요.

## ⭐ 2026-07-25 지침: 기술자료 신규 페이지 타이틀에 "완전 가이드" 등 상투적 문구 금지
- 신규 기술자료 페이지를 생성할 때 `<title>`/`og:title`/JSON-LD `headline`/`<h1>`/`resources/index.html` 카드 `<h2>`에 "완전 가이드", "전체 라인업" 같은 상투적·군더더기 문구를 붙이지 말 것. 브랜드명 + 정식 제품명(필요 시 괄호 병기)만으로 간결하게 구성. 예: "MMF 가속도센서 (진동센서)" (❌ "MMF 가속도센서(진동센서) 전체 라인업 — 모델별 사양 가이드"), 앞서 정한 "BD SENSORS 압력센서" 타이틀도 같은 원칙.
- 기존에 이미 "완전 가이드"가 붙어 있는 페이지(볼트 축력 측정, 토크 측정 방법, 휴대용 진동측정 시스템, 데이터 수집장치)는 이번 지침 대상이 아니며 별도 요청 시에만 수정.

## ⭐ 2026-07-24 지침 (2026-07-25 확장): 타이틀에 괄호 부가설명 추가 시 줄바꿈 규칙
기술자료 타이틀이 "메인명칭 (부가설명)" 구조를 가질 때 — 부가설명이 영문 번역(예: "Tonnage Monitoring System")이든, 약칭/기술용어 병기(예: "신호처리 앰프", "IEPE/차지 앰프", "타코미터")든 상관없이 아래 규칙을 동일하게 적용할 것:
- `<title>` / `og:title` / `og:description` / JSON-LD `headline` 등 **일반 텍스트 컨텍스트**: 메인명칭 바로 뒤에 부가설명을 괄호로 병기하고 한 줄로 유지 (HTML 태그 삽입 불가한 위치이므로 줄바꿈 없음). 예: `프레스 로드 모니터링 시스템 (Tonnage Monitoring System) - 스트레인 트랜스듀서 기반 하중·상태진단 | 씨앤디테크`
- `<h1>` 등 **화면에 렌더링되는 헤딩**: 메인명칭과 괄호 부가설명 사이에 `<br>`을 넣어 두 줄로 줄바꿈 처리 (큰 폰트에서 가독성 확보). 예: `진동·차지 앰프<br>(IEPE/차지 앰프)`
- `resources/index.html` 카드 `<h2>`: 짧게 한 줄로 유지 가능하면 `<br>` 없이 병기 (예: `프레스 로드 모니터링 시스템 (Tonnage Monitoring System)`), 카드 폭이 좁아 넘칠 경우에만 `<br>` 고려. 페이지 본문 h1과 반드시 동일한 타이틀 문구로 맞출 것(카드와 본문 제목이 다르면 안 됨).
- 영문 용어가 포함된 경우 `<meta name="keywords">`에도 소문자 그대로 추가 (예: `tonnage monitoring system`).
- **줄바꿈 균형 확인(신규, 2026-07-25)**: `<br>`로 나뉜 두 줄의 길이가 한쪽이 지나치게 짧거나 길어 보이지 않는지 확인할 것 — 대략 두 줄의 표시 글자 수(영문은 한글 대비 폭이 좁으므로 실제 폭 기준으로 어림)가 비슷한 수준이면 통과. 확연히 불균형하면(예: 한 줄은 3~4자, 다른 줄은 15자 이상) `<br>` 위치를 조정하거나 문구를 다듬을 것. 매번 실제 브라우저로 렌더링해 볼 필요는 없고, 문자 수 비교로 충분함.
- 타이틀을 변경/생성할 때마다 이 규칙을 적용하고, 저장 후 항상 `grep -n "<새 문구>"`로 title/og:title/headline/H1/index.html 카드 전부에 일관되게 반영됐는지 확인하고, div 밸런스·`</html>` 종료 여부도 함께 재확인할 것.

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
- resources/pressure-sensor.html BD SENSORS 공식 4대 압력 제품군 기준으로 재구성 ✅ (2026-07-25, 사용자가 bdsensors.de 공식 홈페이지 3개 카테고리 URL(digital-pressure-gauge, differential-pressure-transmitter, pressure-transmitter)을 전달하며 정리 요청 — 각 페이지를 mcp__workspace__web_fetch로 조회해 실제 모델·사양 확인. "제품 라인업" 섹션을 기존 단일 9카드 그리드에서 BD SENSORS 공식 분류에 맞춘 4개 하위 그룹으로 재구성: ① 압력 트랜스미터(Pressure Transmitter) — DMP320(기존 유지)·DMP331(신규)·XMPi(신규, HART), ② 차압 트랜스미터(Differential Pressure Transmitter, 신규 섹션) — DPT200·DMD331·DPS200, ③ 디지털 압력계(Digital Pressure Gauge, 신규 섹션) — DM01(기존 위치 이동)·DL01→DM10으로 교체(신규)·BAROLI02(신규), ④ 수위 레벨·압력 스위치·기타 — LMP308·LMK858·DCL531·DS401·DS230·PA430·DAC(기존 유지). 출력 신호 비교표에 DMP331·XMPi·DPT200·DMD331·DPS200·DM01/DM10 행 추가. FAQ에 "BD SENSORS 압력 제품군 분류" 문항 신규 추가(JSON-LD·화면 <details> 양쪽 동기화). 타이틀을 사용자 요청대로 "BD SENSORS 압력센서"로 변경(title/og:title/H1/JSON-LD headline 전부), 기존 페이지 전체에 혼용되어 있던 "BD SENSOR"(단수) 표기를 공식 브랜드명 "BD SENSORS"(복수)로 전체 통일. resources/index.html 카드 문구·sitemap.xml lastmod 갱신 포함. 이미지는 이 작업환경 네트워크가 bdsensors.de 도메인을 차단해(curl exit 56) 직접 다운로드 불가했으나, 사용자가 `assets/images/BD Sensors/` 폴더에 bdsensors.de 실제 제품사진 60장을 직접 다운로드해 업로드 — 파일명(csm_*, "pressure transmitter *", "differential pressure transmitter *", "digital pressure gauge *", "electronic pressure switch *" 등 원본 alt 텍스트 기반 파일명) 매칭으로 10개 카드에 반영: DMP320("pressure transmitter precision DMP 320.jpg"), DMP331("csm_R.DMP-331-H00_c4b198f1a2.jpg"), XMPi("csm_XMPi_2020_0f941aadc9.jpg"), DPT200("csm_DPT200_b0ecb11c6a.jpg"), DMD331/DPS200(동일 명명 패턴 파일), DM01("Digitalmanometer DM 01 mit abnehmbarer Anzeigeeinheit.jpg"), DM10("digital pressure gauge DM10.jpg" — 폴더에 DL01 사진이 없어 DL01 카드를 DM10(세라믹 센서, 플랜트·기계용)으로 교체), BAROLI02("digital pressure gauge Baroli 02.jpg"), DS401("electronic pressure switch DS401.jpg"). 카드 상단에 신규 `.ps-product-img` 썸네일 영역(160px, object-fit:contain, onerror 시 자동 숨김) 추가. DS230/PA430/DAC/LMP308/LMK858/DCL531은 매칭되는 파일이 없어 이미지 없이 유지 — 커밋 필요 (`assets/images/BD Sensors/` 폴더 포함해서 커밋해야 함)
- resources/pressure-sensor.html DAC 시리즈 단종 제거 + LMK858/DS230 실제 존재 제품(LMK807/DS233)으로 전면 교체 + 신규 WEBP 이미지 삽입 ✅ (2026-07-25, 사용자가 "DAC는 단종되어 없음", "LMK858/DS230은 실제 제품이 아님(LMK807/DS233으로 교체 필요)"이라고 지적 — bdsensors.de의 LMK 807(submersible probes) 및 DS 233(electronic pressure switch) 공식 제품 상세 페이지를 mcp__workspace__web_fetch로 재조회해 실제 스펙 확인 후 반영. ① DAC 시리즈(GaPO₄ 피에조, 동적 압력) 카드·출력신호 비교표 행·적용분야 카드(💥 폭발·탄도·연소 시험)를 페이지에서 전량 삭제 — 단종 제품이라 유통사 페이지에 노출 불가. ② LMK858(낙뢰·서지 보호 기능, 잘못된 정보)→LMK807(플라스틱 하우징 플러시 마운트 세라믹 레벨 프로브, 4~100 mH₂O, 0.5% FSO, SIL2 옵션, 화학·환경산업/폐수 적합)로 카드·비교표 행·적용분야 카드·JSON-LD FAQ·화면 FAQ 전체 재작성(단순 라벨 치환이 아니라 실제 제품 특성에 맞춰 서술 전면 수정 — "낙뢰 보호" 관련 문구는 LMK807의 실제 기능이 아니므로 전부 삭제). ③ DS230(공압·유압 압력 스위치, 잘못된 정보)→DS233(비부식성 가스·압축공기용 차압 스위치, 압전저항 실리콘, 6mbar~1,000mbar, 0.35% FSO, PNP 접점, 기계설비·HVAC 적합)로 카드·비교표 행 전면 재작성. ④ 적용분야 섹션 재구성: "공압·유압 제어"(DS233·DS401) 카드를 "HVAC·차압 감시"(DS233 단독)로 교체, "지하수·댐·저수지"(LMK807 낙뢰보호, 잘못된 정보) 카드를 "화학·폐수 처리"(LMK807 실제 특성)로 교체, "상수·하수 처리" 카드에서 LMK807·"빗물 배수로" 문구 제거하고 LMP308 단독으로 정리. ⑤ 사용자가 새로 업로드한 WEBP 이미지 6장 중 5장을 기존 빈 카드에 삽입: LMP308("csm_R.LMP-308_oK_getrennt_154084342f.webp"), DCL531("csm_R.DCL-531_oK_80d8f09ad0.webp"), LMK807("csm_LMK807_PPHT_0c16cf7927.webp"), DS233("csm_DS233_5cfc77661c.webp"), PA430("csm_PA430_8296db4c95.webp") — DCL531i 변형 이미지("csm_R.DCL-531i_oK_0ada07a1ea.webp")는 현재 카드가 없어 미사용. 검증: div 133/133 균형, `</html>` 정상 종료, JSON-LD `json.loads()` 파싱 성공 + FAQ 7문항/화면 `<details>` 7개 일치, 신규 이미지 15개 경로 전부 디스크 존재 확인, 제품카드 15개·적용분야카드 7개·비교표 행 12개(헤더 제외) 카운트 일치 — 커밋 필요 (`assets/images/BD Sensors/`에 신규 webp 6장 포함되어 있으므로 폴더 통째로 재커밋 필요)
- resources/mmf-accelerometer.html 신규 생성 — "MMF 가속도센서(진동센서) 전체 라인업" ✅ (2026-07-25, 사용자가 로컬에 `assets/images/MMF Vibration sensor/` 폴더를 새로 만들어 MMF 실사진 약 60장을 업로드하고, 첨부한 "MMF main catalog.pdf"(2012년판, 78페이지)와 mmf.de 공식 사이트(진동센서 카테고리 전체, 특히 `/en/product-category/vibration-sensors/universal-accelerometers/`)를 참조해 신규 기술자료 페이지 생성 요청. 기존 `resources/vibration-sensor.html`은 피에조 가속도계의 일반 원리·선택·설치 가이드(브랜드 비특정)이므로, 이번 신규 페이지는 그와 겹치지 않도록 "MMF 브랜드 제품 라인업 카탈로그"로 명확히 차별화. ⚠️ 타이틀 결정: 사용자가 "MMF 가속도센서"/"진동센서"/"가속도센서 MMF"/"MMF 가속도(진동)센서" 중 SEO 관점에서 최적안을 문의 — "MMF 가속도센서(진동센서) 전체 라인업"으로 확정(브랜드명 MMF를 맨 앞에 배치해 브랜드 검색 매칭, 정식 명칭 "가속도센서"를 주 키워드로 쓰되 괄호로 "진동센서"를 병기해 두 검색어 모두 커버, "전체 라인업"으로 카탈로그성 페이지임을 명시해 기존 원리가이드 페이지와 제목 충돌 방지). 데이터 소스: 오래된 2012 카탈로그 PDF(`pdftotext -layout`로 텍스트 추출)에 있는 모델(KS56·KS57·KS76C·KS77C·KS78C·KS90·KS901B·KS91B/C·KS93·KS94B/L·KS95B·KB12VD·KS48C·KS813B·KS823B·KS943B/L·KS74C·KF24)은 카탈로그 수치를 우선 사용하고, 카탈로그에 없는 최신 모델(KS84B·KS85·KS96B·KS97B·KS98B·KS903B·KS963B·KS973)은 mmf.de 개별 제품 상세페이지를 `mcp__workspace__web_fetch`로 직접 조회해 실제 사양 확보(구형 카탈로그의 "B" 접미사 일부가 현재는 "C"로 개명된 것도 확인, 예: KS94B10→현재 페이지엔 KS94C10, KS91B→KS91C). 6개 공식 카테고리(범용/소형/고감도/3축/산업용/4-20mA 전류루프)로 섹션 구성, 포스 트랜스듀서(KF24)는 별도 그룹으로 추가. 사용자의 명시적 지침대로 모델명 뒷자리 감도 접미사(10/100/500)만 다른 형제 모델은 외관·사진이 동일하므로 카드 1개에 이미지 1장만 삽입하고 스펙 행에 감도별 수치를 병기(예: "10 / 100 mV/g" / "±600 g / ±60 g" 형태)하는 방식으로 처리 — 총 29개 제품 카드(범용 7 · 소형 8 · 고감도 2 · 3축 7 · 산업용 3 · 4-20mA 및 포스 2) 생성, 로컬 이미지 29장 전부 실제 존재 확인 및 매핑 완료. 전 모델 사양 비교표(28행), 적용분야 카드 8개(회전기계진단/건물모니터링/모달해석/고온측정/산업용상시감시/텔레메트리/OEM내장형/동적힘측정), JSON-LD `TechArticle`+`FAQPage`(6문항, 화면 `<details>` 6개와 동기화) 작성. 헤더/모바일서브내비/모바일메뉴/푸터는 `pressure-sensor.html` 구조를 그대로 재사용(그 페이지에 별도의 "모바일 하단 탭바" 마크업이 없는 것을 확인 — 과거 Task #17/#18의 탭바는 `.mobile-subnav` 가로 스크롤 방식으로 구현되어 이미 헤더에 포함되어 있음, 별도 탭바 불필요). CSS는 `.mmf-` 프리픽스로 신규 정의(`.mmf-product-grid/-card/-img/-badge/-spec-list`, `.mmf-app-grid/-card/-icon`, `.mmf-output-table`) — 기존 `.ps-*` 패턴을 그대로 이식. 검증: div 184/184 균형, `</html>` 정상 종료, JSON-LD FAQ 6문항/화면 `<details>` 6개 일치, 제품카드 29개, 적용분야카드 8개, 비교표 28행, 이미지 참조 29개 전부 디스크 파일 존재 확인 완료. sitemap.xml `<url>` 신규 등록, `resources/index.html`에 진동측정 카테고리 카드 추가(vibration-sensor.html 카드 바로 다음, vm100.html 카드 앞) 완료 — 커밋 필요 (`resources/mmf-accelerometer.html`, `assets/images/MMF Vibration sensor/` 폴더, `sitemap.xml`, `resources/index.html` 전부 포함해서 커밋해야 함)
- resources/mmf-accelerometer.html 이미지 15장 크롭 확대 ✅ (2026-07-25, 사용자가 "다른 센서만큼 이미지가 작다"고 2차례에 걸쳐 지적한 15개 모델의 원본 사진을 Python(PIL+numpy)으로 배경색 대비 컨텐츠 바운딩박스를 검출해 확인한 결과, 제품 자체가 800x800 캔버스의 5~24%만 차지하고 나머지가 흰 여백이라 `.mmf-product-img`(150px 고정 높이 + object-fit:contain) 프레임 안에서 다른 카드(40~62% 채움) 대비 훨씬 작게 렌더링되는 것을 확인. 1차(11장): ks91c·ks93·ks94b_10·ks94l·ks95b_10·ks96_10·ks97_10·ks98_10_clip·ks943l·ks963_10·ks973_10_oben_seite. 2차(4장): kf24·ks943b_10·ks90_pins·ks901b_10. 각 원본은 보존한 채 컨텐츠 바운딩박스 기준 여백 22% 마진만 남기고 크롭한 `-crop.png` 파일을 신규 생성(예: `ks91c-crop.png`)해 `assets/images/MMF Vibration sensor/`에 추가, HTML의 `src` 15곳을 전부 크롭본으로 교체(sed 일괄 치환). 크롭 후 채움 비율 대부분 42~48%로 정상화(단 ks90_pins·ks901b_10은 세로로 긴 OEM 핀타입 센서 형태상 33~40%가 자연스러운 최대치). 검증: div 184/184 균형, `</html>` 정상 종료, 이미지 참조 29개 전부 디스크 존재 확인 — 커밋 필요 (`assets/images/MMF Vibration sensor/`에 신규 crop 파일 15장 추가되었으므로 폴더 통째로 재커밋 필요, `resources/mmf-accelerometer.html`도 함께)
- resources/mmf-accelerometer.html 타이틀 단순화 ✅ (2026-07-25, 사용자가 "기술자료 생성할 때 완전 가이드 이런 문구는 빼줘"라고 향후 신규 페이지 전반에 적용될 지침을 주면서, 이 페이지 타이틀도 "MMF 가속도센서 (진동센서)"로 바꿔달라고 요청 — 상단에 "⭐ 2026-07-25 지침" 섹션으로 향후 신규 기술자료 페이지 타이틀에 "완전 가이드"/"전체 라인업" 등 상투적 문구 금지를 명문화. 이 페이지의 `<title>`("MMF 가속도센서(진동센서) 전체 라인업 — 모델별 사양 가이드 | 씨앤디테크"→"MMF 가속도센서 (진동센서) | 씨앤디테크"), `og:title`(동일하게 단순화), JSON-LD `headline`("MMF 가속도센서 (진동센서)"), `<h1>`("MMF 가속도센서<br>(진동센서) 완전 가이드"→"MMF 가속도센서<br>(진동센서)"), `resources/index.html` 카드 `<h2>`("MMF 가속도센서(진동센서) 전체 라인업"→"MMF 가속도센서 (진동센서)") 5곳 전부 사용자가 요청한 정확한 표기(괄호 앞 공백 포함)로 통일. meta description/keywords/FAQ 본문 텍스트는 타이틀이 아니므로 유지. 검증: div 184/184 균형, `</html>` 정상 종료, JSON-LD 파싱 성공(headline 확인)/FAQ 6문항/화면 `<details>` 6개 일치 — 커밋 필요 (`resources/mmf-accelerometer.html`, `resources/index.html`, `CLAUDE.md`)
- resources/pressure-sensor.html "제품 라인업" 섹션 소제목 수정 ✅ (2026-07-25, 사용자가 "제품 라인업 — bdsensors.de 공식 4대 압력 제품군" 문구에서 외부 도메인명 노출을 지적 — "BD SENSORS 제품 라인업"으로 단순화(외부 도메인 언급 제거, 브랜드명만 유지). 검증: div 133/133 균형, `</html>` 정상 종료 — 커밋 필요
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
- (2026-07-26 정정) field-service.html은 2026-07-13에 실제 콘텐츠 작성 완료됨(noindex 제거, resources/index.html 카드·sitemap.xml 등록 전부 완료). 아래 스텁 목록에서 제거.
- resources/sensors.html — 유일하게 남은 스텁. "// COMING SOON" 상태, noindex 유지 중, resources/index.html·sitemap.xml에서 의도적으로 제외됨.
  → sensors.html: 센서 공급 (로드셀·토크·압력·변위, HBM·MMF·BD Sensors)
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
   - ⭐ meta description은 **160자 이내** (검색결과 스니펫 잘림 방지, 2026-07-26 네이버 SEO 점검 후 추가) — og:description은 이보다 더 짧게(120자 내외) 요약해도 무방
4. 이미지 파일명·alt 텍스트는 영문 키워드로 (예: hbm-mx1615b-strain-gauge-setup.webp) — 사진 운영 규칙 섹션 참고
5. **sitemap.xml에 `<url>` 블록 자동 추가** (loc, lastmod=작업일, changefreq=monthly, priority=0.7) — 사용자가 요청하지 않아도 항상 추가
6. CLAUDE.md "완료된 작업 전체" 목록에 로그 한 줄 추가
7. ⭐ **FAQ 섹션 필수 포함** — `<details class="faq-item">` 패턴(global style.css 활용), 최소 5개 항목, CTA 섹션(문의하기 버튼) 앞에 삽입 (2026-07-05 추가)
   - 이미 FAQPage JSON-LD schema가 있어도 UI 섹션이 없으면 별도로 삽입
   - FAQ 없이 페이지를 만들면 안 됨 — 검색 노출·AI 검색 대응에 필수
8. ⭐ **CTA(문의하기) 섹션 필수 포함** — 페이지 최하단, FAQ 다음에 배치. 연락처(031-680-1225, wgjeon@cndtec.co.kr) 또는 contact.html 링크 버튼 포함 (2026-07-05 추가)
9. ⭐ **rss.xml 재생성** — 신규 기술자료 페이지의 title(사이트명 접미사 제거)/link/pubDate(작업일, sitemap lastmod와 동일)/description(meta description)을 최신 항목으로 맨 위에 추가. 최근 25~37개 항목만 유지해도 무방(과거 항목 오래되면 정리 가능). (2026-07-27 추가 — 네이버 서치어드바이저 RSS 제출용으로 최초 생성)

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
- ⭐ **수정할 부분을 발견하면 사용자에게 물어보지 말고 바로 수정할 것** — 자잘한 개선/버그/SEO 이슈 등은 확인 질문 없이 바로 고치고, 완료 후 무엇을 왜 고쳤는지만 보고 (2026-07-26 사용자 지시). 단, 범위가 크게 모호하거나 완전히 새로운 방향 전환이 필요한 경우에만 예외적으로 확인.
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

⭐ 2026-07-26 완료: residual-stress.html 대표 이미지(og:image/스키마) 교체
- 네이버 검색결과 썸네일이 로고 대신 본문의 프로그램 UI 스크린샷(mts3000-system.jpg)으로 나오는 문제 확인.
  → 원인: og:image가 로고(cnd-logo-400.png)뿐이고 JSON-LD에 image 필드가 없어 네이버가 자체적으로 본문 이미지를 골라옴.
- 사용자가 제공한 현장 홀드릴링 프로브 설치 사진을 assets/images/residual-stress/hole-drilling-probe-field.jpg로 저장(578×745, JPEG).
- og:image, og:image:width/height/alt, JSON-LD TechArticle "image" 필드에 반영. 본문 "시스템 구성 다이어그램" 섹션 최상단에도 동일 사진 카드로 삽입.
- 검증: div 밸런스 93/93, JSON-LD 파싱 정상, FAQ 6/6 일치.
- 참고: 대표 이미지 지정은 og:image + 스키마 image 필드로 가능하나, 실제 검색결과 썸네일 반영은 재크롤링 후이므로 네이버 서치어드바이저에서 수집요청 시 더 빠르게 반영됨.

⭐ 2026-07-26 완료: 네이버 SEO 가이드 점검 및 사소한 이슈 수정
- 네이버 서치어드바이저 SEO 가이드(자바스크립트 최적화/URL/색인효율/링크) 대비 전체 사이트 점검 실시.
- 통과 확인: robots.txt 전체 허용(JS/CSS 차단 없음), 해시뱅(#!) 없음, sitemap.xml 정상, title/description 중복·누락 없음(실 콘텐츠 페이지 기준), img alt 누락 0건, javascript:href·onClick 전용 링크 없음, 내부 디자인 미리보기 페이지는 이미 noindex 처리됨.
- 수정: contact.html 사이트 주소 링크 http→https 프로토콜 통일. meta description이 160자를 초과한 3개 페이지(press-load-monitoring.html 197→129자, ship-vibration-iso20283.html 202→126자, vibration-calibrator.html 173→119자) 재작성, 검색결과 스니펫 잘림 방지. vibration-calibrator.html에서 "완전 가이드" 필러 표현도 제거(표준 지침과 통일).
- 검증: 4개 파일 모두 div 밸런스 정상, </html> 종료 정상.

⭐ 2026-07-26 완료: Search Console 색인 문제 2건 진단/조치
1. field-service.html "NOINDEX 태그 제외" 보고 — 원인 확인: 2026-06-22 스텁이던 시절 noindex 추가됐다가, 2026-07-13 실제 콘텐츠 작성 시 이미 제거됨. 구글이 07-13 이전(07-05) 크롤링본을 기준으로 리포트해서 발생한 과거 데이터. 현재 파일엔 noindex 없음 — 코드 수정 불필요, 재크롤링만 기다리면 해소.
2. "사용자가 선택한 표준이 없는 중복 페이지" — index.html ↔ resources/index.html 각각 실제 URL: 사이트 내부 링크는 전부(211건) index.html/../index.html/resources/index.html 형태(파일 경로)를 쓰는데, canonical·og:url·sitemap.xml만 슬래시형(/, /resources/)으로 선언되어 있어 시그널 불일치 발생 → 구글이 canonical 힌트를 무시하고 자체 판단.
   조치: index.html, resources/index.html의 canonical·og:url·(resources는 JSON-LD CollectionPage url도) 전부 실제 링크 형태인 /index.html, /resources/index.html로 통일. sitemap.xml의 해당 두 <loc>도 동일하게 수정. Organization/WebSite JSON-LD의 url(사이트 정체성 식별자, 슬래시 없는 도메인 루트)은 별개 개념이라 변경하지 않음.
- 검증: div 밸런스 정상(index 88/88, resources/index 76/76), JSON-LD 파싱 정상.
- 참고: Search Console에서 두 URL 모두 "색인 생성 요청"으로 재크롤링 요청하면 반영이 더 빠름.

⭐ 2026-07-26 완료: 홈페이지 구글 검색/소셜 노출용 대표 커버 이미지 신규 제작
- 사이트 브랜드 팔레트(--charcoal #1F1D1B, --orange #F29400 등)와 Pretendard 폰트를 그대로 사용해 1200×630(OG 표준 비율 1.91:1) 커버 이미지 신규 제작. 파일 62KB로 용량도 최적화.
- 구성: 로고+"CND TECH · SINCE 2004", "씨앤디테크" 헤드라인, 한 줄 소개 문구, 취급 분야 키워드 5개(DAQ·데이터로거/스트레인게이지/잔류응력측정/진동·소음측정/토크·축력측정), 도메인.
- assets/images/cnd-og-cover.jpg로 저장. index.html og:image(+width/height/alt)를 기존 로고(400×400)에서 이 커버로 교체, WebSite JSON-LD에도 image 필드 추가.
- 검증: div 밸런스 88/88, JSON-LD 파싱 정상, 이미지 실제 사이즈 1200×630 확인.
- 참고: 다른 하위 페이지들도 og:image가 로고뿐인 경우가 있으면 이 커버를 재사용하거나 각 페이지 전용 이미지로 교체 검토 가능.

⭐ 2026-07-26 완료: 홈페이지 og:image 커버 이미지 교체 (사용자 제공 디자인으로 최종 확정)
- 직접 제작한 1차 커버(브랜드 팔레트 기반)를 사용자가 제공한 "회사소개 커버.png"(로고+태그라인+8개 측정분야 아이콘 그리드)로 교체.
- 원본 1983×793(비율 2.5:1)을 OG 표준 비율(1200×630, 1.91:1)에 맞추기 위해 내용을 자르지 않고 위아래 배경색(#F9F9F9, 원본 배경과 동일)으로 여백을 추가한 뒤 1200×630으로 리사이즈 — 로고/아이콘 잘림 없음.
- assets/images/cnd-og-cover.jpg 교체, index.html og:image:alt를 새 이미지 내용(잔류응력·스트레인게이지·PCB응력·축력볼트·토크·진동·압력·온도 측정+DAQ)에 맞게 수정.
- 검증: div 밸런스 88/88, JSON-LD 정상, 최종 이미지 1200×630 확인.

⭐ 2026-07-26 완료: "세 가지 핵심 사업 분야" 카드(.area-card) 호버 불일치 수정
- 원인: .area-card에만 별도로 존재하던 상단 3px 오렌지 바 슬라이드인 효과(::before, hover 시 scaleX(1))가 공용 .fx-spotlight:hover 링 효과와 겹쳐, 카드 위쪽 테두리만 유독 진하고 다른 변(좌/우/하단)과 불균일하게 보이는 문제였음. 색상 자체는 이미 7/25에 소프트닝했던 것과 동일.
- 조치: .area-card::before / .area-card:hover::before(상단 바 효과) 완전 제거. .area-card:hover의 transform도 -6px→-4px로 사이트 전역 표준값(다른 fx-spotlight 카드와 동일)에 맞춤. box-shadow는 어차피 .fx-spotlight:hover가 후순위 우선 적용되므로 중복 선언 제거.
- 결과: 데이터 계측/센서·트랜스듀서/특수 목적 측정 카드가 사이트의 다른 fx-spotlight 카드들과 완전히 동일한 호버 효과(연한 오렌지 1px 링 + 4px 리프트)를 갖게 됨.
- 검증: css/style.css 중괄호 밸런스 270/270 정상.

⭐ 2026-07-26 완료: 시맨틱 HTML(<main>) 사이트 전역 적용 + Organization 스키마에 ProfessionalService 타입 추가
- (제미나이 AI 진단 중 유일하게 타당했던 부분 반영) <header>~<footer> 사이 실제 콘텐츠를 <main> 태그로 감싸는 작업을 41개 HTML 파일에 자동 스크립트로 일괄 적용. 기존에 이미 <main style="...">이 있던 3개 파일(peening-residual-stress, rotor-balancing, welding-residual-stress)은 건너뜀. design-preview/design-font-preview(noindex 페이지)도 제외.
- 적용 규칙: </header> 이후 첫 <section 앞에 <main> 삽입, <footer> 앞에 </main> 삽입 (모바일 nav 오버레이는 <main> 밖에 위치해 시맨틱상 올바름).
- index.html Organization JSON-LD의 "@type"을 "Organization" → ["Organization","ProfessionalService"]로 확장, "areaServed":"KR" 추가.
- 검증: 전체 사이트 JSON-LD 66개 블록 전부 파싱 정상, div 밸런스 전 파일 유지, </html> 종료 정상, header→main→footer 순서 정상.
- 참고: 프레임/테이블 레이아웃, HTTPS 미비, 메타태그/JSON-LD 부재 등 제미나이가 지적한 다른 항목들은 실제 코드 확인 결과 사실이 아니었음(사용자에게 별도 설명함).

⭐ 2026-07-26 완료: resources/sensors.html 삭제 (사용하지 않는 고아 스텁 페이지)
- resources/index.html, products.html, sitemap.xml 등 사이트 어디에서도 링크되지 않는 완전한 고아 페이지였음. 내용도 "// COMING SOON" 안내문뿐(noindex 처리돼 있었음).
- 원래 다루려던 로드셀·토크·압력·변위 센서 공급 역할은 이미 pressure-sensor.html 등 개별 페이지와 products.html "센서·트랜스듀서" 카드로 대체되어 더 이상 필요 없음 → 파일 삭제, sitemap.xml의 관련 주석도 제거.
- 검증: sitemap.xml XML 파싱 정상, sensors 관련 언급 전체 제거 확인.

⭐ 2026-07-26 완료: 기술자료 라이브러리 필터 버튼 글자 크기 축소
- 이전(7/25)에 너무 작다고 키웠던 .res-filter-btn(18px)이 이번엔 본문 소개문(18px, 일반체)과 같은 크기인데 굵은체(600)라 시각적으로 더 커 보여서 축소 요청.
- 데스크톱 18px→15px, 모바일 15px→13px, padding도 비례 축소.
- 검증: div 밸런스 76/76 유지.

⭐ 2026-07-27 완료: GSC 검색 실적(성과) 시트 분석 — CTR 저하 원인 진단
- 사용자가 구글시트(Performance on Search)를 공유해 "노출은 괜찮은데 CTR이 낮다"고 문의. 최근 4주(6/27~7/24) 합계: 클릭 70 / 노출 3,063 / CTR 2.3% / 평균 순위 15.3위.
- 원인은 전체 평균이 아니라 페이지 2개(strain-gauge.html 노출939·22.9위, daq-system.html 노출701·12.4위)가 전체 노출의 54%를 차지하면서 순위가 낮아 CTR이 0.75~1%로 붕괴 → 전체 평균을 끌어내림. 반면 홈/pcb-stress.html/vm100.html처럼 5위 안팎인 페이지는 CTR 6~18%로 정상.
- 추가로 top10인데도 CTR 낮은 페이지(bolt-tension.html 7.1위·1.34%, what-is-residual-stress.html 8.6위·1.55%, vibration-sensor.html 9.9위·1.41%)는 title/meta 재작성 후보로 제안함(아직 실행 안 함, 사용자 요청 시 진행).

⭐ 2026-07-27 완료: 네이버 서치어드바이저 www 미등록 문제 발견 및 소유확인 태그 추가
- 사용자가 서치어드바이저에서 "콘텐츠 노출/클릭 정보 없음"을 확인 — 등록된 사이트가 `cndtec.co.kr`(www 없음, _redirects에서 www로 301 리다이렉트만 하는 껍데기 URL)이라, 실제 색인·트래픽이 발생하는 `www.cndtec.co.kr`과 다른 프로퍼티였음. GSC에서 겪었던 www/non-www 불일치와 동일한 유형의 문제.
- 사용자가 `www.cndtec.co.kr`을 새 사이트로 등록 후 발급받은 소유확인 코드(`ec5716642e5db1537997d486da27cf578712afe7`)를 index.html에 추가함. 기존 non-www용 코드(`f888270d5ec18fa94bd21f2b2045235a171a4616`)는 그대로 유지(두 개의 naver-site-verification 메타 태그 공존, 문제 없음).
- 검증: div 밸런스 88/88 유지, </html> 정상 종료.
- 남은 절차(사용자가 서치어드바이저에서 직접): www 사이트 소유확인 완료 → 요청>사이트맵 제출에 https://www.cndtec.co.kr/sitemap.xml 제출 → 리포트>콘텐츠 노출/클릭은 www 프로퍼티에서 확인.

⭐ 2026-07-27 완료: rss.xml 신규 생성 (기술자료 37건) + resources/index.html RSS 자동검색 링크 추가
- 서치어드바이저 "RSS 제출" 메뉴 문의 중, 사이트에 RSS 피드가 전혀 없었다는 것을 발견 — sitemap.xml의 lastmod + 각 기술자료 페이지의 title(사이트명 접미사 제거)/meta description을 Python 스크립트로 추출해 표준 RSS 2.0 포맷(`rss.xml`, 사이트 루트)으로 생성. lastmod 최신순(2026-07-25~2026-06-22) 37개 항목 전부 포함.
- resources/index.html `<head>`에 `<link rel="alternate" type="application/rss+xml" .../>` 자동검색 태그 추가.
- 검증: `xml.etree.ElementTree.parse('rss.xml')` 파싱 성공, item 37개 확인. resources/index.html div 76/76 유지, `</html>` 정상 종료.
- ⚠️ 위 체크리스트(9번) 반영: 앞으로 기술자료 신규 페이지 만들 때마다 rss.xml에도 항목 추가할 것 — 지금은 수동 스크립트 방식, 자동화 안 돼 있음.
- 남은 절차(사용자가 서치어드바이저에서 직접): RSS 제출 메뉴에 `https://www.cndtec.co.kr/rss.xml` 입력.

⭐ 2026-07-29 완료: 마이크로폰·소음계 기술자료 페이지 신규 생성 (resources/microphone-sound-level-meter.html)
- 사용자가 `assets/images/mircophone/`(폴더명 오타 그대로 사용 중, 이름 변경하지 않음) 폴더에 최근 납품한 정밀 측정 마이크로폰 실사진 7장을 업로드하고 마이크로폰·소음계 기술자료 요청. ⚠️ 아직 특정 브랜드와 정식 라이센스/총판 계약이 없는 상태(협력업체를 통해 공급 가능)라고 명시해, 페이지 전체를 브랜드 중립적으로 작성함(vibration-sensor.html과 동일한 "원리·선택" 패턴 — mmf-accelerometer.html 같은 브랜드 카탈로그 패턴은 사용하지 않음).
- 실사진 7장 중 6장 사용(흐릿한 그리드 클로즈업 1장은 품질 이슈로 제외): 붐스탠드 거치(레벨 내장), 스위블 클립 마운트 2조, 프리앰프 장착 모습, 보관 케이스+BNC 연장케이블(4채널용), 개별 캘리브레이션 인증서+캡슐(분극전압 0V·다이나믹레인지 136dB·기준주파수 250Hz — 실제 인증서 수치를 "공급 사례"로 인용, 브랜드명 노출 없음).
- 구성: 01 콘덴서 마이크로폰 원리(다이어프램·백플레이트·프리앰프, 폴라라이제이션 전압 개념) → 02 마이크로폰 종류(지향성: 자유음장/확산음장/압력형, 캡슐 크기 1"~1/8" 비교표, 출력방식: 전하출력형 vs IEPE) → 03 소음계 종류(Class 1/2, 적분형·주파수분석형·도시미터, A/C/Z 가중치) → 04 선정 시 유의사항 → 05 측정 방법(배치·거리·배경소음 보정) → 06 측정 시 유의사항(풍절음·반사면·온습도·케이블·거치·개체감도) → 07 실측 사진 → 08 DT9837 연동(dt9837-daq.html 스펙 참조해 정확성 확인 — 4채널 IEPE·USB버스파워·QuickDAQ dB SPL 환산). FAQ 6문항(JSON-LD·화면 `<details class="faq-item">` 전역 클래스 사용, 로컬 아코디언 CSS/JS 불필요).
- resources/index.html "소음·진동 측정"(vibration) 카테고리에 카드 추가(ship-vibration-iso20283.html 카드 다음). ⚠️ 최초 편집 시 기존 카드의 `<p>`/`<span>`을 잘못 잘라 새 카드에 붙이는 실수가 있었으나 즉시 발견해 재수정 — div 밸런스 78/78로 최종 확인.
- sitemap.xml `<url>` 추가, rss.xml 최상단에 신규 항목 추가(lastBuildDate 갱신).
- 검증: microphone-sound-level-meter.html div 129/129, `<details>` 6개/JSON-LD Question 6개 일치, `</html>` 정상 종료.
- 참고(미수정, 향후 정리 후보): vibration-sensor.html·dt9837-daq.html이 `var(--surface)`/`var(--bg-card)`를 쓰는데 이 두 변수는 css/style.css에 정의돼 있지 않아 배경이 항상 투명 처리되고 있음(테두리는 정상 표시되어 큰 문제로 안 보였던 듯). 이번 신규 페이지는 실제 정의된 `var(--white)`로 작성함. 기존 2개 파일은 이번엔 손대지 않음(11곳 산발적 수정이라 별도 작업으로 진행 권장).
- ⚠️ 이 작업 중 세션의 bash 툴이 7회 연속 타임아웃되어 완전히 응답 불가 상태였음(사용자에게 별도 보고함) — Read/Edit/Write/Grep/Glob 파일 도구는 정상 작동해 페이지 작성 자체는 문제없이 진행함.

⭐ 2026-07-29 완료: 마이크로폰 전용 라인아이콘 적용 + 다이어그램 이미지 4장 삽입
- 사용자가 `assets/images/LINE ICON 마이크로폰.svg`(붐스탠드 위 마이크로폰 라인아트, 오렌지 포인트) 업로드 → resources/index.html의 마이크로폰 카드 아이콘을 기존 재사용 아이콘(`LINE ICON 진동측정.png` + 인라인 SVG 폴백)에서 이 전용 SVG로 교체(다른 카드와 동일한 `onerror` 폴백 패턴 유지).
- `assets/images/mircophone/` 폴더에 사용자가 추가한 다이어그램/제품 렌더 이미지 4장을 `Read`로 직접 열어 파일명과 실제 내용 일치 확인 후 microphone-sound-level-meter.html 각 섹션에 배치:
  - `cndtech-condenser-microphone-principle.png`(콘덴서 마이크 단면도) → 01 원리 섹션, 카드그리드 다음
  - `cndtech-measurement-microphone-capsule-sizes.png`(1"~1/8" 캡슐 4종 비교) → 02 종류 섹션 ② 캡슐 직경 표 앞
  - `cndtech-class-1-sound-level-meter.png`(삼각대 거치 소음계) → 03 소음계 종류 섹션, Class 1/2 표 앞
  - `cndtech-iepe-microphone-daq-connection.png`(붐스탠드 마이크+BNC+4채널 DAQ 연결) → 08 DT9837 연동 섹션, 인트로 문단 다음
  - 4장 모두 기존 `.ms-img-wrap`(전체폭 + 캡션) 패턴 재사용, alt·캡션 텍스트는 실제 이미지 내용 확인 후 작성(추측 없음).
- 검증: microphone-sound-level-meter.html div 137/137(이미지 삽입으로 8개 증가, 균형 유지), `<details>` 6개/JSON-LD Question 6개 유지, `</html>` 정상 종료(579행). resources/index.html div 78/78 유지, `</html>` 정상 종료(562행).

⭐ 2026-07-29 완료: vibration-sensor.html 콘텐츠 오류 수정 + 종류·선정·측정방식 섹션 대폭 보완
- 사용자 지적: "피에조일렉트릭 가속도센서가 아니라 IEPE 가속도센서 아니야?" — 실제로는 오류라기보다 누락이었음. 기존 페이지는 "자가 발전 방식 — 외부 전원 불필요(전하 출력형)"를 장점으로 서술했는데, 이는 순수 전하출력형(Charge Output) 피에조 센서에만 해당되는 특성이고, 씨앤디테크가 DT9837 등 IEPE 입력 DAQ와 함께 실제로 공급하는 산업용 가속도센서는 대부분 IEPE(ICP®) 방식(정전류로 구동되는 내장 프리앰프 방식)이라 이 설명이 오해를 줄 수 있었음. 전하출력형/IEPE 구분을 명시적으로 추가해 수정.
- 사용자 요청대로 신규 섹션 3개 추가(기존 섹션 번호 01·02 유지, 이후 전부 재넘버링):
  - 03 신호 출력 방식 — 전하출력형 vs IEPE(ICP®) 비교표 + "전원 불필요" 표현은 전하출력형에만 해당된다는 참고 박스
  - 04 센서 종류 — 압전형/압저항형(Piezoresistive)/정전용량형(MEMS) 3종 비교표(DC응답·주파수범위·감도·내구성·용도)
  - 05 선정 가이드 — 측정 주파수범위·감도·신호출력방식·환경사양·축수·무게 6개 체크리스트
  - 07 측정 방식(신규, 06 장점 다음) — 축정렬·IEPE 파워/채널설정·샘플링레이트·시간영역(RMS/Peak)·주파수영역(FFT/옥타브밴드) 5단계 절차
- 기존 03 장점→06으로 이동하며 "자가 발전 방식 — 외부 전원 불필요(전하 출력형)" 문구를 "신호 방식 선택 가능 — 무전원 전하출력형 또는 표준 IEPE(ICP®) 정전류 구동"으로 교정하고, "IEPE 방식은 표준 BNC 케이블로 DAQ에 직결" 장점 추가. 기존 04·05·06(설치전준비·설치방법·성능비교)은 08·09·10으로 번호만 이동, 내용은 그대로 유지.
- 히어로 태그 "PIEZOELECTRIC · ICP · MOUNTING"→"PIEZOELECTRIC · IEPE(ICP®) · MOUNTING", H1 "원리·선택·설치 완전 가이드"→"원리·종류·선정·설치 가이드", 스탯 카드 2번째("PZT 세라믹")를 "IEPE(ICP®)"로 교체. title/meta description/keywords/OG/JSON-LD TechArticle 설명·키워드·dateModified(2026-07-29) 전부 동기화. resources/index.html 카드 배지·제목·설명도 동일하게 갱신.
- FAQ 2문항 추가(JSON-LD + 화면 `.vs-faq-item` 커스텀 아코디언 양쪽 동일 반영, 총 6→8개): "전하출력형과 IEPE(ICP®) 차이", "피에조형 외 가속도센서 종류".
- sitemap.xml lastmod 갱신(2026-07-29), rss.xml 기존 구항목(2026-06-24 pubDate) 제거 후 신규 항목으로 상단(마이크로폰 항목 다음)에 재삽입.
- 검증: vibration-sensor.html div 175/175, `.vs-faq-item` 8개/JSON-LD Question 8개 일치, `</html>` 정상 종료(865행), 섹션 태그 01~10 순번 누락·중복 없음 확인.
- 참고(미수정, 이전 세션에 로그됨): 이 파일은 여전히 `var(--surface)`를 광범위하게 사용 중(정의되지 않은 변수, 배경 투명 처리) — 이번 신규 섹션도 기존 파일과의 시각적 일관성을 위해 동일하게 `var(--surface)`를 사용함. 별도 정리 작업 필요.

⭐ 2026-07-29 완료: vibration-sensor.html — MMF(mmf.de) 이론자료 5개 페이지 반영 심화 보강
- 사용자가 mmf.de/en/theory-and-standards 5개 페이지(Introduction, Piezoelectric Principle, IEPE Standard, Accelerometer Characteristics, Instrumentation) URL을 제공, `mcp__workspace__web_fetch`로 각 페이지 본문 확인 후 반영. MMF(Metra)는 씨앤디테크가 실제 취급하는 브랜드(mmf-accelerometer.html 카탈로그 존재)라 원 제조사 공식 자료로서 신뢰도 높음.
- 01 측정파라미터: 가속도 크기 사례에 "스프린터 출발 4 m/s²", "재봉틀 바늘 60,000 m/s²", "경주용 자동차 60 m/s² 이상 실신" 추가(MMF 원문 수치 그대로 인용).
- 02 원리: 하한 주파수는 상한(공진주파수 기반)과 달리 프리앰프 방식(전압증폭기의 RC 시상수, 또는 IEPE 내장앰프 0.3Hz/3Hz)에 좌우된다는 설명 추가 — 기존에는 상한만 다루고 하한 결정 요인이 없었던 공백을 메움.
- 03 신호 출력 방식 대폭 보강: ① IEPE 상표명 목록(ICP®·CCLD·Isotron®·Deltatron®·Piezotron®) 추가 — 동일 원리의 다른 브랜드명이라는 점 명시. ② 비교표에 출력임피던스·자가진단 행 추가. ③ MMF 원문의 IEPE/전하출력 장단점 4개 항목(장점 2·단점 2)을 정확히 그대로 카드로 반영(기존에는 직접 작성한 요약이었으나 제조사 원문 구조로 교체). ④ 로우파워 IEPE 소개(배터리 장비용, 바이어스 4~8V·컴플라이언스 10~12V·정전류 0.1mA~, 최대 99% 절전). ⑤ ⚠주의 박스 추가— IEPE에 정전류 미조절 전압원 연결 또는 극성 반대연결 시 즉시 손상 경고, 바이어스전압 자가진단 기준표(2V/18V 임계값)로 단선·과부하 판정법 제공(현장 트러블슈팅에 실질적으로 유용).
- 04 센서 종류: 전자기유도형(Electrodynamic) 4번째 유형 추가(MMF 원문에 있었으나 기존 3종 비교표에는 누락) — 저주파 전용·대형·구형이라 현재는 압전형·MEMS로 대체되는 추세라고 설명.
- 05 선정가이드 항목4(환경사양): PZT 큐리온도(~320°C)와 IEPE 전자회로 한계(120°C)를 구분하고, 고온 환경엔 전하출력형+리모트 IEPE 컨버터 구성을 대안으로 제시. IP67/IP68 등급 의미 예시 추가.
- 검증: div 184/184, table 3/3, `.vs-faq-item` 8개/JSON-LD Question 8개 유지, `</html>` 정상 종료(890행).
- ⚠ MMF 원본 다이어그램(피에조효과·IEPE 회로도·주파수응답곡선 등)은 저작권상 그대로 복사하지 않음 — 대신 신규 제작이 필요한 이미지 목록을 사용자에게 별도 안내(자체 제작 또는 MMF 공식 대리점 자격으로 사용 허가 요청 필요).

⭐ 2026-07-29 완료: resources/vibration-evaluation-standards.html 신규 생성 — 진동 평가 기준·규격 완전 가이드
- 사용자 요청: mmf.de/en/theory-and-standards/standards/(수십 개 표준기구의 진동 관련 규격 총람)와 candj.tistory.com/99(씨앤디테크 자사 블로그, meta-by 태그로 자사 저작물 확인됨 — 저작권 문제 없음)를 참고해 "진동평가기준 규격" 기술자료 신규 페이지 제작.
- mmf.de/standards 페이지는 143,787자로 web_fetch 토큰 한도 초과 → 도구가 자동 저장한 로컬 .txt 파일을 Read로 3회 분할(130줄 단위) 읽어 전체 표 확보. ISO 10816/20816, ISO 2631(전신진동), ISO 5349(수부진동), ISO 4866, ISO 20283(선박), ISO 16063(캘리브레이션), DIN 4150 등 관련 규격 taxonomy 추출.
- 사전 중복 점검(Grep): vibration.html(ISO 10816/20816 Zone A~D 표 이미 상세 보유), building-vibration-monitoring.html(DIN 4150/BS 7385/ISO 4866 이미 상세 보유), ship-vibration-iso20283.html(ISO 20283 이미 보유) 확인 → 이 3개 페이지는 요약 + 링크만 하고 중복 서술 금지. 반대로 ISO 2631·ISO 5349(인체 진동)는 사이트 전체에 전무함을 확인 → 신규 페이지의 실질 신규 콘텐츠로 채택.
- 페이지 구성(신규, 글로벌 `<details class="faq-item">` FAQ 패턴 사용 — vibration-sensor.html의 구식 커스텀 아코디언 미사용): 01 진동평가 규격이 왜 필요한가(4대 분류 카드: 기계/정밀시설/인체/선박), 02 기계 진동(ISO10816→20816 요약+vibration.html 링크), 03 정밀시설 진동 — VC 곡선(candj.tistory.com/99 기반 VC-A~VC-E 전체 수치표: 4~8Hz 가속도(gal)/8~80Hz 변위(µm)/속도(µm/s), 1/3옥타브·비례대역폭(23%) 설명, VC≠건축물손상기준 구분+building-vibration-monitoring.html 링크), 04 인체 진동 — ISO 2631(전신)·ISO 5349(수부) 신규 서술, 05 선박 진동(ISO20283 요약+ship-vibration-iso20283.html 링크), 06 규격 선택 가이드(7개 체크리스트+관련기술자료 6개 링크 pill), FAQ 6문항(JSON-LD+화면 동일), CTA.
- TechArticle+FAQPage JSON-LD 작성(datePublished/dateModified 2026-07-29), 카드는 `var(--white)` 사용(레거시 `var(--surface)` 버그 재사용 안 함).
- 검증: div 100/100, table 1/1, `<details class="faq-item">` 6개/JSON-LD Question 6개 일치, `</html>` 정상 종료(488행).
- resources/index.html에 vibration 카테고리 신규 카드 추가(마이크로폰 카드 다음, DAQ 섹션 앞). sitemap.xml에 `<url>` 항목 추가(lastmod 2026-07-29). rss.xml 최상단에 신규 `<item>` 삽입.

⭐ 2026-07-29 완료: vibration-sensor.html 섹션 구조 대대적 재편(사용자 요청) — IEPE/피에조 분리 서술 + 08 설치전준비 섹션 삭제
- 사용자 요청: 기존 09개 섹션(원리·신호출력방식·센서종류·선정·장점·측정방식·설치전준비·설치방법·성능비교) 순서가 산만하다며, "IEPE 방식"과 "피에조(전하출력형) 방식"을 각각 장점 포함해서 독립 섹션으로 분리하고, "08 설치 전 준비 사항" 섹션은 이미지가 09 설치방법 섹션과 중복되고 내용도 안 맞아 전체 삭제 요청. AskUserQuestion으로 두 가지 애매한 지점 확인: (1) 새 순서에 없는 기존 "선정 가이드" 섹션 → 유지, 번호만 뒤로 이동. (2) 09 설치방법·10 성능비교 섹션 → 유지, 번호만 앞당김.
- 신규 섹션 순서(01~09, 총 9개 + FAQ + CTA): 01 측정파라미터(변경없음) → 02 센서종류(구 04, 이동만) → 03 IEPE 방식·장점(신규 — 구 03의 IEPE 카드+상표명+로우파워+자가진단 경고박스+IEPE 장단점을 독립 섹션으로 분리) → 04 피에조(전하출력형) 방식·원리(신규 — 구 02의 PZT/지진질량 원리+주파수응답 전체를 여기로 병합, 구 03의 전하출력 카드+전하출력 장단점 추가) → 05 IEPE vs 피에조 비교표(구 03의 비교표만 독립 섹션으로 분리) → 06 측정방식(구 07, 이동만) → 07 선정가이드(구 05, 뒤로 이동) → 08 설치방법(구 09, 번호만 앞당김) → 09 성능비교(구 10, 번호만 앞당김).
- 완전 삭제: 구 "06 ADVANTAGES"(피에조/IEPE 일반 장점 통합 목록 — 신규 03·04에 각각 장점이 흡수되어 중복이라 제거), 구 "08 INSTALLATION PREPARATION"(설치 전 준비사항 — 이미지가 신규 08 설치방법 섹션과 중복되고 텍스트도 안 맞아 사용자 요청대로 섹션 전체 삭제, 이미지 1장·5개 체크리스트 항목 모두 제거).
- FAQ(8개)와 JSON-LD는 내용 변경 없이 그대로 유지(설치 준비 관련 FAQ 항목은 일반 지식으로 남겨둠, 특정 섹션 1:1 종속 아님).
- 검증: div 165/165, table 3/3, `.vs-faq-item` 8개/JSON-LD Question 8개 일치, `</html>` 정상 종료(856행), 섹션 태그 01~09 순번 누락·중복 없음 확인.

⭐ 2026-07-29 완료: microphone-sound-level-meter.html — cndtech-iepe-microphone-daq-connection.png 이미지 교체 반영(파일명 동일)
- 사용자가 08 DT9837 연동 섹션의 이미지 파일을 새 이미지로 교체(파일명 동일하게 유지). Read로 새 이미지 실제 내용 확인 — 붐스탠드가 아닌 탁상형(desk) 마이크 스탠드에 거치된 측정용 마이크로폰이 케이블로 4채널 DAQ(회로도 프린트된 박스, BNC 4개)에 연결된 구성으로 변경됨.
- alt·캡션 텍스트 중 "붐 스탠드" → "탁상형 스탠드"로 교정, "BNC 케이블로" → "케이블로"(케이블 타입이 이미지상 명확히 BNC로 식별되지 않아 일반화). 나머지 설명(IEPE 프리폴라라이즈드 마이크로폰, 4채널 DAQ 채널1 직결)은 새 이미지와도 부합해 유지.

⭐ 2026-07-29 완료: vibration-evaluation-standards.html 제목에서 "완전 가이드" 제거 — 엔지니어 실검색어 기반 타이틀로 교체
- 사용자가 "완전 가이드" 같은 마케팅성 수식어를 붙이지 말라고 요청, 엔지니어들이 실제로 검색·노출되는 자연스러운 제목을 요청.
- WebSearch로 국내외 진동 평가 기준 관련 검색결과 확인 — KSFM "펌프의 진동평가 기준", INCOSYS "진동 평가 기준에 대한 규격", 대일시스템 "진동 기준" 등 모두 "완전 가이드" 없이 짧고 직접적인 표현("진동평가 기준", "진동 규격", "진동 판정기준")을 사용함을 확인.
- AskUserQuestion으로 3개 후보(진동 평가 기준·규격 / 진동평가 국제기준·규격(사용자 원문 그대로) / 진동 판정기준·규격) 제시 → "진동 평가 기준·규격"(추천안) 선택됨.
- title/H1/JSON-LD headline/og:title/resources 카드 h2/rss.xml item title에서 "완전 가이드" 문구 전부 제거, "진동 평가 기준·규격 — ISO 10816·VC 곡선·ISO 2631·ISO 20283" 형태로 통일(meta description·og:description·JSON-LD description·키워드는 이미 "가이드" 없이 작성돼 있어 변경 불필요).
- 검증: div 100/100 유지. 사이트 내 다른 "완전 가이드" 표기 페이지(볼트 축력·토크 측정·휴대용 진동측정기·DAQ 등)는 이번 요청 범위 밖이라 그대로 둠.

⭐ 2026-07-29 완료: vibration-evaluation-standards.html — 03 정밀시설 진동(VC 곡선) 섹션에 이미지 삽입
- 사용자가 `assets/images/Vibration standard/VC vibration measurement.png` 신규 업로드. Read로 실제 내용 확인 — 액세스 플로어(정밀시설 이중바닥)에 스터드 마운팅된 가속도센서가 진동을 감지(오렌지 물결 아이콘)해 케이블로 4채널 DAQ에 연결되고, 배경에 정밀 계측장비(현미경형 광학기기)가 놓인 구성으로, VC 곡선 섹션의 "정밀시설 바닥 진동 측정" 개념과 정확히 일치.
- 03 섹션(정밀시설 진동 평가 — VC 곡선) 인트로 문단 다음, VC 특성 4항목 리스트 앞에 이미지+캡션 삽입.
- 검증: div 101/101(이미지 삽입으로 1개 증가, 균형 유지).

⭐ 2026-07-29 완료: vibration-sensor.html 이미지 재배치 + 신규 SVG 2장 삽입 + 06 측정방식 섹션 삭제
- 사용자가 `vibration sensor` 폴더에 `IEPE DIAGRAM.svg`(압전소자·내장프리앰프·동축케이블·정전류원·커플링커패시터·계측기입력 회로도), `IEPE Dynamic range.svg`(바이어스전압·정상출력범위·양/음과부하 다이어그램), `피에조센서.png`(스터드형 압전 가속도계 실물 사진, KF24 모델) 3장을 신규 업로드. Read로 실제 내용 확인 후 반영.
- 03 IEPE TYPE 섹션: 기존 04(피에조) 섹션에 있던 3장(가속도센서.png·피에조 일렉트릭 센서의 원리 그림01.png·압전 가속도계의 원리.png)을 이 섹션으로 이동(3열 그리드, alt 텍스트 "피에조일렉트릭"→"IEPE"로 문맥 수정) — 인트로 카드 다음에 배치. 이어서 IEPE DIAGRAM.svg를 전체폭으로 삽입. ⚠주의 박스 다음에는 IEPE Dynamic range.svg를 삽입(바이어스전압 자가진단 설명과 시각적으로 직결).
- 04 PIEZOELECTRIC TYPE 섹션: vs-principle-grid 우측 3장 이미지를 전부 제거하고 피에조센서.png 1장으로 교체(실물 사진으로 단순화).
- 04 섹션 주파수응답 이미지 행에서 `그래프.png` 제거 요청 반영 — 기존 2열 그리드(가속도 응답곡선.png + 그래프.png)를 가속도 응답곡선.png 단일 이미지로 축소(중앙 정렬, max-width 520px).
- "06 · MEASUREMENT METHOD"(가속도센서 측정 방식 — DAQ 연동부터 분석까지) 섹션 전체 삭제 요청 반영 — 5단계 절차 리스트 전부 제거. 이후 섹션 번호 재정렬: 07 선정가이드→06, 08 설치방법→07, 09 성능비교→08(총 8개 섹션).
- 검증: div 161/161, `.vs-faq-item` 8개/JSON-LD Question 8개 유지, `</html>` 정상 종료(855행), 섹션 태그 01~08 순번 누락·중복 없음 확인, "그래프.png"(단독 파일) 참조 완전 제거 확인(성능비교 섹션의 "...비교 그래프.png"는 별개 파일이라 유지).

⭐ 2026-07-29 완료: vibration-sensor.html — 피에조 공식 다이어그램 2장을 IEPE→피에조 섹션으로 재이동
- 사용자가 라이브 사이트 스크린샷으로 두 이미지(피에조 디스크 전하·전압 공식 q=d33F, u=(d33d/e33A)F / 지진질량·피에조세라믹 구조와 Bqa=q/a·Bua=u/a 공식)를 지목하며 "피에조 센서쪽으로 이동"을 요청. 두 이미지 모두 IEPE 고유 특성이 아니라 압전 소자의 일반 원리 공식이라 04(피에조/전하출력형) 섹션 텍스트 설명과 내용상 더 맞음.
- 03 IEPE TYPE 섹션: 3열 이미지 그리드에서 두 공식 다이어그램(피에조 일렉트릭 센서의 원리 그림01.png, 압전 가속도계의 원리.png) 제거, 남은 가속도센서.png(MMF KS943 3축 제품 사진) 1장을 중앙정렬 단일 이미지로 재구성.
- 04 PIEZOELECTRIC TYPE 섹션: vs-principle-grid 우측에 있던 피에조센서.png(제품 사진) 아래에 두 공식 다이어그램을 추가 배치 — "감지 요소 구성"(PZT 세라믹·지진 질량) 텍스트 설명과 정확히 매칭.
- 검증: div 161/161(제거 2 + 추가 2로 총량 동일), `</html>` 정상 종료(855행).
