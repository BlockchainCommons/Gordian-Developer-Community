Okay, so welcome to the Blockchain Commons Gordian meeting of January 10th, 2024.

I'm Christopher Allen and I am the Executive Director and Principal Architect for Blockchain Commons.

What is Blockchain Commons?

Well, we're a community interested in self-sovereign control of digital assets.

We bring together stakeholders to collaboratively develop interoperable infrastructure.

We design decentralized solutions where everyone wins and we are a neutral, not-for-profit that enables people to control their own digital rights and destiny.

So we have to thank our sponsors.

We have a number who have supported us over the last couple of years and we thank them very much for enabling us to continue to do this work.

If you're interested in becoming a sponsor, please let us know.

This is an important way of supporting our work.

Happy New Year.

I hope everybody had a great break.

In December, we talked about output descriptors version three.

We talked about URs and the need for improved documentation and potentially some BIPs.

We showed a demo of Gordian Depot, the share server that allows you to receive SSKR envelope shares.

We talked a little bit about open development.

We'll probably talk a little bit more about it today, but it deserves almost a meeting all by itself to talk about it.

Today's topics, some updates on DCBOR and the ITF, Gordian Seed tool, which is our reference application that uses our libraries.

We now have some support for Tezos, but I want to talk about what is the larger strategy there.

Wolf has, based on the feedback from last month, worked on a multi-part implementation guide for URs, which should make it easier for people to do libraries, understand the UR protocol opportunities, and in particular will help guide us to some form of BIP in the future.

Because there are some parties that have said, "Well, if it's not a BIP, it's not real.

" We also have some discussion about another thing from previous meetings, which is we have all these different documents and tools and libraries or whatever.

What is the status of them?

The first thing we're working on is the status of research and how that works.

We'll have an update on that.

Maybe if there's time, a little bit of discussion about open development.

Wolf, do you want to talk about DCBOR?

Sure.

Well, just briefly for people who don't know about DCBOR, let's recap this really briefly.

C-BOR, the common binary object representation, think of it like JSON button binary.

Without a lot of the problems with JSON, it has a human-readable format called diagnostic format.

It's primarily a binary format.

We've chosen it to build a number of our technologies on.

We have quite a few specs that are now based on C-BOR.

As we progressed using that, we realized that one of the things we are striving for, one of our goals in many cases is determinism, which is the idea that two separate agents serialized in the same data, maybe at different places and times, maybe on different machines, should ideally converge to the same binary representation of the same semantics.

C-BOR, while it has some overtures towards determinism in the primary RFC, leaves a lot of things open to implementers.

We felt that a spec that made some opinionated decisions about that and then formalized that as a way would be a good idea.

That's why we came up with DCBOR.

DCBOR is what most of our specs are now based on, as well as Guardian Envelope in particular, which we believe is going to be very important in a space where determinism is extremely important.

We've been working with the IETF, C-BOR maintenance and extensions work group, or WG, on this.

We published an internet draft of that.

Here's the current version of the internet draft.

I'm putting it into the chat if you'd like to pull that up.

Basically, this is a profile of C-BOR.

By profile, we mean it restricts what C-BOR can normally do.

Of course, your application that builds on DCBOR restricts that further to what your application can do.

When you talk about a very open and general standard like TCP/IP, obviously, if you're running an application on TCP/IP, you're not doing everything with it.

You're doing what your application does with it.

Your application has a profile.

DCBOR is a profile on top of C-BOR, and then whatever you do with DCBOR is your profile on top of that.

In general, profiles restrict.

Extensions extend, and there's a place for that, as well.

DCBOR strictly restricts what is possible with C-BOR, which basically means that all DCBOR is valid C-BOR.

Any C-BOR reader can read DCBOR, but not all pure C-BOR is strict DCBOR.

We've been working with the IETF working group, and we seem to have gotten some fairly good traction there.

We met with them this morning, as well, in their regular meeting.

Several people spoke in favor of DCBOR becoming an RFC.

There's still a fair amount of path to go on that, but I would say that of the specs we've promoted so far, this is actually the furthest along a standards track, even though it's still an internet draft, as they say in the IETF.

The raw material of what the IETF needs, which is rough consensus and running code, is there within the working group.

We're optimistic about it eventually becoming an RFC, and that's the direction we hope to move in.

It also builds on, because we brought determinism into the group as a priority for us, Karsten Borman, who's one of the main developers of the original C-BOR spec, also picked that up.

He built a spec called Common Deterministic Encoding, or CDE, on top of C-BOR, and now we basically put DCBOR on top of CDE.

CDE is a profile of C-BOR and DCBOR is a profile of CDE.

That basically seems to work well because different people have different needs for what they call determinism.

There's no one size fits all.

In fact, applications that need to be determinism are rare among applications.

We're not trying to reroute the nature of C-BOR itself.

We realize that C-BOR, as it's spec, is just great for many applications, but for a lot of stuff we deal with, we realize that determinism is actually important.

The working group seems to have picked up this idea, and we're working very productively together on making that into actual specs that implementers can build on.

Karsten Borman accepted co-authorship of our DCBOR internet draft, which is a good sign to have somebody giving up that strong support.

I think that's about all there is to say.

Do you want to add anything to that, Christopher?

No, just feels like it's going well and we're on track.

I'll say a little bit about this here.

Gordian Seed Tool is our reference application that uses our libraries to demonstrate support for a number of our specifications.

Note that Gordian Seed Tool really is for developers.

This is not something we're offering for grandma and etc.

The goal is that when you want something to test, that you have something to test against.

In the current version of Seed Tool, we largely support Bitcoin standards, we support some adherium capabilities, and that was relatively easy because of SecP256K1, and it's used by both.

This, however, we're increasingly running into situations where we want to be able to use ED25519, which is an ITF standard, NIST standard, etc.

, etc.

, in being able to secure things like developer keys, other different types of things that are using the international standards.

We want to be able to move in that direction.

One of the first places for this is we're now supporting an option to default to the Tezos blockchain, because one of the advantages of that is that it uses ED25519, so it's a demonstration of that capability.

Part of it is that there is also a desire by one of the partners who is working with a very big major museum, who believes that it is part of their mission to help NFT artists be able to protect their digital works.

You may be pro or con on NFTs, but I am a pro artist, so I want to make sure that they have the capability to protect their keys and the ability for us to not only secure Bitcoin, but use Ethereum and Tezos, which seem to be the two most popular NFT capabilities, will allow the museums to help encourage their artists to protect their digital works.

There is some discussion in one of the museums potentially hosting a share depot.

I think it would be fabulous if a major museum, the Electronic Frontier Foundation, Human Rights Foundation, Blockchain Commons, Foundation Devices, and whatever other companies all offered share depots so that you had choice as to where you wanted to do your recovery services, rather than it being one company that has a close relationship with other companies that is questionable, which is the case in Ledger, but it's also potentially the case with some other social recovery, share recovery type services.

We want users to be able to choose, not necessarily your wallet vendor.

We have a preliminary release of support of TZ2 on test flight now, but TZ1 will be part of the 1.

6 release to the store next, hopefully the next couple of weeks.

Did I miss anything, Wolf?

That's it.

If you'd like to see a quick demo of the Tezos interop capabilities of the Tezos interop, I'd be happy to show that.

In particular, show the printout.

I think that's an interesting, the two printouts are good.

Okay, we'll see if I have that capability here.

I will.

Let's see, let me share my screen here.

You should be seeing my simulator screen right now.

This is a seed tool printing on.

It's an iOS app, runs on Mac desktop as well as iPhone and iPad.

