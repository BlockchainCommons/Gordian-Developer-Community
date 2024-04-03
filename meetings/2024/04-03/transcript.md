
Welcome to our Blockchain Commons monthly Gordian developers meeting.

We hold these typically the first Wednesday of the month.

Sometimes not in like July because of July 4th and things of that nature, but almost always the first Wednesday.

This particular meeting today, we're gonna be talking a lot about Frost, but we wanna introduce ourselves and say a little bit more about what's been going on recently in the Blockchain Commons broader community.

So what is Blockchain Commons?

Well, we're a community interested in the self-sovereign control of digital assets in all forms.

We obviously have a large contingent of wallet developers who are doing Bitcoin, but what we really care about is self-sovereign control.

We bring together stakeholders, collaboratively develop interoperable infrastructure.

We believe you can't be self-sovereign if you're locked into one piece of hardware or software or a service provider.

So you need to be able to move freely and be able to make choices as to what is the best service or product or whatever that you can have.

In general, we really wanna focus on designing decentralized solutions where everybody wins.

And as an organization, we're a neutral, not for profit to enable people to control their own digital destiny.

This would not work, would not be possible without our sustaining sponsors.

This includes Fitmark, Chia, Crossbar, Digital Contract Design, Proxy, Unching Capital in the last year, and in particular Foundation Devices who is present today.

So thank you very much for being a sustaining sponsor.

If you would like to be a sustaining sponsor, please mail us at e-mail at blockchaincommons.com or me directly.

We also are funded through the broad support of developers on the GitHub community.

You can go to github.com/sponsors/blockchaincommons and you can see a number of different options, ranging from like $20 a month as an individual developer, $100 a month as a small company, and then various other kinds of options.

You can see a number of recognizable faces here as current sponsors through GitHub, including Jesse.

Our speaker today has been a ongoing individual sponsor for several years.

So thank you, Jesse, very much for your sponsorship.

We do have a challenge this year.

A lot of our sponsors have either reduced or cut back or even stopped sponsoring us, not completely understanding all the circumstances given that cryptographic assets have gone up, but I think it has a lot to do with the funding, especially for second rounds of corporations has been very hard to obtain because of interest rates.

So a lot of companies have basically really tightened their belts.

So we really need your support, even the small support of $20 a month makes a big difference.

It also helps us when we go to Human Rights Foundation or to open SaaS or other organizations to basically say, "Hey, we have real support from the developer community.

Here are our sponsors."

We also are talking with a couple of our sustaining sponsors about some specific projects to meet their needs, where they will temporarily increase their sponsorship to have us focused on something particular that would be of use to them.

These will all be open source.

This just simply accelerates our development.

But if you'd like us to continue to do this type of work, these meetings, these kinds of bringing together and focusing on interoperability and self-sovereignty, we really need your help.

At our last meeting, we had some discussions about request response using Envelope.

We published an implementation guide and a use case.

This is gonna be an ongoing topic.

This is an important topic for this year and we will be talking about it more.

Today's topics, real briefly, Gordie and advancements.

I wanna talk a little bit about another side of what Blockchain Commons does, which is advocacy and some stuff that is beginning to emerge in Wyoming.

Obviously, our keynote is Jesse talking about Frost and then we can talk about what's coming up.

So in the Gordian advances, one of the things we've really been wanting to do since we're all developers and we're largely using GitHub is that we really want to figure out how to broaden our key retention, storage, protection, resilience type of practices to more than just cryptographic asset keys to show that it's broadly useful because we're all developers.

Well, maybe we can protect our SSH keys.

If you've ever done kind of a reproducible build process or you've validated Bitcoin cores, binaries and things of that nature, historically, they've largely been using SSH, I mean, excuse me, PGP to do those signatures, which is really outdated and has lots of different kinds of complications and issues.

We'd like to make that a lot easier possibly by using SSH keys that you're already using with GitHub.

So we've begun working on that.

If this is something that fascinates you, we'd love to have your help.

Where we are right now is we have a new Python, some very early experimental proof of concept code around doing SSH keys into Gordian envelope and import and exporting signatures and stuff.

The other kind of big update right now is in our Rust app for DC board, there was a request that it would be able to be much more usable in embedded environments because there are emerging embedded devices that if you support a no standard environment, may work on those small devices.

So we upgraded the CBOR library and over time, now that we understand more about the no standard environment, the issues and stuff will be bringing more and more of our Rust code base to no standard.

That what this increasingly means is that our Rust stack is becoming our reference stack.

So, but we still wanna support Swift and where we can other platforms.

And of course, we wanna support your ports of our libraries.

So anything we can do to help you port it to whatever obscure or not obscure environment that you use, we'd be glad to help you and help do that.

For instance, we did a documentation on how the UR stack works to make it a lot easier to do ports of the UR part of the stack.

But we do maintain a Swift version of the stack.

And so we'll be updating that second after Rust.

Wolf, is there anything I missed in kind of the Gordian advances right now? - Not in terms of the overview.

I didn't know whether you wanted me to demo the Python thing, but you know, you have to do covered it. - Yeah, I don't think we need a demo.

I mean, if you're interested, we'd be glad to schedule, you know, another between Gordian meeting things.

If you're interested in, you know, how do we protect our developer keys?

How do we do developer provenance of our code bases, of our binaries, you know, hardware, et cetera, et cetera?

You know, we feel like this is an important aspect beyond just storing our digital assets, especially as we begin to deploy Gordian depots.

You don't know what a Gordian depot is.

It's sort of an open share server, open development, open standards, so that you can choose, oh, I want to shard my keys in a variety of different ways.

And I have very specific things I would like to have in my choices of, for resilience, which might mean an organization that, you know, authenticates you to reprieve, you know, one of your shares or offline backups, backups to NFCs, et cetera.

So obviously this is very useful for your digital asset keys, but we also want to back, you demonstrate that this can back up a lot of other things as well. - I would add one more thing, Bisther.

The current work we're doing with Python, of course, our envelope stack that you were referred to is written in Rust.

And, you know, it's very important that our tools be scriptable and integratable with other environments.

And the Python work we're doing right now is actually really interesting in one aspect, which is that, you know, a Gordian envelope by itself is a hierarchical document format that includes holder-based deletion by default, but it doesn't, in its basic spec, include anything for signing encryptions on.

We have extensions for that, and those extensions all have proofs of concept in the Rust code, I mean, you can use it today, and do encryption with looked at keys and things like that.

And as you talked about, the SSH environment is also already very established and used by things like GitHub and so on.

And even though we are supporting, like, for example, specific kind of signatures for Gordian envelope, Gordian envelope doesn't dictate that.

And that's one of the things that this new Python code-based does, shows, is that you can actually sign envelopes using other forms of signatures, including in our case, if you work with SSH signatures, you can either text formats that are PEMM-coded, Bayes 64-encoded, and you can, but you can directly import that into kind of the envelope, UR environment, use them to sign envelopes, and then use those signatures with the public keys to verify the envelopes.

