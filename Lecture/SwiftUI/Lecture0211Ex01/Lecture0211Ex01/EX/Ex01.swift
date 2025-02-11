/*
 ** 조건 **
 - **텍스트 내용**: `"SwiftUI 실습"`
 - **글자 크기**: `largeTitle`
 - **텍스트 색상**: `red`
 - **배경 색상**: `yellow`
 - **테두리 모양**: **둥근 모서리(RoundedRectangle)** 적용, 테두리 색상은 **파란색**
 
 ** 힌트 **
 - font(), foregroundColor(), background(), overlay() 수식어를 사용하세요.
 */

import SwiftUI

struct Ex01: View {
    var body: some View {
        Text("SwiftUI 실습")
    }
}

#Preview {
    Ex01()
}
