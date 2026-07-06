# ============================================================
# 씨앤디테크 블로그 이미지 다운로드 스크립트
# 실행 방법: PowerShell에서 이 스크립트가 있는 폴더로 이동 후
#   .\download-blog-images.ps1
# 또는 탐색기에서 우클릭 → PowerShell로 실행
# expires=1785509999 (2026-07-30까지 유효)
# ============================================================

$base = "C:\Users\wgjeo\클로이드 폴더\cndtec-website\assets\images"

# 폴더 생성
New-Item -ItemType Directory -Force -Path "$base\peening" | Out-Null
New-Item -ItemType Directory -Force -Path "$base\welding" | Out-Null

Write-Host "=== Peening 이미지 다운로드 (blog /117) ===" -ForegroundColor Cyan

$peeningImages = @(
    @{ url = "https://blog.kakaocdn.net/dna/bcDIFQ/btsQGelXxOw/AAAAAAAAAAAAAAAAAAAAALAG3POatHQ9LYcfY8kix9AK4UyEK_C_UqyjP_7VkDGb/img.png?credential=yqXZFxpELC7KVnFOS48ylbz2pIh7yKj8&expires=1785509999&allow_ip=&allow_referer=&signature=gMJfhhjN%2BCTfQolxSIwhqe3O6d4%3D"; file = "peening-header.png" },
    @{ url = "https://blog.kakaocdn.net/dna/bj4MYA/btsQFqN0NM6/AAAAAAAAAAAAAAAAAAAAANNnIlqXjIjT6r6Gc85Mxg0aQxsGoKTeMITvzHL-SeR0/img.jpg?credential=yqXZFxpELC7KVnFOS48ylbz2pIh7yKj8&expires=1785509999&allow_ip=&allow_referer=&signature=On%2ByImS1D%2FmcLTdOEXejn2B1LZ0%3D"; file = "peening-sg-bonding.jpg" },
    @{ url = "https://blog.kakaocdn.net/dna/DJSlJ/btsQCTqm6VZ/AAAAAAAAAAAAAAAAAAAAALBLXbYjJoviGAWFlgwt62-jzmpuh8BngJ0rghNLzQNC/img.jpg?credential=yqXZFxpELC7KVnFOS48ylbz2pIh7yKj8&expires=1785509999&allow_ip=&allow_referer=&signature=wGQEpnxIbmDU4%2BcVs0BeZ0t2a7Y%3D"; file = "peening-hole-drilling.jpg" },
    @{ url = "https://blog.kakaocdn.net/dna/6HWKT/btsQFP7M7e1/AAAAAAAAAAAAAAAAAAAAAOUq4PLAmIZyS2ZihOCqR6GoGO98GyEAvW6xtZ8En6tc/img.jpg?credential=yqXZFxpELC7KVnFOS48ylbz2pIh7yKj8&expires=1785509999&allow_ip=&allow_referer=&signature=mcN3r9iKxVIOk18t6VIJpWJ1Axk%3D"; file = "peening-eval-1.jpg" },
    @{ url = "https://blog.kakaocdn.net/dna/5Ac0e/btsQGFKhzxy/AAAAAAAAAAAAAAAAAAAAAPQdDW-b11ZtL2J61SiveMT8q6oIwtpTOzMBqCbsMsdu/img.jpg?credential=yqXZFxpELC7KVnFOS48ylbz2pIh7yKj8&expires=1785509999&allow_ip=&allow_referer=&signature=N1SNZEnBpRNFp2jLzclijh%2FQlms%3D"; file = "peening-eval-2.jpg" }
)

