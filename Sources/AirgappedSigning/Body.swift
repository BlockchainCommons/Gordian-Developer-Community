//
//  Body.swift
//  AirgappedSigning
//
//  Created by Wolf McNally on 5/4/19.
//

import Foundation

public enum Body: Codable {
    case multiPart(MultiPart)
    case recoveryWords(RecoveryWords)
    case knownReceiver(KnownReceiver)
    case account(Account)
    case transaction(Transaction)

    enum CodingKeys: String, CodingKey {
        case multiPart
        case recoveryWords
        case knownReceiver
        case account
        case transaction
        case missing
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let multiPart = try container.decodeIfPresent(MultiPart.self, forKey: .multiPart) {
            self = .multiPart(multiPart)
        } else if let recoveryWords = try container.decodeIfPresent(RecoveryWords.self, forKey: .recoveryWords) {
            self = .recoveryWords(recoveryWords)
        } else if let knownReceiver = try container.decodeIfPresent(KnownReceiver.self, forKey: .knownReceiver) {
            self = .knownReceiver(knownReceiver)
        } else if let account = try container.decodeIfPresent(Account.self, forKey: .account) {
            self = .account(account)
        } else if let transaction = try container.decodeIfPresent(Transaction.self, forKey: .transaction) {
            self = .transaction(transaction)
        } else {
            throw DecodingError.dataCorruptedError(forKey: .missing, in: container, debugDescription: "Expected exactly one document value.")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .multiPart(let value):
            try container.encode(value, forKey: .multiPart)
        case .recoveryWords(let value):
            try container.encode(value, forKey: .recoveryWords)
        case .knownReceiver(let value):
            try container.encode(value, forKey: .knownReceiver)
        case .account(let value):
            try container.encode(value, forKey: .account)
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

public func getTransaction(_ document: Document) throws -> Transaction {
    guard case let .transaction(transaction) = document.body else {
        throw AirgappedSigningError("Expected Transaction.")
    }
    return transaction
}
