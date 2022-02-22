//
//  ScrollViewController.swift
//  doMorePls
//
//  Created by  Abdurahmon on 21/02/22.
//

import UIKit

class ScrollViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()

        // Do any additional setup after loading the view.
    }


    
    // MARK: - Navigation

     func initViews(){
         setNavBar()
     }
     
     func setNavBar(){
         let back = UIImage(named: "ic_back")
             
         navigationItem.leftBarButtonItem = UIBarButtonItem(image: back, style: .plain, target: self, action: #selector(leftTapped))
             
         title = "Scroll View"
     }
     
     
     
     // MARK: - Actions
     
     @objc func leftTapped(){
         navigationController?.popViewController(animated: true)
     }

}
