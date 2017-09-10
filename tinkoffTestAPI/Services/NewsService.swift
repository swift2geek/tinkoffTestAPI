//
//  NewsService.swift
//  tinkoffTestAPI
//
//  Created by Vladimir Valter on 09/09/2017.
//  Copyright © 2017 Vladimir Valter. All rights reserved.
//

import Foundation

class NewsService {
    static let instance = NewsService()

    var news: News?
    var payloads = [Payload]()
    var content: Content?
    var contentPayload: ContentPayload?

    func getAllNews(completion: @escaping CompletionHandler) {
        let jsonUrlString = BASE_URL
        guard let url = URL(string: jsonUrlString) else {return}

        URLSession.shared.dataTask(with: url) { (data,
            response, err) in
            // check err
            // check reponse status 200 OK
            guard let data = data else { return }

            do {
                self.news = try JSONDecoder().decode(News.self, from: data)
                self.payloads = self.news!.payload
                NSLog("\(self.payloads[0].publicationDate.milliseconds)")
                NSLog("\(self.payloads[1].publicationDate.milliseconds)")
                NSLog("\(self.payloads[2].publicationDate.milliseconds)")
                completion(true)
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }

            }.resume()
    }

    func getContent(withId: String, completion: @escaping CompletionHandler) {
        let jsonUrlString = CONTENT_URL + withId
        guard let url = URL(string: jsonUrlString) else {return}

        URLSession.shared.dataTask(with: url) { (data,
            response, err) in
            // check err
            // check reponse status 200 OK
            guard let data = data else { return }

            do {
                self.content = try JSONDecoder().decode(Content.self, from: data)
                self.contentPayload = self.content?.payload
                completion(true)
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }

            }.resume()
    }

}
