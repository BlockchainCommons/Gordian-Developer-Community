Welcome today to Blockchain Commons monthly Gordian meeting here on May 1st.

What is Blockchain Commons?

We are a community interested in self-sovereign control of digital assets.

We bring together stakeholders to collaboratively develop interoperable infrastructure.

We design decentralized solutions where everyone wins.

And we are a neutral, not-for-profit that enables people to control their own digital destiny.

We would like to thank our sustaining sponsors.

It is because of their support of our efforts that we're able to offer you the tools and the capabilities that we've been able to over the last five years.

I do need to talk more about sponsorships.

It's been a tough year.

We lost a number of sponsors.

They remain interested and involved in our tech, but they're having problems with funding.

So thus, we are having problems with funding.

So if your company is involved in these interoperable standards, please become a sponsor.

You can mail us at team@blockchaincommons.com for more details.

We can also support your company on specific projects, including helping you do your own open source projects, work with our specifications, or other ideas.

Please talk with us.

And I also want to thank our individual sponsors.

These are people that, through GitHub, support us monthly.

They really help us to go to people like Human Rights Foundation and other organizations to say that we have developer support.

So even $20 a month makes a difference.

So thank you for all of the individual sponsors.

Last month, we had our Frost Gordian meeting, where we also talked about Gordian servers, some things coming up in Wyoming legislation, and then, of course, the Frost presentation for the Bitcoin version of Frost.

Today's topic, we're going to talk a little bit about SSH envelope, some other advances in the last month.

PayJoin is our primary presentation, and we think that it connects very well with the request response use case.

So we'll be ending with that.

So this month, Wolf released the preview version of SSH envelope.

Basically it is a Python integration with the Rust envelope CLI, and it allows people to sign and verify Gordian envelopes with SSH keys.

We've made a number of crypto choices in envelope that are very friendly to Bitcoin curves and such, but the foundational system is crypto-agnostic, and we really wanted to demonstrate this was possible.

This also means that you'll be able to back up your SSH keys when you're backing up other keys in collaborative tools that we are developing.

Other things that have been posted in the last month, we have a new summary of Gordian envelope along with its features on our dev pages.

We felt this was important because there's just been a lot of advancements in the last two years of work on it that we felt weren't really being fully reflected in the intro pages.

So we're in the process of doing that.

We also released our quarterly report, which we do every three months.

And if you're interested in seeing what we've been doing in the first quarter of this year, that is available.

And then we also released a new Blockchain Commons research report on representing graphs using Gordian envelope.

Will, if you want to just give us a quick highlights of that, and then we'll move on to the next presentation.

Yeah, I'm happy to do that.

Let me share my screen real quickly here.

This is, let's see here.

So hi, I'm Wolf McNally.

I'm the researcher for Blockchain Commons.

And I just want to really briefly go over this paper we just released.

Our VCR papers are Blockchain Commons research papers.

And this is- We're seeing, we're not seeing, we're seeing a- We're seeing tools.

Looks like your app.

Do you see it now?

Yes.

Okay, very good.

All right, so this is the Blockchain Commons research site.

This is a VCR 2024-006, which is, this is our numbering system for our Blockchain Commons research papers.

Really briefly, many of you I'm sure are familiar with the idea of graphs, which are basically node boxes and lines connecting them.

And this is a very general, very powerful data structure used for representing knowledge.

And now, a growing envelope is inherently designed based on a tree, which is a subcase of graph with one root and many nodes leading off of that.

Graphs admit things like cycles, which is looping back and children having multiple parents, parents having multiple children.

These are really good for representing causal graphs and so on.

And so, the question is, can you represent a graph using a tree like your envelope?

And actually, yes, you can.

We want to demonstrate that in this.

This document is research, even though I do assign specific seaboard tags into that in this, which we will probably keep.

This is not, there's no reference code that goes along with this.

I discussed the nature of graphs and the kind of ontology of graphs, what kind of graphs there are and how we suggest they're represented using Gordian envelope and how to represent various kinds of elements like the nodes and edges of a graph and the kinds of relationships within that, sources and targets of edges, parents and children in tree-like graphs.

And then I show a fairly, very trivial knowledge graph here where two people know each other.

And then I show how that would be represented using existing knowledge representation frameworks like RDF.

And I gave examples of that throughout.

And then move on and showing the kind of depth of RDF here and how that works.

And RDF is one way representing knowledge.

And then how would we represent that in Gordian envelope?

And to do that, I show the same examples represented in Gordian envelope notation.

Now Gordian envelope is a binary structure, but this is the output format we have that's human readable.

But this is essentially representing the same thing.

And then I examine a number of, you know, for example, Gordian envelope has security and privacy advantages RDF does not have in terms of holder-based collision and things like that.

So I show how the envelope can be alighted.

And yeah, just in general, you know, and then various kinds of alternate graph representations, how you compact things into, you know, fewer lines of actual, you know, smaller binary structures if you wish.

So it goes into a fair amount of depth.

But like I said, this is something we would like the community feedback on.

And this is just kind of first steps in this direction.

But we truly believe the Gordian envelope is a very powerful structure that can represent entire graphs in a single envelope or graph spread across many envelopes across the internet that may evolve over time.

So we're looking forward to the community feedback on this.

Thank you, Wolf.

And you know, if you have more questions on that, I encourage you to either post in the Gordian community forums on GitHub, or you can contact us directly at the Gordian chat or Wolf and I directly if you are interested in some of this research.

Okay, so we're welcoming now Dan Gould, who will be talking with us about Pei Join, and in particular, a proposal for Pei Join version two.

Dan, you want to go ahead and share your screen and take over from here.

Okay, we can see your screen.

But we can't hear you.

Hello, everyone.

There we go.

So I'm going to be talking about Pei Join version two.

I've been working on Bitcoin privacy for a long time.

And my belief is that we need privacy at all layers of the payment stack.

If we're going to preserve it anywhere we have leaks, those leaks will compound.

So there's a little history behind Pei Join, which came about in around 2017 with this thing called Busta Pei.

It turned into BIP 79 with some work from Blockstream and some people working on some online casinos.

And then Nicholas Doria and Andrew Camilleri from BTC Pei Server standardized it further so it could use HTTP for networking.

So anyone with HTTP could Pei Join.