And it uses the same basic format of the other signatures that we've done in our code base, but a different kind of signature.

And so, even though we're not big on what's called crypto agility, we will support everything everywhere all at once, we do know, we have always designed our stuff so that it actually is capable of being extended in various directions.

For example, in this case, SSH signatures.

So I think that's super important.

And by the way, I'm Wolf McNally, lead researcher for blockchain commons. - Thank you, Wolf.

And yeah, this is gonna be an ongoing topic.

If you've got questions, you can either bring them up directly to us, use the signal group, and I'd really like to try to get going the Gordian discussion community on some of these types of things that there's interest.

If you hadn't seen it last month, we released a new version of Gordian server.

This is a very user friendly version of Bitcoin core that makes it very easy to install on a Macintosh.

One of the particular advantages of it is it also installs Tor so that you can do a variety of Tor gap type of functionality.

In the latest version, we now support RPC auth, not just a plain text RPC credentials, and we support the new M2 Mac binaries, and we support the Bitcoin version 25 and 26.

One of the exemplary wallets that uses this is Fontaine's fully noted app, which is basically an iOS app, that is only has no ledger in it.

Instead, it uses Tor to communicate with your own personal or server.

We're going to be doing more with Tor gaps in the upcoming year, where we would like to use them, for instance, with future Gordian depot servers and things of that nature, again, to protect the confidentiality.

So if this is something that interests you, you might want to take a look at it.

It is an end user tool, obviously, you can install Bitcoin yourself and Tor yourself, but we're trying to make all of this stuff easier.

One other aspect of what we do is a variety of things around advocacy and law in various places.

And basically, Wyoming is one of the jurisdictions that has been actually taking our advice and has actually passed some laws based on our advocacy.

In particular, there was a private key disclosure bill that basically prohibits under Wyoming law, the demands in discovery and by the courts for your private keys, they can still require you to use your keys or disclose a public key.

But I think this is important as it's the first law in the world that basically says, hey, private keys are no longer private if they're disclosed.

There's also this Wyoming registered digital asset and go, well, why would I want to register my digital asset?

Well, the reason why is that there's lack of clarity in the United States around what is called perfection of digital assets because of different problems.

In particular, as compared to cash, in theory, a court can basically claw back, a UTXO that was stolen six generation back from your UTXO and say, you don't own those coins.

Well, under Wyoming law, you can if you hold it for two years, but that's only for Wyoming citizens.

Under the Wyoming registered digital asset, anybody can register a digital asset and or a content identifier for that digital asset and then basically be able to prove to court or to a bank or whatever that they have to prove sovereignty over that digital asset under law.

So we helped make that bill.

We were also involved in the Dow LLC and incorporated Dow bills that passed, but in particular, my part of my goal is to make sure that it was future-proof and wasn't just an Ethereum Dow.

And we've got some particular ideas around a Bitcoin friendly capability, which leads to in the coming year, I've got some ideas around micro Dows.

Imagine a small company that in effect its entire treasury is a Bitcoin, a multi-stig Bitcoin distributor and the ownership is described by the Bitcoin distributor.

So that's an opportunity coming up.

We wanna legalize data minimization, the redaction and elision.

One of the problems right now is companies carry far too much information about you and they say, well, we have to have it in case we're sued.

So we wanna basically say, no, that's a bad practice.

You can redact, just destroy the information and you can still meet your legal requirements.

And if you must keep the information, you can allide the information, keep the alighted groups online and take the actual data completely off lines so they're not set up to attack.

So if you're interested in these types of activities, the new legislative season basically is starting in May.

I'm meeting with various legislators later today and in the next month to set the agenda for that.

This is something to care about.

Please let me know.

Digital contract design was our sponsor last year for our work and my travel to there and also to other jurisdictions to try to move some of this legislation forward.

And so if you would like to target your sponsorship of blockchain commons for this advocacy, please let me know and become involved.

So now we come to our keynote today, which is on Frost.

Welcome Jesse.

Jesse is the senior blockchain engineer at BitKey and has been a fellow with various organizations that have been sponsoring Frost work for the last couple of years.

In particular, he's been working on the SECP, 6K1, ZKP implementation that's in the block screen repo.

He's been working on the Frost tips and various research projects.

Frost, Jesse, do you want me to drive or would you like to share your screen and you could also drive the presentation? - Yeah, I guess I can share my screen.

Maybe that's a little easier.

Yeah. - And also just maybe reintroduce yourself from 'cause I just gave the high level overview. - Absolutely.

Yeah, I'm just pulling up the slides here.

So yeah, like Christopher said, I've been working on Frost for a while.

I used to be at Coinbase working on some multi-party computation projects.

And had a grant with Brink for a while where I was just full-time on Frost open source.

And now I'm working at Block on the BitKey wallet and continuing to work on Frost in the open source world as well.

So let's dive in.

So what is Frost?

So Frost is an acronym for flexible round optimized Schnoor threshold signatures.

So Schnoor signatures are a new signature type that was added to Bitcoin with the Taproot soft fork.

Before that, we were limited to a signature type called ECDSA.

Schnoor was actually invented before ECDSA, but there was a patent on the Schnoor signature for a while, which has now expired.

And ECDSA was invented basically as a workaround to get around the patent.

And one of the things that changed is the ECDSA signatures is a little bit more complex and it doesn't have a linear form.

And so there's things that we can do with the Schnoor signature that we can't do with the ECDSA signature.

And one of those is a certain style of threshold signatures and distributed key generation.

And so the idea here is, people probably are familiar with multi-sig using Bitcoin script, where we use the Bitcoin scripting language to specify a set of public keys.

And then we can generate an address and then to spend the Bitcoin, you need to sign with a predefined number of keys.

So let's say we're doing a two of three, the script would specify three public keys and a signature from any two of them could move the Bitcoin.

Another way of accomplishing a multi-party transaction or securing Bitcoin with multiple parties is instead of using Bitcoin script to split a private key into multiple pieces and using off-chain protocols and multi-party computation, produce the signature for the single key.

So on the blockchain, it just looks like one key and one signature, but behind the scenes, there was actually multiple parties that created the single key and multiple parties that were required to produce a signature for that key.

And there are ways of doing this with ECDSA, but there are much better ways of doing this with Schnorr signatures.

And the latest and greatest way to do this is called Frost.

These kinds of techniques have actually been around for a long time, but Frost created a number of improvements to the existing types of protocols, but it's the same basic system underneath in all the Schnorr style threshold signing systems.

So you can think of Frost as combining these different primitives.

So you have Schmear secret sharing, where you can take a secret and you can split it into multiple shares and you can have any T of N configuration, three of five, four of 11, whatever you want.

You also have something called verifiable secret sharing, which allows the shares to be verified because when different participants receive Schmear shares, they don't, without VSS, they have no way of knowing whether or not their share actually belongs to the same set as everybody else.

Like maybe they were given a defective share or a malicious share, and they don't even know if the share actually reconstructs to secret that they expect.

