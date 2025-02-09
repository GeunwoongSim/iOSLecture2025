/*
 File: ExecuteMenu.swift
 Purpose: 입력받은 메뉴에 따른 메뉴 실행
 
 Data
 - menu: Int // 입력받은 메뉴 값의 Int형, 1~6은 정상적인 입력으로 메뉴 실행, -1은 오류상태

 etc
 - 지금은 -1이 들어오면 아무것도 안하는데 나중엔 먼가 처리를 해주면 좋을듯
*/
extension ReflectionSystem {
    func executeMenu(menu: Int) {
        if menu == 1 { addReflection() }
        if menu == 2 { searchReflection() }
        if menu == 3 { editReflection() }
        if menu == 4 { deleteReflection() }
        if menu == 5 { printAllReflection() }
        if menu == 6 { exitProgram() }
    }
}
