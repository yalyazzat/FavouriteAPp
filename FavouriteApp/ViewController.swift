//
//  ViewController.swift
//  FavouriteApp
//
//  Created by Ляззат Аманбаева on 09.11.2024.
//

// ViewController.swift

// ViewController.swift
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    

    @IBOutlet weak var tableView: UITableView!
    
    
    // Массив с данными о фильмах (с длинными описаниями)
        let favoriteItems = [
            FavoriteItem(title: "Inception", subtitle: "Sci-Fi", description: "A mind-bending thriller about dreams within dreams. Inception explores the idea of shared dreams and the potential of infiltrating the subconscious mind of others, leading to a journey that pushes the boundaries of reality."),
            FavoriteItem(title: "The Matrix", subtitle: "Action", description: "A hacker discovers the world is a simulation created by intelligent machines. He is led by a mysterious figure, Morpheus, to uncover the truth about the Matrix and fight for the freedom of humanity."),
            FavoriteItem(title: "The Dark Knight", subtitle: "Action", description: "Batman faces his greatest enemy, the Joker, a criminal mastermind who wants to bring Gotham to its knees. The battle between good and evil intensifies as Batman must confront the moral dilemma of justice."),
            FavoriteItem(title: "Titanic", subtitle: "Romance", description: "A young couple falls in love aboard the ill-fated R.M.S. Titanic. Amidst the grandeur of the ship's maiden voyage, Jack and Rose struggle against the constraints of society and class, their love growing as disaster strikes."),
            FavoriteItem(title: "The Godfather", subtitle: "Crime", description: "The story of the powerful Corleone family, and the dramatic rise of Michael Corleone as the head of the family business. Loyalty, betrayal, and vengeance intertwine as the family deals with external and internal conflicts.")
        ]

        override func viewDidLoad() {
            super.viewDidLoad()

            // Настройка делегатов для таблицы
            tableView.dataSource = self
            tableView.delegate = self
            
            // Регистрация кастомной ячейки (если необходимо)
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "FavoriteItemCell")
        }

        // MARK: - UITableView DataSource

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return favoriteItems.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteItemCell", for: indexPath)
            let item = favoriteItems[indexPath.row]
            
            // Устанавливаем название и подзаголовок в ячейку
            cell.textLabel?.text = item.title  // Название фильма
            cell.detailTextLabel?.text = item.subtitle // Жанр фильма (подзаголовок)
            
            return cell
        }

        // MARK: - UITableView Delegate

        // При нажатии на ячейку переходим на экран с деталями
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let selectedItem = favoriteItems[indexPath.row]
            performSegue(withIdentifier: "showDetail", sender: selectedItem)
        }

        // Подготовка данных перед переходом на DetailViewController
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showDetail" {
                if let detailVC = segue.destination as? DetailViewController,
                   let item = sender as? FavoriteItem {
                    detailVC.favoriteItem = item
                }
            }
        }
}

