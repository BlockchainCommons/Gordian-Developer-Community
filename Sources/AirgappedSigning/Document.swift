//
//  Document.swift
//  AirgappedSigning_Example
//
//  Created by Wolf McNally on 4/23/19.
//
//  Copyright © 2019 Blockchain Commons.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

import Foundation

public struct Document: Codable, Checked {
    public let header: Header

    public let multiPart: MultiPart?
    public let recoveryWords: RecoveryWords?
    public let knownReceiver: KnownReceiver?
    public let account: Account?
    public let transaction: Transaction?

    private init(_multiPart: MultiPart? = nil, _recoveryWords: RecoveryWords? = nil, _knownReceiver: KnownReceiver? = nil, _account: Account? = nil, _transaction: Transaction? = nil) {
        header = Header()
        self.multiPart = _multiPart
        self.recoveryWords = _recoveryWords
        self.knownReceiver = _knownReceiver
        self.account = _account
        self.transaction = _transaction
    }

    public init(multiPart: MultiPart) {
        self.init(_multiPart: multiPart)
    }

    public init(recoveryWords: RecoveryWords) {
        self.init(_recoveryWords: recoveryWords)
    }

    public init(knownReceiver: KnownReceiver) {
        self.init(_knownReceiver: knownReceiver)
    }

    public init(account: Account) {
        self.init(_account: account)
    }

    public init(transaction: Transaction) {
        self.init(_transaction: transaction)
    }

    public func getMultiPart() throws -> MultiPart {
        guard let multiPart = multiPart else {
            throw AirgappedSigningError("Expected MultiPart.")
        }
        return multiPart
    }

    public func getRecoveryWords() throws -> RecoveryWords {
        guard let recoveryWords = recoveryWords else {
            throw AirgappedSigningError("Expected RecoveryWords.")
        }
        return recoveryWords
    }

    public func getKnownReceiver() throws -> KnownReceiver {
        guard let knownReceiver = knownReceiver else {
            throw AirgappedSigningError("Expected KnownReceiver.")
        }
        return knownReceiver
    }

    public func getAccount() throws -> Account {
        guard let account = account else {
            throw AirgappedSigningError("Expected Account.")
        }
        return account
    }

    public func getTransaction() throws -> Transaction {
        guard let transaction = transaction else {
            throw AirgappedSigningError("Expected Transaction.")
        }
        return transaction
    }

    public func check() throws {
        try header.check()

        let possibleContent: [Checked?] = [multiPart, recoveryWords, knownReceiver, account, transaction]
        let content = possibleContent.compactMap { $0 }
        guard content.count == 1 else {
            throw AirgappedSigningError("Document: Exactly one content type must be included. Got: \(content.count).")
        }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        header = try container.decode(Header.self, forKey: .header)
        multiPart = try container.decodeIfPresent(MultiPart.self, forKey: .multiPart)
        recoveryWords = try container.decodeIfPresent(RecoveryWords.self, forKey: .recoveryWords)
        knownReceiver = try container.decodeIfPresent(KnownReceiver.self, forKey: .knownReceiver)
        account = try container.decodeIfPresent(Account.self, forKey: .account)
        transaction = try container.decodeIfPresent(Transaction.self, forKey: .transaction)
        try check()
    }
}

public func getMultiPart(_ document: Document) throws -> MultiPart {
    return try document.getMultiPart()
}

public func getRecoveryWords(_ document: Document) throws -> RecoveryWords {
    return try document.getRecoveryWords()
}

public func getKnownReceiver(_ document: Document) throws -> KnownReceiver {
    return try document.getKnownReceiver()
}

public func getAccount(_ document: Document) throws -> Account {
    return try document.getAccount()
}

public func getTransaction(_ document: Document) throws -> Transaction {
    return try document.getTransaction()
}

public func wrapDocument(_ multiPart: MultiPart) -> Document {
    return Document(multiPart: multiPart)
}

public func wrapDocument(_ recoveryWords: RecoveryWords) -> Document {
    return Document(recoveryWords: recoveryWords)
}

public func wrapDocument(_ knownReceiver: KnownReceiver) -> Document {
    return Document(knownReceiver: knownReceiver)
}

public func wrapDocument(_ account: Account) -> Document {
    return Document(account: account)
}

public func wrapDocument(_ transaction: Transaction) -> Document {
    return Document(transaction: transaction)
}
