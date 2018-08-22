//
//  ViewController.swift
//  DogBreeds
//
//  Created by Taylor Smith on 8/22/18.
//  Copyright © 2018 Taylor Smith. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var appTitleLabel: UILabel!
    @IBOutlet weak var refreshButton: UIBarButtonItem!
    
    
    let networkManager = NetworkManager()
    var breedList: [DogBreed] = []
    var breedResults: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = true
        appTitleLabel.alpha = 0.0
        networkRequest()
        animateTitle()
        
//makes nav bar translucent
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
 
    }

// refreshes the app, fetching new data and also reloading animations
    
    @IBAction func refreshButtonAction(_ sender: Any) {
        networkRequest()
        appTitleLabel.alpha = 0.0
        animateTitle()
    }
    

// fetches data from Dog API
    
    func networkRequest() {
        
        networkManager.fetchBreeds { (fetchedInfo, error) in
            
            if let fetchedInfo = fetchedInfo {
                self.breedList = fetchedInfo
            }
            
            OperationQueue.main.addOperation {
                
             // Separates key from the value and appends a new array to load the tableview
                
                let breedArray = Array(self.breedList)[0].message.keys
                for x in breedArray {
                    self.breedResults.append(x)
                }
                self.animateTableView()
            }
            
            
        }
    }

// Animates tableview upon loading
    
    func animateTableView() {
        tableView.reloadData()
        let cells = tableView.visibleCells
        let tableHeight: CGFloat = tableView.bounds.size.height
        
        for x in cells {
            let cell: UITableViewCell = x as UITableViewCell
            
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        
        var index = 0
        
        for x in cells {
            tableView.isHidden = false
            let cell: UITableViewCell = x as UITableViewCell
            UIView.animate(withDuration: 3, delay: 0.04 * Double(index), usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: .transitionFlipFromTop, animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0);
            }, completion: nil)
            index += 1
        }
    }
    
// Animates a simple fade in effect for the title
    func animateTitle() {
        UIView.animate(withDuration: 3.0, animations: {
            self.appTitleLabel.alpha = 1.0
            })
    }
    
}


//TableView delegate methods

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breedResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        
        tableView.rowHeight = 125
        tableView.separatorStyle = .none
        cell.cellFrame.layer.borderWidth = 1
        cell.cellFrame.layer.borderColor = UIColor.lightGray.cgColor
     
        cell.titleLabel.text = breedResults[indexPath.row]
        
        return cell
    }
  
}





















