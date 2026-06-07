@echo off
del /f "%~dp0.git\index.lock" 2>nul
echo Lock 파일 삭제 완료.
cd /d "%~dp0"
git add -A
git commit -m "히어로 섹션: 이미지 4개 삽입 + 기술자료 링크 + ripple 클릭 효과"
git push origin main
echo.
echo === 완료 ===
pause
