//
//  ViewController.swift
//  SojuCap
//
//  Created by Byungwoo Jang on 4/6/20.
//  Copyright © 2020 Byungwoo Jang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    


    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var buttonText: UIButton!
    @IBOutlet weak var sojuPicture: UIImageView!
    @IBOutlet weak var cardCount: UILabel!
    
    var questionBank = QuestionBank()
    lazy var questionCount = questionBank.questionCount
    lazy var questionArr = questionBank.questionArr
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sojuPicture.image = UIImage(named: "sojupic")
        // Do any additional setup after loading the view.
        questionLabel.text = questionArr[questionCount]
        buttonText.setTitle("Next", for: .normal)
        buttonText.layer.cornerRadius = 5
        cardCount.text = String(questionCount+1) + "/" + String(questionArr.count+1)
        progressBar.transform = progressBar.transform.scaledBy(x: 1, y: 8)
        progressBar.progress = 0.0
        self.view.backgroundColor = UIColorFromRGB(rgbValue: 0x2ecc71)
        questionLabel.backgroundColor = UIColorFromRGB(rgbValue: 0x2ecc71)
        progressBar.progressTintColor = UIColor.yellow
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        //print(sender)
        questionCount+=1
        //print(questionCount)
        updateQuestion()
    }
    
    
    func updateQuestion() {
        //print(questionArr.count)
        var progressFloat = Float(questionCount) / Float(questionArr.count)
        if (progressFloat == 1.0) {
            questionLabel.text = questionArr[questionCount-1]
            cardCount.text = String(questionCount+1) + "/" + String(questionArr.count+1)
            progressBar.progress = 1.0
            updateProgressbar(floatingprogress: progressFloat)
            buttonText.setTitle("FINISHED", for: .normal)
            buttonText.setTitleColor(.white, for: .normal)
            buttonText.backgroundColor = .orange
            buttonText.isEnabled = false
        } else {
            questionLabel.text = questionArr[questionCount]
            progressBar.progress = progressFloat
            updateProgressbar(floatingprogress: progressFloat)
            cardCount.text = String(questionCount+1) + "/" + String(questionArr.count+1)
        }
        
    }
    
    func updateProgressbar(floatingprogress: Float) {
        print(progressBar.progress)
        if (floatingprogress >= 0.1 && floatingprogress < 0.2 ) {
            progressBar.progressTintColor = UIColorFromRGB(rgbValue: 0xFFF200)
        } else if (floatingprogress >= 0.2 && floatingprogress < 0.3 ) {
            progressBar.progressTintColor = UIColorFromRGB(rgbValue: 0xFFD300)
        } else if (floatingprogress >= 0.3 && floatingprogress < 0.4 ) {
            progressBar.progressTintColor = UIColorFromRGB(rgbValue: 0xFCD12A)
        } else if (floatingprogress >= 0.4 && floatingprogress < 0.5 ) {
            progressBar.progressTintColor = UIColorFromRGB(rgbValue: 0xFEDC56)
        } else if (floatingprogress >= 0.5 && floatingprogress < 0.6 ) {
            progressBar.progressTintColor = UIColorFromRGB(rgbValue: 0xE4CD05)
        } else if (floatingprogress >= 0.6 && floatingprogress < 0.7 ) {
            progressBar.progressTintColor = UIColorFromRGB(rgbValue: 0xDFB85A)
        } else if (floatingprogress >= 0.7 && floatingprogress < 0.8 ) {
            progressBar.progressTintColor = UIColorFromRGB(rgbValue: 0xEB9605)
        } else if (floatingprogress >= 0.8 && floatingprogress < 0.9 ) {
            progressBar.progressTintColor = UIColorFromRGB(rgbValue: 0xFD6A02)
        } else if (floatingprogress >= 0.9 && floatingprogress <= 1.0 ) {
            progressBar.progressTintColor = UIColor.red
        } else {
            progressBar.progressTintColor = UIColor.yellow
        }
    }
    /*
    func updateProgressbar2(floatingprogress: Float) {
        switch floatingprogress {
        case 0.1...0.2:
            progressBar.progressTintColor = UIColorFromRGB(rgbValue: 0xFFF200)
        case 0.2...0.3:
            
        default:
            progressBar.progressTintColor = UIColor.yellow
            
        }
    }
 */
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

}

