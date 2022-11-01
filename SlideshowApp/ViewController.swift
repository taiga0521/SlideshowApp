//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 上田大河 on 2022/10/29.
//

import UIKit

class ViewController: UIViewController {
    //　再生/停止
    @IBOutlet weak var startButton: UIButton!
    //　画像
    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage?
    var nowIndex:Int = 0
    
    var timer: Timer!
    //　進む
    @IBOutlet weak var imageButton: UIButton!
    //　進む
    @IBAction func nextButton(_ sender: Any) {
        if nowIndex == 0{
            nowIndex = 1
        } else if nowIndex == 1 {
            nowIndex = 2
        } else if nowIndex == 2 {
            nowIndex = 3
        } else if nowIndex == 3 {
            nowIndex = 4
        } else if nowIndex == 4 {
            nowIndex = 0
        }
        if (nowIndex == imageArray.count){
            nowIndex = 0
        }
        imageView.image = imageArray[nowIndex]
    }
    //
    
    //　戻る
    @IBOutlet weak var backIboButton: UIButton!
    //　戻る
    @IBAction func backButton(_ sender: Any) {
        if nowIndex == 0{
            nowIndex = 4
        } else if nowIndex == 4 {
            nowIndex = 3
        } else if nowIndex == 3 {
            nowIndex = 2
        } else if nowIndex == 2 {
            nowIndex = 1
        } else if nowIndex == 1 {
            nowIndex = 0
        }
        if (nowIndex == imageArray.count){
            nowIndex = 0
        }
        imageView.image = imageArray[nowIndex]
    }
    //　画像の配列
    var imageArray:[UIImage] = [
        UIImage(named:"hana1")!,
        UIImage(named:"hana2")!,
        UIImage(named:"hana3")!,
        UIImage(named:"hana4")!,
        UIImage(named:"hana5")!
    ]
    //　画像タッチ
    @IBAction func onTapImage(_ sender: Any) {
        if self.timer != nil {
            print("タイマー停止")
            startButton.setTitle("再生", for: .normal)
            imageButton.isEnabled = true
            backIboButton.isEnabled = true
            timer.invalidate()
            self.timer = nil
        }
        performSegue(withIdentifier: "up", sender: nil)
    }
    //　画像遷移
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let scalingVIewController: ScalingViewController = segue.destination as! ScalingViewController
        scalingVIewController.image = imageArray[nowIndex]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func slideShowButton(_ sender: Any) {
        if timer == nil{
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            startButton.setTitle("停止", for: .normal)
            imageButton.isEnabled = false
            backIboButton.isEnabled = false
        }else{
            timer.invalidate()
            timer = nil
            startButton.setTitle("再生", for: .normal)
            imageButton.isEnabled = true
            backIboButton.isEnabled = true
        }
    }
    
    @objc func changeImage(){
        nowIndex += 1
        if (nowIndex == imageArray.count){
            nowIndex = 0
        }
        imageView.image = imageArray[nowIndex]
    }
    
}

