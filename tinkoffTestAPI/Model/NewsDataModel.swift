//
//  NewsService.swift
//  tinkoffTestAPI
//
//  Created by Vladimir Valter on 09/09/2017.
//  Copyright © 2017 Vladimir Valter. All rights reserved.
//

import Foundation

struct News: Decodable {
    let resultCode: String
    let payload: [Payload]
    let trackingId: String
}

struct Payload: Decodable {
    let id: String
    let name: String
    let text: String
    let publicationDate: PublicationDate
    let bankInfoTypeId: Int
}

struct PublicationDate: Decodable {
    let milliseconds: Int
}

