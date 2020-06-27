//
// Beer.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation


public struct Beer: Codable { 


    public var id: Int64?
    public var name: String?
    public var tagline: String?
    public var firstBrewed: String?
    public var description: String?
    public var imageUrl: String?
    public var abv: Double?
    public var ibu: Double?
    public var targetFg: Double?
    public var targetOg: Double?
    public var ebc: Double?
    public var srm: Double?
    public var ph: Double?
    public var pattenuationLevel: Double?

    public init(id: Int64?, name: String?, tagline: String?, firstBrewed: String?, description: String?, imageUrl: String?, abv: Double?, ibu: Double?, targetFg: Double?, targetOg: Double?, ebc: Double?, srm: Double?, ph: Double?, pattenuationLevel: Double?) {
        self.id = id
        self.name = name
        self.tagline = tagline
        self.firstBrewed = firstBrewed
        self.description = description
        self.imageUrl = imageUrl
        self.abv = abv
        self.ibu = ibu
        self.targetFg = targetFg
        self.targetOg = targetOg
        self.ebc = ebc
        self.srm = srm
        self.ph = ph
        self.pattenuationLevel = pattenuationLevel
    }

    public enum CodingKeys: String, CodingKey, CaseIterable { 
        case id
        case name
        case tagline
        case firstBrewed = "first_brewed"
        case description
        case imageUrl = "image_url"
        case abv
        case ibu
        case targetFg = "target_fg"
        case targetOg = "target_og"
        case ebc
        case srm
        case ph
        case pattenuationLevel = "pattenuation_level"
    }

}
