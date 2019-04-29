//
//  MultiPart.swift
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

public struct MultiPart: Codable, Checked {
    public let uid: UUID
    public let part: Int
    public let count: Int
    public let data: Data

    public func check() throws {
        try checkNotNegative(part, context: "Multipart.part")
        try checkPositive(count, context: "Multipart.count")
        try checkNotEmpty(data, context: "Multipart.data")
    }

    public init(uid: UUID, part: Int, count: Int, data: Data) throws {
        self.uid = uid
        self.part = part
        self.count = count
        self.data = data
        try check()
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        uid = try container.decode(UUID.self, forKey: .uid)
        part = try container.decode(Int.self, forKey: .part)
        count = try container.decode(Int.self, forKey: .count)
        data = try container.decode(Data.self, forKey: .data)
        try check()
    }
}
