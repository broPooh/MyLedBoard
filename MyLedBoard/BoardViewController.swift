//
//  BoardViewController.swift
//  LEDBoard
//
//  Created by bro on 2022/04/29.
//

import UIKit

class BoardViewController: UIViewController {

    @IBOutlet var boardView: UIView!
    @IBOutlet var boardTextField: UITextField!
    @IBOutlet var boardLabel: UILabel!
    @IBOutlet var colorBtn: UIButton!
    @IBOutlet var sendBtn: UIButton!
    
    let colorArray = [UIColor.red, UIColor.blue, UIColor.brown, UIColor.cyan, UIColor.green, UIColor.orange]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initButtonUI(button: sendBtn, color: .black)
        initButtonUI(button: colorBtn, color: .red)

    }
    
    func initButtonUI(button btn : UIButton, color color : UIColor) {
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.borderWidth = 2
        btn.layer.cornerRadius = 10
        btn.setTitleColor(.darkGray, for: .highlighted)
    }
    
    
    func getLabelText() -> String {
        return boardTextField.text != nil ? boardTextField.text! : "글을 입력해주세요"
    }
    
    @IBAction func sendBtnClicked(_ sender: UIButton) {
        boardLabel.text = getLabelText()
    }
    
    
    func getRandomColor(random randomNum : Int) -> UIColor {
        return colorArray[randomNum]
    }

    @IBAction func colorBtnClicked(_ sender: UIButton) {
        boardLabel.textColor = getRandomColor(random: Int.random(in: 0...5))
    }
    
    
    @IBAction func returnKeyClicked(_ sender: Any) {
        view.endEditing(true)
    }


    @IBAction func tapClicked(_ sender: UITapGestureRecognizer) {
        if boardView.isHidden {
            boardView.isHidden = false
        } else {
            boardView.isHidden = true
        }
    
    }
}
