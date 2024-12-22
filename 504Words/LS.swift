//
//  LS.swift
//  504Words
//
//  Created by MAC os on 2/19/21.
//

import UIKit
 class LS: UIViewController {

    @IBOutlet weak var Image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
 
        
        UIView.animate(withDuration: 1,delay:0.5, animations: {
            self.Image.frame.origin.y -= 90

        }
        )
 
        UIView.animate(withDuration: 2,delay:2, animations: {
             self.Image.transform = CGAffineTransform(scaleX: 0.02, y: 0.02)
        }
        )

        {(Success) in
            let storyboard = UIStoryboard(name: "LSS", bundle: nil)
                            let vc = storyboard.instantiateViewController(withIdentifier: "LSI")
            vc.modalTransitionStyle = .crossDissolve
             vc.modalPresentationStyle = .overCurrentContext
                            self.present(vc, animated: true)
        }
//
        
    }
    
   

}
