//
//  ToDoTableViewController.swift
//  Lecture0227Ex01
//
//  Created by 심근웅 on 2/27/25.
//

import UIKit

class ToDoTableViewController: UITableViewController {
  
  var tasks = ["오징어 먹기", "꼴뚜기 키우기", "대구탕 사먹기", "명태 구이 먹기", "거북이 기르기"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem
  }
  
  // MARK: - Table view data source
  //
  //  override func numberOfSections(in tableView: UITableView) -> Int {
  //    // #warning Incomplete implementation, return the number of sections
  //    return 1
  //  }
  //
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return tasks.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //셀을 가져오거나 없으면 새로 생성
    let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
    //현재 indexPath.row에 대한 셀의 값을 tasks 배열에서 가져와서 표시
    cell.textLabel?.text = tasks[indexPath.row]
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let selectedTask = tasks[indexPath.row]
    print(selectedTask)
  }
  
  /*
   // Override to support conditional editing of the table view.
   override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the specified item to be editable.
   return true
   }
   */
  
  /*
   // Override to support editing the table view.
   override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
   if editingStyle == .delete {
   // Delete the row from the data source
   tableView.deleteRows(at: [indexPath], with: .fade)
   } else if editingStyle == .insert {
   // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
   }
   }
   */
  
  /*
   // Override to support rearranging the table view.
   override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
   
   }
   */
  
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
    if segue.identifier == "viewDetail" {
      
      let destiVC = segue.destination as! DetailViewController
      
//      if let task = sender as? String {
//        destiVC.titleStr = task
//      }else
      if let cell = sender as? UITableViewCell, let task = cell.textLabel?.text {
        destiVC.titleStr = task
      }
      print("viewDetail 클릭")
    }else if segue.identifier == "addTask" {
      print("addTask 클릭")
    }
  }
  
}



