
# 주간과제 - CLI 회고 시스템
 <!-- --- -->
## 프로젝트 설명
What : CLI 기반의 회고시스템(Reflection System)을 개발

Why : Swift 학습자가 실습을 통해 기초 문법을 익히고 프로젝트 개발 경험을 쌓음

## 파일 분석
각 파일의 헤드에 주석추가
```swift 
/*
 File: 파일명.swift
 Purpose: 해당 파일의 목적
 
 Data
 - 파일에서 사용하는 data에 대한 설명
 
 etc
 - 추가적인 설명, 나중에 바꾸면 좋겠는것 등을 작성
*/
```

## 데이터 구조
### Reflection 구조체를 사용
  
|속성|타입|설명|
|---|---|---|
|date|String|회고 작성 날짜|
|content|String|회고 내용|
```swift
struct Reflection {
    var date: String
    var content: String
}
```
### ReflectionSystem 클래스를 싱글톤으로 전체 프로그램으로 사용
```swift
class ReflectionSystem {
    static let shared = ReflectionSystem()
    private init() { }
    func run() { }
}
```
### ReflectionSystemDB 클래스를 싱글톤으로 DB로 사용
|속성|Value|KEY|설명|
|---|---|---|---|
|DB|Reflection|Date-String|회고 정보를 담은 DB|
```swift
class ReflectionSystemDB {
    static let shared = ReflectionSystemDB()
    private var DB: [String:Reflection] = [:]
    private init() { }
}
```

## 기능 목록 및 설명 (CRUD)

|기능|설명|입력|출력|함수|
|---|---|---|---|---|
|회고 추가|특정 날짜에 회고 내용을 추가|날짜: 2025-02-09<br>내용: 오늘은 Swift를 공부했다.|회고가 추가되었습니다.|AddReflection|
|회고 조회|특정 날짜의 회고 내용을 검색|날짜: 2025-02-09|날짜: 2025-02-09<br>내용: 오늘은 Swift를 공부했다.|SearchReflection|
|회고 수정|특정 날짜의 회고 내용을 수정|날짜: 2025-02-09<br>새로운 내용: Swift 프로젝트를 진행했다.|회고가 수정되었습니다.|EditReflection|
|회고 삭제|특정 날짜의 회고 내용을 삭제|날짜: 2025-02-09|회고가 삭제되었습니다.|DeleteReflection|
|전체 회고 목록|날짜별 회고 목록을 출력||날짜별 회고 목록을 출력|PrintAllReflection|
|프로그램 종료|프로그램 종료||||

## 프로그램 흐름도
```
메뉴출력
┗ 사용자 입력
    ┣ 회고 추가
    ┃   ┗ 날짜 입력 → 회고 내용 입력 → DB에 저장 → 성공 메시지 출력
    ┣ 회고 조회
    ┃   ┗ 날짜 입력 → DB에서 검색 → 결과 출력
    ┃      ┣ 회고 있음: 회고 내용 출력
    ┃      ┗ 회고 없음: "해당 날짜의 회고가 없습니다." 메시지 출력
    ┣ 회고 수정
    ┃   ┗ 날짜 입력 → DB에서 검색
    ┃      ┣ 회고 있음: 새로운 내용 입력 → 수정 → 성공 메시지 출력
    ┃      ┗ 회고 없음: "해당 날짜의 회고가 없습니다." 메시지 출력
    ┣ 회고 삭제
    ┃   ┗ 날짜 입력 → DB에서 삭제
    ┃      ┣ 회고 있음: 삭제 → 성공 메시지 출력
    ┃      ┗ 회고 없음: "해당 날짜의 회고가 없습니다." 메시지 출력
    ┣ 전체 회고 목록 출력
    ┃   ┗ DB에 저장된 모든 회고 검색 → 결과 출력
    ┃      ┣ 회고 있음: 날짜별 회고 출력
    ┃      ┗ 회고 없음: "저장된 회고가 없습니다." 메시지 출력
    ┗ 종료
        ┗ 프로그램 종료 메시지 출력
```




## 파일 구조
<!--
vscode에서 원하는 폴더 우클릭 generate to tree 하면 나오는거 복사
--->

```
📦 WeekAssign02
 ┣ 📂 BasicFunction
 ┃ ┣ 📜 AddReflection.swift
 ┃ ┣ 📜 DeleteReflection.swift
 ┃ ┣ 📜 EditReflection.swift
 ┃ ┣ 📜 ExitProgram.swift
 ┃ ┣ 📜 PrintAllReflection.swift
 ┃ ┣ 📜 PrintMenu.swift
 ┃ ┗ 📜 SearchReflection.swift
 ┣ 📂 Data
 ┃ ┗ 📜 Reflection.swift
 ┣ 📂 System
 ┃ ┣ 📜 ReflectionSystem.swift
 ┃ ┗ 📜 ReflectionSystemDB.swift
 ┣ 📂 UserInput
 ┃ ┣ 📜 UserContentInput.swift
 ┃ ┣ 📜 UserDateInput.swift
 ┃ ┗ 📜 UserMenuInput.swift
 ┣ 📂 UtilFunction
 ┃ ┣ 📜 ExecuteMenu.swift
 ┃ ┗ 📜 ValidateDate.swift
 ┣ 📜 main.swift
 ┗ 📜 Templete.swift
```
## 추가되면 좋은 기능
1. 파일 저장 시스템
2. 로그인 시스템 - 자신의 회고만 관리
3. 회고 공유 시스템
4. 
5. 
6. 
7. ...
8. UI로 개발
