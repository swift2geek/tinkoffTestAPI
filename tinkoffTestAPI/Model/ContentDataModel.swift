//
//  ContentDataModel.swift
//  tinkoffTestAPI
//
//  Created by Vladimir Valter on 10/09/2017.
//  Copyright © 2017 Vladimir Valter. All rights reserved.
//

import Foundation

struct Content: Decodable {
    let resultCode: String
    let payload: ContentPayload
    let trackingId: String
}

struct ContentPayload: Decodable {
    let title: Title
    let creationDate: PublicationDate
    let lastModificationDate: PublicationDate
    let content: String
    let bankInfoTypeId: Int
    let typeId: String
}

struct Title: Decodable {
    let id: String
    let name: String
    let text: String
    let publicationDate: PublicationDate
    let bankInfoTypeId: Int
}

