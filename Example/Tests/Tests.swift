import XCTest
import AirgappedSigning

class Tests: XCTestCase {
    func decodeDocument(from json: String) throws -> Document {
        let data = json.data(using: .utf8)!
        let document = try JSONDecoder().decode(Document.self, from: data)
        try document.check()
        return document
    }

    func testThrowsOnNoContent() {
        let json = """
        {
            "header": {
                "format": "AirgappedSigning",
                "version": 1
            }
        }
        """
        XCTAssertThrowsError( try decodeDocument(from: json) )
    }

    func testThrowsOnNoHeader() {
        let json = """
        {
            "multiPart": {
                "uid": "449C40FE-E207-4AC9-B552-51B007B68D50",
                "part": 0,
                "count": 1,
                "data": "VGhlIHF1aWNrIGJyb3duIGZveCBqdW1wcyBvdmVyIHRoZSBsYXp5IGRvZy4K"
            }
        }
        """
        XCTAssertThrowsError( try decodeDocument(from: json) )
    }

    func testThrowsOnMoreThanOneContent() {
        let json = """
        {
            "header": {
                "format": "AirgappedSigning",
                "version": 1
            },
            "multiPart": {
                "uid": "449C40FE-E207-4AC9-B552-51B007B68D50",
                "part": 0,
                "count": 1,
                "data": "VGhlIHF1aWNrIGJyb3duIGZveCBqdW1wcyBvdmVyIHRoZSBsYXp5IGRvZy4K"
            },
            "recoveryWords": {
                "name": "Rainy Day",
                "format": "BIP39",
                "words": ["panda", "diary", "marriage", "suffer", "basic", "glare", "surge", "auto", "scissors", "describe", "sell", "unique"]
            }
        }
        """
        XCTAssertThrowsError( try decodeDocument(from: json) )
    }

    func testThrowsOnEmptyWords() {
        let json = """
        {
            "header": {
                "format": "AirgappedSigning",
                "version": 1
            },
            "recoveryWords": {
                "name": "Rainy Day",
                "format": "BIP39",
                "words": []
            }
        }
        """
        XCTAssertThrowsError( try decodeDocument(from: json) )
    }
}
