//
//  formularioViewController.swift
//  MarkedDay
//
//  Created by Student on 3/8/17.
//  Copyright © 2017 Fabiano Leite. All rights reserved.
//

import UIKit

class formularioViewController: UIViewController {

    @IBOutlet weak var tituloTextField: UITextField!
    @IBOutlet weak var descricaoTextView: UITextView!
    @IBOutlet weak var inicioDatePicker: UIDatePicker!
    @IBOutlet weak var terminoDatePicker: UIDatePicker!
    
    var titulo: String {
        get {
            return tituloTextField.text!
        }
        
        set {
            tituloTextField.text = newValue
        }
    }
    
    var descricao: String {
        get {
            return descricaoTextView.text
        }
        set {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
