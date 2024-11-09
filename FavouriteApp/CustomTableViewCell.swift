//
//  CustomTableViewCell.swift
//  FavouriteApp
//
//  Created by Ляззат Аманбаева on 09.11.2024.
//


// CustomTableViewCell.swift
import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    // Метод для настройки ячейки с данными
    func configure(with item: FavoriteItem) {
        titleLabel.text = item.title
        subtitleLabel.text = item.subtitle
    }
}

