# Proof of Concept: 2019

_This is an archive of proof-of-concept files from 2019._

## Status - Late Alpha

**Airgapped Signing**  is currently under active development and in the late alpha testing phase. It should not be used for production tasks until it has had further testing and auditing.

## Origin, Authors, Copyright & Licenses

Unless otherwise noted (either in this [/README.md](./README.md) or in the file's header comments) the contents of this repository are Copyright © 2020 by Blockchain Commons, LLC, and are [licensed](./LICENSE) under the [spdx:BSD-2-Clause Plus Patent License](https://spdx.org/licenses/BSD-2-Clause-Patent.html).

In most cases, the authors, copyright, and license for each file reside in header comments in the source code. When it does not, we have attempted to attribute it accurately in the table below.

This table below also establishes provenance (repository of origin, permalink, and commit id) for files included from repositories that are outside of this repo. Contributors to these files are listed in the commit history for each repository, first with changes found in the commit history of this repo, then in changes in the commit history of their repo of their origin.

| File      | From                                                         | Commit                                                       | Authors & Copyright (c)                                | License                                                     |
| --------- | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------ | ----------------------------------------------------------- |
| exception-to-the-rule.c or exception-folder | [https://github.com/community/repo-name/PERMALINK](https://github.com/community/repo-name/PERMALINK) | [https://github.com/community/repo-name/commit/COMMITHASH]() | 2020 Exception Author  | [MIT](https://spdx.org/licenses/MIT)                        |

### Dependencies

To build  `$projectname` you'll need to use the following tools:

- autotools - Gnu Build System from Free Software Foundation ([intro](https://www.gnu.org/software/automake/manual/html_node/Autotools-Introduction.html)).

### Derived from…

This  `$projectname` project is either derived from or was inspired by:

- [community/repo-name/](https://github.com/community/repo-name) — Repo that does what, by [developer](https://github.com/developer)  or from  [community](https://community.com).

### Used with…

These are other projects that work with or leverage `$projectname`:

- [community/repo-name/](https://github.com/community/repo-name) — Repo that does what, by [developer](https://github.com/developer)  or from  [community](https://community.com).

## Financial Support

**Airgapped Signing** is a project of [Blockchain Commons](https://www.blockchaincommons.com/). We are proudly a "not-for-profit" social benefit corporation committed to open source & open development. Our work is funded entirely by donations and collaborative partnerships with people like you. Every contribution will be spent on building open tools, technologies, and techniques that sustain and advance blockchain and internet security infrastructure and promote an open web.

To financially support further development of **Airgapped Signing** and other projects, please consider becoming a Patron of Blockchain Commons through ongoing monthly patronage as a [GitHub Sponsor](https://github.com/sponsors/BlockchainCommons). You can also support Blockchain Commons with bitcoins at our [BTCPay Server](https://btcpay.blockchaincommons.com/).

## Contributing

We encourage public contributions through issues and pull requests! Please review [CONTRIBUTING.md](./CONTRIBUTING.md) for details on our development process. All contributions to this repository require a GPG signed [Contributor License Agreement](./CLA.md).

### Questions & Support

As an open-source, open-development community, Blockchain Commons does not have the resources to provide direct support of our projects. If you have questions or problems, please use this repository's [issues](./issues) feature. Unfortunately, we can not make any promises on response time.

If your company requires support to use our projects, please feel free to contact us directly about options. We may be able to offer you a contract for support from one of our contributors, or we might be able to point you to another entity who can offer the contractual support that you need.

### Credits

The following people directly contributed to this repository. You can add your name here by getting involved. The first step is learning how to contribute from our [CONTRIBUTING.md](./CONTRIBUTING.md) documentation.

| Name              | Role                | Github                                            | Email                                 | GPG Fingerprint                                    |
| ----------------- | ------------------- | ------------------------------------------------- | ------------------------------------- | -------------------------------------------------- |
| Christopher Allen | Principal Architect | [@ChristopherA](https://github.com/ChristopherA) | \<ChristopherA@LifeWithAlacrity.com\> | FDFE 14A5 4ECB 30FC 5D22  74EF F8D3 6C91 3574 05ED |

## Responsible Disclosure

We want to keep all of our software safe for everyone. If you have discovered a security vulnerability, we appreciate your help in disclosing it to us in a responsible manner. We are unfortunately not able to offer bug bounties at this time.

We do ask that you offer us good faith and use best efforts not to leak information or harm any user, their data, or our developer community. Please give us a reasonable amount of time to fix the issue before you publish it. Do not defraud our users or us in the process of discovery. We promise not to bring legal action against researchers who point out a problem provided they do their best to follow the these guidelines.

### Reporting a Vulnerability

Please report suspected security vulnerabilities in private via email to ChristopherA@BlockchainCommons.com (do not use this email for support). Please do NOT create publicly viewable issues for suspected security vulnerabilities.

The following keys may be used to communicate sensitive information to developers:

| Name              | Fingerprint                                        |
| ----------------- | -------------------------------------------------- |
| Christopher Allen | FDFE 14A5 4ECB 30FC 5D22  74EF F8D3 6C91 3574 05ED |

You can import a key by running the following command with that individual’s fingerprint: `gpg --recv-keys "<fingerprint>"` Ensure that you put quotes around fingerprints that contain spaces.


## Blockchain Commons 2019 Proof of Concept

In 2019 Blockchain Commons did a proof-of-concept of air-gapped signing between two airgapped devices, one written in Swift for iOS, the other using Java on macOS Desktop. Though the POC was functional, some lessons were learned to inform a better architecture in the future.

See the `Docs` directory for:

* `AirgappedSigningSchema.json`, which is JSON Schema document that validates protocol messages.
* `AirgappedSigningExamples.md`, which is documented examples of the protocol.

### Requirements for 2019 POC

* Swift 5.1

* Xcode 11.3

* The `AirgappedSigning` framework depends on the `Bitcoin` framework, which includes a pre-made build of [libbitcoin](https://github.com/libbitcoin). To properly install this, you need to first install the latest version of Git and the Git Large File Storage handler:

```bash
$ brew install git
$ brew install git-lfs
$ which git
/usr/local/bin/git
$ git --version
git version 2.21.0
```

### Installation for 2019 POC

`AirgappedSigning` no longer supports building via Cocoapods, but since it depends on the `Bitcoin` framework, which in turn embeds several third-party pre-built binary frameworks (libbitcoin etc.) it is also not suitable for distribution via the Swift Package Manager at this time. So for now, it is built directly as an Xcode project.

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

### Unit Tests for 2019 POC

The `AirgappedSigningDemo` app is simply an iOS container for the test suite. To run the unit tests, select the `AirgappedSigningDemo` target and then `Product > Test`.

### Author of 2019 POC

Wolf McNally, wolf@wolfmcnally.com

### License for 2019 POC

AirgappedSigning is available under the Apache 2 license. See the LICENSE file for more info.

### Changes in 2019 POC

#### 0.6.0

* Added data carrier (OP_RETURN) payload type to transaction outputs.

## Status - Archive

This PoC_2019 is not under active development

## Origin, Authors, Copyright & Licenses

Unless otherwise noted (either in this [/README.md](./README.md) or in the file's header comments) the contents of this repository are Copyright © 2020 by Blockchain Commons, LLC, and are [licensed](./LICENSE) under the [spdx:BSD-2-Clause Plus Patent License](https://spdx.org/licenses/BSD-2-Clause-Patent.html).

In most cases, the authors, copyright, and license for each file reside in header comments in the source code. When it does not, we have attempted to attribute it accurately in the table below.

This table below also establishes provenance (repository of origin, permalink, and commit id) for files included from repositories that are outside of this repo. Contributors to these files are listed in the commit history for each repository, first with changes found in the commit history of this repo, then in changes in the commit history of their repo of their origin.

| File      | From                                                         | Commit                                                       | Authors & Copyright (c)                                | License                                                     |
| --------- | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------ | ----------------------------------------------------------- |
| exception-to-the-rule.c or exception-folder | [https://github.com/community/repo-name/PERMALINK](https://github.com/community/repo-name/PERMALINK) | [https://github.com/community/repo-name/commit/COMMITHASH]() | 2020 Exception Author  | [MIT](https://spdx.org/licenses/MIT)                        |

### Dependencies

To build  `$projectname` you'll need to use the following tools:

- autotools - Gnu Build System from Free Software Foundation ([intro](https://www.gnu.org/software/automake/manual/html_node/Autotools-Introduction.html)).

### Derived from…

This  `$projectname` project is either derived from or was inspired by:

- [community/repo-name/](https://github.com/community/repo-name) — Repo that does what, by [developer](https://github.com/developer)  or from  [community](https://community.com).

### Used with…

These are other projects that work with or leverage `$projectname`:

- [community/repo-name/](https://github.com/community/repo-name) — Repo that does what, by [developer](https://github.com/developer)  or from  [community](https://community.com).

## Financial Support

**Airgapped Signing** is a project of [Blockchain Commons](https://www.blockchaincommons.com/). We are proudly a "not-for-profit" social benefit corporation committed to open source & open development. Our work is funded entirely by donations and collaborative partnerships with people like you. Every contribution will be spent on building open tools, technologies, and techniques that sustain and advance blockchain and internet security infrastructure and promote an open web.

To financially support further development of **Airgapped Signing** and other projects, please consider becoming a Patron of Blockchain Commons through ongoing monthly patronage as a [GitHub Sponsor](https://github.com/sponsors/BlockchainCommons). You can also support Blockchain Commons with bitcoins at our [BTCPay Server](https://btcpay.blockchaincommons.com/).

## Contributing

We encourage public contributions through issues and pull requests! Please review [CONTRIBUTING.md](./CONTRIBUTING.md) for details on our development process. All contributions to this repository require a GPG signed [Contributor License Agreement](./CLA.md).

### Questions & Support

As an open-source, open-development community, Blockchain Commons does not have the resources to provide direct support of our projects. If you have questions or problems, please use this repository's [issues](./issues) feature. Unfortunately, we can not make any promises on response time.

If your company requires support to use our projects, please feel free to contact us directly about options. We may be able to offer you a contract for support from one of our contributors, or we might be able to point you to another entity who can offer the contractual support that you need.

### Credits

The following people directly contributed to this repository. You can add your name here by getting involved. The first step is learning how to contribute from our [CONTRIBUTING.md](./CONTRIBUTING.md) documentation.

| Name              | Role                | Github                                            | Email                                 | GPG Fingerprint                                    |
| ----------------- | ------------------- | ------------------------------------------------- | ------------------------------------- | -------------------------------------------------- |
| Christopher Allen | Principal Architect | [@ChristopherA](https://github.com/ChristopherA) | \<ChristopherA@LifeWithAlacrity.com\> | FDFE 14A5 4ECB 30FC 5D22  74EF F8D3 6C91 3574 05ED |

## Responsible Disclosure

We want to keep all of our software safe for everyone. If you have discovered a security vulnerability, we appreciate your help in disclosing it to us in a responsible manner. We are unfortunately not able to offer bug bounties at this time.

We do ask that you offer us good faith and use best efforts not to leak information or harm any user, their data, or our developer community. Please give us a reasonable amount of time to fix the issue before you publish it. Do not defraud our users or us in the process of discovery. We promise not to bring legal action against researchers who point out a problem provided they do their best to follow the these guidelines.

### Reporting a Vulnerability

Please report suspected security vulnerabilities in private via email to ChristopherA@BlockchainCommons.com (do not use this email for support). Please do NOT create publicly viewable issues for suspected security vulnerabilities.

The following keys may be used to communicate sensitive information to developers:

| Name              | Fingerprint                                        |
| ----------------- | -------------------------------------------------- |
| Christopher Allen | FDFE 14A5 4ECB 30FC 5D22  74EF F8D3 6C91 3574 05ED |

You can import a key by running the following command with that individual’s fingerprint: `gpg --recv-keys "<fingerprint>"` Ensure that you put quotes around fingerprints that contain spaces.
