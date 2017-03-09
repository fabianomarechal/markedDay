//
//  AtividadesCollectionViewController.swift
//  MarkedDay
//
//  Created by Student on 3/7/17.
//  Copyright © 2017 Fabiano Leite. All rights reserved.
//

import UIKit
import UserNotifications

private let reuseIdentifier = "atividadeCell"

class AtividadesCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var AddButton: UIBarButtonItem!
    
    var atividade: Atividade?
    var atividades: [Atividade]? = AtividadeDAO.searchAll()
    
    var novaAtividade: (descricao: String, inicio: Date, termino: Date)?
    
    // 2: Solicitar autorização para enviar notificações
    func registerForNotifications() {
        // Defina o tipo de notificações que você quer permitir
        let notificationTypes: UNAuthorizationOptions = [.sound, .alert, .badge]
        
        // Utilizamos o notification center para solicitar autorização
        let notificationCenter = UNUserNotificationCenter.current()
        
        // Solicitamos autorização
        notificationCenter.requestAuthorization(options: notificationTypes) {
            (granted, error) in
            if granted {
                print("Autorização concedida :D")
            } else {
                print("Autorização negada :(")
            }
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerForNotifications()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    
    override func viewWillAppear(_ animated: Bool) {
        atividades = AtividadeDAO.searchAll()
        self.collectionView!.reloadData()
        print("Estou de Volta")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */


    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    

}

extension AtividadesCollectionViewController {
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return atividades!.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        let atividade = atividades![indexPath.row]
        // Configure the cell
        if let atividadeCell = cell as? atividadeCollectionViewCell{
            atividadeCell.descricaoTextView.text = atividade.descricao
        }
     
        return cell
    }
    
}

extension AtividadesCollectionViewController {
    
    // Lembre-se que em uma extension só podemos ter
    // propriedades computadas!
    
    // Defina a distancia entre os itens na CollectionView
    private var sectionInsets: UIEdgeInsets {
        return UIEdgeInsets(
            top: 10.0,
            left: 10.0,
            bottom: 20.0,
            right: 10.0
        )
    }
    
    // Defina o número de células que terá por linha
    private var itemsPerRow: CGFloat {
        return 2
    }
    
    // 1. Defina a altura e largura de cada célula
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    // 2. Define as distâncias entre as células na CollectionView
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    // 3. Define o espaço entre linhas e colunas de células dentro de uma seção
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}

