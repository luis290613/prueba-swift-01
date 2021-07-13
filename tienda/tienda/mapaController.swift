//
//  mapaController.swift
//  tienda
//
//  Created by Luis Diego Ruiz Bautista on 7/12/21.
//  Copyright © 2021 Luis Diego Ruiz Bautista. All rights reserved.
//

import UIKit
import Foundation
import GoogleMaps
class mapaController: UIViewController {
    
    var listMarkers : [Marcadores] = [
        Marcadores(latitud: -12.04646987173534, longitud: -77.04275380024174, titulo: "tienda 01", descripcion: "Decripcion 01"),
         Marcadores(latitud: -11.960100718798815, longitud: -76.98810058838379, titulo: "tienda 02", descripcion: "Decripcion 02"),
         Marcadores(latitud: -11.970596451078068, longitud: -77.00947242976709, titulo: "tienda 03", descripcion: "Decripcion 03"),
         Marcadores(latitud: -12.100136347832676, longitud: -77.02060828648668, titulo: "tienda 04", descripcion: "Decripcion 04"),
         Marcadores(latitud: -12.021535568894471, longitud: -77.0564383095293, titulo: "tienda 05", descripcion: "Decripcion 05"),
         Marcadores(latitud: -12.02883897772345, longitud: -76.99687181260998, titulo: "tienda 06", descripcion: "Decripcion 06")
    ]
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let camera = GMSCameraPosition.camera(withLatitude: -12.04646987173534, longitude: -77.04275380024174, zoom: 12.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        mapView.mapType = .normal
        mapView.isMyLocationEnabled = true
        
        for item in listMarkers {
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: item.latitud, longitude: item.longitud)
            marker.title = item.titulo
            marker.snippet = item.descripcion
            marker.icon = UIImage(named: "tienda")
            marker.map = mapView
        }
        botones()
       
    }
    
    func botones(){
        self.title = "Locales"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(back))
    }
    
    @objc func back(){
    self.navigationController?.popViewController(animated: true)
    }


}
struct Marcadores {
    var latitud : Double
    var longitud : Double
    var titulo : String
    var descripcion : String
}