These are seeds.

If you're not familiar with seed tool, the visuals you're seeing here are life hash, which is our open source visual hashing method that is used so you can recognize things visually very quickly, digital objects very quickly.

That's also open source.

You can go to lifehash.

info to find out more about that.

I'm just going to point out that our settings here now has three settings for the primary asset, Bitcoin, Ethereum, and Tezos.

Bitcoin as the default, it assumes you're going to be deriving Bitcoin keys and addresses, Ethereum keys and addresses, and Tezos.

Of course, now we're supporting Tezos.

I'm going to switch this to Tezos now.

This sets the default.

When you actually derive keys, you can choose which asset you're going to derive for, but this is your default.

When we open up a key, a seed here, that is, things that are public are green in the app and things that require authentication or are secret are yellow.

In this case, this would use the biometric authentication in your device when I click authenticate.

Then what we're going to do here is we're going to, and we have, of course, backing up with SSKR if you wish, so you can actually decide to back up shares of your seed to various places, including its metadata.

Then if you use the Gordian float version, you get all the metadata.

SSKR just backs up the seed.

Then what we're going to do here is we're going to say derive key and we're going to say other key derivations.

In this case, again, we see which asset we're using here.

This is the HD key derivation path for Tezos.

This is documented in SLIP44 as their official assigned derivation path.

You can enter any derivation path you wish, of course.

From that, the HD key is derived for that.

This is the HD key, but what you really want is the private key.

This is what you would actually import into a Tezos wallet to establish your account in the Tezos wallet.

This doesn't actually display it.

This is the actual QR code of that.

If you scan this right now, you'd actually get the, I think it's a SPSK, share it.

Of course, you can share it, print it.

In our share thing, you can copy directly to the clipboard.

If I print it, then you'll basically see here's the actual address that can be derived from it.

Here's the parent seed, and here's the actual private key, the EDSK.

This is derived from the EAD25519 curve.

Which is the Tezos 1 address.

That print, when you get the address and the key, if I then, from the private key, the public key is derived.

Then from that, the address is derived.

This is again, these are green because these are public keys.

These are yellow because these are private keys.

You can also see the difference here, the red circle, private key, green circle, public key.

This is the address again.

This would be just for if you wanted to show some of the address and just scan the address.

If I print this, you see it's just the address itself and mentions the parent seed along with, but again, the parent seed itself is not here, just the fingerprint of the parent seed.

That's a basic overview of how we're currently driving this.

There's a number of conveniences we're going to add to make it even easier to get to these things from the top level of the app without having to drill down quite so far.

There'll be a number of other enhancements by the time version 1.

6 comes out.

The 1.

6 beta right now generates TZ2 keys, but this version that you're seeing right now is a preview of the version that will generate TZ1 keys.

Once we make that and these other enhancements public, we'll go live with 1.

6 of the app.

Wolf, would you switch back to Bitcoin and show the descriptor storage?

Yeah.

Let's go back to primary asset Bitcoin.

Didn't need to do that, but we'll do it anyway.

In this case, actually, a seed can have an output descriptor associated with it.

If you derive an output descriptor from this, let's actually go to say, write a key, other key derivations, set by default, Bitcoin, you can actually do a master key, Gordian co-signer path, a segwit path, or enter your own path to the derivation.

Here's the private HD key.

Then the secondary derivation for that can be a public key, including its address, an output descriptor, or an account descriptor, which is a bunch of bundled output descriptors.

If we take, say, here's the public HD key and the address derived from that.

If we take output descriptor, then we are deciding what account number we want and then which kind we want.

If we just do a native segwit single key, then we can, you actually see the output descriptor format here.

We can share that as a UR output descriptor.

This is the latest version 3 format we have for output descriptors.

A copy of that to clipboard and go back to the actual seed itself.

We can now associate, that's the note, but I can actually paste.

That's something I haven't tested yet.

Sorry, demoitis here.

Basically, once you paste this, it will actually appear here and be associated with the seed as your primary output descriptor.

That's a code path I haven't followed since I've did a couple of things.

Sorry about the stumble there.

That's what happens.

You paste this, it will appear here as your output descriptor associated with the seed and then be backed up with the seed everywhere you actually do backups, like, envelope backups and things like that, or sharing.

It will work fine if you do it with the text or the envelope.

It's the output descriptor format that's not in yet.

Got it.

Okay.

If you'd like to see me do that, then let's just go to the output descriptor here.

We can actually just click and hold on most text in this.

It will copy it to clipboard, text, QR code, and so on.

You can click and hold on almost anything in the app and it will copy it.

Now, if we do that here and click paste, there we go.

Thank you, Shannon.

This is now saved with the key can be separately shared.

Save with the seed, I should say, can be separately shared, of course, as a board of envelope or as text.

There you go.

Some important points here is this is just one form of metadata that everybody who's doing Bitcoin potentially can use.

In fact, the output descriptors can be a list.

You could have two or three output descriptors associated with a set of keys.

We really need to work with the wallet companies to decide what else should be in our reference implementation.

There are special cases in Lightning where you may want to have some Lightning channels stored.

There are some special cases with adapters, keys, and other different types of things that to fully recover your account details need to be stored.

We are not a Bitcoin wallet vendor.

We're supporting the Bitcoin wallet to vendors.

We really need to know what you need and what your challenges are in fully recovering your wallets in an interoperable way.

I think it's important to point out that this app and all the supporting layers of technology are all open source and are all in the blockchain commons account on GitHub as completely open source libraries.

We definitely appreciate your support if you use them, but we want them to be used because we want to have developers not have to read them.

They'll be all over and over again, but have some consensus on the things that they all share and compete on other dimensions.

Okay, so any questions on Interop and the purpose of Gordian Seed Tool or all okay there?

Okay, so sure.

So the metadata and the output descriptors are mandatory too.

For example, if you have a multi-sign and you use Seed Tool to create a two out of three, for example, is that the descriptor information is mandatory or optional?

Well, it's definitely optional.

The only thing that is really required, I don't know if you're actually sure of that.

I mean, I think technically you could put a master key and not put a seed in there, but that's not something that is intuitive.

There are some weird cases where you don't have a seed, but you do have a master public key.

I don't know that we're doing much with that, but there is a minimum.

Descriptors, obviously, you know, we cannot construct a complete, Wolf showed you constructing a descriptor for a single signature.

Obviously, you'd have to have from a coordinator like Sparrow or Casa, etc.

would have to construct your descriptor, because you need the public keys for the other signers.

But we can store that.

The longer term goal is also to make this a heck of a lot easier.

So right now, if you're creating a multi-sig under Sparrow, you go through a bunch of different processes where it'll tell you go to this part in this app and go to here and then click on this tab and etc.

to ultimately give you the material that you need to be able to create your descriptor.

We have the capability and we actually already have some basic support for being able to request that in a process of just a series of QR codes.

So it'll say present this QR code to your Gordian, present this QR code to your foundation devices, present this code to whatever, and each one of the things will do what it needs automatically, no UX required other than maybe approval to continue.

It will construct all the right things and then say, "Hey, do you want to archive this on a depot server?

" and you say, "Sure.

" So we hope that this will make it a lot easier in the future to automate a lot of this stuff because the reality is Shannon and I created a whole process procedure that helps you save and protect your keys in the Smart Custody book.

But the reality is most people don't use it because it takes them an hour.

I think it's sometimes silly when somebody's got lots of money on Bitcoin and they don't want to spend an hour to protect it, but it's the reality.

They're not spending that hour.

So we need to find ways to make it easier.

