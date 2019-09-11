//
//  SongTableViewCell.swift
//  ShuffleSongs
//
//  Created by Paulo Henrique dos Santos on 07/09/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    static var reuseIdentifier = "SongCell"
    var indexPath: IndexPath!
    private let imageCornerRadius: CGFloat = 8

    func setupWith(songViewModel: SongViewModel) {
        albumImage.layer.cornerRadius = imageCornerRadius
        titleLabel.text = songViewModel.title
        subtitleLabel.text = songViewModel.subTitle
        setupAccessibility()
        downloadImage(urlString: songViewModel.imageURL)
    }
    
    override func prepareForReuse() {
        albumImage.image = UIImage(named: "albumPlaceholder")
    }
    
    private func setupAccessibility() {
        self.accessibilityIdentifier = "Song Cell \(indexPath.row)"
    }
    
    private func downloadImage(urlString: String) {
        ImageDataManager.shared.loadImage(urlString: urlString, indexPath: indexPath) { [unowned self] (image, oldIndexPath) in
            if oldIndexPath == self.indexPath {
                self.albumImage.image = image
            }
        }
    }
}