And now I'm working on a new version where the receiver doesn't need to have a server because in Pei Join the person sending the payment, the sender, and the person receiving the payment, the receiver both combine their transaction inputs to get some privacy.

So we're going to get into why we would want this.

I gave you a lot of information right up front.

Why we need this new version and what challenges an implementation is running into.

So first off, what is Pei Join?

The goal of this research today is more to elicit some review and feedback and discuss the current design of the coordination mechanism rather than the transaction structure of the Pei Join itself.

So the idea of a Pei Join, why you would do it, is because the Bitcoin blockchain is slow.

Most people construct their transactions in a non-interactive way where one person contributes all of the inputs to a transaction.

And because of that, anyone looking at the chain can make a lot of assumptions about all of those transactions on the network and how they're connected.

And people's privacy is not preserved.

If we're talking about strictly scaling and incentives, then Pei Join gives us the easiest way to make batches, which is the easiest way to scale a database.

So this is how it works.

And if anyone wants to interject in the middle of this, I welcome that.

I like having sort of a discussion rather than strictly a presentation, but I'm happy to field questions at the end too.

So your basic Bitcoin transaction has got three participants, where the network is, I guess, a bunch of participants.

But you have a sender and a receiver.

The receiver makes their destination address known to the sender.

And then the sender has enough information to sign all of their inputs, create a transaction with a new output to the receiver's destination, and publish that to the network.

This has some of the problems that I talked about before, where that assumption that a single person contributed all of the inputs is actually the sole open privacy problem Satoshi left in the white paper.

So the transactions are costly because you only have one person's transaction intent, the sender, and the inputs belonging to the sender make privacy a big problem.

So Pei Join version one tries to fix this.

And the way version one works is by having a sender and receiver interact outside of the chain.

We do this through partially signed Bitcoin transactions, which are PSBTs.

The cool thing about Pei Join is it maintains the form of your typical transaction flow.

So the receiver still generates some destination, which includes an address, but now also includes a HTTP endpoint, so a URL.

And this is all contained in a BIP21 URI.

The BIP21 URI is supported by dozens of wallets across the space and makes it really easy for any wallet that can copy and paste a payment request to parse what's going on and what payment methods they support or do not support.

So these BIP21s contain the amount, a message, a label, perhaps a lightning invoice, and in this case, a Pei Join endpoint.

So over HTTP, the sender can create a transaction as they would in the basic case from the address, sign it, finalize it, ready for sending to the network, but not send to the network.

Instead of sending it to the network, they send a POST request containing that PSBT to the receiver.

Now the receiver has a choice.

If the receiver wants to Pei Join, if they want to take the opportunity that the sender is giving them to consolidate some inputs or to transact on the fees of the sender, then they can add their inputs to the Pei Join.

They can augment the outputs by the amount of their new input.

So say the sender was paying them 2 Bitcoin and they already had 7 Bitcoin, they could add their 7 Bitcoin input and change the 2 Bitcoin output that was paying them to a 9 Bitcoin output, augment the basic PSBT that way, and then return it to the sender in an HTTP response.

So now that the receiver has signed, the sender's signature has to be invalid because they augmented that original PSBT and the sender would have signed using SIGHashAll.

So the receiver removes that signature.

The sender has the Pei Join PSBT that has been augmented to either save money for the receiver or preserve privacy for the sender and they can decide whether or not they want to sign this transaction based on whether that Pei Join PSBT is in their best interest.

Assuming it is and they sign, they then broadcast that to the network creating a Pei Join.

There are a few interesting restrictions on when the sender and the receiver sign here.

So the sender sends a basic PSBT first so that the receiver always will get paid and the receiver will not expose any UTXOs from their wallet without knowing that they're going to get paid first.

That way they can't be probed.

And the sender has to broadcast because of this constraint that they go first because they need to have the updated PSBT.

And this is all done over a single HTTP request and response.

So in some ways it's one shot.

If it doesn't work on the first try, then the receiver will just broadcast the original the transaction they extract from the original PSBT or basic PSBT labeled here to get paid.

But this does provide that opportunity to create a Pei Join to preserve privacy and save fees without disrupting the typical transaction flow.

The sender just scans the destination and the endpoint and the communication can happen abstractly behind the scenes.

But in practice, this is hard to use.

Many wallets have been able to implement the sender because it's only an HTTP client and some PSBT logic, which wallets are already familiar with.

Lots of wallets use PSBTs.

But the receiver has to run a server.

So that server needs to get a static certificate in order to be able to augment the output.

If the receiver wants to change that output from their original address, then they need some authentication.

They need some way to communicate to the sender that it was actually them that changed the PSBT.

And they can do that over Tor too.

But they also want that encryption.

They don't want to leak the original, the basic PSBT, or else the third party onlooker can have enough information to de-anonymize the Pei Join PSBT.

Any privacy is lost if the intermediate steps get leaked.

It's also synchronous.

So the sender and the receiver, because it's a single HTTP request and response, they need to be online at the same time, which is a problem, especially for the receiver.

Say they generate the address on their phone or on a desktop client and they send it over to the sender, then they might not be online when that sender tries to make a request.

And if they're offline, the V1 protocol just fails.

It just says it fails.

And even that original PSBT doesn't get broadcast, maybe the sender tries again to broadcast it on their own.

And IP addresses also leak everywhere because this is a connection directly between the sender and the receiver.

They figure out one another's IP address when they do this, which could reveal their information.

Join Market did a great job of solving this static server problem by using Tor for their receiver.

But that introduces a Tor dependency for everyone and depends on hidden services for discovery.

So if a certain set of senders support Page Join but doesn't support Tor, they won't be able to use the protocol.

That's where Page Join V2 comes in.

Page Join V2 introduces a directory, which is a store and forward server that can accept the PSBTs and forward them on behalf of either the sender and the receiver.

So in the sequence diagram, a receiver first requests some subdirectory allocation on the directory.

So an example would be I run the pageo.in server, where you can do this today using the Page Join CLI tool.

And then they will use their public key to enroll at the directory.

So now their destination in the BIP21 will include an address to make that basic PSBT and a pageo.in/their public key.

And anyone that tries to put things in that box at the public key will be able to communicate with the receiver.

And the protocol roughly proceeds as it would before, but instead of just one HTTP request, it uses polling.

The receiver is listening on the directory and polls waiting for a request represented as a dotted line.

