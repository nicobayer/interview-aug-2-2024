
import Foundation

protocol FarmDataProvider {
    var numberOfFarms: Int { get }
    func farm(at index: Int) -> Farm
}