It is part of the architecture of all of the Gordian tools to enable this to be easier and slowly but surely it is.

So along those lines, our most successful, broadest deployed standard is the specification for PSBTs.

We have 13 or 14 wallets now that support signing through QRs or through URs using PSBTs.

The complaint has been for deployment that you really have to look at the source code in order to implement one of the various libraries.

How many libraries are there?

There are five or six?

>> It hasn't stopped people from implementing it, but we have had requests for more detailed implementation guidance.

>> Right.

So, Wolf, in a moment, we'll show you our latest documentation to try to address that so that you don't have to use the open source reference code to understand and implement multi-part URs, the QR capability in particular.

So this is just recently completed.

We really need more people to review it.

People have already done some of the libraries to make sure we didn't miss something or people who are wanting to implement it themselves on platforms that we don't support right now.

For instance, we don't have a Java card version of the UR library.

And yet we know from experience that you can do multi-part QRs, the animated QRs on low-powered devices.

So there just is no open code for that.

So we'd like to move in that direction.

Is the spec sufficient?

Note that the Sparrows-Homingberg library now supports the latest.

There's a URL for that.

And then as soon as we have some confidence, there are some wallet vendors saying, hey, if it's not a bit, we're not going to implement it.

So the goal would be to ultimately have this described in a bit format.

So, Wolf, why don't you take over and talk about the doc?

Also, we have to develop and give a little intro because probably I make this a separate video.

>> Sure.

Yeah, I'm Wolf McNally, lead researcher for Blockchain Commons.

And I'm going to share my screen here in a moment here and show you a couple things we've been doing with our UR specification, which is definitely one of our more popular specifications.

This is our research repo on GitHub.

And this is a BCR that's for Blockchain Commons research.

So these papers we consider to be research, not standards.

And that's something we can't emphasize enough because there's still fluid in many cases.

We hope that -- and one more say about this later in our Gordon-Belper meeting.

This is taking place in.

So, but this is actually -- it doesn't stop people from adopting it.

We encourage people to adopt it and translate these things.

Uniform resources are a way of encoding data in a way that's friendly for transmission as either URI because they are URIs or QR codes.

And I'm not going to go over this text too much because those of you who are familiar with it already understand UR is to a certain extent, but I encourage you to read the document if you're not familiar with it.

But our goals, you know, transport binary data of arbitrary content and length using a sequence of one or more URIs or QR codes.

And we'll be talking about that a lot, the sequence of one or more specifically.

And, you know, our other things here.

And then you asked, Chris, for implementations.

We have our own two primary implementations, URKit for Swift and BCUR for C++.

We also -- yeah, we -- right.

We actually don't have our own REST implementation.

We have a thin layer on top of that.

But there is a REST implementation for third party, which we are actually using in our stack now.

So we definitely appreciate when the community basically takes these things and decides they're valuable and chooses to implement them.

And what we're going to be talking about is that implementation step.

Because even though this document goes on to discuss, you know, how the rationale for URIs and examples of how they're encoded and so on, and then it does talk about what a UR looks like, gives examples, and then talks about how a multipart UR looks like, including this SEQ, which is part number one, you know, one out of whatever, X out of Y.

And it mentions that the sequence numbers can go higher, 11 out of 10.

What does that mean?

Well, that basically means that you've gone into the area of rateless fountain codes as opposed to fixed rate codes.

And we'll talk more about that in a minute.

But this document itself stops short of actually telling you how to implement those rateless fountain codes and so on, and refers you to the new document, the multipart UR, or MUR, MUR implementation guide.

And that's mostly what we're going to talk about.

And if you don't want to understand, you know, there's also the Q&A section here, why didn't we do things other ways?

So we do feel like there's sufficient justification for UR and a lot of people will appear to be agreeing with us.

So we're very happy about this, but we have received a fair amount of feedback that people who are going to the source code, because this document used to basically refer you to the source code, implementation, or everything else, that we felt we got enough feedback from the community that said, yeah, we need something that is a better guide for implementers.

And so we're going to pop over to the MUR implementation guide.

And I'm going to kind of walk through this.

It's going, I'm going to read you a little bit, but I hope to gloss over certain sections as well, because I want to give you the flavor for this.

And there is source code in here.

There is extracts from the from the Swift source code, but you can think of it like pseudocode if you don't know Swift very well.

So that's not definitely not a requirement.

So as this says, the document does not deal with the encoding of yours generally, and specifically does not deal with their textual representation.

That's the job of the other document you were just looking at.

It strictly deals only with the partitioning of a message into multiple parts, and the binary representation and serialization of those parts.

While the multi-part architecture described here can be used to encode single part messages as a degenerate case when using URs, the single part syntax that you saw in the other document in the URs specification is required for single part messages.

So this document is intended to be read through from top to bottom, since later sections build on earlier ones.

And so implementers and other interested parties who just want to understand the architecture of the system can read that in that way.

And then it's a reference for implementation.

But you can also, we recommend that implementers also use the top to bottom approach, because you can generally implement these things from the top down, because the dependencies always flow upwards in this document, or at least that's the intent.

So just a little bit of terminology here, because you'll hear these just a lot.

The message is the actual binary structure that we're going to be encoded and recovering.

A fragment is a piece of that message, fragments are received by the decoder and reassembled.

And then a part refers to one of a set of structures encoded for transmission, each of which contains a fragment of the message and metadata needed by the decoder.

And in the case of rateless codes, and I'll explain what those are in a minute, more than one fragment may be mixed together in a single part using XOR.

Parts containing a single fragment are called simple parts, and parts containing multiple fragments XORed together are called mixed parts.

Okay, so those are essential terms, because parts can contain more than one fragment, XORed together.

And how does that make sense?

Well, you'll see as we explore this.

So then we go into discussion of channel types, because we really want people to understand the motivation behind this, and also why we haven't taken certain other kind of what I would consider more naive approaches.

So I talk about the dimensionality of a channel, whether it's full duplex, both people can talk at the same time, half duplex, or simplex, which is actually the term for what QR codes are, where there's a sender that can only transmit and the receiver only receive.

You can think of the QR code on your screen or printed on paper is just a sender, never a receiver, that makes sense, right?

Reliability.

Okay, so a channel is either reliable or unreliable erasure, erasure, which basically means the receiver will know they didn't receive something correctly, or reliable deletion, which means they may not receive everything, and they won't even know it.

So then this becomes important later.

And then ordering, channels can be the order where everything goes in comes out in the same order or unordered.

And so generally, you start with more primitive kinds of channels, and you build these capabilities on top of that.

So examples that you're familiar with would be like TCP/IP, which is full duplex, reliable, and ordered.

We use that all the time, every time we connect to a website.

And then there's UDP/IP, which is what TCP/IP is built on, which is full duplex, but unreliable deletion, which means the receiver won't, you know, deliver his best effort, which basically means packets can get dropped and the receiver will never know it in any kind of inbuilt way.

And it's also unordered, packets can arrive out of order.

So when you scan a single QR code, what's that?

Well, that's simplex, as we discussed.

It's unreliable erasure.

So if you try to scan a QR code and it doesn't work, you'll know it, right?

So that's an erasure channel.

And it's also ordered because when you scan a single QR code, it either arrives or it doesn't.

And then everything in it is in the order that it was in the QR codes.

That's an ordered channel.

But what happens when you animate QR codes?

You get a simplex channel that's unreliable, but it's a deletion channel because if there's a series of QR codes going by quickly, you're not necessarily going to know when one was failed to read.

And so you have to assume that the camera may just miss it and not even know it was trying to read a QR code in that moment.

