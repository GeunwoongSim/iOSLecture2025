/*
 File: 파일명.swift
 Purpose: 해당 파일의 목적
 
 Input Data
 - 파일에서 처리하는 기능에 대한 입력, 전달 값
 Output Data
 - 파일에서 처리한 내용에 대한 출력, 반환 값
 
 Warning
 -
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
