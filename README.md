[README (1).md](https://github.com/user-attachments/files/21569650/README.1.md)
# 📱 PoketmonDex - RxSwift 기반 포켓몬 도감 앱

RxSwift와 MVVM 아키텍처로 구현된 iOS 포켓몬 도감 앱입니다.  
포켓몬의 이름, 타입, 키, 몸무게를 [PokeAPI](https://pokeapi.co/)에서 불러오며, 사용자는 검색을 통해 포켓몬을 탐색할 수 있습니다.

---

## 🛠 기술 스택

| 분류        | 사용 기술              |
|-------------|------------------------|
| Language    | Swift                  |
| UI          | UIKit, SnapKit         |
| Architecture| MVVM                   |
| Reactive    | RxSwift, RxCocoa       |
| Network     | URLSession + RxSwift   |
| Caching     | UserDefaults (JSON)    |
| ImageLoader | Kingfisher             |

---

## 📦 주요 기능

### ✅ 도감 목록
- 모든 포켓몬을 **도감번호 순서대로 3열 Grid** 형태로 표시
- `UICollectionView + FlowLayout`을 사용

### ✅ Rx 기반 MVVM 구조
- ViewModel은 Rx로 데이터를 바인딩
- View는 RxCocoa를 통해 UI 업데이트

### ✅ 상세 화면
- 포켓몬 클릭 시 **상세 뷰**로 이동
- **이름, 타입, 키, 몸무게** 정보 표시
- 타입/이름은 모두 한글로 번역 (custom translator 사용)

### ✅ 검색 기능
- 포켓몬 **한글 이름** 또는 **도감번호**로 검색 가능
- 영어 검색은 제한 (의도적으로 제외)
- RxCocoa를 이용한 `UISearchBar` 실시간 필터링

### ✅ 로컬 캐싱
- 앱 실행 시 모든 포켓몬 데이터를 한번에 불러오고
- 이후 실행 시에는 `UserDefaults`에 저장된 JSON을 활용

---

## 🚧 예정된 기능

| 기능                              | 상태 |
|-----------------------------------|------|
| 아직 로딩되지 않은 포켓몬도 검색 | ❌ 구현 예정 |
| 타입별 필터링                     | ⏳ 고려 중 |
| 앱 내 즐겨찾기 기능               | ⏳ 고려 중 |

---

## 🔧 설치 방법

1. 이 저장소를 클론합니다:
```bash
git clone https://github.com/yourusername/poketmondex.git
```

2. Xcode로 `.xcodeproj` 또는 `.xcworkspace` 파일을 열고 실행

---

## 📮 문의 및 제안
궁금한 점이나 피드백은 언제든지 Issue나 PR로 남겨주세요!
