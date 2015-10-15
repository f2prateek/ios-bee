import UIKit
import XCTest

class BeeTests: XCTestCase {
    
    func testCharacters() {
        assertEqual("abcdef", expected: "Alfa Bravo Charlie Delta Echo Foxtrot")
        assertEqual("ghijkl", expected: "Golf Hotel India Juliett Kilo Lima")
        assertEqual("mnopqr", expected: "Mike November Oscar Papa Quebec Romeo")
        assertEqual("stuvw", expected: "Sierra Tango Uniform Victor Whiskey")
        assertEqual("xyz", expected: "X-ray Yankee Zulu")
    }
    
    func testDigits() {
        assertEqual("1234567890", expected: "One Two Three Four Five Six Seven Eight Nine Zero")
    }
    
    func testUnknown() {
        assertEqual(",./", expected:", . /");
    }
    
    func assertEqual(input: String, expected: String) {
        let got = Bee.spell(input)
        XCTAssertEqual(got, expected, String(format: "expected %s but got %s", expected, got))
    }
    
    func testPerformance() {
        self.measureBlock() {
            Bee.spell("abcdefghijklmnopqrstuvwxyz")
            Bee.spell("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
            Bee.spell("1234567890")
            Bee.spell(",./ ")
        }
    }
    
}
