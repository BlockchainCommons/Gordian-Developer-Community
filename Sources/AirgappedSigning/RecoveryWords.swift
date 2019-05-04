//
//  RecoveryWords.swift
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
import Bitcoin
import WolfCore

public struct RecoveryWords: Codable, Checked {
    public let name: String?
    public let format: Format
    public let words: [String]

    public init(name: String?, format: Format = .BIP39, words: [String]) throws {
        self.name = name
        self.format = format
        self.words = words
        try check()
    }

    public init(name: String?, format: Format = .BIP39, mnemonic: Mnemonic) throws {
        let words = mnemonic®.split(separator: " ").map { String($0) }
        try self.init(name: name, format: format, words: words)
    }

    public func check() throws {
        try checkName(name, context: "RecoveryWords.name")
        try checkNotEmpty(words, context: "RecoveryWords.words")
    }

    public enum Format: String, Codable {
        case BIP39
    }

    public var mnemonic: Mnemonic {
        return words.joined(separator: " ") |> tagMnemonic
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        format = try container.decode(Format.self, forKey: .format)
        words = try container.decode([String].self, forKey: .words)
        try check()
    }
}
