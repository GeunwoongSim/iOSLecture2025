// 0203 Lectture 이어서 수업

/*
let MAX = 21
var prev = 0
var cur = 1
var next = 1
var flag = false
var total = 0

// 피보나치 출력하기
while cur <= MAX {
    // cur 출력
    print(cur, terminator: cur == MAX ? "=" : "+")
    total += cur
    // 이전항과 현재항을 더해서 다음 항 만든
    // 현재항은 이전항으로 변경
    // 다음항이 현재항으로 치환 된다.
    next = prev + cur
    prev = cur // 덮어지기 때문에 미리 이전항으로 치환해 주어야 한다.
    cur = next
}
print(total)

// 피보나치 부호를 엇갈려서 출력하기
prev = 0
cur = 1
next = 1
flag = true
total = 2 // 초기값이 꼭 0일 필요는 없다.
while cur <= MAX {
    //더하기 빼기가 교차 되도록
    if flag {
        print(cur, terminator: cur == MAX ? "=" : "+")
        total -= cur
    }else {
        print(cur, terminator: cur == MAX ? "=" : "-")
        total += cur
    }
    flag = !flag
    
    next = prev + cur
    prev = cur
    cur = next
}
print(total)
*/


// 중요: 함수나 구조체는 호출하지 않으면 동작 하지 않는다.

// 구조체 객체를 생성하고 멤버 호출
// 생성자 함수 호출
// exam은 참조변수 (스택 메모리 영역)
// Example() 생성자 함수를 호출하면 Example의 객체가 힙 메모리 공간에 생성된다.
// Example1.run()
let exam: Example1 = Example1()
exam.run()
