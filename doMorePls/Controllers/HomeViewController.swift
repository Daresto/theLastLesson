//
//  HomeViewController.swift
//  doMorePls
//
//  Created by  Abdurahmon on 17/02/22.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {


    @IBOutlet weak var colletctionView: UICollectionView!
    var items: Array<Post> = Array()
    let numberOfColumns: CGFloat = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        initViews()
        // Do any additional setup after loading the view.
    }


    
    // MARK: - Methods
    
    func initViews(){
        setNavBar()
        
        colletctionView.delegate = self
        colletctionView.dataSource = self
        
        self.colletctionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MyCell")
        
        if let flowLayot = colletctionView?.collectionViewLayout as? UICollectionViewFlowLayout{
            let screenSize: CGRect = UIScreen.main.bounds
            let cellWidth = screenSize.width / numberOfColumns - 15
            flowLayot.itemSize = CGSize(width: cellWidth, height: cellWidth)
        }
        
        
        items.append(Post(picture: "mac", text: "Best Coding"))
        items.append(Post(picture: "poppy", text: "Amazing Code"))
        items.append(Post(picture: "mac", text: "Best Coding"))
        items.append(Post(picture: "poppy", text: "Amazing Code"))
        items.append(Post(picture: "mac", text: "Best Coding"))
        items.append(Post(picture: "poppy", text: "Amazing Code"))
        items.append(Post(picture: "mac", text: "Best Coding"))
        items.append(Post(picture: "poppy", text: "Amazing Code"))
        items.append(Post(picture: "mac", text: "Best Coding"))
        items.append(Post(picture: "poppy", text: "Amazing Code"))
    }
    
    func setNavBar(){
        let list = UIImage(named: "ic_list")

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: list, style: .plain, target: self, action: #selector(rightTapped))
            
        title = "Collection View"
    }
    
    
    
    func callScrollController(){
        let vc = ScrollViewController(nibName: "ScrollViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Actions
    
    @objc func rightTapped(){
        callScrollController()
    }
    
    
    
    // MARK: - Collection View
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        
        let cell = colletctionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! CollectionViewCell
        
        cell.image.image = UIImage(named: item.picture)
        cell.text.text = item.text
        
        return cell
        
    }
    
    
    
    

}
