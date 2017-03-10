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
    
    var atividade: Atividade?
    var atualizar: Bool = false
    
    @IBAction func cadastraAtividade(_ sender: UIButton) {
        print("titulo=\(titulo), descrição=\(descricao)")
        
        if atualizar{
            atividade?.setValue(titulo, forKey: "titulo")
            atividade?.setValue(descricao, forKey: "descricao")
            atividade?.setValue(inicio, forKey: "inicio")
            atividade?.setValue(termino, forKey: "termino")
            
        } else {
            atividade = Atividade()
            atividade?.titulo = titulo
            atividade?.descricao = descricao
            atividade?.inicio = inicio as NSDate?
            atividade?.termino = termino as NSDate?
        
            if AtividadeDAO.insert() {
                print("Atividade Salva com sucesso")
            }
        }
        
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

        if self.atividade != nil {
            titulo = (atividade?.titulo!)!
            descricao = (atividade?.descricao!)!
            inicio = atividade?.inicio! as! Date
            termino = atividade?.termino! as! Date
            self.atualizar = true
        }
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
