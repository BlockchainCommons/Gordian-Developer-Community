Welcome everybody to the Blockchain Commons Gordian developer meeting.

We do this monthly.

This is our August meeting of 2024.

First off, what is Blockchain Commons?

We are a community supporting the self sovereign control of digital assets.

We bring together stakeholders to collaboratively develop interoperable infrastructure.

We design decentralized solutions where everyone wins and we are a neutral not-for-profit that enables people to control their own digital destiny.

We need to thank our sponsors Bitmark Chia, Crossbar Human Rights Foundation, Foundation Devices, Digital Contract Design, Unchained Capital, some of our larger sponsors.

But this has been a tough year.

We've lost a number of sponsors.

They all remain interested in supporting our technology, but they're having problems with funding especially those that are being funded through capital markets.

It's been a challenge.

So if you're interested in becoming a sponsor, please contact us at team@blockchaincommons.com or me directly.

We can also support your company on specific projects that are open source or related to our specifications.

Talk with us.

And I really want to thank Human Rights Foundation for our recent Frost Grant and Foundation Devices for recent Gordian Seal Transport Protocol research funding.

We also have a lot of individual sponsors through GitHub.

These are really useful.

Even a small donation helps.

And of course, the social proof of having backers allows us to go to organizations like Human Rights Foundation and others and say, "Yes, we have people that are supporting us."

To subscribe to our announcements list, you can go to Blockchain.com and subscribe.

There are two lists in particular, one for this meeting, the Gordian Developers meeting.

We also have one for the Frost meetings.

These are both announcement-only mailing lists.

For other communications, we use a signal discussion group.

If you need an invite, just go to that link and you can add yourself.

I also can share with you a Google Calendar invite.

It's unfortunately not automatable, so you'll just have to send me an email with what Google address you would like to receive the calendar I'd like to.

At our last meeting, we talked about SeedTool, Command Line and Rust.

We also talked about some new advancements in using SSH and the SSH envelope command line updates.

Then we had a presentation on what I think is really an important new capability for us, which is the Gordian Sealed Transport Protocol, or GSTP.

Today's topic is really all about seeds.

Seed resilience, how seeds work with the current Blockchain Commons technologies and stack.

We're going to have a presentation on BIP85 and another on the Ledger Seed tool.

One of my main goals here is really get your help in identifying what do we need to do next to be able to make seeds more resilient and secure.

What do I mean by seed resilience?

Obviously, seeds are the heart of digital asset security, in particular digital assets in the self-sovereign community.

They really are the layer zero of cryptographic security that everybody relies on.

Typically, a seed is 12 or 24 bytes, but they're crucial.

We have to keep them safe, aka security, and we also have to avoid losing them, which is resilience.

We're going to talk about both of those today.

What are some of the Blockchain Commons specs and tools on these topics?

What's been working so far?

We have UR envelopes for seed storage.

We've been talking about that for a while.

In preceding that, we have basic SSKR shared secret key reconstruction, sharding for seed resilience.

I think we started that in 2019.

It's beginning to get some momentum.

We're going to be talking more about that coming up.

An important area where we actually have demonstrations but don't really have a third-party wallet support is the ability to do request response for seed transfer and key derivation so that this can be automated in a useful way to make it easy for users.

We have two reference apps.

There's the seed tool CLI, which is in Rust.

That's the new version.

The old version was in C++.

Really allows you to create and manage seeds on the command line.

It integrates with envelope CLI and other CLI apps in our stack.

We also have I/O seed tool, which also works on the Mac, which really is about best practices.

These are not really consumer.

We've charged $5 for it because we don't want grandmas using them quite yet.

It's more as a demo for you to be able to test things against and also to be able to demonstrate best practices.

As an example, this is from seed tool.

It is what we call an object information block for a seed.

The seed has a life print.

It has a couple of identifiers that are useful.

This one being the seed identifier, but this being the master key identifier that you may have seen in other places like descriptors.

It also has some metadata in there.

In this case, it's the name.

You can basically get all of the -- you can scan this with a couple of different apps, but in particular, the seed tool demo.

You can get all the data out of it.

What does that data look like?

This is what you'll see in the QR itself, which is basically a minimal byte words conversion of this DC bore.

This is the hex version of it.

You can see here in DC bore what is -- what all is in here.

What is important in all of these is they create seeds, they identify seeds, name, life hash, the object identity block, backup seeds, not only with our own byte words format, which is really optimized for QRs, but we do support the old BIP39 and it can be very useful to export as text.

And then within envelopes, we support a variety of kinds of metadata, including name, dates, notes, output descriptors.

There can be more.

We need your feedback on that.

And of course, we can demo all the QR capability of which there's quite a bit.

We can shard the seeds in the original SSKR format, which is very concise and short, but also in the SSKR envelope format, which allows you to add extra metadata, which will be particularly important in some new emerging tools we are working with you guys on, which is collaborative seed recovery and Gordian depositories.

The seed tool iOS app also supports driving keys in a couple of different formats.

You can drive any one of any derivation, but we make it easier to support at least these three.

And then we do have a simple Bitcoin PSBT capability.

So if we receive a animated QR or QR with a PSBT and a variety of legacy and also the current format, the seed tool iOS will sign it.

I use it all the time.

This by the way, is a little bit more detail.

This is actually something with more metadata.

It's the same seed that I showed you before.

You'll notice a life print is the same and the hashes are the same.

But obviously the QR is more complex because it is an envelope.

This is what it actually looks like inside the iOS app.

You can see the basic information.

We make it very easy to create co-signers because a lot of the use of seed tool is with multi-sig.

We have a variety of developer capabilities.

You click on this and it'll show you the QR for a request response.

So this is how you could request this seed.

Basically we can back it up into SSKR format, the original and envelopes.

We can share it as byte words or bit39.

We can derive keys.

And again, in the crypto, when you turn on the developer mode, you can see the responses for the seed.

Obviously it has a name and creation date.

It has some notes.

We have the ability to support a Bitcoin output descriptor.

In this particular case, it's a witness key hash.

We actually do check and make sure that the pub key in here is properly associated with that.

And then again, as a developer assistance, we're showing the envelope notation for this envelope version of the seed.

So at this point, I don't believe we have anybody that is supporting the envelope version of seed capabilities.

But I think we've talked with several people who have it on their roadmap and would like to help you in whatever way you can to make it easy for your customers to be able to move their critical keys from one device to another.

One of the other things that is really nice about the seed tool iOS and Mac app is it does have the ability to print for offline PDFs.

This is great for multisigs.

So for instance, I have one of these in my safe deposit box that is completely offline.

And I can very quickly use it as my key of, say, two of three, it would be the third key of last resort.

And it has all the backup information you need so that if you have a regular wallet, you can still use the bit39 words.

I can see the output descriptor, et cetera.

Obviously, all of this is demo would be unique for different apps and different app needs.

You could put in lightning information, you could put in transaction data, et cetera.

But we wanted to show you what an offline version of this works.

Also, we support NFCs in the near field communication cards and in the NREF format.

So you can actually store this seed on a NREF card.

And we've been in discussions with a couple of different organizations that would like to see these on smart Java cards, which would give you some extra capabilities and would be able to leverage the key material that's in a smart card.

Seed tool CLI, again, allows you to create seeds, backup seeds, bit39 by words, hex, envelope, supports the multipart UR, which is kind of the underlying layer that allows for animated QR to work.

We can shard seeds, again, SSKR, the short form and SSKR envelope.

Translate seeds from one format to another.

And it makes it really easy to integrate with envelope CLI for signing a lighting, encrypting, et cetera.

So for instance, you may want to encrypt that envelope before you transfer it, say, across Signal or something of that nature.

Very simple syntax.

You can just type in seed tool, you'll get a random seed based on the machine randomness.

