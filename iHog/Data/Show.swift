//
//  Show.swift
//  iHog
//
//  Created by Maegan Wilson on 9/16/20.
//

import Foundation

struct Show: Identifiable, Hashable {
    let id: UUID = UUID()
    var name: String
    var dateCreated: Date
    var dateLastModified: Date
    var note: String
}

var testShows: [Show] = [
    Show(name: "Mary Poppins", dateCreated: Date(), dateLastModified: Date(), note: "Current show"),
    Show(name: "Avengers", dateCreated: Date(), dateLastModified: Date(), note: "Current show"),
    Show(name: "Hamilton", dateCreated: Date(), dateLastModified: Date(), note: "Current show"),
    Show(name: "Lover Fest", dateCreated: Date(), dateLastModified: Date(), note: "Current show"),
    Show(name: "folklore", dateCreated: Date(), dateLastModified: Date(), note: "Current show"),
    Show(name: "Newsies", dateCreated: Date(), dateLastModified: Date(), note: "Current show"),
    Show(name: "Book of Mormon", dateCreated: Date(), dateLastModified: Date(), note: "Current show"),
    Show(name: "Lion King", dateCreated: Date(), dateLastModified: Date(), note: "Current show"),
    Show(name: "Captain Marvel", dateCreated: Date(), dateLastModified: Date(), note: "Current show"),
    Show(name: "WWDC 2021", dateCreated: Date(), dateLastModified: Date(), note: "Current show")
]
