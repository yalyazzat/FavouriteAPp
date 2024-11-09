//
//  DetailViewController.swift
//  FavouriteApp
//
//  Created by Ляззат Аманбаева on 10.11.2024.
//

import UIKit

class DetailViewController: UIViewController {
    // Ваши аутлеты и код
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var favoriteItem: FavoriteItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Настройка UI с переданными данными
        if let item = favoriteItem {
            titleLabel.text = item.title          // Название фильма
            subtitleLabel.text = item.subtitle    // Жанр фильма
            descriptionLabel.text = item.description  // Описание фильма (длинный текст)
        }
        
        let backButton = UIBarButtonItem(title: "Назад", style: .plain, target: self, action: #selector(backButtonTapped))
            self.navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
