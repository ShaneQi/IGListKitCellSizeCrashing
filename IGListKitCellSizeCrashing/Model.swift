//
//  Model.swift
//  IGListKitCellSizeCrashing
//
//  Created by Shane Qi on 1/27/17.
//  Copyright © 2017 Shane Qi. All rights reserved.
//

import IGListKit

class User: ListDiffable {
	
	var id: String = UUID().uuidString
	var messages: [String]
	var photos: [UIImage]
	
	init(messages: [String], photos: [UIImage]) {
		self.messages = messages
		self.photos = photos
	}
	
	func diffIdentifier() -> NSObjectProtocol {
		return id as NSObjectProtocol
	}
	
	func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
		guard let object = object as? User else { return false }
		return id == object.id
	}
	
}