And so with verifiable secret sharing, there are these commitments that are made to the structure by which the secret was split, namely a polynomial.

And without revealing any secrets, participants can use these commitments to verify their shares are all part of the same set as the other participants, and that they reconstruct to a secret, a private key that corresponds to a public key.

They don't learn the private key, but if they know the public key, they can verify, "Yes, I hold a share of the private key "for this public key that I know."

And then distributed key generation lets us create Schmear shares and VSS proofs in a distributed way.

So rather than having a trusted dealer that generates the secret and splits it and gives the shares to different participants, with distributed key generation, we can have multiple participants send some data around to each other.

And at the end of the process, they each have Schmear shares of a private key that no participants know.

And in fact, the private key has never been constructed in a single place.

And then we have Schnoor signatures.

Like I mentioned, they have this linear form.

So that means we can do things like aggregate keys and signatures, or in the case of Frost, we're gonna be aggregating nonces.

And with Schmear secret sharing, you have to take your shares and get back to the secret.

You do something called Lagrangian interpolation, and it involves multiplying some coefficients by the shares and then summing them.

So with Schnoor, since we have this linear form, we can have the participants sign with their Schmear shares and we can aggregate these signatures.

And this goes to the last point, the signature aggregation, where we can have some participants sign with their shares to produce these partial signatures, and then we can aggregate the signatures.

Because the Schnoor signature is linear, the Lagrange coefficients distribute over the partial signatures when we combine them, such that the shares, such that the signature forms a valid signature for the public key.

But we never actually had to bring the shares together in one place.

Each participant just signed with their share, and we aggregated the partial signatures, but we didn't aggregate actual shares themselves.

So we can get into more detail about why that's important.

So like I was saying, the more kind of traditional way of doing this is with Bitcoin script.

So what are the advantages over Bitcoin script?

Why use Frost instead of Bitcoin script?

Well, when you use the script, when you spend the coins, you reveal information about your setup.

So if you have a two of three, when you go to spend, you're gonna reveal that the setup required three public keys, and you are including two signatures.

So you're revealing some information about your configuration, and that could provide a very powerful heuristic for chain analysis, for example, if they know a certain wallet has a certain configuration, and they can see that, oh wow, your change outputs are always using this specific configuration, so it probably belongs to the same wallet, and so on and so forth.

So with Frost, it's always the same footprint, which is you see one on chain, you see one signature, one key.

It doesn't matter if you had a three of four, or two of three, or four of 11, it always looks like one signature, one key, and it's the same.

So you essentially have the same anonymity set as everybody else who's doing a key spend in Taproot.

It all is homogenous, indistinguishable, and looks the same.

You also have lower fees with Frost, because when you use Bitcoin script, you have to include multiple public keys when you spend in the redeem script, and multiple signatures.

So that's just more data, which creates a bigger transaction, which then adds up the more inputs that also have to have multiple keys and multiple signatures.

It can get quite expensive.

And so with Frost, since we always have one key, one signature, we have basically a constant scaling factor in terms of fees that no matter how many participants or what the threshold is, the fee will always be the same.

So that's really nice.

And some newer things that myself and some other folks have been looking into is there's a whole line of research related to something called proactive secret sharing and dynamic secret sharing.

And these haven't yet been fully explored yet in terms of combining it with Frost, but we basically, all these protocols were developed for Shamir shares.

And since Frost produces Shamir shares, we pretty much know that these protocols will work with Frost.

And what they let you do is, for example, let's say you have a two of three wallet.

Let's say you have a two of three wallet and you lose one of the nodes.

One of the nodes loses its share, or let's say the share is stored on a phone and you lose the phone.

One of the shares is lost.

There's repair protocols such that you can, a threshold of participants can send data to the node or the signer or the participant that lost its share, and it is able to reconstruct its share without revealing it to anyone else.

You can also do things in that case where you have a lost share, you may wanna change it out because if you have a phone that has a share on it and it's been lost, you have to assume that that share might have been compromised 'cause you no longer have physical possession of it.

So first you would get a new phone, then you would repair the share, so the new phone has the share that it previously had, then you'd run a refresh protocol, so all the shares change, and now if an attacker gets the lost share, it can't be used for anything.

But we didn't change the underlying private key.

So we didn't actually have to make an on-chain transaction.

Same thing in terms of, let's say we wanna enroll a new participant, or we wanna disenroll an existing participant, or we wanna modify the threshold, we wanna move the threshold up or we wanna move the threshold down.

Without these protocols, every time you do any of those actions where you're recovering a lost share, you're enrolling, disenrolling, modding the threshold, you have to make an on-chain transaction to sweep to a completely new key.

And if you're moving your entire wallet, you're gonna have to pull in your entire UTXO set into a sweep transaction, and that's gonna could get very expensive.

Especially as fees potentially rise over time.

And also it's not great from a privacy perspective, 'cause now you have a single transaction that includes all your UTXOs, making them more easy to link together.

So with this kind of off-chain resharing, we can do all these cool operations without ever having to change the keys, and therefore without ever having to make an on-chain transaction, which is better for privacy and fees.

So those are the advantages over Bitcoin script.

There's also some more theoretical things we might be able to do that I'm not gonna get super deep into, but where we can potentially get a multi-sig lightning kind of setup and have security that looks more like cold storage or warm storage than the hot kind of keys we deal with today in lightning.

That there's still a lot of research that needs to be done there and a lot of unsolved problems, but that's another possibility down the road.

The advantages over Shamir secret sharing are that, so with Shamir secret sharing, and this is what a lot of exchanges or institutions and other entities that hold large amounts of Bitcoin have used in the past, is they have a trusted setup, some kind of secure location, and with all kinds of precautions or whatever to generate a key and then split it into shares.

And that is a very sensitive operation, it's easy to screw up, and it creates a single point of failure where if the trusted dealer was compromised or if the setup was compromised, then the whole output is insecure.

And typically what it means is only large organizations can securely run this process, it requires a lot of operational overhead, so it's a big limitation.

And the other thing is then when you wanna spend the Bitcoin, you have to bring the shares back together, and that also requires some sort of secure operational process where the shares can be combined and there's a single point of failure and then now it becomes a hot key and it can never become cold again.

So you have these two kind of bottlenecks of like these two central points of failure of when you generate the key and then when you sign for the key, and with Frost we eliminate both of those.

No trusted dealer, private key is never generated in one place and we never have to bring the shares back together to reconstruct the secret.

So what's the current state of the world?

There's a Frost PR open in SecP, ZKP, I also have a trusted dealer version of the PR that we might be able to get in more quickly because a lot of the complexity of the protocol has to do with the DKG, the distributed key generation.

So of course, trusted dealer removes that one advantage of no trusted dealer, now you have a trusted dealer, but you still don't need to bring the shares back together when you reconstruct, you can keep them separated.

So that might be acceptable for certain settings or environments.

It also will let us kind of get the code in for signing and nonces and all of that, and just focus on the DKG separately.

