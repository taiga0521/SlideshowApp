//
//  ScalingViewController.swift
//  SlideshowApp
//
//  Created by 上田大河 on 2022/10/29.
//

import UIKit

class ScalingViewController: UIViewController {
    

    @IBOutlet weak var imageView2: UIImageView!
    
    var image: UIImage?
    
    @IBAction func backBackButton(_ sender: Any) {
        //let preVC = self.scalingViewController as! ViewController
        //preVC.variable = self.variable
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView2.image = image
        //let image = ViewController()
        //imageView2.modalPresentationStyle = .fullScreen
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
