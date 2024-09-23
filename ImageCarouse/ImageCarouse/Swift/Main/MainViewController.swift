//
//  MainViewController.swift
//  ImageCarouse
//
//  Created by APPLE on 23/09/24.
//
import UIKit

class MainViewController: UIViewController {

    let floatingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add", for: .normal)
        button.addTarget(MainViewController.self, action: #selector(showStatistics), for: .touchUpInside)
        return button
    }()

    var items: [String] = ["Apple", "Banana", "Orange", "Blueberry"]

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(floatingButton)
        floatingButton.frame = CGRect(x: view.frame.width - 70, y: view.frame.height - 100, width: 50, height: 50)
    }

    @objc func showStatistics() {
        let statsVC = StatisticsViewController(items: items)
        present(statsVC, animated: true)
    }
}

class StatisticsViewController: UIViewController {
    
    var items: [String]

    init(items: [String]) {
        self.items = items
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        let itemCountLabel = UILabel()
        itemCountLabel.text = "Item Count: \(items.count)"
        itemCountLabel.frame = CGRect(x: 20, y: 100, width: 200, height: 40)
        view.addSubview(itemCountLabel)

        let topThreeLabel = UILabel()
        let topThree = calculateTopThreeCharacters(items: items)
        topThreeLabel.text = "Top 3 Characters: \(topThree)"
        topThreeLabel.frame = CGRect(x: 20, y: 150, width: 300, height: 40)
        view.addSubview(topThreeLabel)
    }

    func calculateTopThreeCharacters(items: [String]) -> String {
        let characters = items.joined().reduce(into: [:]) { counts, letter in
            counts[String(letter), default: 0] += 1
        }
        let sorted = characters.sorted { $0.value > $1.value }.prefix(3)
        return sorted.map { "\($0.key): \($0.value)" }.joined(separator: ", ")
    }
}
