//
//  KnownReceiver.swift
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
import WolfCore

public struct KnownReceiver: Codable, Checked {
    public let name: String?
    public let asset: Asset
    public let address: PaymentAddress

    public func check() throws {
        try checkName(name, context: "KnownReceiver.name")
        try checkAsset(asset, context: "KnownReceiver.asset")
        try checkNotEmpty(address®, context: "KnownReceiver.address")
    }

    public init(name: String?, asset: Asset, address: PaymentAddress) throws {
        self.name = name
        self.asset = asset
        self.address = address
        try check()
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        asset = try container.decode(Asset.self, forKey: .asset)
        address = try container.decode(PaymentAddress.self, forKey: .address)
        try check()
    }
}
