//
//  ViewController.swift
//  Gradients
//
//  Created by Nomadic on 7/22/20.
//  Copyright © 2020 Nomadic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gradientNameLabel: UILabel!
 
        
        let gradientNames = ["Roseanna", "Sexy Blue", "Purple Love", "Piglet", "Mauve"]
        
        let colors = [[#colorLiteral(red: 1, green: 0.6862745098, blue: 0.7411764706, alpha: 1).cgColor, #colorLiteral(red: 1, green: 0.7647058824, blue: 0.6274509804, alpha: 1).cgColor], [#colorLiteral(red: 0.1294117647, green: 0.5764705882, blue: 0.6901960784, alpha: 1).cgColor, #colorLiteral(red: 0.4274509804, green: 0.8352941176, blue: 0.9294117647, alpha: 1).cgColor], [#colorLiteral(red: 0.8, green: 0.168627451, blue: 0.368627451, alpha: 1).cgColor, #colorLiteral(red: 0.4588235294, green: 0.2274509804, blue: 0.5333333333, alpha: 1).cgColor], [#colorLiteral(red: 0.9333333333, green: 0.6117647059, blue: 0.6549019608, alpha: 1).cgColor, #colorLiteral(red: 1, green: 0.8666666667, blue: 0.8823529412, alpha: 1).cgColor], [#colorLiteral(red: 0.2588235294, green: 0.1529411765, blue: 0.3529411765, alpha: 1).cgColor, #colorLiteral(red: 0.4509803922, green: 0.2941176471, blue: 0.4274509804, alpha: 1).cgColor]]
        
        
        var gradientIndex = 0
        
        var roseannaLayer: CAGradientLayer! {
            didSet {
                roseannaLayer.startPoint = CGPoint(x: 0, y: 0)
                roseannaLayer.endPoint = CGPoint(x: 0, y: 1)
                
                let startColor = #colorLiteral(red: 1, green: 0.6862745098, blue: 0.7411764706, alpha: 1).cgColor
                let endColor = #colorLiteral(red: 1, green: 0.7647058824, blue: 0.6274509804, alpha: 1).cgColor
                
                roseannaLayer.colors = [startColor, endColor]
            }
        }
        
        override func viewDidLayoutSubviews() {
            roseannaLayer.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture(gesture:)))
            swipeRight.direction = .right
            self.view!.addGestureRecognizer(swipeRight)
            
            let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture(gesture:)))
            swipeRight.direction = .left
            self.view.addGestureRecognizer(swipeLeft)
            
            setGradient()
        }
        

        @objc func swipeGesture (gesture: UISwipeGestureRecognizer) -> Void {
            
            if gesture.direction == UISwipeGestureRecognizer.Direction.right {
                
                if gradientIndex < 4 {
                    gradientIndex += 1
                }
                else {
                    print("No more gradients")
                }
            }
            else if gesture.direction == UISwipeGestureRecognizer.Direction.left {
                
                if gradientIndex > 0 {
                    gradientIndex -= 1
                }
                else {
                    print("No more gradients")
                }
            }
            changeColors(index: gradientIndex)
        }
        
        func setGradient () {
            roseannaLayer = CAGradientLayer()
            view.layer.insertSublayer(roseannaLayer, at: 0)
        }
        
        func changeColors (index: Int) {
            
            let startColor = colors[index][0]
            let endColor = colors[index][1]
            
            roseannaLayer.colors = [startColor, endColor]
            
            gradientNameLabel.text = gradientNames[index]
        }

    }
