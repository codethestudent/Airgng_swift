//
//  TableViewController.swift
//  Airgng
//
//  Created by 하준영 on 2022/03/06.
//

import UIKit

struct fit{
    var fitnessEquip: String
    var userName: String
    var weight: String
    var size: String
    var thumbnail : String
    var detailImage : [String]?
    var price: Int
    var rate: Double
}


class TableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    let data = [
        fit(fitnessEquip: "dumbell", userName: "Bob", weight: "10kg", size: "30x10x15", thumbnail: "Dumbell", detailImage: ["dumbellDetail1","dumbellDetail2","dumbellDetail3"], price: 10000, rate: 4.8),
        fit(fitnessEquip: "barbell", userName: "Suzie", weight: "20kg", size: "1700x5x5", thumbnail: "barbell", detailImage: ["barbellDetail1","barbellDetail2","barbellDetail3"], price: 20000, rate: 4.7),
        fit(fitnessEquip: "bench", userName: "Billy", weight: "30kg", size: "120x50x30", thumbnail: "bench", detailImage: ["benchDetail1","benchDetail2", "benchDetail3"], price: 10000, rate: 4.9),
        fit(fitnessEquip: "chin up", userName: "Silly", weight: "35kg", size: "100x220x70", thumbnail: "chinup", detailImage: ["chinupDetail1","chinupDetail2"], price: 50000,rate: 4.6)
        ]

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FitnessCell", for: indexPath)
        cell.textLabel?.text = "Cell"
        
        let index = indexPath.row
        let Fitness: fit = data[index]
        
        cell.textLabel?.text = Fitness.fitnessEquip
        cell.detailTextLabel?.text = Fitness.userName
        cell.imageView?.image = UIImage(named: Fitness.thumbnail)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue",
            let detailVC = segue.destination as? DetailViewController,
            let cell = sender as? UITableViewCell,
            let index = self.tableView.indexPath(for: cell)
        {
            let index = data[index.row]
            detailVC.index = index
        }
        
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
