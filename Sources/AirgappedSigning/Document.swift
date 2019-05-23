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

public struct Document: Codable {
    public let header: Header
    public let body: Body

    public enum Body {
        case multiPart(MultiPart)
        case recoveryWords(RecoveryWords)
        case knownReceiver(KnownReceiver)
        case account(Account)
        case accountRequest(AccountRequest)
        case transaction(Transaction)
    }

    public init(_ body: Body) {
        header = Header()
        self.body = body
    }

    enum CodingKeys: String, CodingKey {
        case header
        case multiPart
        case recoveryWords
        case knownReceiver
        case account
        case accountRequest
        case transaction
        case missing
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        header = try container.decode(Header.self, forKey: .header)
        if let multiPart = try container.decodeIfPresent(MultiPart.self, forKey: .multiPart) {
            body = .multiPart(multiPart)
        } else if let recoveryWords = try container.decodeIfPresent(RecoveryWords.self, forKey: .recoveryWords) {
            body = .recoveryWords(recoveryWords)
        } else if let knownReceiver = try container.decodeIfPresent(KnownReceiver.self, forKey: .knownReceiver) {
            body = .knownReceiver(knownReceiver)
        } else if let account = try container.decodeIfPresent(Account.self, forKey: .account) {
            body = .account(account)
        } else if let accountRequest = try container.decodeIfPresent(AccountRequest.self, forKey: .accountRequest) {
            body = .accountRequest(accountRequest)
        } else if let transaction = try container.decodeIfPresent(Transaction.self, forKey: .transaction) {
            body = .transaction(transaction)
        } else {
            throw DecodingError.dataCorruptedError(forKey: .missing, in: container, debugDescription: "Expected a document value.")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(header, forKey: .header)
        switch body {
        case .multiPart(let value):
            try container.encode(value, forKey: .multiPart)
        case .recoveryWords(let value):
            try container.encode(value, forKey: .recoveryWords)
        case .knownReceiver(let value):
            try container.encode(value, forKey: .knownReceiver)
        case .account(let value):
            try container.encode(value, forKey: .account)
        case .accountRequest(let value):
            try container.encode(value, forKey: .accountRequest)
        case .transaction(let value):
            try container.encode(value, forKey: .transaction)
        }
    }
}

public func getMultiPart(_ document: Document) throws -> MultiPart {
    guard case let .multiPart(multiPart) = document.body else {
        throw AirgappedSigningError("Expected MultiPart.")
    }
    return multiPart
}

public func getRecoveryWords(_ document: Document) throws -> RecoveryWords {
    guard case let .recoveryWords(recoveryWords) = document.body else {
        throw AirgappedSigningError("Expected RecoveryWords.")
    }
    return recoveryWords
}

public func getKnownReceiver(_ document: Document) throws -> KnownReceiver {
    guard case let .knownReceiver(knownReceiver) = document.body else {
        throw AirgappedSigningError("Expected KnownReceiver.")
    }
    return knownReceiver
}

public func getAccount(_ document: Document) throws -> Account {
    guard case let .account(account) = document.body else {
        throw AirgappedSigningError("Expected Account.")
    }
    return account
}

public func getAccountRequest(_ document: Document) throws -> AccountRequest {
    guard case let .accountRequest(accountRequest) = document.body else {
        throw AirgappedSigningError("Expected AccountRequest.")
    }
    return accountRequest
}

public func getTransaction(_ document: Document) throws -> Transaction {
    guard case let .transaction(transaction) = document.body else {
        throw AirgappedSigningError("Expected Transaction.")
    }
    return transaction
}
