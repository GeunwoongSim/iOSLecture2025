import UIKit
import CoreData

class CoreDataViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    fetchData()
    print("=======================")
//    saveData(title: "test", content: "아아 테스트 중입니다")
//    deleteData(str: "Core Data 실습 중!1")
    print("=======================")
    fetchData()
  }
  
  func saveData(title: String, content: String) {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
    let context = appDelegate.persistentContainer.viewContext
    // 저장할 Entity형태의 객체를 생성
    let note = NSEntityDescription.insertNewObject(forEntityName: "Note", into: context)
    // 객체에 값을 지정
    note.setValue(title, forKey: "title")
    note.setValue(content, forKey: "content")
    note.setValue(Date(), forKey: "createdDate")
    
    do {
      try context.save()
      print("데이터 저장 성공!")
    } catch {
      print("❌ 데이터 저장 실패: \(error)")
    }
  }
  
  func fetchData() {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
    let context = appDelegate.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Note")
    
    do {
      let notes = try context.fetch(fetchRequest)
      for note in notes {
        let title = note.value(forKey: "title") as? String ?? ""
        let content = note.value(forKey: "content") as? String ?? ""
        print("📝 불러온 노트: \(title) - \(content)")
      }
    }catch {
      print(error)
    }
  }
  func deleteData(str: String) {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
    let context = appDelegate.persistentContainer.viewContext
    
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Note")
    fetchRequest.predicate = NSPredicate(format: "content == %@", str)
    
    do {
      let notes = try context.fetch(fetchRequest)
      for note in notes {
        context.delete(note)
      }
      try context.save()
    }catch {
      print(error)
    }
  }
}
