//
//  SongListRouter.swift
//  ShuffleSongs
//
//  Created by Paulo Henrique dos Santos on 06/09/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

class SongListRouter: SongListRouterProtocol {
    weak var baseViewController: UIViewController?
    var storyboard: UIStoryboard {
        return UIStoryboard(name: "SongListView", bundle: Bundle.main)
    }
    
    func build() -> UIViewController {
        let interactor = SongListInteractor()
        let presenter = SongListPresenter()
        let router = SongListRouter()
        let viewController = storyboard.instantiateViewController(withIdentifier: "SongListView") as! SongListViewController
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        return viewController
    }
}
