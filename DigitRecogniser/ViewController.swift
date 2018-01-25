//
//  ViewController.swift
//  DigitRecogniser
//
//  Created by Bhavin on 25/01/18.
//  Copyright © 2018 Bhavin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let digitView: CanvasView = {
       let view = CanvasView()
        view.backgroundColor = UIColor.black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let clearButton: UIButton = {
        let button = UIButton()
        button.setTitle("Clear", for: .normal)
        //button.backgroundColor = UIColor.green
        button.setTitleColor(UIColor.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        digitView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - 50)
        clearButton.frame = CGRect(x: 20, y: self.digitView.frame.height + 8, width: 70, height: 40)
        view.addSubview(digitView)
        view.addSubview(clearButton)
        clearButton.addTarget(self, action: #selector(clearTheCanvas), for: .touchUpInside)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func clearTheCanvas(){
        digitView.clearCanvas()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

