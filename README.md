# 커밋 참고 사항
## 폴더
-  lecture : 강의중 사용한 프로젝트 파일
-  Assignment : 주간 과제 or 일일과제 or 퀴즈 프로젝트 파일

## 프로젝트명
-  LectureMMDDExNN (ex. Lecture0122Ex01) : lecture에 사용
-  WeekAssignN (ex. WeekAssign01) : N번째 주간과제  
-  DayAssignNN_MMDD (ex. DayAssign01_0124) : N번째 일일과제_과제날짜

## Organization Identifier
- Lecture : lecture 통일
- Assignment : assign 통일
## 과제링크
- [02.03 퀴즈](Assignment/DayAssign02_0203/DayAssign02_0203/main.swift)
# create a new repository on the command line
```swift
echo "# iOSLecture2025" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/GeunwoongSim/iOSLecture2025.git
git push -u origin main
```

# push an existing repository from the command line
```swift
git remote add origin https://github.com/GeunwoongSim/iOSLecture2025.git
git branch -M main
git push -u origin main
```