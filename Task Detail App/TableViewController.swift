//
//  thirdViewController.swift
//  Task Detail App
//
//  Created by Coditas on 16/06/21.
//

import UIKit


class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var completeName = [String]()
    var email = [String]()
    var imageURL = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    var personData3  = [DataPerson]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        //Register .xib file
        tableView.register(UINib(nibName: "CustomDetailCell", bundle: nil), forCellReuseIdentifier: "CustomCellXib")
        tableviewHeight()
        
        for name in personData3{
            let fullName = name.first_name + " " + name.last_name
            completeName.append(fullName)
        }
        
        for mail in personData3{
            email.append(mail.email)
        }
        for image in personData3{
            imageURL.append(image.avatar)
        }
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personData3.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellXib", for: indexPath) as! CustomDetailCell
        cell.nameCellView.text = completeName[indexPath.row]
        cell.emailCellView.text = email[indexPath.row]
        let imageData = try! Data(contentsOf: URL(string: imageURL[indexPath.row])!)
        let image: UIImage = UIImage(data: imageData)!
        cell.avatarCellView.image = image
        return cell
    }
    
    func tableView(_ tableView: UITableView,
             didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableviewHeight(){
        tableView.rowHeight = 100.0
    }
    
    
    
    

}
