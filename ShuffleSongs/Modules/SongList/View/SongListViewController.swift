//
//  SongListViewController.swift
//  ShuffleSongs
//
//  Created by Paulo Henrique dos Santos on 05/09/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

class SongListViewController: UIViewController {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: SongListPresenterProtocol?
    var songViewModelList: [SongViewModel] = []
    
    let cellReuseIdentifier = SongTableViewCell.reuseIdentifier
    let cellNib = UINib(nibName: "SongTableViewCell", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.transform = CGAffineTransform(scaleX: 2, y: 2)
        setupTableView()
        setupNavigationBar()
        addShuffleButtonOnNavigationBar()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = UIColor(red: 70/255, green: 46/255, blue: 62/255, alpha: 0.72)
        navigationController?.navigationBar.tintColor = .white
    }
    
    private func setupTableView() {
        tableView.register(cellNib, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.tableFooterView = UIView()
    }
    
    private func addShuffleButtonOnNavigationBar() {
        let buttom = UIBarButtonItem(image: UIImage(named: "shuffle"), style: .done, target: self, action: #selector(self.shuffleButtonPressed(sender:)))
        navigationItem.rightBarButtonItem = buttom
    }
    
    @objc func shuffleButtonPressed(sender: UIBarButtonItem) {
        presenter?.shuffleDidTap()
    }
}

extension SongListViewController: SongListViewProtocol {
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func startLoadingAnimation() {
        DispatchQueue.main.async { [weak self] in
            self?.activityIndicator.startAnimating()
        }
    }
    
    func stopLoadingAnimation() {
        DispatchQueue.main.async { [weak self] in
            self?.activityIndicator.stopAnimating()
        }
    }
    
    func updateWith(songList: [SongViewModel]) {
        songViewModelList = songList
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension SongListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let songCell = cell as? SongTableViewCell
        let viewModel = songViewModelList[indexPath.row]
        songCell?.setupWith(songViewModel: viewModel)
    }
}

extension SongListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songViewModelList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? SongTableViewCell, indexPath.row < songViewModelList.count else {
            return UITableViewCell()
        }
        cell.indexPath = indexPath
        return cell
    }
}
