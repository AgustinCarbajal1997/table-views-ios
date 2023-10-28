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
        
        TableView.dataSource = self //data inicial
        TableView.delegate = self //recoger elementos
        TableView.tableFooterView = UIView() // para evitar que me cree celdas vacias para rellenar espacio
        
        //asociar la nueva vista de table cell con este controller
        TableView.register(UINib(nibName: "MyCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "mycustomcell")
    }


}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(myCountries[indexPath.row])
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCountries.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 50
        } else {
            return 200
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            // siempre reutilizar celdas ya creadas, para eso le asigno un identificador, se instancia
            var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            if cell == nil {
                // si nunca se creo, se la crea de la siguiente forma
                cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
                cell?.backgroundColor = .green
                cell?.textLabel?.font = UIFont.systemFont(ofSize: 20)
                cell?.selectionStyle = .default
                //cell?.accessoryType = .checkmark
                //cell?.accessoryType = .disclosureIndicator
            }
            
            cell!.textLabel?.text = myCountries[indexPath.row]
            return cell!
        } else {
            // siempre reutilizar celdas ya creadas, para eso le asigno un identificador, se instancia
            var cell = tableView.dequeueReusableCell(withIdentifier: "mycustomcell", for: indexPath) as? MyCustomTableViewCell
            
            cell?.myFirstLabel.text =  String(indexPath.row + 1)
            cell?.mySecondLabel.text =  myCountries[indexPath.row]
            
            return cell!
        }

    }
    
    
}

