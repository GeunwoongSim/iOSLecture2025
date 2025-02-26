import UIKit

class FirstViewController: UIViewController {
  @IBOutlet weak var statusLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("viewDidLoad - 뷰가 메모리에 로드되었습니다.")
    statusLabel.text = "viewDidLoad 호출"
    
    self.title = "첫 번째 화면"
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "다음", style: .plain, target: self, action: #selector(goNext))
  }
  
  @objc func goNext() {
    let nextVC = NextViewController()
    navigationController?.pushViewController(nextVC, animated: true)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("viewWillAppear - 뷰가 화면에 나타나기 직전입니다.")
    statusLabel.text = "viewWillAppear 호출"
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print("viewDidAppear - 뷰가 화면에 완전히 나타났습니다.")
    statusLabel.text = "viewDidAppear 호출"
  }
  
  
}