There's work on a BIP for the DKG specifically and Tim Ruffing and Jonas Nick have been leading that, I think I saw Tim Ruffing's on the call and there's some really cool things about that BIP.

We have a great RFC for Frost, but I don't think it actually specifies the distributed key generation, the Frost RFC.

But also what's kind of innovative about the DKG BIP is it sort of has a batteries included specification, which means there's things that are frequently kind of required with Frost, but aren't necessarily spelled out how to implement them or the implementation won't provide the functionality, all the functionality out of the box required to use Frost.

So one of the things you need for Frost distributed key generation is a broadcast channel or something that simulates a broadcast channel.

And that's specifically for VSS.

When you do VSS in a distributed way, all the participants need to know that they received the same VSS commitments as everyone else.

And there's some attacks if that is not done, if that's not verified.

So one of the things that the Frost DKG BIP does is it provides a way for all the protocol, for all the participants to be able to verify that they saw the same data as everyone else.

And the other thing is you need secure channels between each participant, because they're gonna be sending each other secret data.

So the BIP also provides a method where, if all the participants know each other's public keys, they can, they're able to encrypt the data that they send to each other using those public keys.

And so this is really nice 'cause people will really be able to just use this like out of the box.

And these will be making their way into the SECP, ZKP implementation.

So we'll have all these kind of batteries included things.

I also think I saw Siviram on the call.

He's been leading up the signing BIP.

So we're kind of splitting the BIP into distributed key generation and signing is kind of, there's a lot to both of them.

So we're treating them separately and he's been making great progress on that.

I also saw recently that Zcash has a PR open to add taproot support to their Frost implementation.

Frost was initially invented, I think, in collaboration with Zcash or with Zcash in mind.

And they have a Rust Frost implementation and they've had a SECP implementation, but it didn't use the Schnoor type of signatures we use in taproot because Schnoor is not, unlike ECDSA, there's not like a single specification for Schnoor.

There's a lot of different flavors of Schnoor and they all are basically the same, but there can be slight variations and taproot has a very special kind of Schnoor signature.

In particular, it uses X-only public keys.

So even though Zcash had a SECP implementation, they didn't have the taproot style Schnoor with the X-only public keys.

And there's a PR open to add that, that looks like it's getting pretty close to being merged.

So that's pretty exciting.

So, some new papers.

So there's this new paper that came out this year, re-randomize Frost.

And this proves security for key tweaking.

So we've already kind of known that we can do taproot key tweaking with the Frost key or BIP32 key tweaking for Frost key.

But this demonstrates that it's actually secure, which is nice.

So you could create a Frost key and then derive child keys with BIP32 and sign for them.

Or you could create taproot addresses that include a key spend path and a script spend path.

And the Frost key could sign for the key spend path.

And so the key tweaking is really nice.

The other thing, this other new paper that I haven't looked too deeply into yet, but it looks pretty exciting is this kind of Arctic, lightweight and stateless threshold Schnoor signatures.

So one of the things that we want with signatures, ideally when we're dealing with nonces is deterministic nonces.

Because if you reuse a nonce across two signatures, the private key can be extracted from the two signatures.

And this has happened many times, most notably, like with the PlayStation 3 firmware, they reuse their nonce and the key was extracted.

And you need like a good source of randomness if you're just gonna generate a new nonce each time and you have to be very careful that it hasn't been reused.

So in ECDSA, we hash the message along with the private key and to get the nonce.

And that guarantees that if the message changes, the nonce will change.

And so you don't have to worry about nonce reuse and you don't have to worry about your entropy or your randomness for the nonce.

But when we're dealing with multiple party protocols like MUSIC and FROST, there's some attacks that could be done with the deterministic nonce where if a participant submits a malicious nonce and then everybody has to redo the protocol, all the participants who were honest are gonna produce the same nonce.

And the one that had produced the defective nonce will produce a different nonce and that can create nonce reuse kind of problems that are similar.

It's not exactly nonce reuse, but it's a similar kind of attack.

So these protocols like MUSIC and FROST have not been able to use deterministic nonces.

There is a protocol MUSIC DN that uses zero knowledge proofs for deterministic nonces.

But this now, this new paper is more lightweight than MUSIC DN.

It's more efficient for when there's a smaller set of participants and we can get deterministic nonces with I think something that looks very similar to FROST.

And I believe that means we can sign in one round.

So like typically FROST, you either need to pre-generate your nonces in advance, which can create some issues of how do you make sure you're selecting the right ones or you need a two round protocol to sign.

And so if we have a deterministic nonce, I think signing becomes one round.

But we do have a honest majority requirement with this new technique, which means not just two of three honest majority, but like there's this mu thing, which is how many participants need to be present at a signature, even if not all of them are honest.

And so we have a little bit, we couldn't do like a two of three here.

We would need, if the threshold is two, so two T four minus one is three, we would need at least three signers present, even if the threshold is two, meaning we can, one of those signers can be corrupted and it's still secure.

So that's that.

So like I mentioned, proactive secret sharing is this way that we can change the Shamir shares without changing the underlying private key.

And this requires end participants to be present, but there's ways I think you can get around this where you could disenroll any participants that aren't present, rotate the shares, and then re-enroll the ones that are absent.

And there may be things there of like, how did those participants verify what happened while they weren't there?

But that is an area for exploration for how to kind of maybe change the shares around, even if not all end participants are present.

We assume that at least T participants actually delete their old shares, which is in the same security model where we assume T honest participants, otherwise they could just reconstruct the secret.

But also there needs to be like a secure deletion that takes place.

And if the old shares aren't deleted, that's a security issue.

Refreshing shares can also be used for disenrollment because basically, let's say you have six participants and five want to each participant.

The five participants do the refresh protocol and they just don't include the six participant.

And so now their shares no longer can be used for signing.

So that's a way you can disenroll participants.

The way this works for those who kind of know a little bit about Frost is you basically do a distributed key generation where the secret is zero.

And then you add those shares to the existing shares.

And since the first coefficient is zero, when the two polynomials combine, all the coefficients change except for the first one, which means that the shares are new.

Old shares don't work with the new polynomial, but the secret hasn't changed.

Another protocol that's part of proactive secret sharing is repairing.

Like I said, if there's like a lost share and that participant needs to recover or repair their lost share, the existing participants can send data to the participant that lost the share and they can reconstruct their lost share.

Oh, and also for refresh, there's an issue where it's being discussed to be added to Zcash, but it hasn't actually been added yet.

Repair has been added to Zcash.

And so this only requires T participants, not all N.

Communication complexity is a little bit better than T squared.

And what's cool about this is it can also be used to enroll a new participant.

So let's say you have three participants that have IDs one, two, and three, and number two was lost.

So you repair the share for number two.

But for enrolling, basically you repair the share for number four.

Like if you wanted to add a fourth participant, you run the same repair protocol, but you're repairing a share that was never actually created to begin with.

And that's why both repairing and enrolling are the same protocol.

