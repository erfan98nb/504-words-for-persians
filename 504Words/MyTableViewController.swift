//
//  TableViewController.swift
//  504Words
//
//  Created by MAC os on 1/31/21.
//

import UIKit
import ViewAnimator
class MyTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPopoverPresentationControllerDelegate {
    
    
    
    var indexPath: IndexPath  = []
    
    
    @IBAction func AAA(_ sender: Any) {
        let fromAnimation = AnimationType.vector(CGVector(dx: 0, dy: -90))
        let zoomAnimation = AnimationType.zoom(scale: 0.2)
        UIView.animate(views: tableView.visibleCells, animations: [fromAnimation], duration: 1)    }
    @IBOutlet weak var tableView: UITableView!
    let identifier = "tablecell"
    let arr = ["lesson 1","lesson 2","lesson 3","lesson 4","lesson 5","lesson 6","lesson 7","lesson 8","lesson 9","lesson 10","lesson 11","lesson 12","lesson 13","lesson 14","lesson 15","lesson 16","lesson 17","lesson 18","lesson 19","lesson 20","lesson 21","lesson 22","lesson 23","lesson 24","lesson 25","lesson 26","lesson 27","lesson 28","lesson 29","lesson 30","lesson 31","lesson 32","lesson 33","lesson 34","lesson 35","lesson 36","lesson 37","lesson 38","lesson 39","lesson 40","lesson 41","lesson 42" ]
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setGradientBackground()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1.5, animations: {
            self.tableView.alpha = 1
            
        })
        let fromAnimation = AnimationType.vector(CGVector(dx: 0, dy: -90))
        //        let zoomAnimation = AnimationType.zoom(scale: 0.1)
        //        let rotateAnimation = AnimationType.rotate(angle: CGFloat.pi/9)
        //        let zoomAnimation1 = AnimationType.random()
        UIView.animate(views: tableView.visibleCells,animations: [fromAnimation], delay: 1.5, duration: 1)
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.alpha = 0
        
    }
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath) as! MyTableViewCell
        let color1: UIColor = .random
        
        cell.blueview.backgroundColor = color1
        cell.separatorInset = UIEdgeInsets(top: 0, left: cell.bounds.size.width, bottom: 0, right: 0)
        
        cell.label.text = arr[indexPath.row]
        // Configure the cell...
        cell.label?.translatesAutoresizingMaskIntoConstraints = false
        
        cell.label?.trailingAnchor.constraint(equalTo: cell.label!.trailingAnchor, constant: 16).isActive = true
        
        cell.label?.centerYAnchor.constraint(equalTo: cell.label!.centerYAnchor).isActive = true
        cell.label?.font = cell.label?.font.withSize(20)
        
        //
        cell.imageView?.translatesAutoresizingMaskIntoConstraints = false
        cell.imageView?.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 9).isActive = true
        cell.imageView?.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 9).isActive = true
        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView?.centerYAnchor.constraint(equalTo: cell.imageView!.centerYAnchor).isActive = true
        
        
        
        cell.label.translatesAutoresizingMaskIntoConstraints = false
        cell.blueview.translatesAutoresizingMaskIntoConstraints = false
        
        
        cell.label.centerXAnchor.constraint(equalTo: cell.contentView.centerXAnchor).isActive = true
        cell.label.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor).isActive = true
        cell.label.textColor = .white
        
        cell.blueview.centerXAnchor.constraint(equalTo: cell.contentView.centerXAnchor).isActive = true
        cell.blueview.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor).isActive = true
        cell.blueview.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 1.2).isActive = true
        cell.blueview.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 8.5).isActive = true
        cell.blueview.layer.cornerRadius = 15
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 7
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "content", sender: nil)
        self.indexPath = indexPath
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "content" {
            if let indexpath = tableView.indexPathForSelectedRow {
                
                if indexpath.row > 4{
                    print("subscription")
                    button()
                }
                //
                let vc = segue.destination as! contentView
                
                vc.leason.append(arr[indexpath.row])
                
                vc.modalTransitionStyle = .coverVertical
                vc.modalPresentationStyle = .popover
                vc.popoverPresentationController?.delegate = self
                vc.preferredContentSize = CGSize(width: UIScreen.main.bounds.width / 2,
                                                 height: UIScreen.main.bounds.height / 2)
            }
            
            
        }else  if segue.identifier == "back" {
            let vc = segue.destination as! ViewController
            
            vc.modalTransitionStyle = .partialCurl
            vc.modalPresentationStyle = .fullScreen
            
        }
        
        
    }
    func setGradientBackground() {
        let colorTop =  UIColor(red: 43/255.0, green: 88/255.0, blue: 118/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 78/255.0, green: 68/255.0, blue: 118/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    func button(){
        //1. Create the alert controller.
        let alert = UIAlertController(title: "To access more lesson you need to join our membership ", message: "monthly 3.99$  ", preferredStyle: .alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.text = "Gmail: "
        }
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0] // Force unwrapping because we
        }))
        alert.addAction(UIAlertAction(title: "cancel", style: .cancel))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