Maybe the camera moved away and QR codes flew by or whatever.

And that also means that no matter what you do, the data may arrive in out of order.

So we have to deal with this kind of channel.

So it's this last form of channel for which we wish to provide a robust solution.

So this leads to the discussion of QR code partitioning.

So in the case of air gap data transmission using QR codes, it's often a message that is larger that can fit into a single QR code.

And PSBTs is a perfect example of that, which is partially signed Bitcoin transactions for anyone not familiar with that term.

In this case, the message may be broken into a sequence of smaller fragments, each of which is transmitted in a separate QR code called a part.

The fragments are then reassembled by the receiver to reconstruct the original message.

And this requires that each part in addition to its payload fragment has to contain metadata with the length of the sequence and its index within the sequence.

And that allows the receiver to know when it has received all fragments and enables it to assemble them in order, thus turning the unordered channel into an ordered one.

Remember, I talked about how you build more reliable channels on top of less reliable channels.

Okay, so now let's talk about what we mean by fixed rate and rateless.

The decision how you break the message in fragments depends on the reliability of the channel.

If the channel is reliable, then you can just show each QR code once and be done, right?

And because you can do each QR code as a packet.

But if the channel is unreliable, then you may have to retransmit the sequence fragments repeatedly so the receiver can reconstruct the original message by eventually receiving all the fragments.

And this might be the case if the QR codes are displayed as an animation on a screen.

And I also mentioned that if they're printed on a single page, you can consider that to be just, you know, everything's there.

You can scan it until everything's read and you don't have to worry about repeating the sequence because it's all there right in front of you.

But in case of an animated QR code, yeah, you could have to repeat the whole sequence over and over again.

These are called fixed rate options because the number of fragments is fixed and every part, each continuing new fragment must be received to reconstruct the original message no more, no less.

So unfortunately, the problem is with fixed rate codes, you can get stalling, which is where codes are missed and the camera misses them or it's blur, you know, we're focusing or whatever.

And when a code is missed, the receiver has to wait for the entire sequence to cycle through again.

And there have been a number of naive approaches that use this.

So the problem is that ultimately this results in divergence from the optimal transition time as more and more cycles to the entire sequence are needed to successfully capture all the codes.

So it's an alternative.

Rateless codes, on the other hand, are designed to be more robust, to be more robust against issues, such issues in helping converging towards optimal transmission time.

In a rateless system, each code is somewhat independent and contains some of the overall message encoded in such a way that any sufficient large set of codes can be used to reconstruct the entire message.

This means that if even if some codes are missed, as long as enough other codes are successfully read, the message can still be reconstructed.

And there's no specific sequence that needs to be followed.

And each code has a relatively high probability of bringing new information to the table that the reader doesn't have yet.

This property significantly reduces the likelihood of stalling as the receiver doesn't have to wait for a specific code containing a specific fragment to come around again in a sequence.

The more codes are read, the closer the receiver gets to having enough information to reconstruct the original message.

And the takeaways this leads to a system that tends to converge towards the optimal transmission time, regardless of individual code losses.

And if you think there might be overhead, well, yeah, there's some overhead.

In a well-designed system, the number of codes that must be captured is not much higher than the number of fixed rate codes that would have to be required.

There is some overhead to a rateless system.

But because it's unreliable channel, it actually works out better.

So, if fountain codes, you'll hear that term a lot, or type of rateless code, because it's named by an object to a water fountain.

The flow of water from the fountain is continuous and effectively never-ending, but you only need to take a little bit to get a drink.

All right.

So, mer, the most part, UR scheme, uses a hybrid strategy of both fixed rate and rateless fountain codes.

You actually get the best of both worlds.

The message is broken into seclin fragments, and that's how many are refragments you have.

You'll see the term sequence length, or seclin.

The first seclin parts of the message are fixed rate and can be by themselves be used to reconstruct the original message.

So, if it takes 10 fragments, you get 10, the first 10 parts that are received are just the original message.

If the channel is reliable, like a printed page, then these initial parts are all that need to be generated.

Each part generated includes metadata that includes seclin, which is the number of fragments in the message, and seclin, which is the one-based index of the part.

The receiver can use this metadata to know that it has received all the parts and to reconstruct the original message in order, even if the codes are scanned out of order.

The fixed rate parts have a seclin, less than or equal to seclin.

You saw that before in the SEQ, in the other document.

So, you know, 10 part QR, 10 part sequence, you get one from 10, one of 10 through 10 of 10.

If the channel is unreliable, then our system, when requested to generate parts where seclin is greater than seclin, will generate rateless parts.

So, values like 11 out of 10 are up and up or normal and indicate rateless codes.

This indeterminate length stream of rateless parts are generated using algorithm that in each generated part mixes together a subset of the entire set of fragments of the original message.

We'll talk about that in a minute.

So, there has to be a consensus way of dealing with this, and we'll talk about that in a minute.

For the sender receiver, I need to agree on which fragments are mixed into each part.

This is done using a consensus stack, and we'll talk about that now.

So, the next section is the consensus stack.

Several components in this section are shared by the encoder and decoder and used by them to agree on which fragments are mixed into which parts.

In the following subsections, we're going to introduce and discuss each of these components from the bottom up.

And I'm not going to dwell on each of the components very heavily, but at the very bottom is the CRC32 techsum scheme, and we have a random number generator built on top of that, which is called Zoshi row 256, standard algorithm.

We have the random sampler, the degree chooser, and the fragment chooser, and I'll explain all of them briefly here.

So, because CRC32 is only four bytes, it's very compact and can be included in the QR codes, which is why we chose it as opposed to something much bigger like shot 256 or something like that, because it's enough for our purposes to verify the integrated message.

And so, in our case, you'll see throughout this document, we're giving a small frame of code in the test vector.

So, again, you can think of this as Swift, but you can think of this as pseudocode, and as we get into more complex parts later, you'll see that it's very heavily documented.

So, I just said CRC32, so why do we need shot 256?

Well, we do need to seed the random number generator, and the Zoshi row 256 star star PRNV needs a 256-bit seed.

So, we can actually use shot 256 to stretch that CRC 32 to 256-bit seed, and so we have a test vector.

We're assuming you're using an existing implementation of shot 256.

Now we're discussed the Zoshi row 256 star star, and this algorithm has public domain status, it's simple to implement, it's fast, it uses a 256-bit seed, and it has a very high quality that is very statistically random output.

It's not a cryptographically strong PRNV, but it's not actually a requirement for MUR to be that, because we're not actually encrypting anything.

So, in this case, we actually give our implementation of Zoshi row, and then several test vectors that you can basically implement to prove that you've got the same implementation.

So, built on top of that is the random sampler, and you'll see why in a minute, but this uses in the process of deciding how many fragments to mix together each part, which may include many fragments, but it's biased to include fewer, and then we discuss the method we're using, and then we based our implementation on.

Those are all there for your reference if you need them.

But we've basically made it so that our random sampler, the random numbers it generates, come from the PRNG, so that because we're basically creating a deterministic system here, a consensus system between sender and receiver.

This system does use floating point numbers to have a few people say, "Well, what about floating point error?

Will that cause different problems and different problems?

" So, we actually address that here.

Although this algorithm does use floating point numbers, as long as the implementation is running on IEEE 754 compliant platform, and the PRNG returns deterministic results, the result of this algorithm will also be deterministic.

So, it's required that the implementation of this random sampler use the IEEE 754 floating point numbers.

This is basically every processor in existence now.

If you can show me one that doesn't use IEEE 754 that isn't a relic, I'd be very surprised.