The sender pushes their basic PSBT to that directory.

As soon as it's available to the receiver, they're able to pull it, again, augment it with their input, return the Page Join PSBT to the sender, and then send it to the network after the sender signs.

But this is not the whole picture.

So we had a few problems that are solved with this diagram.

The synchronous nature of Page Join is solved because we have polling with this always online directory server.

So if the receiver goes offline and doesn't make this basic PSBT request until after it's posted, they'll still be able to do that as long as this subdirectory hasn't expired.

Same thing for the sender.

If the sender goes offline in between the time when the Page Join PSBT is posted and some time later, then they can just come online and check that directory, check that mailbox, get the Page Join PSBT and continue the protocol.

This gets rid of the need for certificates because this directory can always be online.

This directory is a low-resource Redis database and these subdirectory locations that can take on the burden of getting a certificate so that the sender and the receiver can do all of this communication using only an HTTP client.

We still haven't covered the IP address leaks though.

The IP address leaks, the network privacy, talking about blocking leaks at every layer of the stack is done by something called Oblivious HTTP.

So the diagram above included, or in the previous slide included a directory which is actually two functions.

It's actually an Oblivious HTTP gateway and a Page Join directory.

The best way to think about Oblivious HTTP in my view is that it's a solution that gives you 80% of the benefit of Tor with 20% of the effort.

So instead of having a consensus network with exit nodes and many hops with relays, you just have a concrete two-hop network where the client communicates directly with another server an Oblivious HTTP relay.

These aren't run by the same person running the Page Join directory.

These are run by, right now one is being run by Obscura VPN and another is being run by the Bobspaces incubator in Thailand.

And they point to the Page Join directory's Oblivious HTTP gateway, which is at the same address as stated before, pajo.in.

And anyone can run these servers.

This is all open source code on the Page Join organization and the Rust Page Join repo on GitHub.

So a client will encapsulate a request to the Oblivious HTTP gateway using a key that the Oblivious HTTP gateway distributes.

So the relay can see the IP address of the client, but not the contents of the message, not the subdirectory that the client is trying to communicate with.

Then it passes it to the Oblivious HTTP gateway to pass it to the directory.

So the directory can only see the contents of the message, but not the IP address of the client.

The protocol proceeds as in the prior document.

Effectively, this is the sequence diagram, but there is a relay between the directory and the receiver and the sender and the directory, which is the Oblivious HTTP relay.

And as long as that does not collude with the directory, as long as the relay and the directory don't collude, then the clients can expect network privacy.

They don't reveal their IPs.

They don't connect their IPs to a particular PSBT or a particular sender and receiver pair without needing to have that heavy dependency of Tor.

Of course, there is some cryptographic dependency.

There's some keys that they need to get, which are akin to TLS certificates, but they're not exactly the same in that they can be distributed in slightly different ways depending on the constraints of the environment.

Which brings us to the ergonomics.

How do we actually implement all this?

So use something called hybrid pubkey encryption, which is, I suppose, similar to what Gordian Envelope is trying to do in terms of protection.

We don't use the Envelope protocol right now to serialize the data that's inside the pubkey encryption, but the sender and receiver exchange keys in the BIP21, you can see that that's the pubkey in the subdirectory highlighted in red here.

From that, they can use a Diffie-Hellman key exchange to establish end-to-end encryption and authenticated encryption without the use of TLS.

So they can just use the server in the middle, even if it's not protected by HTTPS, to establish that end-to-end tunnel.

They also establish an end-to-end tunnel with the gateway using this oblivious HTTP key, which can also be shared in the BIP21.

And this can use SecP256K1, which is an unusual dependency outside the Bitcoin space, so that's something that needs some manual implementation, but is not impossible.

And you notice that this oblivious HTTP key is in the BIP21.

Where does that come from?

So the receiver still needs to somehow get that information and may not get it through your typical certificate authority chain.

So we need to figure out how to do that, especially in constrained environments like Bitcoin Core that don't necessarily have access to TLS.

And then there's this question of encoding, whether or not we want to use here, these are BEC32M strings encoding both the public key for the subdirectory and the oblivious HTTP was called a key configuration, which includes the key material and which key derivation algorithm is going to be used, which hash algorithm, which curve, et cetera.

But the spec uses hybrid pubkey encryption for both of these, which is a new -- it's an RFC 9180, I believe, or maybe that's for oblivious HTTP, but they both depend on hybrid pubkey encryption so that this public key can be shared in the BIP21 and then a Diffie Helming key exchange can be used to establish the end-to-end encrypted connection.

And the big bonus for this is that there's no TLS dependency, so it can be used in something like Bitcoin Core.

There has been a draft to support SECP256K1 as a curve for hybrid pubkey encryption, but it's not totally standardized yet.

But if we use SECP256K1, then the hybrid pubkey encryption standard already supports ChaCha20, Poly 1305 for authenticated encryption, and ShaF256 has a hash algorithm for key derivation, so we're not introducing any new cryptographic dependencies from your typical Bitcoin software because ChaCha is used in the V2P2P protocol so that from a dependency perspective, this becomes more palatable to include in various Bitcoin software.

The encoding issue here is still an open concern, which is where I looked at UR, and I think this is where Christopher wrote me an email on the Bitcoin Dev mailing list at first.

So somehow we need to communicate these public keys, and at first I was using Base64 URL, but there's a problem with Base64 URL for encoding these keys, which is that it is case-sensitive.

And if it's case-sensitive, then you can't encode these Bitcoin URIs in QR codes using the alphanumeric mode.

So you end up with QR codes that are more pixels across, they're more dense, and they're harder to scan.

So one option I thought at first was to use BEC32M because that's already supported anywhere that's encoding an address and it has the human-readable part in the front to distinguish what's going on.

So that's PK here and OH there.

And it's everywhere.

Yeah, it's UR.

It seems to be more concerned with structured data, maybe something that has multiple fields, which the OHGTV key configuration does have, but it's already encoded in a structured binary blob from the RFC.

So to me, it made some more sense to use BEC32M because that just encodes one binary piece and includes that human-readable part at the beginning and the checksum at the end.

But after iterating through this a few times, I found there is a bit bigger of an issue, which is that the equals sign and the question mark are not in the QR alphanumeric encoding set.

It's just like a base 45 set.