But then I can transfer, I can basically convert this format into bit39.

There's the bit39 for it.

I can also create three SSKR shares very, very quickly.

Again, send one of those over Signal to my close colleague.

And of course, I can examine it with the envelope tool to see that it has a seed.

So our main topic of the day is BIP85.

We do not currently support BIP85 in either of these tools.

We're trying to understand it better and the utility of it.

How should we support it?

And we want to talk about other security and resilience for seeds.

So Anish, do you want to go ahead and take over and talk about BIP85?

Sure.

Let me start my screen share here.

All right.

I'm not able to see two screens at once, but I assume, is everyone able to see my slides?

Okay, great.

So BIP85 is something that thank you for inviting me to speak, by the way.

I think we're aligned in terms of enabling individuals greater serenity and greater control over their cryptographic secrets.

And I think we all understand that this is the primary barrier to adoption.

So it's good that we have the wallet vendors listening at some level.

And I originally got into BIP85 to solve some of my own problems, namely that creating multisig Quora becomes like a big project.

And it's very expensive to change out your seed sets.

And I mean expensive in terms of time.

And the real promise behind BIP85 here, before I move forward, I just want to say, is that my contact information is here.

And I've got an open source repository that you can look at all the tools, which I'll be demoing today in this talk.

And let's see.

Okay, great.

So I think you all understand or let me state that the primary purpose of BIP85 is essentially to use a single secret as the root of a tree of secrets.

And this means that you can derive millions of secrets from a single seed.

This is all based implicitly.

It's a slight generalization of BIP32, which I'm going to get into and I'll show you how this works in just a moment.

But that's the key idea.

And a quick, very quick refresher here, the derivation paths from BIP44, we're going to use a generalization of those.

So M there, that is your master node.

And then you have these series of slashes.

This is the path that you're looking at here is five levels deep.

And this single apostrophe indicates hardened derivation.

We'll talk more about that in a second.

And every segment in this path is an unsigned integer.

So it's a 32 bit integer.

However, the leading bit is used to indicate hardening or lack thereof.

So if you have a leading one, that's a hardened child.

We'll talk more about what this means in a second.

And if you have a leading zero, that's an unhardened child.

So quick refresher on BIP32, because this is kind of the core of how BIP85 works here is that when BIP32 was conceived, it's funny because a lot of the terminology for this actually gets quite sloppy.

But we have this progression from master seed to master node.

We're going to go through all this derivation as it relates to BIP85 in just a moment to accounts and chains and addresses.

And the thing that hierarchical wallets were designed to do is you may want to have watch only wallets.

You may want to have a complex multi-tiered business where some people have their permission to see the transactions, but not the ability to sign the transactions.

And so this is this world that this, the entire HDWs, hierarchical deterministic wallets in BIP32 really opened for us.

And pretty much today, every wallet vendor, whether it's a cold wallet or a hot wallet, supports BIP32.

I want to go into detail here because my goal is to make it so that you will be able to use and implement the pieces of BIP85 that are generally useful for secrets management.

And in this presentation, that's really the context in which I'd like you to think about BIP85.

It is a generalized key chain and it's built on top of HDWs.

And the cool thing is pretty much all the software out there already has the algorithms and already has the implementation to do this.

So there's just some small tweaks required to generalize the BIP32 chain.

I think everybody understands the irreversibility of hierarchical deterministic wallets.

They're irreversible up to hardening.

I won't get too deep into this, but I'll talk a little bit more about it.

And the reproducibility of PORS is key.

If you have the master node or the precursor to the master node, I think they call it the master seed, and a derivation path, you can reproduce as many secrets in the tree as you need to.

And so this is a pure function, essentially.

And as long as you have the seed and the derivation path, you can go anywhere in the tree.

And it's fairly easy using the child index to jump to create a fresh secret, which we'll talk about in a moment.

Some of these asterisk slides I won't really go into.

I do think it's important to understand the yin and the yang of hardening.

And so unhardened keys are useful and that you can look forward.

So when you have a watch-only wallet, you use an extended public key.

And that allows you to see what all the child addresses are.

So there is an advantage to having keys that are unhardened, but that also makes them more dangerous.

And so a compromised XPUB is loss of privacy.

A compromised extended private key is compromised funds.

And then this strange property, what unhardened children, the undesirable property that they have is if you have an unhardened child key, private child key, and then you have the XPUB of the parent, you can actually get the extended private key of the parent.

So this is where the care comes in.

And actually, the consequence of this is that in BIP85, we generally use all hardened keys in the derivation.

The order is quite important and the terminology is important.

So the mnemonics from BIP39, those are the seed word phrases that everybody's familiar with.

Those get normalized and run through PBKDF2, which is essentially a multi-round HMAC.

And I think there's a fixed number of rounds.

It's all in the spec.

I think it's like 2048 rounds.

This is usually the most computationally expensive step in key derivation.

And you'll see that it dominates most of your CPU time because it is an iterative HMAC.

And you just, you keep HMAC-ing until you hit the number of iterations.

The extended private key is then one more HMAC.

There's a special process for deriving, according to BIP32, the root key.

And then at each level of the derivation, there are some pretty simple elliptic curve operations and another HMAC that governs the generation of the secret.

These I won't get into.

This is kind of specifics of BIP32, but it's here for your reference.

I want to talk a little bit about some of the software that has been written so that you can actually experiment with BIP85.

And I think to Shannon's point, this is software for developers who are writing applications.

And this is designed, this software, well, I did write it for myself so that I could generate seeds offline and multi-sig quora and these types of things.

But it's really for developers to experiment with as a command line tool.

There are also Python libraries.

And I want to show you a little bit how that works by way of getting to what are some of the things that wallets should be doing with BIP85.

So it's fairly standard.

You can generate mnemonics in any language.

You can pretty print mnemonics.

This is the first command here.

And this either uses user provided entropy that you can provide as an integer, or it will use the Python secrets library, which should be cryptographically strong source of randomness.

The next piece is validation.

This is going to become significant because I'm going to talk about seeds, Deganography, and the ability to generate seeds from non-traditional sources like decks of cards in just a second.

What validates job is essentially to check if the words are in dictionary.

And then of course, BIP39 has the checksum, which is part of it.

So it checks that all the words are dictionary and it checks the checksum.

And I guess one of the things that I'm experimenting with in the open source is this concept of a free language, which will let you input literally any string.

And this is the beautiful thing about pdkdf2.

It does not care what you input.

So this is kind of the basic idea.

How many people have heard of brain wallets?

Yeah.

So this is it.

Now, I'm not saying they're secure because as I'm saying on the slide, more entropy is better, but pdkdf2 is input agnostic.

So if you had a phrase that you'd memorize and you ran it through pdkdf2, and this phrase was of sufficient length and sufficient randomness, then in theory, you have the ability to derive a seed from anything.

And this level of portability is really important, war zones being an example.

One of the problems that seeds have, seed words have, is that if anybody finds those, they're instantly recognizable and they can instantly guess, okay, this must be part of a Bitcoin seed.

So stegography is the idea that you can hide the existence of the secret or the precursor to the secret.

They haven't gone anywhere on the BIP proposal stage yet, but I do have some early proposals that I'm linking to here for how to do a few of these things here.

The so we talked about mnemonic, we talked about validate, the XPRV is exactly what you would think is that once you have a validated string, you can then turn that into an extended private key.

And this becomes our masternode, as we showed in the BIP32 diagram.

And now is where things get interesting.

So the fourth command, and these are designs that you can all chain them together, and they really just reflect the order of maturity in that BIP32 diagram or the order of derivation.

So once you have an extended private key that can be treated as a root, you can now call derive and derive is really the application of BIP85.

And all you're doing in derive, you need really only a couple of parameters for derive.