And any problems you've ever heard of, like the Pentium bug and so on, those have long since ceased to be issues.

So, we do not expect this to be a problem at all.

So, there's the implementation of that, and then the test vector.

So, determining fragment length.

The encoder first partitions the message in fragments of equal length, and there's no single right way to do this.

And we discuss here at some length what the considerations are, you know, how fast you want to display them, how dense you want them to be, the resolution of your camera, the resolution of your display.

There's no one right way to do this, and so ultimately this is up to you to decide your fragment size for a particular transmission.

Our reference implementation has a specific methodology, the linear search to find the largest fragment length, that for a given message length produces the least number of fragments that lie within the given minimum and maximum fragment length.

So, that's the way we're doing it.

Yes.

Also, to be clear, you know, we've tested this fairly thoroughly on LeithyKit at the low end, which is a low end ARM device with a display that is only 200 by 200 and has a high latency in the pixels being changed because it's a paper ink display.

Works with MIR.

But we've also, you know, on an iPhone, fairly high powered device, big display, really good camera, etc.

We've seen very, very high throughput iOS device to iOS device.

So, we support a wide range.

Obviously, every app is going to be different.

Sparrow, for instance, runs on laptops.

Laptop cameras are notorious for, you know, not focusing well or not having super high resolution.

So, they have to make different choices than another device does.

So, you know, that's, you know, where all the trade offs are is, you know, what does your specific device support?

What are your scenarios?

But also, like, what other parties in the ecosystem are you interoperating with?

So, you know, if you know you're going to be using a laptop's QRs, you know, you might go very differently than you do with than a current mobile device to mobile device.

>> Right.

So, then we've provided some simple test vectors here.

And then, you know, once you know the second lane, then you need to generate the fragments.

And if the last fragment would be smaller, because of course not everything works out to even multiples of your fragment length, it's pat with zeros at the end.

And there's good reason to do that.

But for now, what this outputs is takes in a data and a fragment length and outputs an array of data objects.

And then if the padding is necessary, it depends the padding at the end.

And that's all that does.

So, we have test vectors for that.

And again, this is basically using the, you know, our random generator with constants.

The test vectors always succeed.

All right.

The degree chooser.

So, once we've chosen the -- once we've chosen the fragment length, now we can choose the degree.

And what's the degree?

The degree is the number of fragments that are mixed in each package.

And the degree is chosen suit randomly with a bias towards lower degrees.

The successive relative probabilities of higher degrees being chosen are our harmonic series, one over one, one over two, one over three, one over four.

This is the degree and the probability goes down.

Down to one over second.

The chooser is strategic.

It biases the selection towards lower degrees.

Which is crucial because degree one parts are simple parts are essential in decoding higher degree mixed parts.

And we'll talk about that more in a bit.

This is to make sure there are enough low degree parts, especially simple parts to initiate and facilitate the decoding process.

So -- and this is -- the chooser is fairly simple.

It's based on the random sampler.

And basically, so it's given the harmonic series of probabilities based on second.

And then every time you say choose degree and you get the seated random generator, it gives you an integer back, which is the degree of the part and our test vector.

So, we need to choose which parts at this point.

So, for this we're using the Fisher-Yach shuffle, which is a provably random shuffle.

But we've optimized it so that rather than shuffling all the part numbers and then taking the leading five, if it's a degree five, then it just stops at the number of items you asked for.

And our test vector showing the count here.

Actually, this is not correct.

I need to update that with the last version of the Fisher-Yach shuffle there.

Anyway, so you can see that it's actually generating consistently both the number and random shuffles of the actual part number and part length.

Yeah.

So, all right.

So, now the fragment chooser.

And this is where it all comes together.

The fragment chooser is initialized with the second line and checks some of the message.

And then that's used to suit or randomly choose which fragments include in each part by providing the second number of the part being generated.

So, this is the meaning for which the sender and receiver agree on which fragments include each part.

That way they don't have to exchange a table.

Here's the parts I have in the data.

They just know based on the checksum and the second number.

And the return value is a set of fragment indexes.

And I won't belabor this too much, but we basically see the random generator and using the second one checksum, stretch that with chop, shuffle six, see the random generator.

And so the fragment chooser essentially uses the degree chooser inside it.

And when you choose the fragments, it basically says that this is the critical part.

If the second number is less than the second line, then we're just returning the unmixed fragment.

And that's why you have the hybrid unmixed fragments.

Because the unmixed fragments come first.

And then after that, then what we're doing is we're basically creating our seed, seeding the random number generator, choosing the degree based on that, and then shuffling, and then choosing only the degree count that we want of pieces and returning that as a set of fragment indexes.

And you can see that fragment indexes is an alias for set of integers.

And our test vector.

And so you can see that here's the fixed rate parts that come first.

And then the rate list parts start jumping around between simple parts.

And some have a lot of them mixed in and some have a few mixed in.

But they're biased towards the simple parts.

All right.

Moving on to part serialization.

This is how the sender and receiver actually communicate.

We're using CBOR to do this.

And this doesn't have to be DC-BOR.

But it works out the same way.

It's going to end up being if you use the standard encoding methods of CBOR, it'll be DC-BOR2.

So it doesn't matter.

We're using CDDL, which is the language used to describe CBOR structures here.

And it's basically just it's an array of five elements.

And it's basically pretty self-explanatory here.

We haven't discussed message and len yet, which is conveyed in each part as well, which is the total length of the message in bytes, not including any padding, added less fragment.

And then that basically translates to our reference implementation structure here.

A more detailed walkthrough of the actual meanings of these and then our test vector.

And this is just syntax highlighting stuff because we're showing the actually here, we're showing the diagnostic output of what the CBOR is, which is the human readable form of CBOR.

So you can actually see what's been encoded in this and syntax file there doesn't like it for some reason, but it's fully valid Swift.

All right.

Next is the buffer XOR primitive.

And this is really straightforward.

Just, hey, give me two buffers of equal size and XOR them together.

Give me the result.

And that's all that really is with a test vector.

And then now we're talking about the encoder.

And the encoder and the decoder are very interesting because the encoder is actually pretty simple compared to the decoder.

But the decoder can sound kind of scary at first because you're receiving these parts which are mixed together with XOR.

And what do you do about that?

How do you put the spaghetti back into the package once it's cooked?

So yeah, but it's actually not that bad.

So basically I talked about the initialization of it here and basically show the state of it here.

And it's, but basically it comes down to every time you ask for the next part, increments, sequence, number.

If it's a single part generation, don't call this again.

It uses the fragment chooser to choose the fragments.

It mixes them together and then returns the part.

That's it.

Okay.

It's really simple.

And we've already talked about the fragment chooser.

This is the actual function that does the mixing.

If it's only one fragment, it just trivially returns the fragment.

Otherwise it mixes them together using the XOR function.

So you see, again, everything we're doing here builds on what's previous.

And then we have test vectors for this.

This outputs the actual kind of debugging output of this, again, using deterministic message.

And then also we are testing the seaboard output.

We're not, you know, since seaboard output's going to be, it's going to be different, different platform.

We're not providing code for that, but it's in our reference implementation.

If you want to go see how we did it, but you should be yielding this output for that.

And then also testing to make sure that the encode says it's complete when it says it is.

All right.

Now onto the decoder, because the encoder, like I say, is simpler.

The decoder requires a little bit more understanding.

And so I want to make sure people understand this.

And so we have an essential decoding concepts here.

And so fountain codes may be simpler and mixed.

Simple codes contain exactly one fragment.

Mixed codes contain two or more fragments combined with XOR.