So these URIs are not eligible for encoding like that.

So I went to the Bitcoin design community and discovered that they can actually be encoded in mixed mode, which is some parts of the string that you're encoding can be encoded in binary mode, some parts can be in alphanumeric mode.

But in practice, it seems like only the last part, at least in software that does this automatically, only the last part will be encoded using that alphanumeric mode and the savings as a BIP21 get larger in the size of a QR are marginal.

So I'm still not sure which encoding makes the most sense for this and that's something I'm hoping for some feedback on.

I think it's very important to maintain the BIP21 for the pay join requests because it's already supported in dozens of apps.

Like I said, Cash App uses this, Foundation uses this, Sparrow uses this.

It's totally backwards compatible with the V1 pay join because this store and forward server can have a V1 adapter so that when V1 sender tries to make a pay join to a receiver using a V2 receiver at that directory, if the V2 receiver is online, they're able to respond immediately.

Private polling gets a response right away and they produce a reply right away within a typical HTTP request response timeout window and still make that pay join happen.

The other important thing to me is that just ergonomically, we want these things to happen automatically in the background.

Bitcoin privacy solutions in the past tend to be focused on this idea of a separate mixing step where you manually go in and make a batch transaction with other people and that costs more money on top of your typical payment flow and it creates an overt signature on the blockchain that you're using some privacy protocol and then you still need to manage your change afterward.

So it costs you time and money and the privacy can be tenuous, you get from that.

So having it happen at the time of payment seems like a hard requirement for me for a privacy protocol that's going to be widespread.

And lastly, this encoding consideration is sort of the last real dependency specification thing to figure out before we roll this out.

So there are two pieces of software that run this right now.

There's the Bitcoin D pay join CLI client you can run on top of your Bitcoin core instance to send and receive pay joins.

Like I said, the directory is open and running as are the pay join relays and getting the envelope right for even alpha releases is somewhat important because once people have this software out in the wild, they may not want to change it and make their previous versions of their software incompatible.

That is what I have for a presentation.

So the BIP 77 on the BIPs repo, the PR is 1483.

I'm really hoping to get some feedback in the design of this from a coordination perspective.

The transaction structure is a different but related question that I haven't totally covered here because there's not much that a new coordination mechanism can change in the transaction structure.

But the big idea, I think, to understand about transaction structure is that there are two types of privacy we're trying to preserve.

We're trying to preserve third person privacy.

So if Christopher and Wolf are transacting, I shouldn't be able to look at their transaction and figure out who paid who.

I shouldn't be able to figure out how much money was exchanged between them.

Maybe I know that they communicated, but they should have some privacy from me.

That's the kind of privacy that pay join typically gives you.

And because the transaction it typically produces looks like other transactions that have multiple inputs that all came from one person.

So you have some indistinguishable by default.

There's also a question of second person privacy.

So if Christopher sends Wolf money, it would be best if Christopher didn't know what outputs that Bitcoin ended up in and for Wolf not to know where that money came from, which inputs.

And we can do that with potentially a pay join protocol involving more than two people, which is something I think could be coordinated in the future.

And to do something like that, we definitely need to have the basic case of two people down.

But I think we still want to preserve this sort of BIP21 payment flow that people are comfortable with now, where they scan a QR code or they copy and paste a URI or hopefully increasingly they just tap and this is exchanged over NFC.

So yeah, that's pay join V2.

Thank you very much.

And I hope I can answer any questions you have.

Thank you.

So let's leave your slides up for a moment.

So I wanted to chat with you about a few different things.

Wolf and Shannon also may have some questions or contributions.

So I think we'll start at the end point.

You've encountered the exact problems that we had with encoding of things and the problems that it causes with the QRs.

And we do have a library that does do the multiple, tries to do the smart thing.

Wolf, what are the two?

I know one, what are the two QR libraries you did that do the fancy QR encoding?

We have a QR encoder library, which I based on a C++ library that I converted to Swift actually.

But it basically allows the basic QR encoding API available in iOS does not allow the mixed mode encoding that Dan was referring to, whereas this one does.

You can encode fragments of the QR code in binary and other parts using their other encoding modes that are more compact for certain kinds of data.

But we found that the support for those, while it's useful to support that for certain kinds of pre-existing formats that we can't control, we also realized as we were experimenting with various kinds of things, the exact same things that we were running into, for example, bookmark and equal sign not being in the basic alpha numeric mode of QR codes.

And that that was why the basic alpha numeric mode was widely supported for, as just a single fragment in a homogeneous QR code.

So we also found problems.

I mean, we did one from JavaScript in Swift, but then other people needed it C and then other people wanted it Rust, and it was just it was hard to get people to support it.

In the end, we basically said this isn't the right answer.

So we came up with the URL format that you're familiar with, which addressed all of these different types of problems, but also allowed us to leverage CBOR as an option for tagging things.

I mean, when we see C-BOR tag a PSBT, the PSBT is not actually completely converted to C-BOR.

All of its structures are intact.

We do a little bit of magic in there so that we can separate the pub keys out to optimize it, which has gone through a couple of iterations.

But that is now well supported.

There are over 13 wallets that support it, and in particular of the ones you mentioned.

I think Foundation Devices would have been here today.

They're very actively supporting our UR, QR, and envelope work.

And I think Sparrow has also been doing libraries and things of that nature here.

So I think there's less dependency problems than you might think.

I think the harder problem is that we have a richer stack for good reasons, and every one of those deserves maybe a BIP.

And the BIP process has been a bit challenging for some of this stuff.

So we'll see how that all works.

There's a little more contributions I'd like to make about that, but you are, if I may.

So, if you have a pre-existing binary structure like a PSBT that you want to handle as a UR, the only thing you need to do is assign a seaboard tag and a UR type, which is a short and human-able string, to that.

And then you just take your binary structure as a seaboard binary string, you wrap it in your tag, and then you have a standalone seaboard structure that is a binary structure.

If you want to encode that as a UR, then you exchange the tag for the UR type, and you just basically use the byte words encoding for that, and the UR type is isomorphous with the tags, so you can go back and forth between those things.

And there's a couple of advantages to this.

So first of all, you don't have to redesign your binary structure in seaboard, especially like for in the case of PSBT, there's already a lot of software that supports parsing and writing of PSBTs.

