//
//  ViewController.swift
//  SuperKahramanKitabi
//
//  Created by kadir varol on 24.10.2025.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var superKahramanIsimleri = [String]()
    var superKahramanGorselIsimleri = [String]()
    
    var secilenIsim = ""
    var secilenGorsel = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Kahraman verilerini ekle
        superKahramanIsimleri = ["Batman", "Iron Man", "Spiderman", "Thor"]
        superKahramanGorselIsimleri = ["batman", "Ironman", "spiderMan", "Thor"]
    }
    
    // Kaç satır olacağını belirler
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superKahramanIsimleri.count
    }
    
    // Her hücrede ne gösterileceğini belirler
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = superKahramanIsimleri[indexPath.row]
        return cell
    }
    
    // Satır silme (swipe-to-delete) işlemi
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            superKahramanIsimleri.remove(at: indexPath.row)
            superKahramanGorselIsimleri.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // Satıra tıklanınca detay sayfasına git
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        secilenIsim = superKahramanIsimleri[indexPath.row]
        secilenGorsel = superKahramanGorselIsimleri[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    // Segue ile verileri aktarma
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailViewController
            destinationVC.secilenKahramanIsim = secilenIsim
            destinationVC.secilenKahramanGorsel = secilenGorsel
        }
    }
}

