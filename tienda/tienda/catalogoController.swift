//
//  catalogoController.swift
//  tienda
//
//  Created by Luis Diego Ruiz Bautista on 7/12/21.
//  Copyright © 2021 Luis Diego Ruiz Bautista. All rights reserved.
//

import UIKit
import Foundation
class catalogoController: UIViewController {
    
    @IBOutlet weak var constrainsSearch: NSLayoutConstraint!
    @IBOutlet weak var constraintBuscar: NSLayoutConstraint!
    @IBOutlet weak var viewBuscar: UIView!
    
    @IBOutlet weak var txtBuscar: UITextField!
    
    @IBAction func btnBuscar(_ sender: Any) {
     alerta(title: "Falta de tiempo ", mensaje: "para la 2.0 :D")
    }
    func alerta(title : String,mensaje: String){
        let alert = UIAlertController(title: title, message: mensaje, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBOutlet weak var clvCatalogo: UICollectionView!
    
    let myCellWidth = UIScreen.main.bounds.width / 2
    var barraBusqueda = true
    var listProductos : [Producto] = [
        Producto(imagen: "leche", descripcion: "Leche gloria"),
        Producto(imagen: "yo1", descripcion: "Leche ideal"),
        Producto(imagen: "yo2", descripcion: "Leche vida"),
        Producto(imagen: "yo3", descripcion: "Leche gloria"),
        Producto(imagen: "yo4", descripcion: "Leche ideal"),
        Producto(imagen: "leche", descripcion: "Leche gloria"),
        Producto(imagen: "yo1", descripcion: "Leche ideal"),
        Producto(imagen: "yo2", descripcion: "Leche vida"),
        Producto(imagen: "yo3", descripcion: "Leche gloria"),
        Producto(imagen: "yo4", descripcion: "Leche ideal"),
        Producto(imagen: "leche", descripcion: "Leche gloria"),
        Producto(imagen: "yo1", descripcion: "Leche ideal"),
        Producto(imagen: "yo2", descripcion: "Leche vida"),
        Producto(imagen: "yo3", descripcion: "Leche gloria"),
        Producto(imagen: "yo4", descripcion: "Leche ideal"),
        Producto(imagen: "leche", descripcion: "Leche gloria"),
        Producto(imagen: "yo1", descripcion: "Leche ideal"),
        Producto(imagen: "yo2", descripcion: "Leche vida"),
        Producto(imagen: "yo3", descripcion: "Leche gloria"),
        Producto(imagen: "yo4", descripcion: "Leche ideal"),
        Producto(imagen: "leche", descripcion: "Leche gloria"),
        Producto(imagen: "yo1", descripcion: "Leche ideal"),
        Producto(imagen: "yo2", descripcion: "Leche vida"),
        Producto(imagen: "yo3", descripcion: "Leche gloria"),
        Producto(imagen: "yo4", descripcion: "Leche ideal"),
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollection()
        botonesNavigation()
    }

    func configCollection(){
        self.clvCatalogo.delegate = self
        self.clvCatalogo.dataSource = self
        self.clvCatalogo.register(UINib(nibName: "itemTiendaCell", bundle: nil), forCellWithReuseIdentifier: "mycell")
    }
       
    func botonesNavigation(){
        self.title = "Productos"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "mapa"), style: .plain, target: self, action: #selector(goToMapa))
        //navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "buscar"), style: .plain, target: self, action: #selector(mostrarOcultarBuscador))
    }
      
    @objc func goToMapa(){
        let vc = mapaController()
      vc.modalPresentationStyle = .overFullScreen
      self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func mostrarOcultarBuscador(){
        
        
        if barraBusqueda {
            barraBusqueda = false
            UIView.animate(withDuration: 1, animations: {
                         
                self.constraintBuscar.constant = 54
                self.constrainsSearch.constant = 30
                       })
        }else{
            barraBusqueda = true
            UIView.animate(withDuration: 1, animations: {
                         
                self.constraintBuscar.constant = 0
                self.constrainsSearch.constant = 0
                       })
        }
        
        
    }


}
extension catalogoController: UICollectionViewDataSource {

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listProductos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as? itemTiendaCell
        cell?.cargaData(item: listProductos[indexPath.row])
        return cell!
    }

}
extension catalogoController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.section) -> \(indexPath.row) \(listProductos[indexPath.row])")
    }

}
extension catalogoController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.clvCatalogo.frame.size.width/3, height: myCellWidth)
    }
    
}

struct Producto {
    var imagen : String
    var descripcion : String
}
