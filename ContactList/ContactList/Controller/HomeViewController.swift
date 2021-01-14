//
//  HomeViewController.swift
//  ContactList
//
//  Created by amthal enazi on 01/06/1442 AH.
//

import UIKit

class HomeViewController: UIViewController {

   
 
    @IBOutlet weak var tableView: UITableView!
    var model = [Contact]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        downloadJSON {
            print("success")
            self.tableView.reloadData()
        }
    }
   
    
    func downloadJSON(complected: @escaping () -> ()) {
        let urlString = ""
        let url = URL(string: urlString)!

        URLSession.shared.dataTask(with: url) { (data, response, error) in

            if error == nil {
                do {
                    self.model = try JSONDecoder().decode([Contact].self, from: data!)
                    DispatchQueue.main.async {
                        complected()
                    }
                } catch {
                    print("JSON Ereor")
                }
            }
        } .resume()
    }

    
    
}

    
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeTableViewCell
        let ContList = model[indexPath.row]
        cell.name.text = "jjj"
        cell.imagProfile.image = UIImage(data: <#T##Data#>)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = storyboard?.instantiateViewController(identifier: "Detials") as? ContactPageViewController {
            self.present(viewController, animated: true, completion: nil)
            
        }
    }
    
    
}
    


