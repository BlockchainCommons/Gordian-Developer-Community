//
//  Account.swift
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

public struct Account: Codable, Checked {
    public var name: String?
    public var asset: String
    public var hdPublicKey: String
    public var index: Int

    public func check() throws {
        try checkName(name, context: "Account.name")
        try checkAsset(asset, context: "Account")
        try checkNotEmpty(hdPublicKey, context: "Account.hdPublicKey")
        try checkNotNegative(index, context: "Account.index")
    }
}
