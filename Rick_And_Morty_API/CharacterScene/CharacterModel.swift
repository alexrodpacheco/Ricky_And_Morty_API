struct CharacterModel: Decodable {
    let results: [CharacterModelResult]
    
    enum CodingKeys: CodingKey {
        case results
    }
    
    init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        results = try container?.decode([CharacterModelResult].self, forKey: .results) ?? []
    }
}

struct CharacterModelResult: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
//    var origin: CharacterModelOrigin
//    var location: CharacterModelLocation
    let image: String
    let episode: [String]
    let url: String
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case status
        case species
        case type
        case gender
//        case origin
//        case location
        case image
        case episode
        case url
    }
    
    init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        id = try container?.decode(Int.self, forKey: .id) ?? Int()
        name = try container?.decode(String.self, forKey: .name) ?? String()
        status = try container?.decode(String.self, forKey: .status) ?? String()
        species = try container?.decode(String.self, forKey: .species) ?? String()
        type = try container?.decode(String.self, forKey: .type) ?? String()
        gender = try container?.decode(String.self, forKey: .gender) ?? String()
//        let originContainer = try container?.nestedContainer(keyedBy: CodingKeys.self, forKey: .origin)
//        origin = try originContainer?.decode(CharacterModelOrigin.self, forKey: .origin)
        image = try container?.decode(String.self, forKey: .image) ?? String()
        episode = try container?.decode([String].self, forKey: .episode) ?? [String]()
        url = try container?.decode(String.self, forKey: .url) ?? String()
    }
}

struct CharacterModelOrigin: Decodable {
    var name: String
    var url: String
    
    enum CodingKeys: CodingKey {
        case name, url
    }
    
    init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        name = try container?.decode(String.self, forKey: .name) ?? String()
        url = try container?.decode(String.self, forKey: .url) ?? String()
    }
}

struct CharacterModelLocation: Decodable {
    var image: String
    var url: String
    
    enum CodingKeys: CodingKey {
        case image, url
    }
    
    init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        image = try container?.decode(String.self, forKey: .image) ?? String()
        url = try container?.decode(String.self, forKey: .url) ?? String()
    }
}