So you need the root secret, you need the derivation path, and BIP85 tells you how to produce this derivation path, and I'll show you a little bit about that in a second.

And then you need an application.

Okay, so mnemonic in this case, this is the application, and this is kind of the inception or bootstrapping moment because we've taken one mnemonic and turned it into another mnemonic.

And you might think that this is totally stupid, but you can turn this into millions of mnemonics.

So from your root seed, and you can imagine developing a multi-sig core in this way, from your root seed, you can now develop zillions of mnemonics and populate as many hardware wallets as you want.

And it's much easier than having to independently generate those secrets.

And the security and irreversibility of that is really contingent on ECDSA and the BIP32 hierarchical deterministic walletry.

Let me just pause there and see if there are any questions, if I'm going too fast or too slow.

There are a few more things I want to get to, but I just want to see if there are any questions from the audience.

Okay, great.

So I don't know which algorithm they used in the Matrix movies to generate what you saw on screen, but they should have used BIP85.

And one of the neat things you'll see here, upper right, that there's a discrete random number generator in BIP85.

And this means from a single root secret, you can actually produce arbitrarily much cryptographically strong entropy as you desire.

And in the BIP85 spec, you can use this, how many people are familiar with RSA key generation?

So when you generate an RSA key, you have the option of providing a source of randomness to the RSA algorithms, and they don't know ahead of time how much randomness they're going to consume.

So discrete random number generator lets you, you can hand it off as a first-class function, and then you can just pull as much random because it's essentially a scheduled repeatable, given a fixed seed and given a fixed child index stream of entropy.

And so again, the point is here is that RSA is throwing entropy out and consuming entropy.

And again, depending on what you get, you don't know how many bytes of entropy you're going to need.

And this application allows you to just pull from a random and repeatable stream of cryptographic entropy.

In the near future, I will be the maintainer of BIP85.

So the original author is by the name of Ethan, and he's not been reachable for a couple of years now.

And so I've started to add new applications, and these are in pull requests.

One of the things that's missing from BIP85 is the ability to generate pins.

So you might want an ATM pin, you might want a hardware wallet pin, and none of the existing password schemes suit that.

So the dice application, you can see, and I'll show you the derivation paths for this in just a moment.

The dice application lets you say, I want dash n 100 die rolls, and I want six-sided dies, and then it will do the rolls for you.

For a standard pin, you would obviously use a 10-sided die, and you get as many rolls as you want.

And this is actually built on top of the discrete random number generator that's part of BIP85.

So there are a few other password schemes here.

So again, what is happening here?

So I want you to notice here that the application is BIP85, and I'm going to show you how these are generated in just a second.

The application is BIP85, and this allows you to generate a password.

And if you change the dash i, the child index, you completely change the password.

So you have 2 to the 31st of these child indexes.

I guess child indices hardened once.

And every time you change the child index, you get a completely new secret because that's how HDWs work, right?

And that is why, for instance, in a standard BIP32 wallet, a standard Bitcoin wallet today, the addresses are all orthogonal to one another and completely independent set of secrets and signatures.

I want to talk a little bit about what we've done from an implementation standpoint, from going from BIP32 to BIP85.

So we already have in the BIP32 HDW tree, we already have the 512 bits, or 64 bytes.

And by convention, the first 32 bytes are used as the secret for the for ECDSA.

And the second 32 bytes are used as what is called the chain codes.

And what Ethan did in developing this spec was say, hey, you know, what we have is 64 bits of cryptographically strong irreversible entropy.

There's no reason that this should be just confined to ECDSA or elliptic curve cryptography.

And so that's really what we're doing in BIP85.

The derivation paths you can see here, they're all documented in the spec, this 83696968 apostrophe is the purpose code specifically for BIP85.

And then you have a series essentially of arguments that your application takes.

For instance, what language are we talking about?

How many words do we need?

12, 15, 18, 21, 24.

And then what is the index?

Again, you change that index, you get a completely new secret.

So who cares?

What does this offer to our users?

Despite operational security, I personally find this much, much easier than, first of all, what a nightmare rolling dice is.

It's really hard to trust.

I mean, you really shouldn't trust other people's sources of entropy.

So this is much simpler in terms of you can produce dice from your own secure secret that you've created.

The possibilities for Stagnography are really neat.

So this has, it turns out that a deck of cards has the same strength as about 21 seed words.

I think it says like 221 bits of entropy, something like that.

And this is much easier than sitting there and rolling dice.

There's a bunch of weird methods for generating seeds, but it does have a trade-off.

And the trade-off is that this does not implement a checksum.

And my point is here, you can use these as inputs to BIP-C or you can use these as inputs to PBKDF2 and now you have your secrets.

And there are all kinds of neat things that I go through in the spec.

You can store secrets in chess games, you can store them in files.

And this is much better for people who are leaving war zones and don't want detectable secrets with them.

And it could just be something on your hard drive and nobody even has to know.

Again, there are plenty of trade-offs.

I'm not saying this is strictly better or dominates the existing paradigm of BIP39 seed words, but there's a much bigger universe out there.

And the most important thing for this group, I'm going to try and wrap up here, is really that hardware wallets now have everyday use cases for superior password management.

And I've done a little comparison here between what you could do with BIP85 and what you could do with Apple Keychain.

And I think the trade-offs heavily favor some kind of BIP85 style Keychain, cold versus hot roots.

You don't have to back up the ciphertext at all.

As long as you have a seed back up, you just need the derivation path.

And if somebody finds that derivation path on your machine, it means absolutely nothing to them.

It doesn't give them access to the secret at all.

Up to hardware security and up to the air gap of your wallet, no third party is required.

Coldcard actually has the BIP85 support is not good, not great in the ecosystem.

I hope that changes.

It's not difficult to do.

But Coldcard actually has this ability to give it a child index and it'll give you a base 85 or base 64.

I don't remember which of those two they do.

Maybe they do both password.

And there's all kinds of neat things you can think of.

You can have derived keys that are derived just in time.

So the secret doesn't necessarily have to be a hot secret.

And you can submit like, hey, I'm ready to log into this service.

And okay, let me plug in my hardware wallet.

And assuming the implementation is correct, the secret remains cold and offline.

And you just get a just in time secret.

And because you can have millions of these, you can do secret rotation.

There's all kinds of neat things.

So let me just see if there's a message in the chat here.

Foundation password is BIP85 support too.

Nice.

My goal really is to get as many hardware wallets as possible to support BIP85.

We can talk more about that.

So very, very briefly, there are a few limitations of BIP85 that I'm working on, correcting some of the test vectors, updating the languages.

The application code process is very arbitrary and it's not very user friendly.

And anybody who's had to back up a multi-sig wallet knows like, oh, I have to store this derivation path too.

What are these slashes?

So there's a lot of work that needs to be done there.

As far as ECDSA, I'm just making the point that if ECDSA ever gets broken, this all falls apart, but so does the entire Bitcoin security model.

So two future notes, and then I'll wrap and see if there's any questions.

One of the things I'm working on and proposing in this pre-BIP is that instead of...

So this path that we talked about, these derivation paths are just integers.

I can't read that and be like, oh, this is the password for...

This is my Google password.

This is my Apple password.

So what I think we should do is we should use JSON-LD and we should hash that into an integer and now we have these repeatable semantic chains.

So you could imagine that a desktop wallet would just store this tree of JSON objects.

It doesn't have to store the secrets at all.

And you can have a key service that provides the secrets just in time.

I think this is a superior model.

I think this would lead people, if we make it easy enough, I think this could lead people to use their hardware wallets every single day.

And not just once a year for some Bitcoin transaction.

So I think this is huge potential value.

There's a lot of usability R&D that needs to be done, but I think it's a huge potential value for the hardware vendors.

And then I do have this little pre-BIP on these what I call free mnemonics.

And I talk more about what the trade-offs are.

