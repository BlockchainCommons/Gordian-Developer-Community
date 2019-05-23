//
//  Checked.swift
//  AirgappedSigning
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
import Bitcoin

public protocol Checked {
    /// Performs second-level validation and throws if it fails.
    func check() throws
}

func checkName(_ name: String?, context: String) throws {
    if let name = name {
        try checkNotEmpty(name, context: context)
    }
}

func checkAsset(_ asset: Asset, context: String) throws {
    guard ["BTC", "BTCT"].contains(asset.symbol) else {
        throw AirgappedSigningError("\(context): Unsupported asset: \(asset).")
    }
}

func checkAccountFormat(_ format: AccountFormat, context: String) throws {
    guard ["BIP44"].contains(format.rawValue) else {
        throw AirgappedSigningError("\(context): Unsupported account format: \(format).")
    }
}

func checkEqual<T: Equatable>(_ a: T, _ b: T, context: String) throws {
    guard a == b else {
        throw AirgappedSigningError("\(context): \(a) is not equal to \(b).")
    }
}

func checkNotEmpty(_ string: String, context: String) throws {
    guard !string.isEmpty else {
        throw AirgappedSigningError("\(context): Must be non-empty.")
    }
}

func checkNotEmpty(_ data: Data, context: String) throws {
    guard !data.isEmpty else {
        throw AirgappedSigningError("\(context): Must be non-empty.")
    }
}

func checkNotEmpty<C>(_ collection: C, context: String) throws where C: Collection {
    guard !collection.isEmpty else {
        throw AirgappedSigningError("\(context): Must be non-empty.")
    }
}

func checkNotNegative<N: BinaryInteger>(_ n: N, context: String) throws {
    guard n >= 0 else {
        throw AirgappedSigningError("\(context): Must be non-negative.")
    }
}

func checkPositive<N: BinaryInteger>(_ n: N, context: String) throws {
    guard n > 0 else {
        throw AirgappedSigningError("\(context): Must be positive.")
    }
}