Dynamic secret sharing is where you can increase the threshold or decrease the threshold without changing the secret.

There are some protocols where, rather than having a separate protocol for increase and decrease, there's some protocols where the same protocol can do either.

But those don't have good proofs for an active adversary, security proofs just for a passive adversary.

This has also been discussed in Zcash where somebody proposed one of these protocols that doesn't have good proofs for active adversaries.

And there was some discussion about that.

And it looks like the better way to go is to use zero addition for threshold increase, which actually looks exactly like our refresh protocol.

Where we use a zero secret, but we also just generate a higher degree polynomial.

And so then can increase the threshold.

And then there's this other protocol threshold decreased by public evaluation, where the participants repair a share for some new share that doesn't belong to anyone.

And that's publicly revealed to all the participants.

So everybody learns this new share.

And then they subtract it from their existing share in this special way that doesn't change the first coefficient, but decrements the degree of the polynomial.

So those are some things I've actually been looking into recently.

And I'm gonna be giving a talk about these at BTC++ in the first week of May.

And I think this stuff just adds a lot of value to Frost for wallets.

And I think is pretty exciting.

Yeah, so that's all I've got. - Thank you very much.

I'll take the lead from here.

I've shared links for all of the things that were, all of the slide links that were previously shown.

Give me one second.

I'll share my screen again. (mumbles) Okay, so we have a variety of questions that came up in the discussion.

If the participants are still around, I'll let them ask the question.

Otherwise I will recap the question.

So we'll start at the top.

Where is it?

Art, you wanna clarify your question as far as you still around?

(mumbles) You mean about rotating through shares?

Oh, no, no, no, it's clear for me that's a little ignored now.

I have another question writing it too. - Okay, so I did wanna make a statement here that we have some language challenges when we start talking about terms like rotation that we as a community need to be distinct on.

So since the underlying private key technically isn't changing, I technically don't think call that a rotation, but you don't really have a good word for this situation where we have MPC secrets in a fog in the network, and we're generating new shares versus a true rekeying.

And so I just wanted to say we need as a community to start clarifying when is something a rotation, when is it not?

Just because I say I don't consider that a rotation.

Powerful, useful, important, but I'm not sure I call that a rotation as something we have to do.

I think Tim offered a clarification.

Espen, are you still around? - Yeah, one of the things you compared to Shamira's secret sharing is that you have to combine the secrets.

And so if you don't trust or understand Frost, is there a way to combine everything so that you get the secret?

And this way you can basically generate your descriptors based on the secret.

So you combine the Frost shares and generate the secret? - Sure, so I'll do a quick answer on that.

Be one of the other experts can say a little bit more, partly because we're actually in the process of implementing some of this stuff and what we call transitional to Frost.

So VSS is just like the Shamira stuff, we have an SSKR, you can have a trusted dealer that splits it.

That's what SSKR code currently does.

And then of course, you kind of have to trust some computer somewhere and all the connection, network connections to that computer are have to be trustworthy.

And then you're on that trusted device and you're basically reconstructing the shares.

So one of our early goals is to use the trusted dealer code to create these VSS shares rather than old fashioned Shamira G256 shares.

And then you'd be able to restore that.

So technically, you should be able to take that intermediary VSS share that you received as a Frost.

If you really trust your network connection to a trusted computer and that trusted computer, you could give them those VSS shares and they could reconstruct a private key that they could use normally.

Obviously, it's much less secure, you're losing a lot of the value of Frost if you do that.

That being said, there is a special utility in the short term and transitions to do there.

And there also are things like, I've got some real open questions about VIP32 in an MCP.

Like I'm not sure that how easily and maybe some of the other people can answer this question, how easily and safely a Frost quorum can generate child keys that conform to VIP32.

I know they can create child keys.

There are some protocols that do somewhat the same functionality as what, as in a multi-computer process that kind of do child keys, but I don't know that they can conform with the VIP32 keys.

Anybody else have an answer on that one that would like to briefly speak? - Yeah, VIP32 is no problem at all.

So at the end of Frost, you'd have a public key and you'd use that public key as basically your parent public key.

And then you drive, you drive non-hardened child keys from that public key.

Anyone can do that once they have the public key.

And I mean, I guess you'd have to, you generate a random chain code.

So instead of the chain code coming from a seed, you take your Frost public key and then you generate a random chain code and that's your master XPUB.

Then you just derive child keys as normal.

And then when the- - But am I correct that that only works for hardened?

Or I mean, I think there's some, anyhow. - Yeah, this is just for non-hardened. - So if you've got hardened in your path, which a lot of people do, that becomes an issue.

So any case, I think that it's plausible that we can do it.

It could be that we need a BIP32 Frost that is the equivalent, IE uses the paths, but uses a different, uses an MCP compatible technique for doing it.

This also raises questions with BIP85, which again, in that particular case, it's using the child chain, private key and chain code to create a new seed.

And I don't know how to do that with MCP.

Zach, go ahead. - Thank you.

'Cause I'd asked about BIP85 in chat.

I just wanted to kind of expand on my question and give maybe like a basic scenario that we're looking for at foundation to be able to use something like Frost.

In the BIP85 example, that's a pretty popular feature of our hardware wallet right now, where it's not just even used for seeds.

I mean, technically with BIP85, you can use it, you can derive child keys for different things.

You could decide that, for example, we have a path that defines a noster key that's derived from the master seed on the device.

And we need to give users the ability to view these child keys, label them and export them from the device.

So it kind of takes your basic hardware wallet and makes it more into something like a key manager is maybe how I would describe it.

And that's what we call the feature on our device.

So the thing that I'm struggling with here is with Frost, because the master private key doesn't really exist in one place, sort of bringing everything together onto our device and trusting that hardware wallet, right?

But the full seed, which would compromise on the security, as you mentioned, I'm trying to think how we could somehow use this where we can still offer a similar feature with BIP85 and child seeds that users could export out from our device while protecting this master seed and signing from it for Bitcoin transactions with a Frost quorum.

So that's where things start to get very complicated and confusing for me. - Yeah, so again, my gut feel is it probably isn't gonna be easy under MCP, but you can get the exact same functionality, what you need by using an MCP friendly, MPC friendly protocol.

But I think that's kind of, one of the reasons why Blockchain Commons has been pitching to various grant organizations and to our sustaining sponsors to do more here, 'cause these are the kind of wallet problems, wallet level problems of leveraging these tools and leveraging these tools safely that we wanna explore.

I have some specific ideas, but then we need to run them by cryptographers and other people to make sure we're not shooting ourselves in the foot.

Continuing, does anybody have any quick question answer on that one besides the one I just gave?

Okay, so, but definitely worth exploring.

Some of the other questions that Espen asked, I just do a quick answer on, he asked, is anyone using Frost in production today?

I believe Brink and Blockstream are, but I don't know if those are betas or what the status is.

What's the, what is, what do you know, Jesse?

I don't know about Frost specifically.

I do know that like Frost-like systems are used, let's say at Coinbase, I worked on one.