In short, it's much easier to hide these second graphic secrets, but they're easier to get wrong because the user has to implement their own checksum or the protocol needs to have its own checksum.

So those trade-offs are really worth it.

Again, given the portability of something like this, which is very easy to repudiate, I can just stick it in my pocket and leave the country or leave the house.

So I'm quite sure I went quickly, but I hope that that was stimulating for you and that you were able to think about BIP85 as a mechanism for hardware wallets to provide more value and a generalized key chain.

And I'll let Christopher run the agenda, but if there are any questions, I'd be happy to answer those.

Yeah.

So thank you very much.

I appreciate the detail.

And we can also open to other questions, but I very specifically wanted to talk about some relationship with the Blockchain Commons, Gordian standards and where things are going, etc., and BIP85.

So first off, I'll say the reason why I did not initially support BIP85 was that it wasn't clear to me cryptographically that reproducing the whole master seed capability of it and such was actually added that much security to it.

It felt like a bit of overkill.

As compared to just doing PVDKF on a secret, they're both cryptographically just as strong.

So I had some reservations about that.

But I will concede that, as you said, a lot of people have implemented it already because they're already supporting BIP32, BIP39, etc.

And it's well understood.

And it's a little bit of the problem that happened with SSKR versus SLIP39.

SLIP39, a lot of the people who developed BIP32 and BIP30, not later, BIP39 are not completely happy with their choices in retrospect, if you talk about them as a postmortem.

And the Trezor people basically said, oh, we've been working with blockchain commons and others on this secret sharing technique.

But we're just going to back away from the way the master key is generated and do it the way we think it always should have been done.

So it does it in a completely different way, which means that master keys that you create with SLIP39 are not compatible with the master keys that you create with BIP39.

And we felt that was really broken and caused lots of user problems and segmentation, etc.

So we decided to not support SLIP39 and develop SSKR.

And there are a number of people who come back to us and say, oh, that's kind of hidden in there that SLIP39 does this derivation at the end when you actually implement it differently.

And we're going to talk a little bit about that in a little bit when we talk about the ledger seed tool.

But my point back to BIP85 is they're doing it the same way consistently or whatever has some advantages.

So I think that's my first point.

I do want to hopefully keep separate some of the, as you say, free mnemonics and such.

It turns out that a lot of wallets don't implement that fully or completely or only work with English words and things of that nature.

So there's some interesting complexities there.

Also, I will point out that this was an old project.

This is eight years ago.

So this is basically how to turn a binary object into a poem to make it memorable.

I did a lot of study about what makes things memorable and how.

And actually, we have also in the same repo a little Python app that converts things into memorable poetry.

And I was able to derive there, for instance, all of these, you know, how do you do I am because obviously, but also these, these some of these word lists are things that are deliberately it turns out for memorization, there are two properties.

One is its valence, which is its emotional connection.

And the other one is its concreteness.

So if we think about a table, it's very concrete.

So it's easy to keep a picture of a table in our head.

Truth is not concrete, but it has a lot of emotional connection to it.

So it has high valence.

So you want to have words that have both high valence and high concreteness to make it memorable.

And so that was what this original research was.

This later ended up going into informing the work that Wolf and I did on byte words, which we needed for another reason, we needed byte words because of a problem with with qrs and how they encode things.

And we needed to be more optimum than things like base 64, which breaks qrs.

So or makes them makes them double the size.

So Wolf did a lot of work to basically apply all of these things into a word set that was a little bit different, all four letters, all high valence or high concreteness.

But also did some unique things, you know, the Demerol Levenstein distance was high.

And things like the first three letters are unique, the last three letters are unique.

And so is the first and last letter and no homophones, etc.

So I think my point is, is that between the problems of how different apps support BIP39, I don't want to say improperly, but I would say the majority use like an English table and construct it and don't do it the original way, which means they won't work with, you know, Japanese list and such is problem one.

And then there's this larger problem of, you know, how do you create, you know, how do you create these word sets?

How do you make them good, etc.

I would love to talk with you more about that and support your I like your your CLI approach of having an arbitrary text and being able to turn that into a dictionary.

But I think it should be kept separate from BIP85.

I think it shouldn't be part of BIP85.

You totally agree.

Sorry, go ahead.

Okay, no, continue.

That was a beautiful summary.

I think you nailed all the high issues.

And just to reiterate this, getting free mnemonic and steganographic mnemonics is totally orthogonal to BIP85.

I do want to talk about SSKR very quickly, just to say that there's no requirement on how you construct the root secret for BIP85.

So you could have some here, some here, some here secret shares that are used to construct the root secret for BIP85.

And yes, those are all indeed separate issues.

And I think the main trade off to your point, Christopher, the thing I like about BIP85 and why I would recommend it over what happened with slip 39 is you already the vendors already have the implementation.

I think it's just it's just a matter of nudging them to use that.

Yeah.

I also wanted to point out one of the other big values in in BIP85 is so we did this book in 2019, after a couple years of talking with Bitcoin core engineers and big holders, etc., who collectively lost millions of dollars now, probably tens or hundreds of millions of dollars because of loss of keys, in particular, things like using BIP38 encrypted keys, which still is a bugaboo that we haven't got a good answer for because of the similar problem that you're running into, which is the there's no checksum on these passwords and such on these pass phrases or IDs.

And I think that was one of my other reservations about a BIP85 was we still didn't address that problem.

And then we found in the you know, in 2019, 2020 and 2021 that despite we really working hard to make these as easy as possible, so you could have one really good strong random seed that was properly secured and backed up, etc., that people wouldn't even spend the one hour to do it.

I mean, you know, the prior thing, I think, was called Glacier.

Yeah, it was a Glacier project.

And you know, Glacier project, you had to buy old hardware that doesn't you know, and you had to it was like this day long, you know, mess.

So we got it in this book down to like a one hour exercise to very carefully create a master key that you could create offline.

And we eventually we also created a tool called Leithykit, which basically you could, you know, in a in a device that completely let me do I have a picture?

Yeah.

Yeah, so this is Leithykit.

The idea was you have a relatively dumb device that could basically, you know, take an offline seed.

You know, you could take this into the safe deposit box, put in your the seed and then it would create the the the the SSK ours or the other different types of things.

It would be great to add a bit 85 to Leithykit.

And the choice of the hardware also was it has no memory, you turn it off, it's gone, all of that kind of stuff.

But obviously, you know, nobody's made a Leithykit, you know, cheap enough, commercially available enough.

But it sort of illustrates the problem of, you know, people don't want to spend the hour to protect that one key, and then you still have to create the child keys.

I think that 85, you know, offer some opportunities for some low end hardware like this, maybe do this on some kind of, you know, not so much a Java card, but maybe there are some small devices, credit card size, but thicker that, you know, could do this in some interesting ways.

The way we ended up ultimately recommending was these offline QR codes.

And we have a, you know, a bunch of discussion in our repo about what happens with multisigs, how do you care for multisigs, etc.

Probably the biggest one was the designing SSKR.

No, wait.

I think where is the yeah, this is the newest, the newest one.

So we talked to, you know, one of the things that was happening with multisigs is that the use, even with our very, very carefully designed processes for multisigs, you know, they're still too hard.

People there were too many steps.

It was that hour of time.

But it was also all of these decision points, you know, things where a user had to make a decision, or had to do a little bit of research or look something up or whatever, the actual actions that they had to do to do all the steps.

And you know, what could wallets facilitate?

In using envelope request response, it just became two decision points, six places where you needed to confirm that the steps were done properly, only one research instead of 11, 14 actions rather than 31.

And, you know, there are now 33 automated actions that require no human intervention.

You just do the steps.

This was just taking our very rich scenario to create a one really good master key, which I think is part of the problem here.