PSBT is also a semi-fluid format, it may still change the future, and so there's no reason to track that with a separate seaboard-specific structure.

The other thing is that when you're dealing with QR codes, which is one of your interesting use cases, is that because URs are deliberately designed to only use characters from the alphanumeric encoding mode, and because it's case-sensitive, so you translate to uppercase and you have something that's perfectly suitable, in fact more compact than base64 for the purpose of QR codes, that we also support multi-part UR format, which is where you can essentially break your messages of arbitrary length up into a series of parts which are rateless founding codes, which can be transmitted in basically an infinite stream of changing codes that makes various parts of codes of your message together.

And what this does is this allows readers to essentially scan this animating QR code and converge upon the final message, rather than, there's some other schemes proposed which don't use the fountain codes, which if you miss a message more than once, you have to wait for the entire cycle of codes to repeat over and over again, and so you can actually diverge in terms of from optimal transmission time, whereas rateless fountain codes tend to converge.

So if your message is larger than, can become fully represented in a QR code of moderate density, depending on your camera resolution and your screen resolution, things like that, then you can use this extension of the UR format to transmit messages of any length.

So that really ceases to be a concern of fitting in all in one QR code.

Yeah.

So I mean, a couple of different things to note there.

We have examples of it being used on very constrained hardware, both on the display side, LeithyKit has a 200 by 200 display.

So it's a very, very small QR to start off with.

And the tooling will properly size the QR and display it there.

But also on the input side, very tolerant, very different scenarios as far as the quality of the input device, et cetera.

I found, for instance, I think Sparrow is in kind of the worst case in some cases, because it runs on laptops with very poor cameras or don't focus well, et cetera.

And it's taken a while to find the right match of sizes.

But I think we've got some really good answers as for what is the optimum there.

And that's been very reliable.

So that's one part of your thing.

I think some other aspects of stuff is that we're going to talk about in the next presentation a little bit about we really feel like the future of the world is going to be multi-sig.

And so we also have these coordinator issues, which are also dealing with PSBTs and may not necessarily be fully trusted with any keys at all.

They may purely do a coordinator function.

I think there are also a lot of security properties around devices that are functionally separate.

So you might have a phone that talks to an NFC card that then talks to a separate device, which actually does the display.

So we have a lot of these different things that in order to increase security, we're having to do much more complex things.

And we're reaching the level of user tolerance for these that is low.

So we published a scenario for, say, foundation devices, what, two years ago, that really -- no single point of failure, multiple devices, heterogeneity, all the Gordian principles, et cetera, but just wasn't adopted because it was just too hard.

And I see this as going to be increasing future with all of the Bitcoin protocols.

We're all going to be hitting up against these.

And I think Gordian Envelope and URs addresses a lot of these in ways that are transport-agnostic.

We don't care if it's oblivious HTTP or Tor or the Whisper protocol or iMessage, if you really want to.

So we really want something that can transport anywhere.

So the latest stuff, which is what we're going to talk about in the next presentation, is request response.

And that allows for some continuity of a larger number of transactions that are happening and allows you to maybe wrap those inside request response things that basically can establish keys between two parties.

So you have multiple parties in your protocol, in your swim lanes, that need to get keys in a variety of ways.

And in many cases, a trust on first use could make a big difference.

Like, okay, this is now the second time somebody's requested this, but something's changed.

I don't want to deal with you anymore because you're not necessarily who you were before.

I think there's a lot of cases where trust on first use are powerful.

But obviously, that's just the simplest of a number of cases where you establish trust in various other channels for more complex or more concerning issues.

And you need to have the privacy that we are all seeking with these protocols.

So I'm hoping that with the wallet community that is already involved with the Gordian stack that we've built, that we can future-proof for these much more complex things.

Shannon, you're going to be talking in a few minutes, but is there anything that isn't in your talk that you want to connect to the pay-join discussion?

Just generally, what I'm going to be talking about is request-response, which is an envelope functionality that allows one person to say, "Hey, give me something," and then the other party to give whatever's requested or respond in some other way.

So I think there's a question there of, "Hey, is this something that might be helpful for the overall protocol since there's so much back and forth if you're already going in for URs, for example, and for opinion for a pound?"

But I think that's going to be the main thing to maybe think about.

It could be you're well too along in the pay-join to even think about reworking that.

But I'd say think about that as an option when we're doing the other presentation.

I'm definitely here because I'm thinking of these things as an option.

The biggest question I have about the applicability of UR is with regard to the BIP21 flow.

So a lot of the working around pay-join V2 has been to support or be backwards compatible with the way that so many wallets already exchange this request information.

And it seems to me like this was the thing that was both addressed by that original message from Christopher on Bitcoin Dev six months or a year ago, probably eight months ago.

And it's also, I'm not sure if it could be replaced by UR.

So at first, these public keys were base64.

They weren't even base64 URL encoded or URL encoded, which is wrong.

They definitely need to be URL encoded.

But I'm not sure how these components can be replaced by UR because it seems like it would break the BIP21 destination flow.

When it comes to the pubkey encryption, like what's getting sent during the automatic part of the protocol, that could work.

You could encode those things with CBOR.

But here, how do you think that applies?

Yeah, I mean, so I don't know how to necessarily retain compatibility with BIP21.

And that's been a concern.

There are a number of other things.

I mean, the good news is that even this doesn't actually contain a PSBT.

So that was the thing that drove most of the wallet companies to the QR, UR stuff was we just were very quickly hitting the limits of what was possible in a single QR code.

And you're not facing that right now.

So it's not urgent for you.

That being said, when I start thinking about multi-sig, there's some extra information I want to be able to put in here so that because at the other side, it may require multiple devices to agree maybe with the Frost protocol or things of that nature.

And there's no expandability here.

So my intuition says start in the back end of this stack having a more request response envelope, UR style of encoding all of this stuff.

Support the BIP21 as the lowest case.

But you've got already with at least Sparrow and Foundation devices and some of the other parties that are already doing the current PSBT format.

I think you could reach some level of critical mass where you have a, it's a BIP21 plus switch.

It's like, okay, if you want to support the legacy, we'll still support the legacy.

But you really should use a more modern wallet that can do the better encoding and initiate much more complex kinds of interactions.

One of my other challenges here also is the whole question of you're doing this with a remote party who you, and you're also having to trust these third parties.

