# Airgapped Signing Protocol Examples

### Examples

Note that while the examples in this section should validate against the JSON schema, these examples are not test vectors and should not be expected to validate. Please see the JSON schema below for further explanatory comments.

#### MultiPart

Used when a document is too large to fit into a packet (like a QR code) and must be broken into multiple parts. The concatenated `data` fields must decode to another document in this specification.

```json
{
	"header": {
		"format": "AirgappedSigning",
		"version": 1
	},
	"multiPart": {
		"uid": "449C40FE-E207-4AC9-B552-51B007B68D50",
		"part": 0,
		"count": 1,
		"data": "VGhlIHF1aWNrIGJyb3duIGZveCBqdW1wcyBvdmVyIHRoZSBsYXp5IGRvZy4K"
	}
}
```

#### RecoveryWords

Used to back up the seed from which all other keys are derived. The passphrase (if any) is never transmitted in this structure-- it is always entered directly by the user.

```json
{
	"header": {
		"format": "AirgappedSigning",
		"version": 1
	},
	"recoveryWords": {
		"name": "Rainy Day",
		"format": "BIP39",
		"words": ["panda", "diary", "marriage", "suffer", "basic", "glare", "surge", "auto", "scissors", "describe", "sell", "unique"]
	}
}
```

#### KnownReceiver

Used to send the address of a known receiver to the cold wallet to be used when confirming the contents of transactions.

```json
{
	"header": {
		"format": "AirgappedSigning",
		"version": 1
	},
	"knownReceiver": {
		"name": "Example",
		"asset": "BTC",
		"address": "1BvBMSEYstWetqTFn5Au4m4GFg7xJaNVN2"
	}
}
```

#### Account

Used to send a public key, asset, and associated account path to the hot wallet to be used in watching the block chain and/or creating new transactions.

```json
{
	"header": {
		"format": "AirgappedSigning",
		"version": 1
	},
	"account": {
		"name": "Example Account",
		"asset": "BTC",
		"hdPublicKey": "xpub6CUGRUonZSQ4TWtTMmzXdrXDtypWKiKrhko4egpiMZbpiaQL2jkwSB1icqYh2cfDfVxdx4df189oLKnC5fSwqPfgyP3hooxujYzAu3fDVmz",
		"index": 1
	}
}
```

#### Transaction Signing Request

"Transaction" as used here is rougly equivalent to a Partially Signed Bitcoin Transaction (PSBT). It is designed so multiple parties can provide inputs, outputs, and signatures to be combined later.

```json
{
	"header": {
		"format": "AirgappedSigning",
		"version": 1
	},
	"transaction": {
		"uid": "819AACCF-984A-43EF-AC1D-D4CD37C9A7DC",
		"asset": "BTC",
		"inputs": [
			{
				"uid": "A6B0DF6D-E670-4233-8EAC-626C0A9AAC9A",
				"txHash": "ba34fa2ed2c42e7ba66887a96d22e14dec1244a3c47b271cd69a679afbaab868",
				"inputIndex": 1,
				"sender": "18f8tN4PLdCXF2JHy5PjRerqXg994yGme3",
				"derivation": {
					"accountIndex": 0,
					"addressIndex": 12
				},
				"amount": 59943910
			}
		],
		"outputs": [
			{
				"uid": "79296757-6C80-49BF-996F-87FCB46A566C",
				"receiver": "1N5YvoDTEbkKsE1SiPEKbih6BM1HAD3dV9",
				"amount": 9240
			},
			{
				"uid": "69F19CB5-A9B1-4C80-B5CA-A304E37C04C7",
				"receiver": "19MUKz42a951wmXtJBa5fdvRvGvAGh6NDG",
				"derivation": {
					"accountIndex": 0,
					"addressIndex": 4
				},
				"amount": 59855564
			}
		]
	}
}
```

#### Transaction Signing Response

This example is a reply from the cold wallet that signs the input provided in the previous example.

```json
{
	"header": {
		"format": "AirgappedSigning",
		"version": 1
	},
	"transaction": {
		"uid": "819AACCF-984A-43EF-AC1D-D4CD37C9A7DC",
		"inputSignatures": [
			{
				"uid": "A6B0DF6D-E670-4233-8EAC-626C0A9AAC9A",
				"ecPublicKey": "AzfAJTIa8S38RRcVnZvZgWTdL/n715cbKdCqJx1yxATK",
				"ecSignature": "MEQCIBBhpg0KAmDqJu/0v/L8a9kCWGMNh3QVLYpq/tfzEQdmAiAMLrZKT5H2maQXPvEm6iYTNIcpKk6B+8Lg4z+xaLVCbAE="
			}
		]
	}
}
```
