import UIKit



class FileManagerViewController: UIViewController {
  struct Note: Codable {
    let title: String
    let content: String
  }
  let fileName = "notes.json"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    saveNote()
    loadNote()
  }
  
  func saveNote() {
    let notes = [
      Note(title: "iOS 개발1", content: "FileManager 예제 학습 중1"),
      Note(title: "iOS 개발2", content: "FileManager 예제 학습 중2"),
      Note(title: "iOS 개발3", content: "FileManager 예제 학습 중3")
    ]
    let encoder = JSONEncoder()
    
    if let data = try? encoder.encode(notes) {
      let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
      let fileURL = documentDirectory.appendingPathComponent(fileName)
      
      do {
        try data.write(to: fileURL)
        print("노트 저장 성공: \(fileURL)")
      } catch {
        print("노트 저장 실패: \(error)")
      }
    }
  }
  
  func loadNote() {
    let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    let fileURL = documentDirectory.appendingPathComponent(fileName)
    
    if let data = try? Data(contentsOf: fileURL) {
      let decoder = JSONDecoder()
      if let notes = try? decoder.decode([Note].self, from: data) {
        print(notes)
        for note in notes {
          print("불러온 노트: \(note.title), \(note.content)")
        }
      }
    }
  }
}