And we're using the circle plus operator for that here.

So let's say we wish to transmit a message, a, b, c, d, which we partitioned into these fragments.

And the lexicographic order, or alphabetical order, of the letters represents each fragment's second M.

So this is 1, 2, 3, 4.

Each part is also transmitted with the second end of the message, which we'll gloss over here.

So the decoder keeps three basic structures.

The list of mixed parts that hasn't been able to unmix yet, a list of simple parts that it has managed to reduce, and a queue of parts that still need to be processed.

And these are initially empty.

So in our scenario, it first receives the a, b, and c mixed together.

And so all it knows about this part is how many fragments there are in the final message, because second end is transmitted.

So it knows there's four parts.

It's going for four fragments.

It's going for four.

And which three this part mixes, a, b, and c.

But it can't know exactly-- actually extract anything yet, because they're all XOR together.

So the next part receives is c plus d, or c, x, or d.

And it still can't extract anything from that, because there's no way by XORing these two together that you get anything that is smaller than what you have currently.

So it stores that as well.

The next part receives is a, b, c, d.

Wow, it seems like it's getting worse.

But it's actually getting better.

So each time a part is received, the decoder checks to see whether the set of fragments it contains is a proper subset or superset of the set of fragments in any part it already has received.

If so, it can reduce the superset part by the subset part.

In this case, it discovers that it can reduce the incoming part, a, b, c, d, by XORing it with part a, b, c, yielding the simple part, d.

Because it's going to give us subtraction.

a, b, c, d minus a, b, c is just d.

Wow, OK, we've recovered a fragment.

The reduced part, d, now goes into a list of simple parts that have been received.

When this list is complete, the entire message can be reassembled, and decoding will be complete.

The reduced part also goes back into the queue of parts to take part in reduction.

As long as this queue is not empty, it takes the next item from the queue and continues looking for parts that can be reduced.

We don't even get a new part from the stream yet until we've done that process, until the queue is empty.

So we're going to take d out of the queue now, and it now discovers that it can reduce part 2, c, and d, by part 3, d, yielding the simple part, c.

So without even receiving another part, we've already recovered another fragment.

So the reduced part is moved in the list of simple parts, and also back to the queue.

So we take c from the queue and discovers that it can reduce part a, b, c, to part-- by part 2, c, yielding the simple part, a, and b.

This reduced part is still mixed, and we can't do anything more about that.

So it stays in the same list in its reduced form, and it's put back in the queue.

When we take that from the queue, well, we can't do anything with it.

So we're now done with the queue, and now we go back to the stream.

And the next part that arrives happens to be a and c, and it can reduce this part by c, yielding simple part a.

So we have now 3 out of 4.

It puts this back into the list of simple parts, and into the queue.

We take a from the queue and discovers it can reduce a and b by a, yielding b.

And that's it.

OK, the original message is now assembled by sorting the parts by signum, represented here by the letters lexicographic order again, and concatenating their fragments to yield the original message.

Now you understand how a found-- let's found a decoder works.

It's really actually very straightforward.

So how to represent parts in the decoder.

So there's the fountain decoder part, which you've already seen.

That's what we were serializing in the CBOR.

And it's the output of the fountain encoder, but also the input to the fountain decoder, because it also supports serialization to and from CBOR.

Internally, fountain decoder has its own fountain decoder.

part struct, which it uses to track the simple and mixed parts of the processing.

And as you can see, all it has is the fragment indexes, which is a set of integers for reminder, and the data.

That's the only data it tracks.

And then it has some initializer and convenience methods, like is this simple or not.

So the decoder state, remember, we've already talked about this.

Simple parts and mixed parts are dictionaries of parts it's received.

And then there's a queue of parts.

So we're just implementing what we described.

You don't initialize it with anything because all of the state is set to empty.

When the first part arrives, it's going to basically set that-- set everything up as setting the stage for all the other parts to arrive.

And then basically, there's a result attribute.

And you can see that here, which is essentially-- it's either going to be null, which it is at the beginning, which is denoted by the question mark, or it will be the resulting data or an error.

And there's only really one error that can be thrown, which is the final checksum didn't match.

So because any invalid parts that come in are just discarded silently.

And if you use the URL demo, you'll notice that if you try to read part of a URL sequence and then try to read another part of a different URL sequence, it'll click because it's throwing away those parts.

It doesn't recognize them.

You can go back to the original URL sequence and it continues.

So it doesn't blow the whole decode to receive invalid parts.

So here's the actual dictionaries.

Part dict and a part dict essentially keyed by fragment indexes and a part.

This is the decoder part.

So validating the part.

So as each part is received, the first part is assumed valid and sets the values for all subsequent parts that match to be valid.

If any part does not match these values, it's discarded.

And it says what has to be matched.

And then if it's valid, it returns true and false if not.

So here you see it's basically checking to see do we have-- have we gotten a first part yet?

If not, then we set everything up based on that first part.

Other than that, we check everything that's that first part.

And if anything doesn't match, we throw away the part.

So part reduction.

This is a very simple algorithm actually, because it takes two parts and tries to reduce part a by part b.

And that basically means that it checks to see if b is a strict subset of a.

That means b can be subtracted from a.

And so if it can't, then it just returns a by itself.

If it can, it actually subtracts just a set subtraction, subtracts the fragment indexes, and then sets the new data to a, x, or b.

And that basically reduces the fragment.

And you're going to see how this is repeatedly used over and over again.

So reducing mixed parts.

So remember that list of mixed parts.

Any time there's a new part to process, we're going to try to reduce all the existing mixed parts we're tracking by the new part using the reduced mixed method, which is what we have here.

Any resulting simple parts are added to the queue.

And the remaining mixed parts are kept in the mixed parts list.

So that's all that's happening here.

So we're going to mix parts, trying to reduce them.

Then we're creating a new mixed parts list with everything that's possible reduced if it's been reduced to simple.

We can queue it.

Otherwise, we just add it to the reduced parts list and then add the new mixed parts list.

And then finally, we assign that back to the original list.

Simple parts are handled slightly differently.

They're processed by this method.

If the part's a duplicate, it's discarded.

If it's not a duplicate, it's added to the list of simple parts.

And the set of received fragments is updated.

If the set of received fragments is now equal to the set of expected fragments, we're done.

The message is reassembled and the checks are verified.

So here you basically see we're throwing duplicate parts.

We're recording this part, checking to see if we've received all the parts, verifying the checksum if we have.

If not, we're doing the reduced mixed, which you just saw above.

And then processing mixed parts.

So if we receive a mixed part, again, we discard it.

If it's duplicate, if it's already in the mixed list, if it's not duplicate, then an attempt is made.

This is important because this is where we have both the subset and superset.

All the parts try to reduce each other.

An attempt is made to reduce the new part by all the parts we're currently tracking simple and mixed.

If after the direction of the part is now simple, then it's added to the queue.

If it's still mixed, an attempt is made to reduce all the mixed parts for the new part, which you've already seen that's called the reduced mixed here.

So don't process duplicate parts.

Here's the concatenate list of all the simple parts and all the mixed parts, then we'll reduce the part and then basically record what we did.

Now at the higher level, remember I talked about processing the queue.

So when the queue basically has anything in it and we're not done, then we get something from the queue and we decided it's simple and then we call one of the two methods above to process it.

And just repeat this until either we finally come up with the solution to the whole problem, we resumpled the message or the queue parts empty.

So you see we're getting to higher and higher levels here and we're almost done now.

So finally, the received part method is called to submit an incoming part to the decoder.

It returns true if the part was processed and false if it was discarded.

