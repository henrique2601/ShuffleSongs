//
//  UIImageView+Cache.swift
//  ShuffleSongs
//
//  Created by Paulo Henrique dos Santos on 08/09/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

class ImageDataManager {
    
    static let shared = ImageDataManager()
    
    private var imageCache = NSCache<AnyObject, AnyObject>()
    
    private init() { }
    
    func loadImage(urlString: String, indexPath: IndexPath, completitionHandler: @escaping (UIImage, IndexPath) -> Void) {
        
        if let cacheImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            completitionHandler(cacheImage, indexPath)
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            if let error = error {
                print("Couldn't download image: ", error)
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else { return }
            self?.imageCache.setObject(image, forKey: urlString as AnyObject)
            
            DispatchQueue.main.async {
                completitionHandler(image, indexPath)
            }
        }
        
        DispatchQueue.global(qos: .background).async {
            dataTask.resume()
        }
    }
}
