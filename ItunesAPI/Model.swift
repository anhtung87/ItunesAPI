//
//  Model.swift
//  ItunesAPI
//
//  Created by Hoang Tung on 5/7/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import Foundation

struct Result: Codable {
  let resultCount: Int
  let results:[Item]
}

struct Item: Codable {
  let trackId: Int?
  let trackName: String?
  let collectionName: String?
  let artworkUrl100: String?
}
