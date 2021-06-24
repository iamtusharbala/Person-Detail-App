//
//  secondViewController.swift
//  Task Detail App
//
//  Created by Coditas on 09/06/21.
//

import UIKit

class EmployeeDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var idView: UILabel!
    @IBOutlet weak var emailView: UILabel!
    @IBOutlet weak var firstNameView: UILabel!
    @IBOutlet weak var lastNameView: UILabel!
    var personData2  = [DataPerson]()
    var inputNumber : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for element in personData2{
            if inputNumber == element.id{
                idView.text = "\(element.id)"
                emailView.text = element.email
                firstNameView.text = element.first_name
                lastNameView.text = element.last_name
                let imageData = try! Data(contentsOf: URL(string: element.avatar)!)
                imageView.image = UIImage(data: imageData)
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "thirdView"{
            let thirdVC = segue.destination as! TableViewController
            thirdVC.personData3 = personData2
        }
    }

}