The part is discarded if the decoder is already done or if the part is invalid.

When receiving the first part, the fragment chooser is initialized with the second and check sum from the part and the fragment chooser is used to choose the fragments into each part in agreement with the fountain encoder.

So again, this is the consensus stack.

Once incoming parts fragments are known, the part is added to the queue and the queue is processed until the message is complete or the queue is empty.

So here you see the implementation.

Don't process the part for already done because we're done.

And so don't continue if this part doesn't validate.

So we can discard it at this point.

If this is the first part, then it's going to set the parameters for everything else.

If we don't have a fragment chooser, now is the time to create it.

And then we add this part to the queue or choose the fragment and the part.

We discover basically which fragments are in this part by using the consensus stack and then we queue that part.

We process everything in the queue because as you saw, processing a piece of the queue can add more things to the queue.

For bookkeeping, we keep track of how many parts we're doing and we return true.

And this is the test vector.

And that's it.

And I know that was kind of long winded.

And hopefully somebody viewing this later will think it was worth the time.

But I wanted to show that this isn't scary at all.

It's actually fairly straightforward to implement.

All the test vectors are there.

You can see why it's already been implemented on several other platforms.

And we're basically enthusiastic about people adopting it further.

It's one of our best success stories so far.

And we think it's going to be used in a lot of different ways that we're not even imagining yet.

And like I said, this is separable from the whole URL implementation.

So if you want, for some reason, a good way of transmitting data through a lossy channel, this is actually, I think, a pretty good way of doing it without even using the higher level you are textual encoding.

Any questions?

>> Okay.

Thank you, Wolf.

We will save that as a recording because I think it will be useful in the future.

Let me go back to -- >> And if you're in the meeting, this wasn't your cup of tea.

Thank you for your patience.

>> So a result of some of this work and some of the new projects is that we have added more details because of envelope and some of the internet proposals because of this work on multipart URs, et cetera, some newer research papers.

Again, research papers are preliminary to specifications and standards.

So, you know, each of these has a status, which we're going to talk about in a second.

Very briefly, Wolf, don't share the screen.

Just say what each of these are, and then I will go on to the status.

>> Sure.

These are just some of the highlights of papers we published right up against the end of the year where we're basically documenting things we've been doing for a while, but they haven't had any separate documentation.

So if you want to represent public EC keys as URs, then that's how we're doing it in 202311, 202312.

We're talking about envelope expressions.

This is basically part of how you can basically do a kind of a function calling and responses within a Gordian envelope.

And the nice thing about doing it with the Gordian envelope is you gain all the other abilities of Gordian envelopes as well, like encryption and collision and compression and things like that that envelope support.

And this all matters because ultimately we're building up to other things.

And then in number 13, we have envelope encryption.

So all our encryption primitives that we have for doing things like signing and encryption and charting with SSKR and so on, those are all standalone and can be used for anything.

But if you want to do them in envelopes, we have a way of doing them with envelopes.

And that number 13 there describes how we do those cryptographic primitives, sign encryption, symmetric encryption, public key encryption, charting, and so on, using envelope.

And then there's the Gordian sealed transaction protocol, which is essentially what we're using for our Gordian depository or depot server.

But this is kind of the generic level of how do you do a very anonymized transaction protocol through an unsecured channel essentially.

So you're not assuming you have SSL running or anything like that.

It could be through QR codes.

It could be through anything you like, public or not.

But how do you make it so that it's not clear what the two parties are actually transacting, that basically a third party observer can't tell much of anything what's going on.

And so this is implemented again using envelopes.

And then forthcoming is actually the API description.

We've done other descriptions of our Gordian depo server, which uses the Gordian sealed transaction protocol for its API.

And there's the forthcoming BCR, which will actually describe that specifically.

And then the UR account descriptor version two, this is something that Craig Raw of Sparrow has submitted.

And this is an update of that to use our version three, UR output descriptors.

And this is what he's currently implementing in Sparrow.

And shortly we'll have the implemented in C2 as well.

And again, our research repository is where you find all these things.

And this is just kind of highlights.

There's more and I'll talk, you know, in a moment, I'll show you a couple more of those.

But if you see what's been posted in the repository, there's new stuff being posted there quite a few times a year.

And so some of this is catch up, but it's important catch up.

Also important to note is that these are going to be used increasingly this year.

So envelope expressions, you can kind of think of envelopes as being an S expression like Lisp or whatever of data.

By adding envelope expressions, we are now able to do some very simple operations in kind of a Lisp slash forth like way.

What that'll then allows for is some fairly sophisticated future ability to do things, an example of which is the Gordian seal transaction protocol to really simplify the user.

You know, when you can, you know, specific to Marvin's use case, you know, if you're first time seeing a new wallet, it can just simply present a QR that basically initiates a Gordian seal transaction protocol with a new device creates a, you know, trust on first use does all of that different types of things between two devices in a very automated way, using the GSTP, which uses envelope expressions and even can encrypt the QR in case there's, you know, some ring camera over your shoulder.

So none of that is actually implemented at this point, but the design of the architecture is to support those types of things.

Yeah, and envelope expressions, by the way, are basically also useful or could be useful in the future for if somebody wants to develop like a new form of smart contracts, things like that.

So one of the things that came up also last fall is that we had to withdraw one of our earlier specs, because it wasn't really nobody used it.

We also had a situation where we superseded a spec and we did not do so gracefully.

So we've settled that, but we felt like we really needed to be more clear with the community about the what the research status was.

And we've tried a couple of different approaches.

This is the result of the internal consensus, but we're very open to feedback.

The key thing is that with this method, we can combine things in some interesting ways.

So obviously, we have withdrawn and superseded, you know, version one, diversion, two, etc.

Something that is just simply research, we're throwing it out there for people's opinions, thoughts, etc.

A single star means there is a reference implementation, there's actually code working for it.

But it isn't a, you know, it's open, but it's not, you know, it's not up to our kind of minimum standard to kind of move things forward, which is multiple implementations, something written by us or adopted by us, and another implementation.

We might we might implement something like Gordon envelope several times, like we have a swift implementation and a rust implementation according envelope, that doesn't earn it two stars, because we control both of those.

It's when other people start implementing with our work is where we we give ourselves two stars for that.

And our goal is to get as much as possible to that two star level.

There is there are levels past that, like we've seen with DC bore, where we are standards track and at some point, maybe even this year, if an RFC is issued for it, it will be a true international standard with all of the protections and other legal implications of being an international standard and so yeah.

So, so this enables us to be really clear on our specifications.

There is this withdrawn versus superseded as a distinction.

It may be not as clear about backward compatibility or not, we're kind of seeing this, for instance, with Sparrow right now, where the Sparrow app for compatibility reasons, outputs the old version because all their partners have not moved to the new version yet, but they'll accept the new version.

There's sort of a weird transition state where when and he has enough partners that wanted to use the latest version of the spec, at what point does he no longer output it by default.

So we don't we're not really clear on that in this in this status.

But I do think I like what we're talking about being clear about the multiple implementations and how stable things are.

And you know, here is I think a special case, we had another version of this without the emoji.

That was difficult to understand.

But I think this is more clear.

Hey, multiple limitations were made of you are one.

But it's been superseded.

So you know, you should consider moving to your two or your three or whatever.

So that gives you some feeling for what are going on.

And of course, two independent implementations remains our gold standard.

Wolf, can you quickly share your screen?

I don't think we want to get to this next slide because of for Marvin and Andy and a few others.

But just quickly show the Sure, we'll back to our research repo here.