No matter even if you have BIP85 and more people do it, you still really need one good master key, whether or not you want to put that on a passport or have it completely offline or whatever is the right scenario for you or use it in a multi-sig scenario.

There's just some interesting things there.

So I like BIP85 in that it helps there, but I'd love to see it integrated with the, you know, kind of these larger thoughts.

And I do want to reiterate, I would love to figure out in BIP85, since there are really only two organizations that have deployed it in wallets, you know, can we at least have a, you know, BIP85 this or something that recommends that the secrets have some form of, I mean, you know, it's turtles all the way down.

So we just created a secret in which we have to do special care to make the secret a good secret whatever and then be able to make it resilient and SSKR it and all that, only to have a new secret that now we have to annotate and we have to say what is the key with it and whatever, that, you know, maybe there's a BIS version that has some kind of checksum on those.

I think that might be a worthy effort.

So you can at least check and see is this a valid secret that we're using to derive the BIP85 pattern.

>> Christopher, may I make a quick comment here?

>> Sure.

>> You know, you showed off the byte words spec and one thing about the byte word spec is you can use raw byte words, you know, just the correspondence between the four letter words and one of the two six eight bit values.

But the actual spec, if you use it in its fullest sense, then the sequence that you encode would be CBOR.

In other words, if you just want to encode a binary string, it would start with a length byte, essentially a CBOR length byte.

And then when you actually encode it into byte words, the last four words are a CRC32 checksum.

So by adding one byte at the beginning or one word at the beginning and four words at the end, you would have a well formed set of human readable words that, for example, your seed was 16 words, 16 bytes or 32 bytes, whatever, then you'd have that many words plus five and you would have a checksum in that case.

And of course, you don't have to go all the way to words, you could just use the byte values, but then there's this easy correspondence between human memorizable words that actually have a checksum and the actual seed data.

So that might be a way of adding a checksum fairly usable human handleable way.

Yeah.

I mean, I would love that you take a look at the command line tool.

Where is the docs?

Yeah, another thing about the seed tool that we have, which is written in Rust, and it has a deterministic function or parameter, and it does, I believe, I remember off the top of my head, I wrote the code, uses HKDF to hash that into entropy.

And the primary use of our deterministic field is for testing purposes, because we either want you to generate your own entropy using cards, dice or whatever, as much of a pain as that is, or use the built in cryptographically strong random number generator, depending on what you trust more.

But we also offer the deterministic feature, which could actually be brought in line, I guess, with BIP85 in certain ways.

And then the other thing we don't do, which BIP85 does, is allow you to, BIP32 style, provide a derivation path, if I understand correctly, so that you're essentially deriving a seed from a BIP32-like path.

And so that's something that could be added to seed tool that would be BIP85 compatible.

So that's just a few ideas off the top of my head, if that makes sense.

Yeah.

Quick comment there.

The checksum is the easy part.

It's entry errors that are difficult to avoid.

So in other words, we can always, you could take the fingerprint of the master key, you can hash the input.

Here's the problem, though.

So let's say I have a fingerprint for this deck of cards.

That doesn't make it any easier for me to get the deck right when I enter it on a keyboard.

So there's just two different steps there.

It's actually very difficult to enter it wrong, because the first and last letters are unique, the first two letters are unique, the last two letters are unique, no homophones, all those things.

So yeah, so that actually is designed to reduce data entry errors.

Even if you have to speak the words over a telephone, personally transcribe them or enter them yourself, because you can just, you know, and the the if you look at our iOS seed tool when you enter byte words, you can enter very little actually can do rather sloppily, but it will actually tell you along the way, whether or not you are entering valid byte words.

And that error correcting checks are pretty good on top of that.

That is that is huge.

And that's why dictionary words are so useful.

And obviously, there are more redundancy checks here.

But that's what's hard about the steganographic seeds.

Like if you have a chess game or you know, a board game like oh, well, I definitely want I think that's great for to be able to support.

But I think maybe I'd love to see you support as a maybe the base as some kind of a base byte words or, you know, some things of that nature would really help.

And and then, you know, also you have your own, you know, format for how you format the the seeds, how you format the cards, how you format dice, the commands you use for dice, etc.

But you know, before we kind of move seed tool CLI to, you know, formal release that maybe we talk about making those be more common, because I would really love to see one of the things that I really loved about lethal kit was you could use dice with lethal kit, using the deterministic mode, and always get the same thing.

And then you could do dice with the CLI tool on a computer.

And you could do dice on in using a piece of paper and a little bit of manual calculation for the CRC at the end, you do it all these different ways to at least determine that all those devices were consistent before you use them for the real thing.

So there was, you know, it's it's not precisely the reproducible build problem, it's a reproducible result problem.

And it's, you know, not perfect.

But if all three things when you give it the same dice, give you the same seeds, then you can use that same technique for something that on the most trusted of those places and feel like you have some confidence that that, you know, it's not doing bad things.

So again, I'd love to work with you to have a Python version of what everything that seed tool CLI does and have see a seed tool CLI support, you know, the bip 85 things, etc.

And again, if we can puzzle out how to keep we have a separate app for byte words.

So because of this, rather than build a byte, I see a light tool as well.

But yeah, so, you know, we're the main the main big advantage I see of the BIP 85 is just being able to derive seeds from seeds as opposed to BIP 32, which is driving keys from a seed or a root key, which we derive from a seed.

So we we strongly at Blockchain Commons have had a commitment to cryptographic seeds is useful for a long time.

And BIP 85 does seem to fill a gap in what we're doing.

So just how we kind of integrate it and how we make sure that there's maximum interoperability for the good of the, you know, all our users and all that I think is the question going forward.

Yep.

I know it's a BC byte words in Python.

And then the reference, there's also a reference CLI app, both those are in C, we haven't moved those to Rust.

But you know, but again, I think the more consistent we are, the more things we offer.

Agree.

This closing thought would be that now not just seeds, but but passwords, you know, and again, I'm excited about that because users need this.

And I also think we're living in an era where people are scratching their heads, like, do I really want to trust one password like the for like, literally everything in my life, you know, every, every account, every bank account, like, you know, then that's, that's a lot to ask for, for somebody.

And then the thing that really pained me what I'd like to do and where I'd love your help on the BIP85 spec is making it more developer friendly.

Oh, these are the arguments you take in and this is the return value is like totally up in the air.

Because paths weren't really designed.

And how are people going to build good applications if they don't even know there's not even really I'm trying to work on this, a convention for ordering the arguments, they're all integers.

Like That was one of the ones I was when you were talking about that.

That's exactly what DC bore and envelope do.

Okay, going adjacent LD structure, which having I have far too much experience with JSON LD and it's, you know, I'm an invited expert on the W3C on two specs that use it.

And boy, a lot of people don't get it right.

It's hard to do correctly.

Envelope addresses a lot of those by basically having everything be ordered deterministic, just moving forward as an ITF standard.

So like all your maps are sorted, you know, numbers are reduced, etc.

So I think there's some real opportunities for that structure that you kind of designed as JSON LD thing for it just to be an envelope.

And the advantage also is that if you want to share that you can align any of the individual elements that maybe aren't necessary for you to be able to do a restore or maybe are too long.

I mean, we've talked with one wallet developer who only can put a thousand bytes on a storage card.

So, but you know, if you're doing SSKR envelope and you've got, you know, a really long description, or you know, you have, you know, many output descriptors or many bit 38 passwords or all that, you know, your transaction data, that's not going to fit into the into that NFC card.

Well, what you do is you align the stuff you don't need.

But because it has checksum in it, I mean, it has hashes of all the things that are missing, when you get the the, you know, a sufficient quorum threshold.

And one of those thresholds came from, you know, something that was secured on Google or Apple.

It has all the extra data that you need.

And you know, it's but it's that offline version of it that let you decrypt it, and then be able to see and go, oh, yeah, the you know, this these envelopes match, there's extra data here.