There's no persistence in this particular trust things.

So I think there's some questions of, again, trust on first use.

Something's changed.

I mean, we've- Are those questions before we move on, what questions do you have about persistence or the kind of attacks that these third parties could leverage?

Well, I think that the question is that the, I mean, I'd have to look at some of the exact details there, but you are relying on a third party to begin to do these types of things.

So if one or more of these becomes compromised or a DNS attack or something of that nature where it gets pointed to somebody else, and the ability for the system to detect there is now somebody who's taken over this particular service and is logging more IP and doing more correlation of various behaviors on the internet.

I don't know how you tell easily.

So especially if we're trying to avoid going through a certificate infrastructure and things of that nature, it becomes much more important for the parties to be able to kind of pin keys themselves rather than relying on a third party to pin for them.

Oh, yeah.

I think I actually skipped the bootstrapping slide, which is like, how do you get the key for the gateway?

And then if you're using some other infrastructure, like if you're using a cache, I think that does become a problem.

Yeah.

But for all of it, current implementations, HTTPS is still available.

So that hasn't become a problem yet.

But yeah, I do.

I do see that problem.

But as long as you're doing HTTPS, now you've got IP addresses, you've got other also interesting kind of tracking around through DNS.

So you also have to do DNS through HTTPS.

And you just have this whole stack of security hacks to a certain extent.

I mean, I'm the co-author of TLS 1.0.

So I've been watching these hacks over the years.

And to a certain extent, we can rely on them because big companies rely on them.

But that also means the bigger adversaries can take advantage of them.

So I'd like to not have to use that as a choice.

And I think we're approaching the point with some of the envelope stuff where we can avoid all that and just not have to worry about that because we're going to be self-sovereign and responsible for that ourselves, or at least the vendors of the wallets that are creating tools for us rather than relying on infrastructure vendors who may not care as much about Bitcoin privacy as our wallet vendor does.

But I'm not saying that any of this-- I mean, I think that BIP21, your current HET bootstrapping, the oblivious HTTP, et cetera, are all good, innovative improvements.

It certainly would be a useful step forward.

I would just love it to be able to future-proof a little bit for some of these larger problems by slipping in a little bit of additional capabilities.

And we can talk more about that.

I wish the foundation devices people were here because I know they've implemented V1.

They may have some ideas around V2.

And they've been working closely with Wolf on some of the request-response stuff.

So Wolf, do you want to say anything more before we go to Shannon's presentation?

No, I don't think I have much to add.

I think I'd be happy to sit down with you, Dan, and just talk through your scenarios in detail and see where it might fit in.

I think it is important to say that we've designed our stack so that you can pick and choose depending on your use cases.

And UR is a high-level format for essentially translating any binary structure to a very limited subset of ASCII for ideally handling as a URI or transmission in QR codes as multi-part.

But if you don't need that for some reason, then you don't need it.

And if you have a certain existing structure that you just want to wrap in that, you can do that very easily.

So you don't need to necessarily design a set of seaboard structures from the ground up.

But there are some advantages to doing that as well.

And so I'm sure-- And that's right.

Like we did with HTTPS, where it was useful to extract out the pubkeys.

So we have a seaboard structure that uses the PSBT format as is, including as it evolves in the future.

It just simply has little placeholders for all of the pubkeys because those pubkeys are useful enough.

I should think you're referring to the output descriptors actually.

Right.

You're correct.

It's output descriptors.

We haven't done that with PSBT, but it's been discussed.

That's right.

And then, of course, this particular slide that you're talking about here, this is something we're working on right now.

We hope to have available this summer is how do we establish a route of trust with one of our collaborative key recovery servers.

So we've had some previous presentations about you want, hey, server, will you store my secret shares for me?

Okay, later, please give me I need to update those secret shares or I need them back in some fashion and I've lost my keys and I need to reestablish authentication with you.

We've been working with multiple companies and parties to kind of establish that.

And one of the things that will emerge will be a subset of that that is useful for lots of other apps besides collaborative key recovery because that's the way we design things.

And I think it might help you with this as an alternative.

I'm not saying you've already got this working.

I'm not saying don't support this, but it could be that it becomes an alternative format.

This is definitely the biggest hack of the whole operation, which is how I managed to skip it even not thinking because it uses TLS to bootstrap.

And if there were a robust technology elsewhere, I would absolutely consider that and be willing to yeah, I am willing to sit down and hash this out more.

I appreciate you guys having me and being able to do this today.

Great.

Well, thank you very much.

We're going to go now to let's see.

We're going to go now to Shannon, which with a closely related topic, which is the request response.

You should know.

Well, it's not just about request response.

It's about the use case.

Go ahead, Shannon.

Why don't you take over the screen?

Okay.

All righty.

I assume everyone can see that.

Hello.

My name is Shannon Apple Klein, and I'm the lead technical writer for blockchain.

We're seeing all your slides, not just the...

What are you seeing, Chris?

I was actually seeing the single slide.

Why am I not seeing it?

Okay.

I just restarted.

Okay.

There we go.

I got it this time.

Great.

Yes.

All right.

Hello, everyone.

My name's Shannon Apple Klein, and I'm the lead technical writer for blockchain commons.

Today I'm going to be talking about Guardian Envelopes Request and Response System, both what it is and why it's important.

This is kind of a little bit up on the stack from URs.

So let's dive in.

The Request and Response System is part of the expanded Guardian Envelope functionality that blockchain commons supports beyond the core specification that we've been working on.

It allows one device to request something from another.

Our implementation guide has more TTLs, but here's a quick overview of everything.

Requests begin as expressions, which are defined in BCR2023-12, another of our research papers.

They're functions with zero or more paired parameters and arguments.

Here's an expression that asks for a seed, and it includes a seed digest as its argument.

Responses, then, begin as simple envelopes.

This subject contains the result of a request, and a predicate contains an "isa" that defines the subject.

Other metadata can be included if desired, such as the name and descriptor for the requested seed in this example here.

It's not quite everything.

In order to turn that expression and its response into an actual Guardian Request and Response, you have to wrap them up.

For the request, a new subject is created with an apparently random ID, then the expression is encoded as a body predicate.

Here's what that looks like, if it's readable.

A response works just the same.

A new subject is created with the same, apparently random ID as the request, then the response is placed in a result predicate.

