//
//  ViewController.swift
//  TableViews
//
//  Created by Agustin Carbajal on 28/10/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TableView: UITableView!
    
    private let myCountries = ["Argentina", "Mexico", "España", "Estados Unidos"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.dataSource = self
        TableView.tableFooterView = UIView() // para evitar que me cree celdas vacias para rellenar espacio
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCountries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // siempre reutilizar celdas ya creadas, para eso le asigno un identificador
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            // si nunca se creo, se la crea de la siguiente forma
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            cell?.backgroundColor = .green
            cell?.textLabel?.font = UIFont.systemFont(ofSize: 20)
        }
        
        cell!.textLabel?.text = myCountries[indexPath.row]
        return cell!
    }
    
    
}