At the this is the read me of the repo.

And we have the key here of the various tests is the crystal was just discussing any of these can be standalone, some of them can be paired up.

So if you see double x is the after the status symbol, you read it but withdrawn, and a single x is read but superseded, which means there is a newer version available.

And so now our contents have been updated with the with the status column here.

So you see there are certain things like the BC 32 data encoding format.

We implemented and you can still find that code, but it's been withdrawn.

We don't want anybody to use it.

And it will never go any further than this.

Other things are just research like uniformly translate entry cryptographic seeds.

This is kind of a very one of our earliest papers, obviously.

And we still think it has some value.

But you know, it's just it's just out there.

It's we're not we're not basing anything on it.

And, you know, it's just for informational purposes.

A number of these like you ours have are at the two star level, which means, you know, there's been a number of one or more third party limitations, and there's definitely developer interest.

Some of them have have had multiple limitations like the version one of our output scripters, but have been superseded.

And so you see how that's notated there.

Other things have simply been I guided in the withdrawal.

So but at the very bottom here, you see I've added a couple placeholders.

So this is when I was reading to you the multiple implementation guide, because this has been implemented by several developers, it gets two stars.

The seaboard, if you actually open up this BCR right now, what you actually get is a placeholder pointer to the actual DC for IETF internet draft.

I put the abstract here.

But this is so we can actually track it in our BCR repositories.

If you actually want to see the DC board internet draft, here it is.

But we're just pointing to it now on our research repo.

Same thing is true with Gordian envelope because we, you know, it was a BCR.

A long time ago, we made an incident draft, removed it from this repository.

But now we're pointing back to it again as well as just a pointer.

So there's the pointers to the to the internet draft.

So and that's still one star, because there aren't any really third party implementations, even though we have both Swift and Rust available for our ourselves.

And of course, you can use those.

But realize that until there's third party implementations, you know, it's not going to go on and get two stars or hopefully more someday, because we think this is one of our of our better efforts.

Christopher.

Okay.

So I do want to say that a lot of this has to do with we have a higher standard than just open source.

We believe that open development is required.

I'm not really going to go into details of what is open development.

We do have an article where we discussed it.

If you haven't seen it, I encourage you to take a look.

But basically, we're trying to say, yes, open source is great.

But it's limited, we need more ability to deal with gaps in design, how to deal with long term support, you know, all of these efforts to be able to have multiple interoperating specifications, etc.

is part of our strategy of moving toward open development.

So I encourage you go to the open development article, take a look at it, it has, we'll talk about it more in future meetings.

But I did want to close this meeting to discuss an important future.

One of the things that you know, obviously, qrs is a that has been the most widely adopted version of yours, I think you are, excuse me, but you are using qr are most widely adopted, but you are themselves are transport agnostic.

So and they can be used over unreliable channels when you do various kinds of encryption with them, etc.

So this has some real advantages to be able to start leveraging NFC capabilities as well.

So there's this, you know, Venn diagram intersection of things you largely do with multi part qrs like PSB T's that could also be done on secure NFC.

So we can store a share onto a share server, or we can store a share on to a, you know, an NFC card, or we can put it on a smart NFC card, which may be able to do, you know, cryptographic operations on that card.

So this is an emerging project this year, we want this all to be open development, there are other companies that have implemented a proprietary NFC devices and not open source, and in many cases, not even inspectable.

So we're trying to provide an alternative to those choices.

And that means that all of our libraries will be open development oriented, not just open source.

Java card is the leading contender in this particular capability.

That being said, there are other embedded and, and other platforms that we want to be able to support with this type of stuff.

The leafy kit, for instance, is not I was not Java card.

The I think it was I don't remember now.

For specific to NFC smart cards, this particular smart card, the j cop for is not expensive, you know, developer single quantities, five to 10 bucks, you know, you know, you know, any developer who wants to, you know, market this as a as a product can get much better pricing in larger quantities, which makes for an interesting cosigner or backup device, in addition to things like depot servers and printing on paper.

So this is all part of our architecture to try to design something that has a lot of this kind of flexibility.

Our initial goal with the secure NFC is obviously as Bitcoin PSB teas, there is, you know, examples out there of non open source signing using an NFC card for multi SIG.

We want to be able to support that.

But with open development, open source tooling, we want to support envelope based SSKR, so that you can back up your metadata on to NFC cards or other embedded devices.

And there's an increasing need to not just sign things with Bitcoin, but to be able to sign other kinds of messages, especially as our development ecosystems, you know, using tools like GitHub, etc, are requiring us to have keys that are internet standards to be able to do code reproducibility and other different types of security.

We also need to be able to back up our SSH keys, SSL keys, Tor keys, etc.

So we do have some very simple NFC stuff now in Gordian C tool will be expanding that.

So if you have interest or expertise in this, please let us know.

We have at least three companies right now that are interested in funding this these efforts.

And, you know, we'll know more as as we meet in the in the coming months.

Any questions on this before we close?

Marvin?

Oh, no, no questions, per se, I just want to I just type it in chat.

But it's awesome to see this as my first call, because actually, at Rider, we have done a whole bunch of stuff with Java card and Jacob, we have a relationship with NXP and also Infini and, and, you know, been evaluating some of their Jacob based secure elements as well.

So I think this is a place where we could we could help out as well.

Fantastic.

Yeah, we definitely know, you know, I will, um, Wolf and I have limited experience in the Java card area.

proxy, who was a longtime patron of blockchain commons, got acquired by our and, but they're, you know, at least minimally going to be supporting things, they did this SSK our implementation.

And they're in the process of passing that officially on to us, although it is open source, so we could fork it at any point.

But we're hoping to do more with that here.

So that's cool.

This, I just want to share this is still like further away, but just so you're aware of like some of the stuff that we were looking at and doing was a lot of Java card operating systems are very well equipped to do sort of the non crypto non web three stuff in terms of the types of curves and stuff they support, and algorithms, but not so much there's not really a Java card OS that can do a lot of this stuff that we want to deal with with Bitcoin or different more modern chains that use different signature algorithms.

And we're looking at the development of a customer OS that does have those capabilities baked in so that you can have these primitives and then build your Java card app as on top.

So that's that's something that that we've been doing as well.

Yeah, we've also had some success.

We we did what three last year silicon salons and we'll probably be doing one or two more where silicon vendors are are explicitly supporting secp and other curves, etc.

in new chips and some new architectures.

So we've been involved in trying to make that possible.

You know, we've had some, you know, some very interesting conversations.

Obviously, custom chip hardware is expensive and you know, any hardware company, you know, is dealing with another, you know, order of magnitude of delivery time and and and, you know, dollar commitments.

So ways that we as a community can work together, you know, specify, you know, hey, you know, this specific Java card with this, you know, and, you know, with this template, you know, we have four companies that want to use it for different purposes, you know, one's using it for, you know, access to digital identity services, one is using it for, you know, SSKR backups and and things of that nature would be really powerful for the community and for independent developers.

Andy Thunder Biskit, any comments?

Okay, well, as always, I, you know, really appreciate you coming to our meeting.

We hope to be able to do a lot this year, but we are dependent on your contributions through GitHub is where most of them come through.

So I do encourage you to go to our GitHub repo and commit a monthly support for blockchain commons so that we can continue to do more of these types of activities.

Thank you very much for joining us.

And that's it for today.

Thank you.

Some thanks.

It's very, very insightful and interesting.

And I'm very happy I was invited to join here.

And let's be in touch in on email.

Right now I really got off to the next one.

Thank you so much, guys.

Thanks.

Bye.

Thanks.

