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
            "recoveryWords": {
                "name": "Rainy Day",
                "format": "BIP39",
                "words": ["panda", "diary", "marriage", "suffer", "basic", "glare", "surge", "auto", "scissors", "describe", "sell", "unique"]
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
            "recoveryWords": {
                "name": "Rainy Day",
                "format": "BIP39",
                "words": ["panda", "diary", "marriage", "suffer", "basic", "glare", "surge", "auto", "scissors", "describe", "sell", "unique"]
            },
            "knownReceiver": {
                "name": "Example",
                "asset": "BTC",
                "address": "1BvBMSEYstWetqTFn5Au4m4GFg7xJaNVN2"
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

    func test1() throws {
        let json = """
        {
            "header": {
                "format": "AirgappedSigning",
                "version": 1
            },
            "recoveryWords": {
                "name": "Rainy Day",
                "format": "BIP39",
                "words": ["panda", "diary", "marriage", "suffer", "basic", "glare", "surge", "auto", "scissors", "describe", "sell", "unique"]
            }
        }
        """

        let data = json.data(using: .utf8)!

        let decoded = try JSONDecoder().decode(AirgappedSigning.Document.self, from: data)

        dump(decoded)
    }
}
