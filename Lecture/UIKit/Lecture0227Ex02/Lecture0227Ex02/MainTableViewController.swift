//
//  MainTableViewController.swift
//  Lecture0227Ex02
//
//  Created by 심근웅 on 2/27/25.
//

import UIKit

class VM {
  struct task {
    let taskName: String
    let iconName: String
  }
  static let shared: VM = VM()
  var tasks: [task] = [
    task(taskName: "책구매", iconName: "cart.png"),
    task(taskName: "철수와 약속", iconName: "clock.png"),
    task(taskName: "스터디 준비", iconName: "pencil.png")
  ]
  func addTask(_ taskName: String, iconName: String) {
    self.tasks.append(task(taskName: taskName, iconName: iconName))
  }
}


class MainTableViewController: UITableViewController {
  
  @IBOutlet var table: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    table.reloadData()
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return VM.shared.tasks.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath)
    cell.textLabel?.text = VM.shared.tasks[indexPath.row].taskName
    cell.imageView?.image = UIImage(named: VM.shared.tasks[indexPath.row].iconName)
    return cell
  }
   
  
  /*
   // Override to support conditional editing of the table view.
   override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the specified item to be editable.
   return true
   }
   */
  
  override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
    return "삭제"
  }
  
  // Override to support editing the table view.
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      // Delete the row from the data source
      VM.shared.tasks.remove(at: indexPath.row)
      tableView.deleteRows(at: [indexPath], with: .fade)
    } else if editingStyle == .insert {
      // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
  }
   
  
  
  // Override to support rearranging the table view.
  override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
    VM.shared.tasks.swapAt(fromIndexPath.row, to.row)
  }
   
  
  /*
   // Override to support conditional rearranging of the table view.
   override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the item to be re-orderable.
   return true
   }
   */
  
  
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let view = segue.destination as? DetailViewController else { return }
    
    if segue.identifier == "detailView" {
      if let cell = sender as? UITableViewCell {
        view.viewLblText = cell.textLabel?.text
      }
    }
  }
   
  
}
