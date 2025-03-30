//
//  FirebaseManager.swift
//  Lecture0330Ex02
//
//  Created by 심근웅 on 3/30/25.
//

import Foundation
import FirebaseFirestore

class FirestoreManager {
    // FirestoreManager의 단일 인스턴스 생성 (싱글톤 패턴 적용)
    static let shared = FirestoreManager()
    
    // Firestore 데이터베이스 인스턴스 생성
    private let db = Firestore.firestore()
    
    // Firestore의 컬렉션 명
    private let collection = "todos"
    
    // Firestore에 할 일 데이터를 추가하는 함수 - C
    func addTodo(title: String, completion: @escaping (Error?) -> Void) {
        // Firestore에서 새로운 문서 ID 자동 생성
        let docRef = db.collection(collection).document()
        // 새로운 객체를 생성
        let todo = Todo(id:docRef.documentID, title: title, isCompleted: false)
        
        do {
            try docRef.setData(from: todo, completion: completion)
        } catch {
            completion(error)
        }
    }
    
    // Firestore에서 데이터를 실시간으로 가져오는 함수 - R
    func fetchTodos(completion: @escaping ([Todo]?, Error?) -> Void) {
        db.collection(collection).addSnapshotListener { snapshot, error in
            guard let documents = snapshot?.documents, error == nil else {
                // Firestore에서 데이터를 가져오는 중 오류 발생 시 에러 반환
                completion(nil, error)
                return
            }
            // Firestore의 문서 데이터를 Todo 객체 배열로 변환
            let todos = documents.compactMap { try? $0.data(as: Todo.self) }
            // 변환된 데이터를 콜백으로 반환
            completion(todos, nil)
        }
    }
    
    // Firestore에서 특정 할 일의 완료 상태를 업데이트하는 함수 - U
    func updateTodo(todo: Todo, completion: @escaping (Error?) -> Void) {
        let docRef = db.collection(collection).document(todo.id)
        docRef.updateData(["isCompleted": !todo.isCompleted], completion: completion)
    }
    
    // Firestore에서 특정 할 일을 삭제하는 함수 - D
    func deleteTodo(id: String, completion: @escaping (Error?) -> Void) {
        // 해당 ID의 문서를 Firestore에서 삭제
        let docRef = db.collection(collection).document(id)
        docRef.delete(completion: completion)
    }
}
