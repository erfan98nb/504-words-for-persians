//
//  contentView.swift
//  504Words
//
//  Created by MAC os on 1/31/21.
//

import UIKit
 
class contentView:  UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var LessonNumber: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var leason = [String]()
    var WordsNMeaning = [String:String]()
    var find  = 0
     var lessenWords:[String:[String]] = [
        "lesson 1": ["abandon","keen","jealous","tact","oath","vacant","hardship","gallant","data","unaccustomed","bachelor","qualify",],
        "lesson 2": ["corpse","conceal","dismal","frigid","inhabit","numb","peril","recline","shriek","sinister","tempt","wager"],
        
        "lesson 3": ["typical","minimum","scarce","annual","persuade","essential","blend","visible","expensive","talent","devise","wholesale"],
        "lesson 4": ["vapor","eliminate","villain","dense","utilize","humid","theory","descend","circulate","enormous","predict","vanish"],
         
        "lesson 5": ["tradition","rural","burden","campus","majority","assemble","explore","topic","debate","evade","probe","reform"],
        
        "lesson 6": ["approach","detect","defect","employee","neglect","deceive","undoubtedly","popular","thorough","client","comprehensive","defraud"],
         
        "lesson 7": ["postpone","consent","massive","capsule","preserve","denounce","unique","torrent","resent","molest","gloomy","unforeseen"],
         
        "lesson 8": ["exaggerate","amateur","mediocre","variety","valid","survive","weird","prominent","security","bulky","reluctant","obvious"],
        
        "lesson 9": ["vicinity","century","rage","document","conclude","undeniable","resist","lack","ignore","challenge","miniature","source"],
         
        "lesson 10": ["excel","feminine","mount","compete","dread","masculine","menace","tendency","underestimate","victorious","numerous","flexible"],
  
     ]
    
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        LessonNumber.text = leason[0]
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContentCell", for: indexPath) as! contentCell
         cell.secondView.backgroundColor = UIColor(red: 43/255.0, green: 88/255.0, blue: 118/255.0, alpha: 1)
        cell.secondView.layer.cornerRadius = 10
        cell.secondView.clipsToBounds = true
      
          for (key, value) in lessenWords {
            
            if key == leason[0] {
                
                cell.Word.text = value[indexPath.row]
                 return cell
                
             }
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 12
    }
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 7
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "WordDetail", sender: nil)
     
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "WordDetail" {
            if let indexpath = tableView.indexPathForSelectedRow {
                
                let vc = segue.destination as! DetailVC
                
                var mvalue = lessenWords[leason[0]]!
 
                vc.word.append(mvalue[indexpath.row])
                
                vc.modalTransitionStyle = .coverVertical
                vc.modalPresentationStyle = .popover
                
            }
        }
    }
}





 
extension UIColor {
    static var random: UIColor {
        return .init(hue: .random(in: 0...1), saturation: 1, brightness: 1, alpha: 1)
    }
}