So there's like Schnoor style MPC out in the wild, but I don't know in terms of Frost where that's actually up and running right now.

So just for people to be aware, obviously there's also Musig2, which a number of organizations are using and they're pros and cons of using Musig2.

But then the other big category is Threshold ECDSA.

So there are a number of organizations, Coinbase being the biggest one that basically acquired for a very large amount of money as an equity hire, a company that does threshold ECDSA, which is very Frost-like.

But the problem with ECDSA is that when it was invented, it was a hack.

Schnoor was beautiful, clear, elegant.

I have a little article about this on Blockchain Commons, but it was patented and the patent holder were, was impossible to deal with.

When I talked with them in 2001, they wanted 5% of global revenues, okay?

Which basically nobody can afford that.

That was clearly, you know, they didn't want to license it.

And so ECDSA was largely written as a hack to work around the patent.

That hack we're paying a price for.

It just causes a lot of different problems with in more advanced protocols.

That being said, in 2018, I think, somebody basically, you know, posted, oh, here's how to work around that hack and do threshold signatures with ECDSA.

That was then attacked and I'm not sure broken is the right word, but showed some significant weaknesses.

And then in 2021, another paper was written that addressed those questions.

And that's kind of what the, some of the coin bases of the world, people that, you know, can't transition to Squawks, to Schnoor, like the Avarium community, who can only use ECDSA keys, are beginning to play around with.

And I'm hoping to have a future meeting with the people that are creating those code bases.

The advantage of Frost is it uses Schnoor.

It is much easier for a cryptographer to make proofs about Schnoor because it's fairly elegant.

I consider the Frost proofs to be much more mature, much more well reviewed.

Then there was the question about maturity of libraries.

So the Zcash library, which supports multiple curves, so they support 25519 and the Ristretto family, but they also support SECP, did have an extensive security review, third party security review of their code base back in November.

That being said, the November version of their SECP did not use X-only private keys.

And there's some interesting, I don't know, some people might say, well, in retrospect, X-only private keys, as elegant as it is to have this wonderful 32 byte, always consistent rather than, you know, some of them being slightly larger and smaller.

We are paying a price for it in Frost.

Maybe, Tim, are you still around?

You wanna say something about X-only and some of the challenges that it adds to the Frost and music?

Yeah, so Tim's gonna do a mic.

So, but basically just to recap for people, when the Taproot came out, it was proposed, hey, there's this way of just using the X value so that we can have a single private key, excuse me, single public key associated with each private key.

Technically, there are four that are equivalent.

And so this scriptular kind of compression was really convenient 'cause it just fits into this nice simple block.

That being said, it causes some math problems when we're actually implementing code.

I think I heard Tim, go ahead.

Yeah, I think the reason why we came up with this is really just to squeeze out every piece of space we could get when introducing Taproot.

So this saves one byte for Taproot outputs.

It's not just a single bit, right?

Because we have to encode the bits somewhere and it's hard to squeeze it in somewhere else.

Yeah, so this is basically 32 bytes instead of 33 bytes.

And the thing is we didn't really seek like the negative consequences coming.

This is apparently makes engineering harder.

I'm not sure what we have done in hindsight to be honest.

I mean, it's still a reasonable optimization and it makes engineering harder.

But on the other hand, it's not like it.

If you get it wrong, it's not that security break sound, right?

Just have to think about your equations again.

I think like when we came up with this, we thought, okay, let's just save a byte in hindsight.

I'm not sure anymore, but yeah, I guess I'm biased because I wasn't worth in the process.

But even in hindsight, I wouldn't say it was wrong to do it.

Depends on the scenario, I guess.

But yeah, I mean, the thing is it's annoying. - Yeah, so the Zcash community did not implement X-only keys in that reviewed version.

So it hasn't been reviewed by a third party.

That being said, there is a PR to make some changes in their SECP implementation to support it.

As far as I know, the SECP ZKP community has not yet had a formal review of the ZKP code by a third party.

That being said, the developer community there is very mature and has a lot of experience with cryptographic engineering and is very skeptical about stuff.

So I find their code bases pretty solid.

That being said, it has not had a third party review.

And I see down further in the chat that this block stream is not yet using Frost, even though they're hosting that particular project.

Are there risks in terms of math or implementation?

Well, yes.

In math, I'm really pretty confident about Frost.

Again, there's a certain simplicity in Schnoor that makes Frost easy to analyze from a cryptographic, a cryptographer perspective.

Implementation, always interesting challenges, but we've also gone through a lot.

I mean, I started at block stream in 2015 and they were really kind of puzzling in lots of the territory of thresholds and what the challenges were and did a presentation for something that then basically they had to withdraw and do again in a different way.

Their other teams have done other stuff.

So I'm pretty confident on Frost as a general category math wise and implementation wise, fairly mature.

That being said, there are a lot of bleeding edges.

Again, Frost just creates a private key.

It does not create a seed.

It does not create a chain code.

And so there are assumptions by a lot of things that those are being created.

There's a lot of things like, I love, the most powerful thing for me in Frost is the distributed key generation.

So that basically means you don't have to trust a single device fully.

You don't have to trust the random number generator on your ledger or some side channel attack on a ledger.

If it supports doing Frost, then as long as you have multiple devices, say a foundation devices and a ledger and maybe a third party Frost network tool, you'd have to attack a threshold of them, not just one and do side channel attacks.

Same thing, that was the Apple attack recently where on an M2 Mac, M1 Mac, you might be able to get to the trust zone through a side channel attack.

Well, if you're using Frost, you're pretty clear in the sense that they'd have to attack the other thresholds.

And as long as you don't have all your thresholds on an M1, M2 Mac, that really makes it hard to attack.

I have a little more suspicions around ECDSA threshold signing, which we talked about either.

Is there a way to simulate Frost?

Yes, so that's one of the, again, I'm hoping to work on some tooling for what I call a Frost transition.

So in this case, we'd be using the trusted dealer code to generate VSS shares rather than to distribute it to each generation.

And that would allow you to distribute that to various trusted devices that maybe right now can't do the full operation.

So for instance, it's not clear to me that a Java card can do the full Frost DKG.

So you may have to distribute a share to a Frost, to an NFC card, or at least today's NFC cards.

But it could then participate in the non-signing.

So there are various things there where we need to explore these types of things where we can still use a master key and have a trusted device, and yet transition to a real Frost distributed key generation MCP world.

What else?

Obviously join the Signal Channel.

If you're interested in talking about this type of stuff, blockchain commons, Frost is an important part of our roadmap in the upcoming year.

What else?

I've shared about the Frost PRs.

We hosted our first Frost implementers meeting where we actually had people who are coding these libraries meet.

And I think it's been very fruitful.

We had people from not only the ZKP, Blockstream, SecP26K1 community.

We also had the Frost community and some of the people that are doing it also under 25519 all come together.

And I think there were some good results from that.

Continuing on down the list of questions.

So what is the status?

I'm forgetting it's Roast, I think.

