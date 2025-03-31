//
//  FormView.swift
//  Lecture0331Ex01
//
//  Created by 심근웅 on 3/31/25.
//

import SwiftUI
import Combine

class FormViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var isVaild: Bool = false
    
    private var cancelables = Set<AnyCancellable>()
    
    init() {
        // 둘중 하나의 최신값이 들어오면 묶어서 보냄
        Publishers.CombineLatest($email, $password)
            // 결과값의 형태를 변환해서 반환 (String, String) -> Bool
            .map { email, password in
                return !email.isEmpty && password.count >= 6
            }
            .assign(to: \.isVaild, on: self)
            .store(in: &cancelables)
    }
}

struct FormView: View {
    @ObservedObject var viewModel: FormViewModel
    
    var body: some View {
        Form {
            TextField("이메일", text: $viewModel.email)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
            
            SecureField("비밀번호", text: $viewModel.password)
            
            if viewModel.isVaild {
                Text("입력 완료").foregroundStyle(.green)
            } else {
                Text("유효하지 않음").foregroundStyle(.red)
            }
        }
    }
}

#Preview {
    FormView(viewModel: FormViewModel())
}
