//
//  ViewController.swift
//  5-MVP-achitecture
//
//  Created by Long Nguyễn on 04/05/2021.
//

import UIKit

class UserViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addUserButton: UIBarButtonItem!
    let presenter = UserPresenter()
    
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "Users List"
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
     
        presenter.setViewDelegate(delegate: self)
        presenter.getUsers()

    }
    
    @IBAction func handleAddNew(_ sender: Any) {
        performSegue(withIdentifier: "addUserSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is AddNewUserViewController {
            let vc = segue.destination as? AddNewUserViewController
            
            vc?.userVC = self
        }
    }

}

// MARK: - Extension
extension UserViewController: UserPresenterDelegate {
    func presentUser(user: [User]) {
        self.users = user
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension UserViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
}

extension UserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        
        cell.textLabel?.text = users[indexPath.row].first_name + " " + users[indexPath.row].last_name
        
        return cell
    }
}