Jesse, have you been doing anything with Roast?

So, or let me describe what Roast is.

So one of the things about forums in Frost is that you do have to have a threshold of participants.

And if one of them is an active adversary, who's basically saying, no, I don't, I am gonna cheat whatever and make this whole thing fail.

This is not so much a compromise failure.

This is a denial failure.

It's hard to determine who the cheater is.

And so Roast was a proposal that sort of added to Frost that would be able to have a, the dishonest adversaries be thrown out.

So as an example, let's say you had a three of 99 quorums.

That's a pretty crazy quorum, but let's just say, you're seeing the three people to participate.

Well, in a lot of these with Frost, it's possible for a bunch of people that, to basically collaborate and mess up your attempt to try to do a three of nine, and you wouldn't necessarily know who it was that did it.

Under Roast, in theory, you'd be able to just identify the three that is necessary for the quorum, even though it's a very small number of the total and still be able to sign because the quorum authorizes that.

Does anybody have anything new about Roast? - Basically done from research point of view.

And anybody could pick it up if they're interested, but I don't think anyone is currently working on an implementation.

I haven't heard of this. - Well, I'm gonna keep on spreading the word 'cause I think it's useful. (laughing) At least- - Yeah, okay, yeah.

Yeah, I agree, I mean, thanks, yeah. - Sort of in that same category, one of the things about the DKG that is used by Frost is that it is proven to be secure for Frost.

Like you can, there's a cryptographic logical proof that basically says these are good keys for Frost and a good technique to use for non-citizen things of that nature.

That being said, there are a lot of other places where it'd be really useful to have a DKG.

I mean, this is kind of like, does anybody remember when Zcash did their first key generation ceremony?

They had people all over the world distributed in forests in the woods using satellite connections and all that kind of stuff.

And they all did this cooperative ceremony that took like two days on a fairly powerful computer of the day to generate some key material that was used by the original Frost protocol.

Well, nowadays you can do this with a DKG and in less than a second with other parties, if you exclude the latency costs of communicating with all the other parties.

But it's not as clear that that DKG that is used in Frost is usable in a lot of these other scenarios.

So there is the same, two of the same people that did Frost have been working on something called Storm, which is a DKG that is more provable that it can be used in a wide variety of situations.

So I think, I'm not gonna name names, but somebody basically posted a bug report about our Shamir code where they were basically taking random shards, just random numbers using them as input into shards to try to create a private key.

And we're going, no, no, no, please don't do that.

It may work, but it's not provable that it works.

So, in theory, that's one of the flaws with Shamir as opposed to BSS is that you can't identify that somebody gave you a random number and is corrupting your restore, which is why we do some checks, sums and things that some of the security reviewers point, why do you have a checksum here?

That lowers your perfect security to just computational security.

And we're going, oh, computational security is good enough.

We don't need perfect security.

So- - Point of information, the guy who was trying to actually create random shares and collide them using our Shamir code ran into the problem that it was throwing a checksum error.

And he said, this looks wrong.

And I said, no, you're doing it wrong.

You're not calling a split secret.

You're just trying to feed secrets you created into it and trying to rejoin them.

And that's never going to work.

And our code actually prevents that. - So anyhow, we have similar problems where people will go, oh, well, here's this wonderful DKG for frost and we're gonna use it for everything. - Work. - But cryptographers can't prove that it works.

So I'm kind of looking forward to see what happens with Storm and stuff.

And maybe we'll be able to say the DKG in frost that creates these VSS shares can be used for a lot more things.

I think the point of Storm is to make creating the logical cryptographic groups easier, not necessarily that there's any problem with the frost DKG.

We talked about BIP85, that was in there.

We talked about BIP32.

So the limitation right now is for unhardened.

And there's also problems in 25519 when you do BIP32 that you can only do hardened.

So it's like BIP32 has some long-term problems that we've got to puzzle out.

How is frost different from modern MPCs in terms of requirements for interactivity, sync, asynchronous, this was art.

You wanna ask that question again, art, and clarify it?

You still around art? - Yeah, same.

Actually, I didn't go there.

It was answered. - Okay. - I missed something. - Yeah, so frost is a particular MPC that is optimized.

There are other circuit-based multi-party computation things that are much more computationally intensive that allow for other different types of properties.

So there is a kind of optimization with frost that means that it is doable on regular hardware and such.

There is discussion if you go to our silicon salon events, various ways of optimizing for some MPC operations.

But I haven't really found anybody say, here is a particular thing that a silicon device could do to accelerate some aspect of frost.

And I'm hoping that that'll be a future discussion.

I know that for instance, cranium is talking about a particular optimization that will speed up one of the ECDSA threshold signing because there was one particular place that was a bottleneck that could be accelerated on a dedicated chip.

But I haven't gotten that kind of answer from the frost community of, oh, wouldn't it be nice that this particular operation could be done securely on a chip and faster using some kind of hardware acceleration?

Like to see that.

Yeah, how has adoption of these interactive protocols been in practice?

There's been a lot of Bitcoin software and allergic reaction interactivity.

I don't know.

I mean, part of the problem isn't just the interactive protocol.

I mean, I actually talked about this in my next slide.

We demonstrated in this PR, that's not a PR, it's a report that in classic multi-sig operations, this is just two of three.

There are five decision points that the user needs to make.

There are 11 research points where they kind of have to think meta about the problem.

There are 31 actions that they have to do on three devices and a coordinator or two devices and a coordinator to do.

And there are five things that are kind of automated now.

Whereas with, say using Gordian request response, there are only two decision points.

There are six new confirmation points, but they're just sort of, hey, we wanna display something.

We want you to confirm this is what you really intended.

There's only one research point where you have to think meta.

There are 14 actions instead of 31 actions.

And 33 of the actions are automated.

And that's just with traditional multi-sig, none of these aggregated things, et cetera.

So I don't know how much of the adoption of these interactive protocols is because as UX designers, we aren't creating things like request response to make it a lot easier on the users and really focus on things there.

So I may be wrong.

Is there anybody who has, let me jump to the bottom.

Anybody else have a comment about the, is what are the obstacles to the quote unquote allergic reaction to interactivity on Bitcoin?

Jesse, do you have any thoughts on it? - Well, I mean, I think one of the big impediments right now is just we need some good implementations.

The interactive interactivity, like you can, if you really wanna remove it, you can do pre-generated nonces and try to get that to be secure.

But also in a lot of settings, it's not a big deal.

Like let's say for example, you have a two of three wallet.

Like let's say for Bitkey, where you have a hardware wallet, a phone and a server.

When you go to like tap the hardware wallet, the hardware wallet can perform the signature in a single request response cycle, where in the request to the hardware wallet, you give it all the nonce commitments from the other signers.

And then it responds with its nonce commitment and its partial signature.

And so, and then the phone has already received the nonce commitment from the server.

So like once you actually get into the design of the wallet, like the interactivity is not always that big of a deal.

And sometimes you can kind of package these things together and in a single request response cycle.

