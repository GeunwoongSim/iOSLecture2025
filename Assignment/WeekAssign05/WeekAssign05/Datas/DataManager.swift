//
//  DataManager.swift
//  WeekAssign05
//
//  Created by 심근웅 on 3/9/25.
//

import Foundation
import CoreData
import UIKit

class DataManager {
  // Core Data에서 사용할 context 컨테이너
  lazy var container: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "MemoDatas")
    container.loadPersistentStores{ storeDescription, error in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    }
    return container
  }()
  
  static var shared: DataManager = DataManager()
  var memos: [MemoModel] = []
  
  enum Action {
    case memoSave(data: MemoModel)
    case memoLoad
    case memoEdit(data: MemoModel)
    case memoDelete(data: MemoModel)
  }
  
  func send(action: Action) {
    switch action {
    case .memoSave(let data):
      saveData(data: data)
    case .memoLoad:
      let loadData = loadData()
      memos = loadData
    case .memoEdit(let data):
      editData(data: data)
    case .memoDelete(let data):
      deleteData(data: data)
    }
  }
}

extension DataManager {
  // Memo Save
  private func saveData(data: MemoModel) {
    
    let context = container.viewContext
    let memo = NSEntityDescription.insertNewObject(forEntityName: "Memo", into: context)
    memo.setValue(data.uuid, forKey: "uuid")
    memo.setValue(data.title, forKey: "title")
    memo.setValue(data.content, forKey: "content")
    memo.setValue(data.date, forKey: "date")
    memo.setValue(data.image?.pngData(), forKey: "image")
    do {
      try context.save()
      print("데이터 저장 성공!")
    }catch {
      print("❌ 데이터 저장 실패: \(error)")
    }
  }
  // Memo Load
  private func loadData() -> [MemoModel] {
    var result: [MemoModel] = []
    let context: NSManagedObjectContext = container.viewContext
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Memo")
    do {
      let datas = try context.fetch(fetchRequest)
      for data in datas {
        let uuid = data.value(forKey: "uuid") as! UUID
        let title = data.value(forKey: "title") as! String
        let content = data.value(forKey: "content") as! String
        let date = data.value(forKey: "date") as! Date
        let image = data.value(forKey: "image") as? Data
        var temp = MemoModel(uuid: uuid, title: title, content: content, date: date)
        if let image = image { temp.image = UIImage(data: image) }
        result.append(temp)
      }
    }catch {
      print("❌ 데이터 로드 실패: \(error)")
    }
    return result
  }
  private func editData(data: MemoModel) {
    // uuid가 일치하는 메모를 삭제하고 새로 입력
    let context: NSManagedObjectContext = container.viewContext
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Memo")
    
    fetchRequest.predicate = NSPredicate(format: "uuid == %@", data.uuid.uuidString)
    
    do {
      guard let result = try? context.fetch(fetchRequest),
            let object = result.first else { return }
      object.setValue(data.title, forKey: "title")
      object.setValue(data.content, forKey: "content")
      object.setValue(data.date, forKey: "date")
      object.setValue(data.image?.pngData(), forKey: "image")
      try context.save()
    }catch {
      print("error: \(error.localizedDescription)")
    }
  }
  private func deleteData(data: MemoModel) {
    let context: NSManagedObjectContext = container.viewContext
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Memo")
    fetchRequest.predicate = NSPredicate(format: "uuid == %@", data.uuid.uuidString)
    do {
      guard let result = try? context.fetch(fetchRequest),
            let object = result.first else { return }
      context.delete(object)
      try context.save()
    } catch {
      print("error: \(error.localizedDescription)")
    }
  }
}
