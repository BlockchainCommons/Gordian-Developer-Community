//
//  Header.swift
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

public struct Header: Codable, Checked {
    public let format: Format
    public let version: Version

    private init(format: Format, version: Version) throws {
        self.format = format
        self.version = version
        try check()
    }

    init() {
        try! self.init(format: .AirgappedSigning, version: .v1)
    }

    public func check() throws {
        try checkEqual(format, .AirgappedSigning, context: "Header.format")
        try checkEqual(version, .v1, context: "Header.version")
    }

    public enum Format: String, Codable {
        case AirgappedSigning
    }

    public enum Version: Int, Codable {
        case v1 = 1
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let format = try container.decode(Format.self, forKey: .format)
        let version = try container.decode(Version.self, forKey: .version)
        try self.init(format: format, version: version)
    }
}
