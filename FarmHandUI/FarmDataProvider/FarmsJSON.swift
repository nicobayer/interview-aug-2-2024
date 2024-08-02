
import Foundation

struct FarmsJSON: Decodable {
    let farms: [FarmJSON]

    struct FarmJSON: Decodable {
        let identifier: Int
        let name: String
        let crop: String
        let plantingDate: Date
    }
}

extension Farm {
    init(json: FarmsJSON.FarmJSON) {
        self.id = json.identifier
        self.name = json.name
        self.crop = json.crop
        self.plantedAt = json.plantingDate
    }
}
