# 🏷️ Tech!Ting
> 세미나 및 행사 등록, 참석자 출결관리, 데이터 분석 등 실용적인 Mangement 앱

![Group 1923](https://github.com/onthelots/Tech-Ting/assets/107039500/aeddd913-03b7-440a-87aa-9fccfceffaea)

## 1. ADS 및 페르소나
### 1-1. ADS : 유저가 사용하는 앱에서 관리자가 동시에 서비스를 관리하는 것은 비 효율적이며, 문제발생 여지가 크다!
- 세미나 및 행사 등록, 참석자 출결관리, 데이터 분석 등 실용적인 Mangement 기능 제공

### 1-2. Persona
- 행사 당일, 참석자들의 명단을 관리하고 실시간으로 질문을 받고 싶은 주최측
- 세미나에서 강연하기 전, 본인의 커리큘럼이나 강의내용을 공유하고 싶은 강사

<br>

## 2. 앱 설치 및 실행 가이드
```
실행이 필요할 시 elinholic95icloud.com 또는 onthelots@naver.com을 통해 파일을 요청해주세요.
GoogleService-Info.plist
```
```
위 파일 없이 간단한 앱 설치만 필요하시다면 번들 아이디 셋팅은 아래와 같이 요청드립니다.
com.codelion.big-project-c-admin-ipados-JS
```

<br>


## 3. 개발환경
```
- iPad Pro(12.9-inches)에서 최적화됨
- 다크모드 미지원
- 가로화면 전용 지원
```

<br>


## 4. 주요기능
```
현황 탭 : 사용자는 앱을 통해 정확한 데이터 수치를 한 눈에 볼 수 있습니다.
세션 탭 : 사용자는 앱을 통해 앞으로 열릴 세미나를 등록, 수정, 삭제할 수 있습니다.
회원 탭 : 사용자는 앱을 통해 세미나를 신청한 인원을 관리할 수 있습니다.
```

<br>


## 5. 구현 동작
<img src="https://user-images.githubusercontent.com/114602459/210509207-63cbbd8b-18b7-4985-9c1e-a3542aeab6ad.mov" width="600">

- **이벤트 정보등록 및 수정/삭제**
    - 세미나 정보(Server DB 구조와 일치) 등록기능 구현
    - `PhotoUI` 프레임워크 및 `ImagePicker` 기능을 활용하여 UIImage로 변환 
    ➟ `Firebase Storage` 내 저장하는 로직을 구현함으로서 **소비자 앱에서도 활용**될 수 있도록 함

- **세미나 등록현황 및 분석 페이지**
    - 등록된 세미나의 정보를 시각화하기 위해 `Chart`, `Canvas` 기능을 활용, 구현함

- **참석자 등록을 위한 QR 인증 시스템 마련**
    - 세미나 참석확인을 위한 기능으로 `VisionKit` 프레임워크를 통해 카메라 접근을 실시함
    - 소비자 앱에서 로그인한 사용자의 정보를 담은 임의의 QR을 생성, Camera Scan을 통해 정보를 인식함

<br>

## 6. 데이터 구조 
```
📂 Model
📂 ViewModel
📂 View
```

## 7. 프로젝트 피드백
### 7-1. 긍정적인 부분
- **기초적인 데이터 처리기능인 CRUD를 모두 구현하고 활용**
   - ViewModels상에서 필요한 코드를 설정하는 과정에서 ServerDB와의 소통과정을 경험
- **다양한 유형의 Frameworks를 활용하게 된 좋은 기회**
   - `PhotoUI`, `VisonKit`, `Charts` 등 기성 앱에서도 자주 사용되는 기능을 활용
- **Git Convention을 활용함으로서 체계적인 협업을 실행함**
   - 다수의 프로젝트 구성원이 원활한 개발을 위한 규칙을 설정, 자주 발생하는 Git Issue를 감소시킴

### 7-2. 보완해야 할 점(+아쉬운 부분)
- **한정된 개발기간으로 인해 스프린트 단위의 개발이 아닌, 기능에 따른 팀/업무 분담**
   - 상대적으로 많은 개발인원이 투입됨에 따라, 앱의 큰 그림이 아닌 기능 디테일 측면에 몰입됨
   - 초기 기획이 틀어지거나, 전반적인 완성도 측면에서 View 혹은 기능별로 격차가 심함
- **다소** **불 친절한 UX/UI 디자인 구성으로 인해 사용자의 불편 우려**
   - 관리자 앱의 특성에 따라, 소비자 앱보다는 UX/UI 비중을 후순위로 설정함
   - 이로 인해, 세로화면과 다크모드 미지원 등 일부 기능이 누락됨

<br>

## 8. 코드 컨벤션

```
- [feat] 새 기능 추가
- [fix] 버그 수정, 오류 해결
- [docs] 문서 수정
- [style] 코드 포맷팅, 세미콜론 누락 (코드 변경 없음)
```

<br>

## 8. 라이센스 & 라이브러리

```
- 테킷팅(Tech!Ting) is available under the MIT license. See the LICENSE file for more info.
- SDWebImage(https://github.com/SDWebImage/SDWebImage)
```

## 참여자
| 📎박성민 [팀장]<br/>[@teddy5518](https://github.com/teddy5518)<br/> | 📎박정선<br/> [@JSPark0099](https://github.com/JSPark0099)<br/> | 📎황예리<br/>[@hwangyeri](https://github.com/hwangyeri)<br/> | 📎류창휘<br/> [@ryuchanghwi](https://github.com/ryuchanghwi)<br/> | 📎테킷팅<br/> [](https://github.com)<br/> |
| :----------------------------------------------------------: | :---------------------------------------------: | :-------------------------------------------------: |:----------------------------------------------------------: |:----------------------------------------------------------: |
|<img src="https://avatars.githubusercontent.com/u/108975398?v=4" width=200> | <img src="https://avatars.githubusercontent.com/u/91583287?v=4" width=200>  | <img src="https://avatars.githubusercontent.com/u/114602459?v=4" width=200> | <img src="https://avatars.githubusercontent.com/u/78063938?v=4" width=200> | <img src="https://user-images.githubusercontent.com/114331071/209800942-616496f5-b675-4a98-8fd2-4df86958fd5e.png" width=200> |

| 📎김덕훈<br/> [@thekoon0456](https://github.com/thekoon0456)<br/> |  📎최예은<br/> [@lianne-b](https://github.com/lianne-b)<br/> | 📎임재혁<br/> [@onthelots](https://github.com/onthelots)<br/> | 📎조현호<br/> [@HHCHO0220](https://github.com/HHCHO0220)<br/> | 📎황유진 [PM]<br/> [@yooj1202](https://github.com/yooj1202)<br/> |
| :---------------------------------------------: | :-------------------------------------------------: | :----------------------------------------------------------: | :---------------------------------------------: | :---------------------------------------------: |
| <img src="https://avatars.githubusercontent.com/u/106993057?v=4" width=200>  | <img src="https://avatars.githubusercontent.com/u/89244357?v=4" width=200> | <img src="https://avatars.githubusercontent.com/u/107039500?v=4" width=200> | <img src="https://avatars.githubusercontent.com/u/109830398?v=4" width=200> | <img src="https://avatars.githubusercontent.com/u/114331071?v=4" width=200> |

