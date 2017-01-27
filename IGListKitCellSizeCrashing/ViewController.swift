//
//  ViewController.swift
//  IGListKitCellSizeCrashing
//
//  Created by Shane Qi on 1/27/17.
//  Copyright © 2017 Shane Qi. All rights reserved.
//

import UIKit
import IGListKit

class ViewController: UIViewController {
	
	@IBOutlet var collectionView: IGListCollectionView!
	var adapter: IGListAdapter!
	
	var user = User(messages: ["Hey man!", "What's up!", "Happy new year!", "On my way!"], photos: [#imageLiteral(resourceName: "1"), #imageLiteral(resourceName: "2"),#imageLiteral(resourceName: "3")])
	var mode = Mode.photos
	
	enum Mode { case messages, photos }
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		/* Won't crash if comment out estimatedItemSize setting. */
		let layout = UICollectionViewFlowLayout()
		layout.estimatedItemSize = CGSize(width: 100, height: 40)
		collectionView.setCollectionViewLayout(layout, animated: false)
		
		adapter = IGListAdapter(updater: IGListAdapterUpdater(), viewController: self, workingRangeSize: 0)
		adapter.collectionView = collectionView
		adapter.dataSource = self
	}
	
	@IBAction func didTapSwitchModeButton() {
		if mode == .messages { mode = .photos }
		else { mode = .messages }
		/* performUpdates doesn't work since object didn't change. */
//		adapter.performUpdates(animated: false, completion: nil)
		adapter.reloadData(completion: nil)
	}
	
}

extension ViewController: IGListAdapterDataSource {
	
	public func objects(for listAdapter: IGListAdapter) -> [IGListDiffable] {
		return [user]
	}
	
	public func listAdapter(_ listAdapter: IGListAdapter, sectionControllerFor object: Any) -> IGListSectionController {
		switch mode {
		case .messages:
			return MessagesSectionController()
		case .photos:
			return PhotosSectionController()
		}
	}
	
	public func emptyView(for listAdapter: IGListAdapter) -> UIView? { return nil }
	
}

