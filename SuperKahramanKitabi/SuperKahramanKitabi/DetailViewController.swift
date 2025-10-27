//
//  DetailViewController.swift
//  SuperKahramanKitabi
//
//  Created by kadir varol on 24.10.2025.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    var secilenKahramanIsim = ""
    var secilenKahramanGorsel = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: secilenKahramanGorsel)
        label.text = secilenKahramanIsim
    }
    

}