So again, you know, there's some real opportunities to leverage envelope and other things to for that purpose as well.

Christopher, if I might make a jump in and give a pitch for we're going to be releasing a comprehensive understanding Gordian envelope video soon, which I think everybody here should watch, it's going to basically go into all the, you know, architecture, according envelope or, you know, lay the foundation concepts and then go through a bunch of applications and extensions for including our SSKR extension and you know, what the seaboard is and all these things in a very kind of understandable way for technical people.

So I've worked very hard on that and it's in review now.

So we hope to come up with that in a few days.

And it should answer a lot of your questions about what are we even talking about when we talk about 40 number open deterministic seaboard and all that and why we think it's really going to become the go to over things like Jason LD.

And you were one of the parties who's actually implemented VIP 85 for your wallet.

Do you want to share with us a little bit about, you know, what your what was involved in making that decision and your, you know, your thoughts, you know, regarding some of the things we've been talking about?

I mean, we were getting a lot of actual customer requests for it.

It actually wasn't on our roadmap, but we were getting a lot of requests for bit 85.

Today you can create 12 and 24 word mnemonic seeds as well as noster keys.

And we'll probably be extending that in the future.

But I mean, it was trivial to implement, right?

I mean, we already do key derivation or sorry, derivation paths.

And so I think it took us like two days to fully integrate it and make it work.

So it's such an easy thing.

It was such an easy win for us that we there was like no reason not to do it.

Great.

Do you have your own application for noster keys or is that?

So there was a there was like a NIP master improvement proposal, I think that had the like the defined derivation path for it.

But I think I'm not sure it's like, I think it's a standard standard.

I mean, it's the fact there's standard.

And so we just you know, people were asking for it.

So we implemented that as well.

But I think there probably be other way other better ways of doing that in the future.

I think there were some some ways of doing like time box derivations as well so that you could like have a signing key outside your hardware wallet that was valid for a period of time.

So I think it's been a few months since I looked at any of that.

But I know they were doing some they're making some changes or some some proposals so that you could do signing without having to go to your hardware wallet every time.

If you have like the private keys stored on the wallet.

Or a child of the private key.

Yeah, it was basically what they were doing was like having a child with a private key that was valid until a certain block or something like that.

So anyhow, we definitely I'd love to have we used to have more of the lightning community here.

I know they watch the videos, but the time zones in Asia, it's like Europe or Asia.

Can't do both.

But there is some interest in the lightning and noster and other communities in this stuff.

We also have, you know, a little bit of discussion with other other blockchains and some of their needs.

I know, for instance, either I am really the guy who designed the first major wallet, which which which is what everybody kind of bases their architecture on hated.

BIP 32 and BIP 39.

And basically all they do is create one key.

That's the only place they use it.

They don't really use derivations.

And that causes some interesting complexities because that means you're using the same keys to spend money as you are to authenticate to a website, which is just not a not a good idea.

So we have a big lot of thoughts about some articles about key separation and key usage and things of that nature.

I'd love to figure out when we're writing a either a separate bit or some other spec on how these additional secrets are created for the paths that would allow us to have things like a key usage, you know, saying, hey, this is only use this this path for an oster use that, you know, don't use it for other things.

Or yes, this, you know, you can be paid on this, even though it's also an oster key, that type of, you know, usage, key usage is is powerful.

Anyhow, it's a I want to make sure we get to our second our next presentation.

Any last questions from anybody can also bring them up on our signal channel.

It's monitored regularly.

So if you've got your presentation niche.

Yeah, thank you.

My pleasure.

Thank you for having me.

So our next presentation is on the ledger seed tool.

You want to take over the screen?

Not seeing it yet.

Okay, yeah.

Okay, so I wrote an application or I want to introduce yourself real quick.

Sorry, sorry.

Yes, I probably should.

My name is Aiden, but I'm using my nickname, Aido.

And I'm in Ireland, as I mentioned earlier.

So I owned a ledger wallet, and it didn't provide Shamir secret sharing.

So I thought I'd write my own.

So this presentation goes through that.

So let me just go this way.

All right, so you can open the presentation.

So I wrote a letter C to an application by me, Aido.

So the topics I'll discuss are why I wrote it, the tools I use to write it, the challenges I had when writing it, the current status.

If I have time, I'll do a quick demo.

And then I'll talk about the future of the tool and what I plan.

So the origins.

So BIC39 is not a good security for the average person, but I didn't think as a ledger device owner, I was a bit paranoid and I thought BIC39 is good, but it doesn't have redundancy.

And that was one of my requirements for my own general security.

I thought multi-sig is another good solution, but the complexity was a little bit too much.

And I thought the complexity probably suited narrative organizations rather than an individual.

So I came to the conclusion that Shemer's secret sharing is a nice balance between security, complexity and redundancy.

So I searched to see where there existing applications on ledger devices for SSS and their word.

And so did a little bit of research and found an issue on the ledger GitHub site, discussing exactly the problem I had.

Now this issue had been open for at the time, four years.

And there was a bit of discussion back and forth about the best solution to implement SSS on ledger.

Now initially the issue was opened as a request to implement SLIP39 on ledger devices, but through the discussion, it was saying that that wasn't actually a possibility.

And the conclusion then from that issue was SSKR was the best solution for that.

So as I said, that issue had been open for years.

There was no movement on it.

A lot of people talking, but ledger weren't really involved.

So I thought, let's just have a go myself and see if I could do something about it.

So I started writing in that.

So how was I going to write the app?

Ledger rightly so do not allow you to extract the seed.

So, but they do have an app that allows you to check the seed.

If you input your own bit 39, it will check that against the seed on the device.

So you're not directly accessing the seed on the device, but you are inputting your own thing and there's a comparison.

And by that, you will then obviously know the seed of the device.

So this was key to the solution of implementing SSKR on a ledger device because then I could use and leverage the bit 39 SSKR round trip so that I could get a user to input their bit 39 phrase and use the round trip to output some SSKR shares.

So Ledger have a tool, as I said, the recovery check tool that does most of this work, which asks the user to input their bit 39 phrase so I could use this.

So this was a good start.

So I was off.

So then taking the ledger recovery check up, I could plug in some of the blockchain commons libraries and the SSKR library, the SSSC library and the BC Shamir library.

So I started using them.

Now also I would need to test the app once it was written.

So Ledger provide an emulator.

So that was good.

I didn't need to own every single Ledger device, but I could use the emulator to emulate different devices.

And then once the app is completed, needed testing as well.

And it was a good comparison to compare the output of the device and with the C2 CLI, too, so that I could compare and make sure the app is doing what it should be doing.

So those different tools help.

So as I was writing it, there was several challenges.

First, I'm not a real developer.

I was, I can understand C and write C, which is what the app was written in.

And, but yeah, it's not my day job, basically.

So that was one challenge.

Second challenge was halfway through the development of the app.

Ledger decided to release Ledger recover and the recovery service.

I wasn't at the time sure what that service would involve.

So I thought it would actually discover the whole app.

So I started to give up for a while.

But as it turned out, Ledger recover, they released a white paper and it didn't clash with the app itself.

So that was good.

Another challenge was although I owned one Ledger device, my budget didn't allow me to buy all the different types of the three different Ledger devices at the time, the Nano, the Nano S Plus and Nano X.

So that was one challenge.

Also Ledger have an emulator for testing.

And sometimes the emulator doesn't do exactly the same thing as the actual device.

So that was another challenge.

Also as part of this emulator, I discovered that the CRC32, the checksum output is broken.

So I actually had to write my own version of that and do a pull request into the speculums itself.

We got them to fix that.

So we overcame that.

So Ledger can do some finite field operations.

And I wanted to leverage those operations rather than the finite field operations in the blockchain commons tools, because I just thought it would be a bit more secure.

