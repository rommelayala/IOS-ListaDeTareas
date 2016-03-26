//
//  SecondViewController.swift
//  Lista de tareas
//
//  Created by Melo on 26/3/16.
//  Copyright © 2016 Melo. All rights reserved.
//

import UIKit


class SecondViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var addTarea: UIButton!
    @IBOutlet weak var addTareaText: UITextField!
    
    
    @IBAction func addTareaBoton(sender: AnyObject) {
        toDoList.append(addTareaText.text!)
        addTareaText.text = ""
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addTareaText.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//esconder teclado
    
    //funcion hace desaparecer el teclado cuando el textbox pierde el foco
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }

}