So, situations where it is a problem, but I don't think it's always a problem. - And there's definitely, this is an active area of an investigation and also cooperation.

We have a separate channel for discussions around NFC cards.

I think another thing, there is this common misperception with multi-sig that it has to be multi people.

But in fact, I could have my ring be a multi-sig partner and I just tap my ring to my phone.

Now I've got one of the quorums.

My phone has one and then you use a Tor gap, like what the Gordian server we showed you, which does a anonymous Tor location connection to go get the last value, the last of a forum of three or five.

So, and in that case, it's, it is self-serve and they're all my shares, my keys, et cetera.

So I think that's another thing that sometimes there's a misperception in these multi-sig protocols that it has to be multiple people.

So the next question that was in the queue also Art was a frost capable of HD, Shamir schemes.

Again, kind of some interesting questions here.

We talked about it, maybe we can't precisely do some of the bit 32 derivations, but we might be able to do the equivalent.

But we also demonstrated with SSKR how to do a two take traditional Shamir, which is generally just a T of N, but to be able to do it two layers.

So you could do things like the three of, the two of three of two of threes.

So it's equivalent of a four of nine, but you actually have some separation.

So you can say, these are hardware ones.

These are my best, my friends and colleagues.

And these are my trusted services.

I believe that we can do those kinds of two tier, maybe multi-tier types of things with frost, but again, it requires some things.

All of these require tweaks, and there really is no documented convention for how to do a chain code safely with a frosting.

So maybe we have to write that up.

Let's see, yes, let's see.

Somebody asked me in a private thing about descriptors and splitting it up, et cetera.

I think we answered that.

If somebody wants to re-clarify the question about the primitive of a trusted owner and whatever, if it wasn't answered by my other things.

Esten, go ahead.

Did you, okay.

So Tim said, we're, you know, blockstream we're not using frost in production right now.

He talked about the negation and whatever.

How is frost different?

I think we answered that in regards to other multiparty computation.

Jimmy mentioned the benefit of, you can do a lot of these things offline.

A lot of different operations can change without you actually having to move the funds.

We're hoping to do another frost round table.

So if you're actually not just a wallet developer, you're actually creating libraries for frost or you want to help us write libraries to see like, I'd really like to know with the best Java card that there is today, how much of, you know, these operations can we do on a Java card?

We'd love to have your help in trying to figure out what are the barriers on low power devices, which is part of why we'd started doing the no standard Rust implementation of some of our code is, you know, there are also newer devices that allow you to do embedded Rust.

And we'd like to explore that.

We talked about Roast, Arctic.

Craig, do you want to share your observation about Arctic?

Just to say, I've spoken to a few hardware wallet developers about frost and their likelihood of actually bringing it in.

And I think the non-storage and state management has proven to be the biggest hurdle that I've, from what I can understand.

So when I heard about Arctic today, I was obviously very interested for me.

That is a big step forward.

It sounds like we can actually achieve frost, maybe even on the hardware wallet devices that we know today, which I don't know would be possible otherwise.

So that was really the point that I was looking at.

Great.

Mark, are you still around?

Do you want to share what Premium Labs is doing with your hardware?

Yeah, because you had mentioned hardware accelerators and it's been a struggle getting ECDSA and PC to go in a reasonable amount of time for signature and generation.

But frost is already so much faster that that hasn't really been the focus.

It's about 10 times faster even without trying.

So yeah, I would be interested if anyone has an idea for specific accelerators around that.

But I think we've been focusing on the harder one that needs acceleration.

Yeah, so Mark is the CEO of Premium Labs and its parent company Crossbar.

They've been a sustaining sponsor of Blockchain Commons.

And they also hosted with us some of the silicon salons.

We did four of those last year, really looking at how do we have better hardware for these problems.

So I definitely encourage you to take a look at some of the transcripts and videos.

If you're interested in kind of looking at, forward looking at what's coming in hardware for better chips to do this type of stuff.

Shannon, can you put the silicon-salon link in the chat?

Talk about...

Okay, so if you have a question or a comment, we're going to try to close up the conversation today.

But I want to make sure that if there's anything else left that we capture it.

Our next meeting is going to be May 1st on May Day.

Dan Gould is going to be talking about serverless pay join using some of the UR standards.

He has a GitHub poll on that.

And we'd again like to talk more about improving the user experience using request response.

And we hope that you can join us in May.

Any last questions or comments?

Just raise your hand.

I think Dan is here.

If you want him to do a quick intro to what he'll be talking about.

Dan, do you want to share what you're going to be talking about next month?

Sure, happy to.

Thanks for the invite.

So my name is Dan.

You can find out about payjoin on payjoin.org.

The big idea is that it's very difficult to batch transactions to save fees and to have privacy.

A lot of people use things like coin join, which is a separate transaction, or lighting network which involves a whole peer-to-peer network.

Payjoin is the simplest way you can do that.

We're just a sender and receiver collaborate.

There's a version one protocol that's been around since 2018.

And some attempts at it even earlier than that, that in my opinion fail because they require both synchronous communication and the receiver to run a server on HTTP and get a certificate from a certificate authority.

So I'm working on a version two.

There's working software.

That's AlphaState.

There's a BIP77 that's up.

And the new protocol is asynchronous.

It uses oblivious HTTP by default to preserve the IP address privacy of both parties involved.

And it's backwards compatible with V1.

So I do hope you join us in May.

Thanks.

So one of the nice things about it is that we can also use the air gap QR work that we've been doing to facilitate that.

And then I'm hoping that we'll be able to add that to our request response frameworks so that you can say, hey, I would really like to do a Payjoin.

Can you do it?

And basically initiate that whole process for a TorGAP or whatever the different thing is.

So we're going to be talking about that next month.

Any last questions or comments from people?

Okay.

Thank you very much for joining us.

Again, I'm Christopher Allen.

These events are hosted by blockchaincommons.com.

I really hope you will continue to sponsor us and encourage others to do so.

We have submitted to OpenSats and Zcash Foundation and Human Rights Foundation, et cetera.

So far, they are not as productive as we hope they were.

So we either have to make it up from our members or if you have any influence on these organizations, say hey, we're doing good work.

And that would really help us.

So again, thank you very much to Jesse for teaching us all about Frost today.

Thank you very much, Jesse.

And also all the other Frost experts who came and joined us to help make clarity there.

We will have a video up probably later today, maybe the transcript up later today, and then we'll let everybody know through the Signal Channel and other channels when those are available.

Yeah, that's a couple of things to absolutely be up today.

Please, if you have clarifying questions or whatever, use the Signal Channel.

If you want to use the public GitHub discussion area, that way the advantage of Signal is you get an immediate question, but then it disappears.

The advantage of using the GitHub discussion area is that it's permanent and safe and we can all share with other wallet developers who maybe could make it here today.

Thank you very much and have a good day.

Thank you very much.

Thanks.

I'm going to go ahead and close this up.

Thank you.

[BLANK_AUDIO]