And if there's hardware acceleration or whatever on the device, I could use that as well.

So not all devices have that.

So Nano S, for example, doesn't use finite field operations.

So I wrote my own for that as well.

And also speculums again at the time, they did not implement finite field operations.

So that slowed down testing as well.

And then finally, once the app was written, it would obviously need a security audit.

Now Ledger helped out here because normally apps are written by larger organizations, not a single individual.

So they took on board actually doing the security audit themselves.

So otherwise, I would have to pay a push, which my budget did not allow.

So basically, all those challenges were overcome.

And we got to where we are today.

So the app is released at the moment on nature.

It can be run on the Nano devices, the Nano S, Nano S Plus, and the Nano X.

And I have a read me which sort of explains how the app works.

I'll just flip across to that.

Yeah, no, that's sorry.

I'm going back on myself here.

This was the issue that was initially raised that caused me to write the app in the WordPress.

So a lot of chitchat going on there, coming as a conclusion that we need to use S.K.R.

So this is the app itself, the GitHub repository.

So it gives an explainer of the different things the app does.

Not all things work on all devices.

So I just created a table there.

So I pretty much at the moment have everything I want working for now working on all the Nano devices.

So you can check your BIP39, which is exactly what the Ledger recover app originally did.

So recovery checkup, you can generate some S.S.K.R shares.

You can check those shares.

And you can convert those shares back to BIP39.

And I'm currently working on the Stacks version because I don't have a new device, a Stacks device, which is actually it's a much improved device as regards to the interface it uses, the screen and all that.

So you can do a lot more things with this device than with the previous devices because basically the Nano devices, basically what we are is a small OLED screen with two buttons for input connected to a secure element.

So it's a fairly basic device.

It sort of doesn't give you much options for, you can show on the screen how you input words and that can be a bit tedious stuff like that.

Whereas the Stacks device gets around all that.

It's a touchscreen with a much larger screen.

So you can do a lot more things with it.

So then I created a flow chart of different menus that you can...

Oh, sorry.

I just want to get a bigger version of that flow chart.

Oh, where have I gone?

There we go.

So the flow chart here, basically it's the different menus available within the app.

So you can do your Bit39 options.

You see this part here, the top left is everything that exists, pre-existed in the ledger recovery check application.

So I stole all that.

And then once you've typed in your Bit39 phrase and it's verified it, I then chunk in all the SSKR stuff for generating the shares and then conversely, the round trip then is the other way around where you input all your SSKR shares and it will give you back your Bit39 phrases.

So that's kind of a flow chart through the different menus.

Now also, once I had the app written, Ledger decided to write a little blog post on the app once they released it.

So this blog post, they just asked me a few questions and I answered some of their questions and it's pretty much this page is available on the Ledger website and it's pretty much saying what I'm saying to you now.

So there's nothing new in there, but if you want to visit that.

So what I might do is I might do a quick demo of the app using Ledger Spectless.

So when I do the demo, basically, as I was saying, then Ledger Nano screens, it's quite limited.

It's a small tiny little OLED screen.

These are some animations which I'll go to in a second and you're a bit limited.

So the input here is if you've ever sent a text on an old feature phone from the 90s, it uses predictive text and the input is pretty much the same.

And all you have is a left and a right button to choose all your letters.

Whereas as I mentioned, once we move on to stacks, even much larger screen and it makes it a lot easier because what I found is, for example, sskr shares, they can be 46.

Yeah, so they can be up to 46 words long.

And that gets quite tedious when you're just two buttons to input, use for input.

So the stacks sounds a lot of that.

So if we have time, how are we running?

Are we still got time?

I might just show you a quick demo, a power speculus and to show you what the app looks like initially on a Nanos and I'll mute the input devices.

So I just want to power it up now.

So this is speculus.

Can you see that?

Yes, we can.

Okay.

Yeah, I'll be sure.

So basically you start up the app, opens up on your device and you use your left and right button to sort of go through the different menus.

So I'm still seeing the animation.

Yeah, sorry.

Yeah, I can't see the same.

Read me.

Really?

Okay.

Yeah, we're seeing that this BIP 39 menu, this the old animation.

You may have to unshare and share again.

Okay, maybe.

Okay.

I'm trying to onto the screen.

I was sharing.

Sometimes Zoom makes it hard to find the screen you're looking for.

Yeah, I know.

No, I can't see where I'm sharing.

Okay, my demo has gone.

Well let's.

There we go, sorry.

So if you're able to find it quickly, otherwise maybe we should go to some Q&A and discussion.

Yeah.

Okay, there.

Can you see that now?

I'm not seeing you.

There we go.

Okay, there.

So this is what it looks like on a ledger in Anos.

See your different menus, check the 39, SSPR.

And again, all you have to navigate through this is a left and right button shows you the version and you can quit.

Now quickly, I have what I can do in specless is you can actually save some key presses.

So I save some key presses to speed up things.

I'll replay them.

So now I'm replaying the screen.

So here's how you input the words.

As I said, it's like predictive text from the 90s.

And this is a 12-word phrase that's importing at the moment.

So it's not too bad in putting this way when it's 12 words, but when it gets to 46 words, those get a little bit annoying.

And that's why the stacks is going to save us here.

So eventually once it gets through the 12 words, it'll give you an option of either quitting on the app or choosing to generate some shares.

So we're going to be on seven.

Just let that play out for another couple of minutes and a couple of seconds.

Just for there was some discussion about 18-word and 24-word, et cetera.

For Bitcoin, there really is no security advantage of having more than 12 words just due to the fundamental computational security of Bitcoin.

So given that it just adds so much more complexity, if you're doing Bitcoin, we just saying do the 12 words.

There could be an argument that for high security things where you're creating driving keys for other purposes that you might want to secure with a stronger set of words.

So 24 may be useful for some of those.

But as far as I know, there are no applications really commercially available that need that amount of or where that amount of entropy actually adds any security.

So it's kind of an interesting problem.

Did that not finish at the end?

What happened was, Beckins crashed for some reason and it didn't finish.

So I won't go through it again.

But you get the general idea.

Now as well, the screenshots page has a big XM thing.

So it shows you what the stacks looks like as well.

So that's a joke.

I would love to see a little video from you at some point on that page that is just the speculose put in a standard 12 word, maybe even use the one that we use in that QR code and then show the output of two or three or something.

That would be really I'd loved to, for instance, share.

Use that video on our website in our SSKR pages.

Now, as I say, the screenshots page does have a animation, which is as good as a video.

Now I did sort of it's a bit quick.

You have to sort of be fast to catch it.

So I might actually slow down the animation a bit, maybe spend a second on each screen and it's giving you an idea of how to use it then.

Okay.

Anything else you want to share?

Not really.

Basically, I'm working on the stacks version at the moment.

That's I should have that finished.

I'm not the fastest in the world of getting these things done, but it should be in the next couple of weeks.

I can have stacks version out.

And then after that, Ledger recently released a new hardware device called Flex.

So I'll start working on Flex.

Now the difference, hopefully, between stacks and Flex isn't too much and I can add something running fairly quickly there as well.

And then after that, the plans are to add 55 to the application.

Sorry.

Yeah.

You've got the presentation there as well.

So that's my future plans are that stacks initially get stacks working, which is nearly don't return get working on Flex and then investigate how difficult 55 will be.

But I don't think it would be that difficult.

That's the year on nature.

Okay.

I mean, the big thing here is that the C code for SSKR had a security review from radically open software.

The Ledger team has a very good security review team and they also reviewed this app before releasing it on their official channel, which means that there's now 7 million devices plus that can use SSKR to shard things.

And I think it's also particularly important when we're talking about kind of the next level of what does the Gordian wallet community and blockchain commons want to do?

What levels of BIP85 support do we want to have?