There's of course more details to how all of that works.

The request and response subjects that you saw are actually seaboard tags.

The functions and the parameters that were in angle brackets are special known values for functions.

Everything that you saw in a single quote like function and parameter here are known values too.

The implementation guide, which is another BCR, shows how you can use all of this in an interoperable way.

That's basically what request and response is, but why would you use it?

Obviously they're an interoperable way to communicate, and that's pretty important in a Balkanized digital asset world that seems to be growing more Balkanized all the time.

However, we think they're even more important for automating complex tasks, and that's where our use case comes in.

Currently non-automated systems have three major complexities, which are shown here.

They require users to figure out how things work, we call those research points, to make decisions which are decision points, and ultimately to push buttons which are human actions.

The more of these three complexities that exist, the less likely a user is to finish a task.

How does automation make that better?

This use case that we've written on the creation of multisig demonstrates the need for a request response system.

Right now we think multisigs are critical.

As Christopher said earlier, we think they are the future of Bitcoin.

They enable what we call smart custody without single points of failure to our compromise.

Even better, they're actually createable today, which wasn't true when we started working on this five years ago.

You can use Sparrow as a transaction coordinator, you can connect up a variety of signing devices, and you have a multisig, possibly a totally self-sovereign one where you control everything.

We bring the scenario and we've asked people to try it, and we think the scenario is very clear, but there's just so much complexity in it that people stall out during it.

That's one of the problems that request and response helps resolve.

The main problem with the current non-automated system for multisig creation is that you have to know a lot of stuff.

You have to understand the lengthy procedure, and you have to have pretty good knowledge of how all of your devices and apps work.

It's a really high bar, and that's not even counting all the button pushing that goes on.

An automated multisig creation system built on request and response improves the situation by having the transaction coordinator, such as Sparrow, be a conductor for everything.

It frees the user up from that task.

It does the heavy lifting of managing the procedure, telling each device what to do, so that the user doesn't have to.

It just makes requests, and the individual devices offer responses.

The user does still remain involved.

He has to ensure the safety of the system.

They confirm whenever data is transferred from one device to another.

Out of necessity, they take physical actions too, but it's a lot less that they're doing, and they have to know a lot less.

Here I have two sequence diagrams that show the difference between non-automated multisig creation, which is on the left, and automated multisig creation, which is on the right, using request and response.

Without automation, the user has to figure things out and do a lot of independent action.

If you can actually see this sequence diagram, you can see there's lots of brains here, which talk about them having to figure out how things work.

There's lots of faces, which show them having to actually take actions, a lot of actions.

There's some light bulbs, which are places they have to make a decision.

In contrast, with the automated system, they still have agency, but it's through confirmations, which we can see as these thumbs up, rather than problem solving.

Lots of automation instead of human actions.

It's just a system that's going to be easier for anyone to use.

That's why we think request response is important.

It reduces the need to research, to decide, and to act during a complex procedure without affecting the agency of the user.

It guides the user instead and points them toward the important stuff.

These abuse turns an unmanageable task into a manageable one, maybe even a simple one.

When I plotted out these two sequence diagrams, what struck me the most were the research points here, which again, were the places where the user really had to figure out how things worked.

In the original system, there were 11 specific unique research points.

In the new one, there's just one, which is setting up the system to get going.

But also, the decisions are reduced and the human actions are reduced.

As I said earlier, we're pretty sure that's going to make people more likely to actually complete the task.

Today, we're seeing the request and response ecosystem just beginning to grow.

Foundation Devices is one of the earliest adopters because they're working on it for an upcoming project.

We think that's just the start, that there's a whole universe of automatable tasks that request and response could support, including functions like PageJoin, if desirable.

For more, you should take a look at these two documents, which we created earlier in the year.

The multi-sig use case for requesting responses in our Smart Custody repo, which has a lot of documents on how to be safe in the usage of digital assets.

The implementation guide is in our research repo, where it's bcr2024-004.

That's it.

Thank you.

Any questions?

Thank you, Shannon.

One thing that we didn't discuss was, of course, all the request responses are envelopes, which means that you have the full capability of using any of the envelope features.

For instance, you can encrypt, you can allide various information, you can set it up such that the party in the middle cannot access the data that a party at the end of a series has access to.

We've not fully explored all of the interesting choices that these scenarios might require.

I've been struck that even with a trusted coordinator, Sparrow, or something of that nature, it often ends up needing a lot more information than it actually needs to perform the transaction for you.

Are we even able to -- for instance, you don't necessarily need to know what the root key is.

I think there's some interesting choices that can be made in the future.

The first step is getting request response working and then we can wrap in Tofu and different kinds of allision and encryption protocols for the different steps.

What else would you say would you add to the -- I'd just add that for anybody who's coming into the cold conversation on envelopes, it's a very lightweight structure.

You really only have to pay for what you use in terms of how big the structure is.

It's a miracle-like tree, so you can actually transform certain parts of the structure, like illusion or compression or encryption without paying a very penalty for it.

It's all kind of baked in.

Very small structures are just very -- there's a little overhead for them.

We designed it to be a very simple, very elegant structure that's usable for a wide range of tasks.

We're seeing how it fits into various kinds of use cases.

We're discovering that it really actually enables a lot more power in various use cases as we continue to experiment with them earlier in this presentation.

You saw how we're looking at a general representation of graphs and how combining that with, for example, like the holder-based illusion enables various kinds of documents to be much more secure and much more protecting and respecting of personal privacy and sovereign rights.

Right now, the low-hanging fruit on request/response is for coordination.

For coordination, you have multisig as Shannon's use case demonstrates.

The other one that we've been talking about and we're hoping to see this year is our first collaborative seed recovery tools so that we can do what Ledger and other parties are doing with proprietary tools but also with a limited set of sharing vendors.

In our case, you could choose which recovery partners you wish to use, which not only could be a major company with lots of protection but could also be your own friends and colleagues or could be offline in the form of an NFC card or even a paper document put into a vault.

We feel like there's some real opportunities in that low-hanging fruit for request/response.

The other area that is basically coordination and the collaborative recovery are the two.

When we start talking about self-sovereign pay join, I think there are also some -- I'm sorry, I'm getting some music from somewhere and I'm not sure where it's coming from.

Is that my computer or someone else's?

It's not over the Zoom.

