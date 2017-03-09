//
//  formularioViewController.swift
//  MarkedDay
//
//  Created by Student on 3/8/17.
//  Copyright © 2017 Fabiano Leite. All rights reserved.
//  Fabiano Leite

import UIKit

class formularioViewController: UIViewController {

    @IBOutlet weak var tituloTextField: UITextField!
    @IBOutlet weak var descricaoTextView: UITextView!
    @IBOutlet weak var inicioDatePicker: UIDatePicker!
    @IBOutlet weak var terminoDatePicker: UIDatePicker!
    
    @IBAction func cadastraAtividade(_ sender: UIButton) {
        print("titulo=\(titulo), descrição=\(descricao)")
        
        navigationController?.popViewController(animated: true)
    }
    
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
            descricaoTextView.text = newValue
        }
    }
    
    var inicio : Date {
        get {
            return inicioDatePicker.date
        }
        set {
            inicioDatePicker.date = newValue
        }
    }
    
    var termino : Date {
        get {
            return terminoDatePicker.date
        }
        set {
            terminoDatePicker.date = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    // Atualiza a view
    override func viewWillAppear(_ animated: Bool) {
        
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
