//
//  MyCustomTableViewCell.swift
//  TableViews
//
//  Created by Agustin Carbajal on 28/10/2023.
//

import UIKit

class MyCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var myFirstLabel: UILabel!
    @IBOutlet weak var mySecondLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // operacion que se llama cuando se instancia por primera vez
        myFirstLabel.font = UIFont.boldSystemFont(ofSize: 22)
        myFirstLabel.textColor = .blue
        mySecondLabel.numberOfLines = 0
        backgroundColor = .gray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        print(myFirstLabel.text ?? "")
    }
    
}
