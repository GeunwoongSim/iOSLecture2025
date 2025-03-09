//
//  DataManager.swift
//  WeekAssign05
//
//  Created by 심근웅 on 3/9/25.
//

import Foundation
import CoreData

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
  }
  
  func send(action: Action) {
    switch action {
    case .memoSave(let data):
      saveData(data: data)
    case .memoLoad:
      let loadData = loadData()
      memos = loadData
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
        result.append(MemoModel(uuid: uuid, title: title, content: content, date: date))
      }
    }catch {
      print("❌ 데이터 로드 실패: \(error)")
    }
    return result
  }
}
