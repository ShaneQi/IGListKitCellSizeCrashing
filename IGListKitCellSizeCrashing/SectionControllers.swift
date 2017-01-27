//
//  SectionControllers.swift
//  IGListKitCellSizeCrashing
//
//  Created by Shane Qi on 1/27/17.
//  Copyright © 2017 Shane Qi. All rights reserved.
//

import IGListKit


class MessagesSectionController: IGListSectionController, IGListSectionType {
	
	var user: User!
	
	public func numberOfItems() -> Int { return (user?.messages.count ?? 1)}
	
	public func sizeForItem(at index: Int) -> CGSize {
		return CGSize(
			width: collectionContext!.containerSize.width,
			height: 50)
	}
	
	public func cellForItem(at index: Int) -> UICollectionViewCell {
		let cell = collectionContext?.dequeueReusableCellFromStoryboard(withIdentifier: "messageCell", for: self, at: index) as! MessageCell
		cell.textLabel.text = user?.messages[index]
		return cell
	}
	
	public func didUpdate(to object: Any) { user = object as? User }
	
	public func didSelectItem(at index: Int) {}
}

class PhotosSectionController: IGListSectionController, IGListSectionType {
	
	var user: User!
	
	public func numberOfItems() -> Int { return user.photos.count }
	
	public func sizeForItem(at index: Int) -> CGSize {
		/*
		Cell sizes are from object.
		Crashes because collection view asks
		size of a not-anymore existing cell.
		*/
		return user.photos[index].size
	}
	
	public func cellForItem(at index: Int) -> UICollectionViewCell {
		let cell = collectionContext?.dequeueReusableCellFromStoryboard(withIdentifier: "photoCell", for: self, at: index) as! PhotoCell
		cell.imageView.image = user.photos[index]
		return cell
	}
	
	public func didUpdate(to object: Any) { user = object as? User }
	
	public func didSelectItem(at index: Int) {}
}