foreach ($img in $peeningImages) {
    $dest = "$base\peening\$($img.file)"
    try {
        Invoke-WebRequest -Uri $img.url -OutFile $dest -UseBasicParsing -TimeoutSec 30
        $size = (Get-Item $dest).Length
        Write-Host "  OK  $($img.file) ($size bytes)" -ForegroundColor Green
    } catch {
        Write-Host "  FAIL $($img.file): $_" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "=== Welding 이미지 다운로드 (blog /108 + /52) ===" -ForegroundColor Cyan

$weldingImages = @(
    @{ url = "https://blog.kakaocdn.net/dna/NPgMm/btsKkZJjQoy/AAAAAAAAAAAAAAAAAAAAAHj9D4OoWS0BpqqshLwgu6vdO0WqTODb2c6DROKfQ9a_/img.png?credential=yqXZFxpELC7KVnFOS48ylbz2pIh7yKj8&expires=1785509999&allow_ip=&allow_referer=&signature=X4MlQ%2F20ym4UpfG5xB88HmxqgR0%3D"; file = "welding-setup.png" },
    @{ url = "https://blog.kakaocdn.net/dna/bjE145/btsKkoQcPTX/AAAAAAAAAAAAAAAAAAAAAF8Gt236i0vzPFAeeXI7L9NMc4dQW1XwVe-KrBY2LLTo/img.jpg?credential=yqXZFxpELC7KVnFOS48ylbz2pIh7yKj8&expires=1785509999&allow_ip=&allow_referer=&signature=0gHhglTVf4X4g3npfYXCUOdNtHA%3D"; file = "welding-specimen.jpg" },
    @{ url = "https://blog.kakaocdn.net/dna/bjkj4S/btsKl8Fh1t1/AAAAAAAAAAAAAAAAAAAAAKO8yB9GG5nGmHUHTzk7LQvfd2_S5JV6VTVNeBhr18j-/img.jpg?credential=yqXZFxpELC7KVnFOS48ylbz2pIh7yKj8&expires=1785509999&allow_ip=&allow_referer=&signature=x7QC2i2vnk15%2FHWlRyc%2BQo5XbtM%3D"; file = "welding-sg-bonding.jpg" },
    @{ url = "https://blog.kakaocdn.net/dna/Jqtb3/btsKl1TG1Ix/AAAAAAAAAAAAAAAAAAAAAL8x_eN_M2X31oB3Tpl45OFhMGbQgA-F_7aZEECnos8z/img.jpg?credential=yqXZFxpELC7KVnFOS48ylbz2pIh7yKj8&expires=1785509999&allow_ip=&allow_referer=&signature=wwo8eKFOVBay5%2F0Swx8orykyHfs%3D"; file = "welding-measurement-1.jpg" },
    @{ url = "https://blog.kakaocdn.net/dna/bxHhMH/btsKlzKdS2Y/AAAAAAAAAAAAAAAAAAAAAAIbF-vsbCJFuL99MUfYqnLwmVrLtZTjhZ6wmVkl8qKH/img.jpg?credential=yqXZFxpELC7KVnFOS48ylbz2pIh7yKj8&expires=1785509999&allow_ip=&allow_referer=&signature=kmLvNWUzDLjsIavfAMbTroQz2xc%3D"; file = "welding-measurement-2.jpg" },
    @{ url = "https://blog.kakaocdn.net/dna/bUPjr2/btsKkq8j2jI/AAAAAAAAAAAAAAAAAAAAAKpzfzI8uXBAOpWN8ib699d3_5-eoII49z8GCUVPJ5xK/img.jpg?credential=yqXZFxpELC7KVnFOS48ylbz2pIh7yKj8&expires=1785509999&allow_ip=&allow_referer=&signature=jtjo7yA3kopPSpkZlF0mOVd60v0%3D"; file = "welding-measurement-3.jpg" },
    @{ url = "https://blog.kakaocdn.net/dna/en7o7K/btsuOhSTpNK/AAAAAAAAAAAAAAAAAAAAAEnX_v-gCxyd-r4JaVQh-ZANvqNt7qsx90XLshxmTTGb/img.png?credential=yqXZFxpELC7KVnFOS48ylbz2pIh7yKj8&expires=1785509999&allow_ip=&allow_referer=&signature=rZPMQ3gfSv5cehilk039rjM0ovM%3D"; file = "welding-cause-diagram.png" },
    @{ url = "https://blog.kakaocdn.net/dna/bv92Jm/btsuPNYl3oz/AAAAAAAAAAAAAAAAAAAAAHcJtMTw0tajPbc9YlYrKUcDnP1dX-zO954JMr_khjRU/img.png?credential=yqXZFxpELC7KVnFOS48ylbz2pIh7yKj8&expires=1785509999&allow_ip=&allow_referer=&signature=STjMoJWNLBp52L8eNhB%2FlCX4GZw%3D"; file = "welding-mechanism.png" },
    @{ url = "https://blog.kakaocdn.net/dna/AhtP2/btsuQQNYLfU/AAAAAAAAAAAAAAAAAAAAAHrV_mQ7HBXOSEk3799SIl4lTXTIyBofomU_WjaocUOc/img.jpg?credential=yqXZFxpELC7KVnFOS48ylbz2pIh7yKj8&expires=1785509999&allow_ip=&allow_referer=&signature=lYFCdy%2FXjROTCXrEwoy0Va4p91s%3D"; file = "welding-field-1.jpg" },
    @{ url = "https://blog.kakaocdn.net/dna/bgdd33/btsuQUiwb4U/AAAAAAAAAAAAAAAAAAAAAKnTHdjcmmobfbYcUAB4I5nRznFHw9ddYXL9DR8gdHig/img.jpg?credential=yqXZFxpELC7KVnFOS48ylbz2pIh7yKj8&expires=1785509999&allow_ip=&allow_referer=&signature=yDQCz0P4EBrh63Np5QDyQ0tNpg0%3D"; file = "welding-field-2.jpg" }
)

foreach ($img in $weldingImages) {
    $dest = "$base\welding\$($img.file)"
    try {
        Invoke-WebRequest -Uri $img.url -OutFile $dest -UseBasicParsing -TimeoutSec 30
        $size = (Get-Item $dest).Length
        Write-Host "  OK  $($img.file) ($size bytes)" -ForegroundColor Green
    } catch {
        Write-Host "  FAIL $($img.file): $_" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "=== 완료 ===" -ForegroundColor Yellow
Write-Host "peening\ 폴더: $(Get-ChildItem "$base\peening" | Measure-Object).Count 개"
Write-Host "welding\ 폴더: $(Get-ChildItem "$base\welding" | Measure-Object).Count 개"