I hear nothing.

Okay.

I see what happened.

Siri.

Started playing music for some reason.

The -- I think the -- I lost my train of thought.

Pay join obviously is a two-party protocol.

Right now, it can't be done offline.

You can't have two devices meeting at the next rebooting web of trust and somebody wants to pay their share of the dinner and has no net connection.

Moving to sort of the more UR, QR and envelope type structures would allow you to potentially do that completely through a QR mechanism.

I think there's some interesting things there.

But as soon as we get more parties involved, I mean, we've kind of seen with what's happened in the last week in regards to mixing services, you know, any form of centrality of, you know, can be attacked in a variety of different ways.

And we've seen evidence of that, you know, with the recent news events.

But there should be nothing that allows, say, the four of us who are all trying to pay for dinner at rebooting to be able to participate in a pay join together and mix all four of our payments so that none of us can be identified.

So I'd like to see those kinds of futures.

Any other questions or comments?

Andrew you sort of stuck through the whole presentation.

Do you have any questions for Dan or for us?

If not, I've got some questions about the meta, how you come up with these solutions.

I've seen these slides a couple times when I've attended these meetings, the decision points, confirmation points, research points, human actions, automated actions.

What do you call that framework?

How did you come up with it?

It seems like if you list all those out, you can figure out what actually needs to be optimized.

It just seems like a great way to approach a problem.

Yeah, I don't think we have a name for it yet.

And it really came out of looking at multi six and saying, why is this so problematic?

And so we thought, what are the different types of things that are happening?

But maybe we should write it up as a problem solving methodology or an analysis methodology.

It somewhat comes out of my security design work and such.

You can find a lot of its roots back in the original Smart Custody book from 2019, I think.

Where we talk about how do you think about adversaries and then using that we have some interesting metrics and approaches for how to use that to make decisions.

And we've just then applied that to multi-sig and a variety of multi-sig scenarios, including using various spreadsheets where-- I think there was one spreadsheet we had that had like 64 different threats for on a multi-sig where we could basically show that in every single case, we had a solution for every single point of failure and single point of compromise, which are subtly different.

Oftentimes they're the same.

But if you don't separate them, you'll miss them.

So but yeah, that's-- we've done this now for a few different companies who've asked their support from us to force some of these very specific scenarios to analyze the single points of failure and compromise.

And then we, of course, did the public one, which uses Sparrow Foundation devices, Gordian feed tool.

I think that was the requirements for that.

And in that one, Sparrow does not have any keys.

So all the keys are not in the coordinator.

Yeah, it certainly grew out of that adversarial work.

And here we were looking at the adversary of time and effort, which are listed as adversaries in our original.

So one of the interesting things about the sequence diagrams that I showed were that when I showed that really long list with all of the human actions and decisions and stuff, that was actually just getting one of the keys that Chris was pointing out.

I think the one from guardian seed tool that is used for backup.

And so the whole method is just so complex that help is needed.

And I think that's true for a lot of work with digital assets.

Often, so the other challenge is that we've got something called the NASCAR problem.

And this has happened in other industries that has killed interesting, if not decentralization, at least distribution.

So like open ID at one point allowed everybody to, in theory, have their own ID server.

But there was also this NASCAR problem where for a couple of years, there would just be this longer and longer and longer list of all the different services that you could offer to use to do your identity.

And at the bottom would be you could do your own if you pasted this URL type thing.

In the end, it was just too complex for users who don't like having more than one or two choices at a time.

And seeing all these logos and stuff also meant that the big guys had to be at the top, Facebook, Twitter.

And of course, the big guys did not fully participate in the system.

So they're at the top, but then they wouldn't support other people's open IDs.

So it just ended up in this mess where the choices ended up being controlled by the people with the most money.

And then the whole thing kind of disappeared.

You sort of see it now a little bit with the federated login.

Every once in a while you have somebody say, you can log in with Google or you can log in with Twitter and you can log in with Facebook.

And that's it.

And related to that, if we talk specifically about Sparrow, every time a new feature is being added, then you have to have some documentation that says, oh, well, in this app, in this wallet you have to do X, Y, and Z.

So there's this long little dialogue that says, go here, do tab this, go to this line, paste it here or whatever.

And every time he supports another hardware wallet, he's having to do that again.

And so now just this long list of help that he's having to support, which means that maybe he isn't spending as much time adding Page Join V2 because he's just simply trying to support the fact that Foundation Devices has upgraded their wallet.

Now all those little choices are in different spots.

And they're on different named screens.

And with RequestResponse, you can just simply say, hey, wallet, this is the function I want you to do.

When you're done, give it back to me.

I don't care what you do as long as you give me the response that I'm asking for.

And then the wallet can basically go, yeah, I know how to do that and lead the user through all the different steps.

Got help?

Yeah, what's the tiny URL for the BCR?

I missed it in the slides and I don't see it in the developer meeting, Marcia.

>> Sure.

>> Can you paste that to the -- >> Which URL are you looking for?

>> The BCR, it was like 2004, 004.

I have the multisig RR and the multisig documents, but not the one that I think is the RequestResponse itself.

>> Yeah, hold on.

Let me grab it for you.

And I will send it over in the chat.

The tiny URL might have been BCR-2024-004 because that is the right number for the -- >> And you can always ask these on the Signal Channel.

>> We have such a proliferation of different documents and examples and videos and other stuff of all of this type of things that we're always, you know, puzzling out how to make it easier for people to be able to find things.

>> But I just sent it over in the chat, too.

>> Yep.

>> So basically all of our research docs that we've been talking about are in GitHub.

They're in our repo under Blockchain Commons called Research.

And there's a master list of all of them that says what they all are and also says what the status of each of them is.

So BCR-2024-004 is the Guardian Transport Protocol Implementation Guide/The Envelope Request and Response Implementation Guide.

>> Excuse me.

Great.

Well, Dan, thank you very much for presenting today.

And we'll be making this video available shortly, and hopefully you can also use it to try to get more people involved.

And we would love to work with you to figure out how to, you know, take it to the next step.

>> Well, let's do it.

Thanks so much.

>> Thank you.

>> Goodbye, everybody.

Have a good week and see you in the beginning of June for our next Gordian meeting.

Thank you.

>> Bye, everybody. [end of transcript] 1 [BLANK_AUDIO]