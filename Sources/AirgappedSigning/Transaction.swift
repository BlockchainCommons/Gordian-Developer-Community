//
//  Transaction.swift
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

public struct Transaction: Codable, Checked {
    public var uid: UUID
    public var asset: String?
    public var inputs: [Input]?
    public var outputs: [Output]?
    public var inputSignatures: [InputSignature]?

    public func check() throws {
        if let asset = asset {
            try checkAsset(asset, context: "Transaction")
        }
        if let inputs = inputs {
            try checkNotEmpty(inputs, context: "Transaction.inputs")
            try inputs.forEach { try $0.check() }
        }
        if let outputs = outputs {
            try checkNotEmpty(outputs, context: "Transaction.outputs")
            try outputs.forEach { try $0.check() }
        }
        if let inputSignatures = inputSignatures {
            try checkNotEmpty(inputSignatures, context: "Transaction.inputSignatures")
            try inputSignatures.forEach { try $0.check() }
        }
    }

    public struct Derivation: Codable, Checked {
        public var accountIndex: Int
        public var addressIndex: Int

        public func check() throws {
            try checkNotNegative(accountIndex, context: "Derivation.accountIndex")
            try checkNotNegative(addressIndex, context: "Derivation.addressIndex")
        }
    }

    public struct Input: Codable, Checked {
        public var uid: UUID
        public var txHash: String
        public var inputIndex: Int
        public var sender: String
        public var derivation: Derivation
        public var amount: UInt64

        public func check() throws {
            try checkNotEmpty(txHash, context: "Input.txHash")
            try checkNotNegative(inputIndex, context: "Input.inputIndex")
            try checkNotEmpty(sender, context: "Input.sender")
            try derivation.check()
            try checkPositive(amount, context: "Input.amount")
        }
    }

    public struct Output: Codable, Checked {
        public var uid: UUID
        public var receiver: String
        public var amount: UInt64
        public var derivation: Derivation?

        public func check() throws {
            try checkNotEmpty(receiver, context: "Output.receiver")
            try checkPositive(amount, context: "Output.amount")
            try derivation?.check()
        }
    }

    public struct InputSignature: Codable, Checked {
        public var uid: UUID
        public var ecPublicKey: Data
        public var ecSignature: Data

        public func check() throws {
            try checkNotEmpty(ecPublicKey, context: "InputSignature.ecPublicKey")
            try checkNotEmpty(ecSignature, context: "InputSignature.ecSignature")
        }
    }
}
