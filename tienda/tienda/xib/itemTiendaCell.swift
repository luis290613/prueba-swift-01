//
//  itemTiendaCell.swift
//  tienda
//
//  Created by Luis Diego Ruiz Bautista on 7/12/21.
//  Copyright © 2021 Luis Diego Ruiz Bautista. All rights reserved.
//

import UIKit

class itemTiendaCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var descripcion: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func cargaData(item : Producto){
        self.image.image = UIImage(named: item.imagen)
        self.descripcion.text = item.descripcion
    }

}
