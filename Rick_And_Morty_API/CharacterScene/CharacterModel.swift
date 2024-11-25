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
        image = try container?.decode(String.self, forKey: .image) ?? String()
        episode = try container?.decode([String].self, forKey: .episode) ?? [String]()
        url = try container?.decode(String.self, forKey: .url) ?? String()
    }
}
