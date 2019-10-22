# AirgappedSigning

A protocol for transmission of messages between hot and cold cryptographic wallets.

## Documentation

See the `Docs` directory for:

* `AirgappedSigningSchema.json`, which is JSON Schema document that validates protocol messages.
* `AirgappedSigningExamples.md`, which is documented examples of the protocol.

## Requirements

* Swift 5
* Xcode 11

* The `AirgappedSigning` framework depends on the `Bitcoin` framework, which includes a pre-made build of [libbitcoin](https://github.com/libbitcoin). To properly install this, you need to first install the latest version of Git and the Git Large File Storage handler:

```bash
$ brew install git
$ brew install git-lfs
$ which git
/usr/local/bin/git
$ git --version
git version 2.21.0
```

## Installation

`AirgappedSigning` no longer supports building via Cocoapods, but since it relies on embedding the `Bitcoin` framework, which in turn embeds several third-party pre-built binary frameworks (libbitcoin etc.) it is also not suitable for distribution via the Swift Package Manager at this time. So for now, it is built directly as an Xcode project.

The `AirgappedSigning`, `Bitcoin`, and `CBitcoin` project directories should be siblings in the same directory:

```
MyProjects
|
+—— CBitcoin
|   |
|   +—— CBitcoin.xcodeproj
|
+—— Bitcoin
|   |
|   +—— Bitcoin.xcodeproj
|
+—— AirgappedSigning
    |
    +—— AirgappedSigning.xcworkspace    
```

```bash
$ cd MyProjects
$ git clone https://github.com/BlockchainCommons/iOS-CBitcoin.git CBitcoin
$ git clone https://github.com/BlockchainCommons/iOS-Bitcoin.git Bitcoin
$ git clone https://github.com/BlockchainCommons/AirgappedSigning.git AirgappedSigning
$ cd CBitcoin/Sources
$ unzip -q Frameworks.zip
$ cd ../../AirgappedSigning
$ open AirgappedSigning.xcworkspace/
```

⚠️Make sure you open `AirgappedSigning.xcworkspace` and not `AirgappedSigning.xcodeproj`.

Within Xcode:

* Wait for the required Swift Packages to resolve
* Build the `AirgappedSigning` target for an available platform.

## Unit Tests

The `AirgappedSigningDemo` app is simply an iOS container for the test suite. To run the unit tests, select the `AirgappedSigningDemo` target and then `Product > Test`.

## Author

Wolf McNally, wolf@wolfmcnally.com

## License

AirgappedSigning is available under the Apache 2 license. See the LICENSE file for more info.
