//
//  ViewController.swift
//  tienda
//
//  Created by Luis Diego Ruiz Bautista on 7/12/21.
//  Copyright © 2021 Luis Diego Ruiz Bautista. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtContra: UITextField!
    
    
    var listUsuario : [Usuario] = [
        Usuario(usu: "luis@gmail.com", pass: "12345678"),
        Usuario(usu: "diego@gmail.com", pass: "12345678")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func btnIniciarSesion(_ sender: Any) {
        validaUsuario()
    }
    func validaUsuario() {
        if txtUsuario.text == "" || txtContra.text == "" {
          return alerta(title: "Error",mensaje: "todos los campos son requeridos")
        }
        
        for item in listUsuario {
            if item.usu == txtUsuario.text && item.pass == txtContra.text {
            return gotToCatalogo()
            }
        }
        
     return  alerta(title: "Error",mensaje: "credenciales incorrectas")
    }
    func gotToCatalogo(){
       
        
        let VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "catalogoController") as! catalogoController
        let navRootView = UINavigationController(rootViewController: VC)
        navRootView.modalPresentationStyle = .overFullScreen
        
        self.present(navRootView, animated: true, completion: nil)
        
        
    }
    
    func alerta(title : String,mensaje: String){
        let alert = UIAlertController(title: title, message: mensaje, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    


}

struct Usuario {
    var usu : String = ""
    var pass : String = ""
}

