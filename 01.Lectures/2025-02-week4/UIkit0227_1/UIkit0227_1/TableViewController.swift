//
//  TodoTableViewController.swift
//  UIkit0227_1
//
//  Created by Uihyun.Lee on 2/27/25.
//

import UIKit
var items = ["책 구매","철수와 약속","스터디 준비하기"]
var itemsImageFile = ["cart.png","clock.png","pencil.png"]


class TableViewController: UITableViewController {
    
    var tasks = ["오징어 먹기","꼴뚜기 키우기","대구탕 사먹기","명태 구이 먹기","거북이 기르기"]
    @IBOutlet var tvListView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
        override func numberOfSections(in tableView: UITableView) -> Int {
    //        // #warning Incomplete implementation, return the number of sections
    //
           return 1
       }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        //tasks 배열의 갯수 반환
        return items.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        // 셀을 가져오거나 없으면 새로 생성
        
        // 현재 indexPath.row에 대한 셀의 값을 tasks 배열에서 가져와서 표시
        cell.textLabel?.text = items[indexPath.row]
        cell.imageView?.image = UIImage(named: itemsImageFile[indexPath.row])
        return cell
    }
    
    
    
    // Override to support conditional editing of the table view.
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }
    
    
    
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    //삭제 동작감지
         if editingStyle == .delete {
             //taks 배열에서 indexPath.row의 해당하는 item을 삭제
             tasks.remove(at: indexPath.row)
             
             
     //tasks에서 해당 item 삭제
             tasks.remove(at: indexPath.row)
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     
    
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
}