How do we do key derivations of different kinds?

So, GSTP and Gordian depository is really an open version of what Ledger has done in a very closed way with the Ledger recovery service.

So we'd really like to see that be more broadly available for multiple wallet companies.

I would love to see a blockchain commons, a repository server, a foundation devices, a depository server, several other wallet companies offering depository servers, but also like can we get Human Rights Foundation to do one or the Museum of Modern Art or EFF to offer depository services?

Since they're only doing shards, this is not custodial data and it would leverage sort of the next level of SSKR, which is SSKR envelope.

We don't have time today, but one of the things I really would love to have a conversation about, we'll be talking a little bit about it next month in the Frost meeting, but it's really more of a topic for our December Frost meeting, which is there's definitely a relationship here between seeds and the trusted dealer and distributed key generation that leverages multi-party computation protocols.

So I think there's some interesting things we have to think about when we start talking about actually the seed never exists on a single device.

So then we want to do things like, okay, we're going to do MUSIG or Frost's VSS in a multi-party computation to create a threshold based shares that can then be used to create maybe a BIP85 key that allows you to use it on hardware that doesn't understand Frost or MUSIG2.

So I think there's some interesting things we have to talk about longer term with BIP85 in a multi-party computational world.

And then of course, I would really love to have a bit of discussion like what else in the area of the layer zero seeds and kind of the root keys and derivations that are the heart of all of our technology, how can we make it more secure and more resilient?

So we'll be continuing to talk about that this year.

And it's 1130, which is our closing time, but I wanted to leave at least a minute or two for anybody who wants to share any other thoughts or just an urgent question that you'd like to get answered.

I'm not seeing anybody raise their hands.

So thank you very much, Anish and Ido, for presenting today.

Very helpful.

I look forward to helping you with your projects and making sure that more people be aware of it.

We did record this session and we'll make these presentations available fairly shortly.

Okay.

Well, thank you very much.

And everybody have a wonderful day.

Thanks, everyone.

That's been fantastic.

Thanks, everyone.

That's been fantastic.

Oh, sorry.

We didn't hear you.

We have a few questions about the...

Sorry, can you hear me now?

Yeah.

Yeah, I just want to say if you have any technical questions about our technologies that you're having trouble finding answers to, just reach out to me directly.

You can, I'm just wolf@wolfmcnally.com and you can find me on GitHub and all the other places.

So happy to work with you directly.

I do have a 60-second.

So if any support you need on BIP85, also check out the source code.

It is Python source code, so you'll be doing a C translation.

I'm actually looking for a Python library that is constant time programmed.

So I guess the ECDSA library is side channel attack vulnerable because I guess the operation times are not constant.

Anyway, if anybody knows, then what did I look at?

There aren't any good libraries out there actually that are Python exposed.

What is the problem I'm worried about?

Yep, it's definitely an issue.

I mean, we've...

I mean, we are still doing some C support, but largely we've been moving everything over to Rust.

And then when we need, we can move it over to Wasm or whatever.

So for instance, the life hash thing, which we didn't really talk about, which is a really great UX solution for making it easy for a user to identify is something changed in a seed or key.

We are doing...

We have a Wasm version of that.

But yeah, Python tends to be what the default reference is for a lot of Bitcoin apps.

And I have real questions on can it ever be properly.

So yeah.

I think it's just a matter of...

Ken has more experience with it, I think.

I wasn't saying anything.

I was just clearing my throat.

Sorry.

Okay.

Can the original version of foundation used MicroPython as many people do and they've moved down to Rust and it's an interesting problem.

Sometimes the solution is we think it, you put it on a device that's never connected to a network and cannot physically store any memory.

It only has RAM.

Are you saying you have the constant time primitives in Rust?

Because that would be a good reason.

This is a learning curve, but that'd be a good reason to use that.

And it's already code reviewed.

We use a variety of other libraries that have been reviewed.

I'm also constantly keeping an eye on what's out there.

I particularly like some of the work that Zcash Foundation has been funding in Rust.

So although it's part of their overall library for Frost, they have Trusted Dealer, which is basically kind of the equivalent of what we do with SSKR of basically splitting a secret.

But instead of using Shamir secret sharing, they're using verifiable secret sharing in the Feldman algorithm, which has the advantage that the shares can use Frost or Musig to do signing operations without having to actually restore the key, which is what you have to do with any Shamir-based one, including SSKR.

So one of the other things we're looking at is a SSKR 2.0, which supports both VSS on multiple curves and thus can be signed by different things.

And also the original G256-based Shamir that we use now.

So all interesting problems.

And then of course, part of the whole goal of the Gordian community is when we have a library that needs to be reviewed or somebody has something that needs a little tender-loving care by a cryptographic protocol specialist, that we can pass the hat and basically say, hey, this is going to cost 10 grand to do this.

We're all going to be using this library or some derivative of this library or whatever.

It's all sharing the cost of getting that extra security review or that extra attention going.

And I'm hoping that we can get-- we were doing better last year.

I would have-- if I'd known about Ido not having the latest hardware, we should have gotten him one of those.

So I'd love to be able to find ways to support people in whatever way is possible to make sure that they can do what they need to do.

Nature has since posted out stacks to me.

So that's on its way.

I just haven't received a chance.

So I am getting some of the hardware.

Cool.

Well, I would love-- I mean, nope.

The maintainer for LeafyKit has moved into other areas.

But the general concept of LeafyKit-- and I think I have a few boxes.

And it's a commercially available, very cheap $15 CPU.

I think there's some interesting things there.

LeafyKit only has a 200 DPI black and white screen.

So it's not even grayscale.

But you can do LiveHash with it.

And it's recognizably the same.

And it's really interesting how that particular algorithm really makes it useful to go, yeah, did I really restore the seed that I thought I restored?

Or did something go wrong?

And of course, Anish and Ido, I mean, there's the whole question about BIP38 passphrases.

That is, to my records, the number one loss of Bitcoin has been failure to do those properly.

And you think, oh, I just got one letter wrong.

I'm going to keep on fooling around with it.

But in a lot of cases, I think Ledger is one of them.

You only have a limited number of tries.

Trezor, I think, has a similar type of thing where they make it longer and longer every time.

I don't remember exactly what they do.

But it's definitely caused some losses that there's no checksum on that in the tens of millions, if not hundreds of millions.

OK.

Well, thank you much.

Everybody have a good day.

And we'll be talking in a month at our regular Gordian meeting.

We're probably going to be updating people on what's going on with our libraries.

We'll have some new videos about envelope and some hopefully better documentation and overview.

Hopefully we'll begin to be talking more about trusted key generation at our Frost meeting for cryptographers, cryptographic library designers, et cetera.

That's in middle of September.

And then really we have plans for in December, one really for this community and the Frost and maybe the music communities to talk about multiparty computation and how that fits in with different things like taproot and such and actually applying it into wallets.

What are the issues?

So that's scheduled.

If any of you have a topic that you'd like to bring up in a future meeting, just let Shannon and I know.

Where's the schedule, Christopher, for those meetings?

I'm looking for on your site and I'm not finding it.

Shannon?

They're the first Wednesday of every month.

I'm not sure we list them specifically on the site.

Should be on the subscribe page, which is blockchaincompose.com/subscribe.

I'm going to put it there if it's not already.

Okay, thank you.

But first Wednesday of the month, usually at this time, which is scheduled for 10 a.m.

Pacific time, whether it's a standard or a day.

Was it with Labor Day this year, for September?

I didn't even look.

We had a Fourth of July problem this year.

We did.

Well, Labor Day is always on a Monday, so it will be on the week of Labor Day, but probably okay.

Okay.

I think people will be busy getting back on track on Tuesday, and then Wednesday is probably fine.

So September 4th should be the next.

Okay, well, thank you, everybody, and have a good day.
