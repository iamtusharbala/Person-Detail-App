//
//  ViewController.swift
//  Task Detail App
//
//  Created by Coditas on 09/06/21.
//

import UIKit

class InitialViewController: UIViewController {
    

    @IBOutlet weak var inputField: UITextField!
    var personDetails = [Initial]()
    var personData  = [DataPerson]()
    var inputNumber : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getRequest()
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        inputNumber = Int(inputField.text!)!
        inputField.text = ""
    }
    
    func getRequest(){
        let url = URL(string: "https://reqres.in/api/users")
        let session = URLSession.shared
        session.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                do{
                    let jsonData = try JSONDecoder().decode(Initial.self, from : data!)
                    self.personData = jsonData.data
                }
                catch{
                    print("JSON error")
                    print(error)
                }
            }
            
        }.resume()

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondView"{
            let secondVC = segue.destination as! EmployeeDetailViewController
            secondVC.personData2 = personData
            secondVC.inputNumber = inputNumber
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if inputNumber > 6 || inputNumber == 0{
        //Show UIAlertController instead of UIAlertView it is deprecated
            let alertController = UIAlertController(title: "Error", message: "Enter number between 1-6", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
                    UIAlertAction in
                    NSLog("OK Pressed")
                }
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            return false
        }
            return true
    }


}
