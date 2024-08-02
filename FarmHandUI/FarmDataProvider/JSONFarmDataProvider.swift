
import Foundation

class JSONFarmDataProvider {

    private let farms: [Farm]

    init() {
        let file = Bundle.main.url(forResource: "farms", withExtension: "json")!
        let data = try! Data(contentsOf: file)

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.iso8601Full)

        let farmsJSON = try! decoder.decode(FarmsJSON.self, from: data)
        self.farms = farmsJSON.farms.map(Farm.init)
    }

    func farmForIdentifier(_ identifier: Int, completion: @escaping (Farm) -> Void) {
        DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + 2) {
            let index = identifier - 1 // WARNING: manual adjustment
            completion(self.farms[index])
        }
    }
}

extension JSONFarmDataProvider: FarmDataProvider {
    var numberOfFarms: Int {
        farms.count
    }

    func farm(at index: Int) -> Farm {
        farms[index]
    }
}
