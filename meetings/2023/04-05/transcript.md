# Gordian Developer Community - Meeting 2023-04-06

_This is a transcript of the meeting of the Gordian Development Community held on April 4, 2023. The archive of the overall presentation is available as a [YouTube Video](https://www.youtube.com/watch?v=EyYiwYpui5Q), an [MP3 Audio](audio.mp3) and the [Slides PDF](presentation.pdf) are available on GitHub._ 

_See our [meetings directory](../../meetings) for a complete list of details on other meetings._

> ABSTRACT: _At this regular Wallet Developer meeting (held the first Wednesday of every month), Blockchain Commons discussed promoting success of QR PSBT interop, shared observation from presenting Envelope at IETF Dispatch, offered update on CBOR/UR and evolving Internet Drafts, and briefly talked about legislative work in Wyoming. The community discussed QuickConnect's next generation, a javacard version of SSKR, and plans for the next monthly call in coordination with Silicon Salon 4. More lively discussion followed including about BIP 85._

> SUMMARY: _See Gordian Developer Community Discussions https://github.com/BlockchainCommons/Gordian-Developer-Community/discussions/108 for a summary._

## Raw Transcript

> _(What follows is a rough computer-generated transcript with some minor edits. VOLUNTEERS NEEDED)._

### Introduction

Welcome everybody to our monthly Blockchain Commons Gordian Developer Community Meeting.

This is for the month of April.

Just to quickly recap, what is Blockchain Commons.

Well, we're a community interested in self-sovereign control of digital assets and identity.

And in fact, we'll have representatives from a variety of different communities here today about that.

And that's part of what we do is we're bringing stakeholders together to collaboratively develop interoperable infrastructure in particular around wallets.

And I really wanna design decentralized solutions where everybody wins.

And as such, Blockchain Commons is a neutral not-for-profit that has a mission of enabling people to control their own digital destinies.

Who am I.

I'm Christopher Allen, @ChristopherRay on GitHub, on Twitter, almost everywhere.

And I'm the Principal Architect and Executive Director of Blockchain Commons.

So specifically, what is the Gordian community.

It is the developers that are specifically focused on jointly expanding and using the Gordian specs.

Again, open, interoperable, secure, compassionate infrastructure is our mission.

And this year we're really focusing on these four initiatives.

There are libraries for deterministic seabore and Gordian envelopes, which we are doing a rust version of and other people are looking into Kotlin and other kinds of ports.

We are putting together reference examples of various QRUR crypto requests, such as signing beyond just the typical PSBT signing, which has been a big success for us so far, but also things like account policy creation and some other advanced topics when we start talking about hardware and chips.

This will lead us to be able to do a lot of our vision around collaborative seed recovery.

How can we all be much more reliable and have much better tools, not only to do collaborative and social key recovery, but also be able to evaluate what is good, reliable methods that have no points of failure or of compromise or no more than, no single points at least.

And then we really wanna create a foundation for collaborative key management.

There is certainly a future with Multi-SIG and Mu-SIG and FROST and all of those that we need to prepare for 'cause it's gonna really transform the way we think about security in the next five years.

So in our last meeting, we really focused on DC-BOR and UR interoperability.

We introduced DC-BOR, again, that's decentralized, excuse me, not decentralized, It is deterministic, Seaborg.

And we talked about some of the wallets now supporting URs.

And we ask people to start joining some of these community channels, such as Signal and our announcements list, so you can be notified of these meetings.

Our topics today are the seven.

So we wanna promote the success of QR, PSBT, Interop.

We've got over a dozen companies that are currently doing that, but we'd like to make it better and we'd like to let people more know about the value of being able to do this interoperability.

We went to dispatch at the ITF, that has some impact on some things if you're interested in international standards, which then relates to some CBOR-UR updates that we wanna make sure everybody are aware of because they're changing our internet drafts as we get closer.

We've had some success on our legislative work that you might be wanting to know about or participate in next year's vision there.

And then we have two presentations from members of the community on new ideas.

There's Quick Connect, the next generation and also SSKR for JavaCard.

So we're hoping that in future meetings, if you have a topic you'd like to talk about that you'll add it to the agenda and let's talk about it.

Let's find out, hey, is there other people that are interested in that and how can we make it more interoperable.

So QRPSBT Interop, this is our biggest success to date.

Again, we have over a dozen wallets.

So one of the things we wanna do is create a video to celebrate this interoperability.

So what we'd really like to try to do is get from each of you a clip of sending and receiving a PSBT from your wallet.

So Shannon's working on an example of that now for the Gordian Seed tool, but we want it from Sparrow.

We want it from everybody who sports that so that we can just quickly show, hey, here is all of these different wallets that interop now for multi-sig PSVTs.

So, we'll be telling you more details about that, but let us know if you're interested in contributing that and we'll probably need a logo and some other different types of things to put together a really nice video on interoperability success.

This does mean you should update your wallet details and entry on the Gordian community page.

So we have on the-- there we go.

We have on the Blockchain Commons Gordian Community page this table of what we know about the various projects.

So in particular, you note that we have question marks on a few of these.

And there are also-- not everybody supports all the different URs.

If you're supporting one of the other UR formats or are planning to, please add them to this table.

But there's also a member section here where we talk about how does somebody contact you.

So if you want to reach somebody at Keystone, here's how you can get them at GitHub.

If you want somebody at Foundation Devices, here's Ken.

So if you can update that information.

Also, we have a number of people who've been doing libraries related to URs.

And I don't think we have a listing of all of them current right now.

This is what I have right now, which is the BCUR in Java, the URKit and URUI in Swift, Hummingbird, Foundation Devices, Python, UR, and then a UR Rust version from a third party.

So if you've got some kind of code, a library, whatever, around any of our CryptoCommons work, we really wanna properly list it here.

And of course, don't forget to subscribe to our community channels.

That's this page.

So there's a signal group, which I think most of you are on.

We have a GitHub discussions forum here, where we do calls for agenda and things of that nature.

It's really easy to just basically go to watch custom, and then you can just basically say you want to only watch the discussions for instance.

And that'll make sure you get notified about things that are going on at Blockchain Commons.

So before we go on, any questions regarding PSBT Interop.

Is there anybody that would like to talk about that in their project or other Interop successes.

Okay.

Going forward, we presented at Dispatch.

That's a group that helps us talk about our prospects in ITF.

And we talked both about DCBOR and also about Gordian Envelope.

And I think the DCBOR stuff, they liked it.

They referred us to the CBOR community and, you know, we've made some good connections there.

And I think there's a good chance that there'll be a, a, either a profile or maybe even an RFC may eventually come out of the DC bore work.

But I think that we failed in demonstrating the simplicity of Gordian envelope as just, you know, I mean, in the end, what it does is it delivers you a deterministic hash.

We weren't, we didn't really talk about that.

In the end, it's only eight, you know, variants of a leaf of a tree.

That did not come across, but probably most important is why, okay.

You know, we didn't, we maybe should have opened with, hey, you guys said in privacy in '69, '73, and in human rights in '82, '80, that you need to support these things.

And guess what.

You're not doing a lot of it.

and you're basically still allowing standards to move forward without more privacy.

And we think this, because it works with C-BOR and works with a variety of other things, offers a lot of opportunity for adding privacy to a wide variety of protocols.

I mean, they kept on saying, well, you don't have a customer, you don't have a client within the IETF that wants to use this.

And I'm going, well, to a certain extent, you're all my clients.

If you've got data at rest, definitely, and even if you've got data in transit, you need to start doing privacy.

So we're talking with people about writing some documents around the guidelines and such.

You're interested in this, you're interested in ITF processes, we'd love to have your help with this.

Our goal is to have a birds of a feather buff at the face-to-face in July in San Francisco.

Wolf, do you want to say anything else about our dispatch experience.

- Yeah, I'd say that, you know, I went in prepared to make a technical show of, you know, of what Envelope is, and it became very clear from the feedback we got that we need to understand, we need to convey better why Envelope is.

And since then, you know, Christopher's made a lot of notes on that, that we'll be incorporating into our future documentation and presentations about that, because I think we agree that there's a huge case for it.

And of course, having been its primary architect, I'm enamored with its simplicity.

To a certain extent, I'm not sure that came across properly either, which is something I'll work on.

Because it is inherently very simple.

But it was a learning experience, 'cause I have next to no experience with standards bodies, So this was new.

On the other hand, the kind of feedback we got from people who are very technically minded, but also the technical, the standards bodies that we're used to working with standard bodies was useful.

And I think that I understand the kind of people we're working with.

I've worked with many people like that in the past, just not in standards bodies.

So I get the feedback we got.

- Thank you.

Harrison, we didn't mention last time we had presented to the W3C, and I felt like that meeting went a lot better, but do you have any thoughts about, you know, moving forward, Gordian Envelope and DCBOR and things of that nature in the W3C, or any advice for us based on, you know, our presentation at the W3C.

- No, I think that was a great presentation.

I think we probably should continue that discussion because I think the first time we bring it up, I think, you know, it takes, my general feedback is like, it takes like about three conversations for the full effect to sink in.

So, and I think Gordian Envelope in general, as a data structure is, and concept is quite cutting edge.

So I think we probably should continue to have those discussions to gain more, I guess, community acceptance and adoptive.

Yeah.

- Thank you, Harrison.

Anybody else have any comments around IETF and international standardization.

Okay.

We'll move forward to the next item.

So Wolf, I'll let you lead on this.

Right, so I've actually been on vacation about the past week.

I'm still kind of getting back into things.

But before I left, I spent a very intense week or so bringing a lot of our documentation into line with the latest work I've been doing.

I'm pretty certain that pretty much all of our research papers as well as our ETF, internet drafts, and so on are all very consistent right now.

By the way, I should mention I'm Wolf McNally.

I'm the lead researcher for Blockchain Commons.

Christopher and I have been working together for a number of years.

I've, you know, the primary lead developer of the UR specification as well as Gordian Envelope.

And in this case, dcbor, which we identified as kind of a necessary foundation for the kinds of things we would like to do with Envelope and that we think has wide applicability to the community at large.

So part of what we need to kind of harmonize in this last week is the proposed cbor tags.

C-Boar has a, like, if you're thinking about determinants of JSON and so on, they're often, if you want context, they're often using URLs, which are quite lengthy.

And you can still use those with C-Boar as well, but C-Boar has its own system of tagging data as having a certain semantics.

And then the IANA runs a registry of these tags.

So I've been assigning tags as I go from spaces that are fairly low in numbers, but still not occupied by the IANA registry.

and uh.

.

.

but because i've been kind of adding them as i go uh.

.

.

they fall in a broad categories and so it's very kind of ad hoc now some of these tags have already been uh.

.

.

are out there in the wild and uh.

.

.

and i've uh.

.

.

mark those in some record documents is now fixed uh.

.

.

and had they had those are not been renumbered uh.

.

.

but meanwhile the ones i still consider it heavily influx well primary recording of already on the look in certain things I've now kind of stabilized in certain ranges.

As you can see there, 200 through 206 are the core envelopes tags.

And some of those were things like, we had one for an encoded cryptographic message using Chacha Polly, and that now has a fixed number.

That number has changed, but as far as my knowledge, nobody else was using it at this point.

So I took liberty to renumber these things.

So 200 through 206 are now the core envelope tags, 200, seven through 212 are for distributed function calls, which we will believe will be a major use case for envelopes.

And then 300 through 323, many of which are, have fixed values in those for things like PSBTs and so on, which have not changed, but those are related to Bitcoin and secure components.

And then 400 through 410 are uses output descriptor types, which we've documented before.

those haven't changed either.

And then 500 is a miscellaneous tag uses a response type for output description response, which again, I don't think anybody else is using currently, but we left it where it was.

So they're much more harmonious and that's part of the preparation for actually submitting requests for IANA to allocate space in the C-more tag namespace.

So two previously published names for, as you know, if you've looked at URs, They are a UR stands for uniform resource.

It's a binary encoding in essentially an ASCII and a limited subset of ASCII that can be used in uppercase for QR codes in their very efficient alphanumeric encoding mode.

It's generally useful for other things as well because it puts data into a URI format.

But part of that URI where the scheme would be UR colon is the type.

And so we had one called CryptoDigest, which is just for a cryptographic digest in this case, SHA-256, we've just changed that to digest by itself.

So ur colon digest is the SHA-256 digest and crypto message, which is, as I mentioned, is the encrypted message is now just ur colon encrypted.

And so these, you know, were the only changes I made to actually registered ur types.

If you, in all our specs, we've been consistent.

In fact, we've made this a requirement that the corresponding type and number are together.

But if you use the type in a UR, you don't put the C-Board tag on because there's a one-to-one correspondence between them.

And if you're gonna transmit as pure binary without being in UR form, you do put the tag on it.

So all the correspondences between these are listed in our documentation.

So basically the intent being you should be able to move back and forth between UR format and pure C-Board format, and it should round trip.

So if you have any questions about that, feel free to reach out to me and I'll point you towards the exact right documents to answer your questions.

- Thank you.

So I think at this point, we're fairly certain that this doesn't impact anybody, but there are some people we've experienced in the past who kind of jumped ahead and implemented, kind of a draft proposal and didn't let us know they used it.

So we're trying to be clear on that.

I mean, I know for instance that Ken is beginning to play around with some of the distributed function calls.

I don't think it affects anything at this point, but let us know if it does before we submit anything to IANA or other places.

Anybody have-- - Yeah, if we're gonna make any last minute changes, now is the time, at least for these tags.

- Anybody have any tags that they're using that are at risk here or challenges.

I mean, obviously, we're going to have to add more.

Especially as we do more things with the W3C community, we'll probably have to define some more tags in the 300 range around keys that aren't just secp256 keys and such.

So some of these-- So I don't have any feedback.

but now that you've mentioned all this stuff, I am gonna take a closer look at the tag definitions just to see if I do have any comments.

- Yes, please do.

And also, one of the nice things about tags is, if something is a semantically a variant, like let's say digest, because digest, we were using a Blake three digest and we just recently switched everything over to SHA-256, primarily for compatibility with international standards and whereas Blake three is probably better, but not as well recognized at this point, then if we did want to add other digest first, they could still be UR colon digest, but we would have, we can add additional affordances in the C board itself to say, yes, it's digest, but it's a different kind of digest.

For example, we wanted to add Blake three later, didn't recognize that as a digest because they wouldn't recognize it as a Blake three digest, but digests that were Blake three would just be recognized as digest.

they will handle SHA-256 or Blake 3 equally well, just by recognizing the form of the C-Board that goes with the type of digest.

So we don't need to add new UR types or top-level tags for every possible variation semantic that can happen at a lower level, an internal level.

- Thank you very much.

Any last comments on this.

A lot of exciting stuff is gonna be coming this year.

I'm really looking forward to some of the distributed function call capabilities 'cause among other things, they can go multiple direct, you know, multiple levels deep.

So, you know, the coordinator out in the cloud can make a request of your local iPhone app.

Your local iPhone app can now make a request related to that to a secure biometric device, which in turn may actually use a UR to the chip.

If it's like a cranium chip, which Crossbar is proposing, it will actually allow for some very simple UR command so that it can respond at the chip and do the operation, the signing, and then pass it all the way back to the coordinator when it's needed.

So we really want to be able to have a variety of different kinds of advanced flexibility where we don't really care that, hey, it's a UR from the server through a QR code, but from the iPhone to the biometric device, it's a NFC from the biometric device to the Silicon is some kind of trusted secure channel on the board.

We want to handle that very broad range of things.

And I think that's something that nobody else is really trying to think about that range of things.

So moving on, Walt, you wanna continue on this.

- Sure.

So if some of you here have no doubt read the internet draft for accordion envelope or looked at the reference implementation in Swift, I am officially broken ground on the reference implementation we're doing for Rust.

As you know, we already have a DC-BOR internet draft as well, and we have the reference implementation in both Rust and Swift.

And they've been aligned to be very close to each other in terms of their, the semantics and the capabilities of their APIs, but they're idiomatic within their languages.

So the feature that I've added to Envelope is because it occurred to me that one of the basic use cases of envelopes, especially when you're dealing with large data is to have some kind of ability for envelopes to become compressed.

And in this case, it made sense to implement that as an eighth envelope case, which is a nice round number eight now.

But, and then we've chosen to use the deflate algorithm as our default choice because it's generally quite useful and highly available and even standardized.

So obviously there could be other forms of compression used that could be adopted over time, again, without having to add another case because those are all the compressed case.

And like the encrypted and lighted cases, it is the third case that declares its digest of what the actual envelope inside it should be when it is uncompressed and expanded to become an envelope.

So it doesn't really change the semantics of what envelopes are in general.

It's all envelopes within envelopes within envelopes.

There's now three cases, encrypted, alighted, and compressed that declare digest.

Alighted has no additional data with it.

Encrypted has an encrypted payload, and compressed has a compressed payload.

And if you replace them with their unencrypted, unalighted, or uncompressed counterparts, it's the exact same envelope, essentially.

So semantically, it's the same envelope, it's just been gone through these three kinds of transformations, which are collectively, I call the obscured cases.

So because the contents are obscured in some way, either by being omitted in the Illini case or by being encrypted or by being compressed.

And so you can see that that's our internet draft, which we haven't actually published the full internet draft yet.

It's still in the editor's copy.

So we were waiting for the window to open up the window to submit new versions of the ID to ITETF closed just before the big meeting.

And then, so we didn't make it by that deadline.

When that window opens up, I will submit the new draft, but right now you can check out our editor's draft, which has those changes.

And then conversations, as you heard Christopher say, we were at the dispatch meeting, and that's basically, you know, where, okay, you wanna push the IET to work with us, we need to dispatch.

And so, as expected, the C-Board working group, which we are already having some fruitful conversations with.

One thing we discussed with them is that one of the specs, requirements I had made is that map entries not be null because that seemed to me to be indistinguishable from the case where they're not having a map entry at all.

And the idea is to have the DC board describe what you need to do to make it deterministic.

After further consideration and kind of concerns raised by the group, I realized that, nope, there is a semantic difference between them.

I won't get into it right now.

But that's the only semantic change that we've made to the DC-VOR internet draft.

And also the reference implementations have been updated to allow null map entries at this point.

So, and that's the main thing.

And of course, all of these, all of the reference implementations have been brought into line with these internet draft updates.

- Thank you.

Does anybody have any questions about the internet drafts or about some of these changes.

I mean, at this point we did not have a specific developer community member say that, hey, this compressed case is really important to us, but we felt like it made sense.

And I suspect that there might be some people that can use it.

- Yeah, in many cases, payloads, Obviously, if your payload is small, you get no benefit.

In fact, you add a little overhead.

But if your payload is like even 100 bytes, it can probably make a little bit of a difference.

In cases where that's what matters and you have the ability to decompress it on the other end, I think having a general built-in facility for that could be quite useful.

This was not a demand-driven thing.

In fact, that's one of the criticisms we got at the beginning is, well, why does this exist and who are the customer inside IETFB for this.

Apparently, this is something that's new to me.

You get a lot more respect from the IETF if you're already saying, hey, we're solving this customer demand.

Well, we are with Gordian Envelope, but we just didn't have the way of articulating that at that point.

So in many ways, I'm doing something I think would be good.

Nobody is required who's doing their own implementation of Gordian Envelope needs to support compression.

Look at these things, there's a semantic space for it, there's a case for it, but if you don't need it and you need like a very size limited version, you don't wanna include a deflate algorithm, whatever, you don't have to implement it.

There's nothing about this as you have to implement it.

If you wanna create a full reference implementation, yeah, you should support it, but because it's part of the actual, it's actually one of the cases, but for actual practical deployment purposes in small environments, you don't need it.

- I wonder if it makes sense to sort of do a variant for the PSPT signing, 'cause like one of the things we're running into is like larger PSPs are really annoying to sign over QR because it takes so long to scan them.

- Yep.

- Like if we could compress them down quite a bit, that could make it possible to scan or to sign a larger PSBT in a shorter time.

- Right, so the UR-PSBT, the actual PSBT type of UR is just a PSBT.

But if you put it into a Gordian envelope and then compress that envelope and send that envelope as a compressed envelope and the receiver knows they could be getting a compressed envelope that contains a PSBT, then sure, then the transmission and reception of Gordian Envelope means that if you get a compressed arm, you know what it is, you know how to decompress it, you know that it's sending a PSPT sign-in request and it can even be wrapped in the semantics of a remote function call.

So yeah.

- I mean, that's one answer.

Go ahead, Ken.

- I was just gonna say, I wonder, does it make sense to define this as an extension, like a standard extension then, so that we don't all do it differently.

- Well, it has to be, if you're gonna implement it, in this case, it has to be Deflate right now, if you're gonna go by our internet draft.

And we have the reference implementations as well as, I'm not sure of any specific test vectors, but the reference implementations definitely have test cases in them that show whether you've gotten it right or not.

So there's only one way to support it right now.

And so it's not a matter of you can just use an old compression algorithm or whatever.

We state very specifically what the parameterization has to be - Right, so like you're gonna, me as a developer, I'm gonna find some C-board to wrap this PSPT, right.

You know, then compress it.

So like whatever it is that, whatever that C-board looks like, you know, we should standardize that.

- Yeah, we can get examples for that.

I don't think that's the problem.

I do have a kind of a larger question.

I think that's the pragmatic answer, given the dozen or so wallets that are out there.

And, you know, some of them have never shown up at any of these meetings, I do believe that the right answer is to actually encode PSVTs in a more generic form that is binary centric.

I mean, right now, a lot of the problems, like we literally ran into today, Shannon and I were trying to make a little video of Sparrow and SeedTool exchanging a PSVT, but Sparrow has kind of moved on to multi-path descriptors, which is not a BIP yet.

And it's kind of got some weird things 'cause it kind of implies a change policy in there and whatever.

And this whole binding of, oh, well, an X pub means this and a Y pub means this policy.

And then, oh, well, that kind of ended up being a never ending mess, but we're gonna keep X pubs even if we're not gonna do Y pubs and all that kind of stuff anymore.

This binding the encoding and the data and the policies all into this weird object that is tightly tied.

This is exactly what Seaboard is designed to make easy.

You have a self-describing thing.

This is an extended public key.

This is a BIP 32 path.

This is some policy hints.

You want Segwit or you want Taproot.

Here's the-- Are you suggesting a completely new format instead of PSPT or just defining C4 that maps to PSPT.

Let me finish on that.

So I think that would be the ideal from the long term because then we could do things that are beyond just Bitcoin, you know, other kinds of, you know, pre-signed transaction type things, you know, partially signed transaction type things could be generalized for all of our use cases.

That being said, unless we had some critical massive developers that wanted to support, you know, going to that level of, you know, break, you know, you know, breaking this apart is right now going to be challenging.

So I mean, if you and Sparrow and two or three other wallet companies said, "Yeah, let's just bite the bullet and just describe this in a well thought out, well layered way, and we'll at least be compatible with each other and we'll try to be compatible with the people who aren't at the table," then I might reconsider it.

But right now I'd say The short-term solution is if you've got a 10K descriptor with a, not a 10K descriptor, a 10K PSBT, it's got all these transaction headers and all these just change that's being consolidated, et cetera, just compress it.

It's the short-term pragmatic answer.

The reason why we, you know, you are PSPT, I just defined it as it is.

It's just has, you know, it's header and then the actual current binary PSPT was for expediency.

You know, if it were up to me at this point, especially having an encoding envelope, I would basically say, you know, the Bitcoin transaction to be signed as the subject, the signatures are the assertions on the subject.

And I would encode it as an envelope.

But even then, you know, compression can be used.

And the nice thing about adding compression to the envelope is, because it doesn't change the Merkle tree of the envelope to compress an arm of it, if you have a particular bigger arm, yes, the receiver does have to recognize, oh, this arm might be compressed because it might be big, and just check for that and then say, oh, yeah, uncompress it.

It's the same envelope.

So you can send it compressed or uncompressed and have the exact same semantics.

You just need to make sure the receiver checks to that, oh, yeah, if this is compressed, uncompress it.

Don't just reject it.

Because once it's uncompressed, it's put in place.

It's just another, you know, it's just a PSBT ready for signing.

And so you can make that part as a PSBT signing request envelope that's using the request response semantics.

So in my opinion, everything should get easier, including, you know, making PSBTs, which I think are fairly compressible, you know, smaller.

Yeah.

And I feel like this general problem, we think about, you know, the pattern of what is a PSVT, which is a partially signed transaction.

There are lots of other things we want to do partial signings for.

That was one of the headaches when we had that special meeting on how do we do UR/QR signing of other things is that, okay, if we try to inherit the legacy Bitcoin transaction format, then we end up having 10 weird special use cases for this is, oh, this is what a PGP signature looks like.

This is what a whatever.

And again, those bindings are all kind of messy.

If we can abstract that out, then we have something that generically will allow us to do partial signatures for a lot more things and allow the UXs to go, "Wait a second.

I don't understand this path that you've given me.

This is not a standard path and then be able to warn the user, "Oh, this is not a path I recognize as being conventional and do you still really want to do it.

" Which is kind of hard to do right now with, you really have to follow not just the BIPs, But because, I mean, like I said, multi-path descriptors, which might be used in a PSBT, isn't even a BIP yet.

And there are other PSBT emerging problems as we're trying to do more complex things that I think could have been generalized better.

Don't know.

It's going to It's going to be a question for this community, and Sparrow, who's on another time.

We need to start having meetings in the mornings for the European developers.

So we're going to be puzzling out how to alternate that.

So in any case, if they ask for a customer who wants this, you can say, I want it for PSPP signing.

Right.

Right.

- I have one thumbs up, cool.

- And before we leave the topic, I want to point out that if you go through all the examples of the envelope documentation I've given, where I talk about, well, here's a generic hello world message, and here's how Alice and Bob would sign it, and here's how you have a threshold, you know, a number of signatures to check for that, and how my reference implementation will already check for a certain threshold number of signatures.

You know, I'm trying to lay down kind of use patterns for how you might do such things, because it doesn't have to be hello world, It could be a Bitcoin transaction.

It doesn't have to be Alice and Bob.

It could be anything signing these things using any methodology.

The same basic patterns could apply.

So I'm trying to develop a pattern language for envelopes.

And obviously the community, I would love it for the community to help with that and look at what I've done and say, oh yeah, this is or isn't applicable to these kinds of other things we'd like to do with it.

- So thank you.

And moving forward to our next agenda item.

So this isn't precisely technical, but I wanted to make sure you knew about it.

So Blockchain Commons has been very involved in Wyoming and not just Wyoming, but also in Europe and Argentina and other places around creating a stronger legal basis around safe practices for keys.

And one of our biggest successes is this Wyoming bill that passed and is signed by the governor and starts this June, which basically it does two things.

First off, if you're a Wyoming court, which means it won't work in all the world or United States yet, but at least it's a precedent, a court cannot demand, a judge cannot demand, a pretrial attorney cannot demand in a court proceeding your private keys.

They may be able to ask you for a public key so that your wife can have a fair distribution of assets and things of that nature.

And if you don't give them a public key, there are actions that they can take, but they can't take your private keys because they're just, first off, there's no secure way to do so.

So that's a fundamental problem.

And then at certain point, there are just lots and lots of risks.

We had federal prosecutors testify that federal prosecutors should not have this data because they don't have the capability for it.

We had some judges go, oh my God, I don't wanna have this in my offices type of things.

So that law passed.

And then obviously, there's a lot of things around legal clarity around digital assets and Wyoming has some nice tools from a legislation side.

And even if you're not a Wyoming citizen starting I think December, it might be January, you'll be able to register digital assets under Wyoming law.

Sort of in the same way when you have a contract that says, hey, if there are any disputes in regards to this contract, you know, we will handle those disputes in a particular court.

This is sort of a way of saying, hey, if there's any disputes about this digital asset or this digital identity or whatever, we will use the terms and language and whatever of the Chancery Courts of Wyoming who have special knowledge.

I felt that was an interesting success that you guys might wanna know about.

Any comments from anybody.

OK, so moving on from there, I haven't seen Peter.

Peter wanted to present on this topic.

And I also had a ping on our other update, which was the JavaCard, that he was running late.

So I'm just going to give a quick overview of it, and then we can go on to a general discussion.

So what is Quick Connect.

So Quick Connect is a QR code that allowed for a server, in particular, the little node servers.

But we also use it in the Apple Mac server installer called Gordian Server, where now that I've got this and I've got this up on the net, how do I communicate with it in order for a mobile app or a remote app to be able to do so.

So we created Quick Connect that allowed you to either, you know, get a QR code from a sticker on the bottom of the box, or a little QR code on a display, or on a webpage when you connected to it, that would then allow these remote devices to communicate with that full node over Tor.

I mean, it was largely, they're all, as you can see here, it's largely just an onion address.

So, and it also supports Tor's ability to do some other capabilities and do so securely.

So, there are probably over 30 little projects and or hardware companies that have little Bitcoin full nodes that use this.

And I think a couple of other people do that, but all it does is allow you to communicate with your full node over Tor.

But there's a lot of things emerging here.

So if we're talking about Nost, or now we're wanting to talk to some node that is gonna handle your lightning services, not just your full nodes, your full node transaction confirmation.

So, you know, he wanted to present about this.

He has some proposals.

I'll post these links up in GitHub in our discussion area.

But I think it also raises a larger problem of service discovery.

Like, you know, how does Ken's device offer some special service to some app that's out there that is unique to Ken's device, that's beyond just signing Bitcoin transactions.

Maybe Ken's device can store something securely or it can store a share, a social secret share for somebody.

How do we advertise these services.

And then also how do we advertise them And some of them may be other secure methodologies such as a Tor onion or some kind of Diffie-Hellman secured NFC with a trust on first use, et cetera.

So I thought that was an interesting topic to have for broader discussion.

I'm gonna pick on Ken again.

Do you have any kind of thoughts on this discovery problem And is this something that blockchain commons should begin to tackle.

- So, I mean, when we spoke yesterday, we were talking a little bit about the case where we're gonna start doing encrypted communication between Envoy and Passport.

And so like there's a, for that whole Biffy Hellman key exchange trust on first use type stuff there.

And so I don't know if this is appropriate for that.

Maybe we can talk about that at some point.

But as of right now, we haven't got any plans to sort of advertise any services, sort of the way you mentioned, but not out of the realm of possibility.

- I mean, one of the other services- - Especially on our next device.

- Yeah, one of the other services we do now that I wanted to add to Quick Connect was SpotBit.

So pricing service, like how do you communicate securely to some exchange to go, what is the current US price for Bitcoin and do so from a cafe in Iran or Korea, I don't know.

How do you do so in a secure way.

And that would be another example of a kind of service that a wallet, your little iPhone supplement or a transaction coordinator or other thing might need to know that information.

And right now, it's having to talk securely to say if you've got a traditional wallet, you're gonna basically be talking to their headquarters, wherever it is in France or in Prague.

and basically asking their server to then ask somebody for the current price.

That feels very not decentralized to me.

So it's a larger problem.

I'm hoping we can tackle it this year.

But like everything we do, we really wanna do things when we have at least two parties that are really seriously interested in making it possible.

So we'll keep this on the agenda.

maybe he'll present in a future Gordian meeting.

I don't see-- well, we'll hang around a little bit longer.

The essence here is that all of our code for SSKR is in C.

And he's basically translated it into Java, the very limited version of Java that JavaCard uses.

And ended up coming up with some interesting different approaches to generating all the values.

But he basically can, in a very constrained device with very constrained memory, be able to do all of the SSKR operations.

I think this is significant because this may mean that we can do things like NFC cards and other low-power devices or whatever that can cooperate in various kinds of SSKR-related functions.

And remember with envelope, we have the ability to have SSKR permits for envelopes.

So, you know, you can have a device that, you know, gets the, you know, the data from one device and then uses the SSKR permit from, you know, NFC card and an NFC, you know, a biometric ring from somebody else, and then be able to restore the envelope, you know, decrypt the envelope.

So I think there's some interesting things there.

And I think Ken to your question regarding the trust on pure first use, he also wants to puzzle out, how do we make NFC more secure with some kind of trust and first use.

So he concurs with your thing that we need to come up with some good answers here.

- Okay, well, we'll have an opportunity for a little bit of discussion just in case one of our two presenters can show up.

Our next monthly call will not be at the 4 p.

m.

time.

Instead, we're gonna hold it in conjunction with Silicon Salon 4.

Not all of the events will do this, but we felt like there was some real synergy here In particular, Andrew Polstra is going to be talking about preventing key exfiltration through signature nonce data.

And I feel like this is something at all, any wallet who is doing signing at some level, I mean, if you've got MicroPython code or, you know, Rust code that is, you know, executing on some processor somewhere, you ought to support, you know, this particular approach to prevent a corrupt device from sending through the nonces parts of your private keys.

It's a fairly simple protocol.

It would mean, for instance, when we're kind of deconstructing things like PSBTs that there ought to be an option for, oh, here is the key exfiltration nonce data that you need, some random data that the device signing needs.

And then when the device signing returns, it's not just returning the sign, the signature, it's also returning a little proof that said, yes, I did incorporate your randomness.

And you can prove that this truly is a random number that has been returned.

So I think that's an important-- for anybody who's doing signing.

We have some other discussions around chip stuff.

This is very much what Silicon Salon is all about, is kind of how do we connect the wallet developers and the chip makers and the software and the cryptographers all together.

Luke Layton and David Calderwood is gonna be talking about how we can make that faster through some interesting big integer stuff on the chip.

And then in general, we wanna have an open hardware discussion.

A number of companies are constrained by other companies, trade secrets and NDAs and whatever to make open hardware truly open.

But there are things we can do.

So we're trying to nail down what the, what does that really mean to be truly open and be able to say that your hardware is open, whether or not it's chips or the micro, I forgot what they're called, but where you put multiple chips on a single substrate, those packages, whether or not those packages now are on a board and that board is now integrated into a larger system.

You know, the way we talk about open software today doesn't quite map completely.

There are issues in there.

So how can we do better and what does that mean.

What does open hardware mean.

So those are at least three of the topics.

It's another full month away.

we may have a couple of other presentations.

And if any of you are experts on kind of this question or have some opinions about open hardware, we'd love to have you come to the meeting and maybe even present some of your ideas.

I mean, the salons aren't just about these presentations, they're also about really good questions.

So I hope that you can make it next month.

And then the first Wednesday in June will continue the conversation on Gordian developer call.

And then we always, part of the thing we did, we used to have these meetings bi-weekly and that was a little bit too much, but we will have occasions where three, four, five people just want to get together to talk about a specific problem.

We had an example of that with the signing call.

So if there's a particular topic you'd really like to, you know, to cover before our next regular meeting, you know, we can basically announce, oh, we're doing a special call on this topic, you know, at this time that makes sense for, you know, the core parties of that group and let everybody know and pull that together.

And we will do the transcripts and YouTube videos and all that kind of stuff for people who can't attend.

So let's just, you know, oh, I should say, as always, we hope that you will financially support us on GitHub.

You know, all of this work is sponsored by the community and we greatly appreciate everybody's help.

A number of you here today are, you know, ongoing sustaining sponsors for Blockchain Commons.

So thank you very much.

We'll close this, say close this, Bob Sharer, there it is.

Okay, so we don't have to go to the full 530 call.

We have a few people that haven't, been at previous meetings.

Javier, Irfan, Jim, do you have anything you want to share or any topics that you'd like to see us.

- You have a question over chat, Chris.

- Oh, sorry.

Will there be a QR demo of legacy Bitcoin signing with Envelope.

Yes.

So that is something we definitely want to support.

we did a YouTube video of our special signing meeting.

And that was definitely something that came up.

But I think we also wanna do some, I think we need to be able to handle some of these legacy problems, but also potentially be able to do it in a better way.

So there's a lot of times where a party wants to know, do you have control over this particular address.

Or is this wallet the wallet I think it is.

And can it prove that it has the key material that I thought it had.

So there are a variety of different kinds of interesting authentication, authorization, and what is it authenticating and whatever.

We'd like to do that a little bit better.

And I think we can learn from that while still offering some support for things like a legacy Bitcoin address, legacy Bitcoin signing from Bitcoin 5 or 4 or whatever it was that was the first one to do that.

Yeah, he's getting a thumbs up.

- Cool, okay.

Jim, any, I think for whatever day, for whatever reason today was a slow day, but any particular things you would like to see Blockchain Commons doing or any questions about what we're doing.

- Well, I mean, you and I had a conversation DM over Twitter.

I wouldn't presume to know enough about what Blockchain Commons goals and prior work has been to really comment on that.

I will say for those who are interested maybe in preparing themselves for Andrew's talk about anti-exfiltration measures, there is actual code available.

It is part of the implementation of Blockstream's Jade hardware wallet.

So it's already integrated into that code base.

And the Blockstream Jade is, I won't say unique, but remarkable in that all of the firmware is, you know, as well as the driving software is all open source.

The primary interface to using the Blockstream hardware wallet, rather than have a separate piece of driver code, like Ledger Live or the Trezor suite or anything like that, you use a Blockstream desktop code as the default interface to talk to and control your wallet.

So you can find the anti-exfiltration code somewhere in there.

Don't have to have it handy, so I can't just like point to it in the chat.

But if you dig around a little bit, there was certainly a blog entry on the topic on Blockstream's site.

Andrew, of course, works for Blockstream.

He's the lead of their research team.

So that's one thing.

One thing I'm working on that's trivial in terms of coding, although with any kind of crypto, even trivial is still fraught with lots and lots of foot gun traps is the, again, this refers to a feature of Blockstream Jade, relatively new feature they added, which allows you to create a subkey conforming to the BIP 85 standard or specification.

So what this allows you to do is derive a key from the same seed or a new seed from the seed that your hardware wallet is protecting.

And then you can use this, which is presented to you as a mnemonic, 12 or 24 word mnemonic, which you can then turn around and use to, for instance, initialize a software wallet.

One example is I used one of my Jade devices to derive the seed that I'm using on the test flight version of the mobile green app so that I don't have to maintain yet another seed recovery mnemonic.

I can just go ahead and re-derive it if I should ever need to.

- Right.

Part of the thing that, you know, this is an example of why we wanna try to, you know, puzzle out in abstract things like, you know, what is a C-board description of a path is that, you know, there's a lot of weird stuff that happens in BIP-85 because there is not, you know, you know, it's a weird triviality, but you know, there is, you cannot take a Bitcoin master extended key and make BIP32 words out of it.

It's a one-way transition from the, you know, the seed randomness to the master Bitcoin keys.

So that was, you know, a weird thing that, that happened early on in Bitcoin.

And as a consequence, turning any of the other extended keys back into the seeds, there are some games that have to be played and that's what ends up defining it in BIP 85.

(indistinct) BIP 85, but I think also we wanna basically puzzle out the pattern and the problem and go, oh, there are other uses for that other than just the specific thing that BIP 85 does.

- Actually, if I could, first of all, XPUBs and the various forms, ZPUB, YPUB, et cetera, the primary complication there isn't so much the derivation of the public half of those keys, but rather with more complex setups, you have descriptors and you have a lot more use of multi-sig.

Well, there is no such thing as a single XPUB for a multi-sig wallet, for example.

So, but that's entirely different in my view than what BIP 85 is talking about.

So in addition to the ability to control multiple sub wallets such as your mobile and desktop wallets from your hardware device, What I'm interested in much more specifically and what we discussed is derivation of other types of usually 256 bit seeds, such as the Nostr public private key pairs, your wire guard keys, the ability to initialize a pair or multiple instances of a YubiKey such that they are effectively clones of one another in much the same way as hardware wallets are clones of one another.

There are use cases where being able to take this sub key that you have derived and that you can rederive from your one, if you will, your hard point in terms of secure keys, being able to rederive the various other things, for instance, on a per device basis.

So I'll have one of these that I derived for a new laptop And then because it's exposed to the laptop, all of the different private keys that I generate for the various different applications on that, that use keys, I don't have to worry about them being involved in my backup and thus having to secure them in my backups.

In fact, I want to exclude them from my backups because I can always re-derive them.

So the results in a much more secure, you know, much better OPSEC all the way around.

- Yeah, so like I said- - And that's exactly what- Code for this is fairly trivial.

For instance, for Noster, you use the pip install of BIP 39, right.

And that can then derive, you know, decode the mnemonic into its core.

And also it can do the derivation to add in additional phrases.

So for instance, for Noster, I might have one BIP 85 key and I generate multiple separate Noster key pairs from it to have segregation between, for instance, my private chat and activity versus my more professional things.

So anyway, that's what I'm interested in.

I don't expect it to be technically all that sophisticated in terms of code, but rather thinking through.

And I am by the way, an Ops guy, operation.

So thinking through the implications of how to use these things once you have them is much more what I'm interested in.

- You should definitely take a look at the collaborative seed recoveries, stuff that we've been working on and we hope to have some good multiple wallet demos this summer.

So, I mean, first off, there is the ability to do some fairly sophisticated things because of the envelope package.

So one of the things the envelope package means is that, you know, we can give you, we can have the key, the extended information, which is not precisely a key, but it's something else.

We can have the various path and policy information, descriptors, et cetera, all in an object that can be backed up in a very reliable way, even if you don't necessarily know what all those different pieces are.

For instance, you know, a lot of wallets these days store the date the key was created so that it doesn't have to go all the way back to the beginning of history to do things, to get the data, but not all wallets want that or need that.

So there's a lot of optional data there.

And then you have the ability with this package encryption capability.

So obviously you can encrypt it with a symmetric secret, but you can also encrypt it with a public key such that maybe only one of your other public keys can recover it.

But more importantly, you have the ability to actually divide that into shares.

So you could have those shares be on, you know, a variety of different places that are secure for you.

And you, even that data, well, not just the keys, but the data will not be lost if you get adequate shares for that.

And because envelopes have this ability to do elision, you don't necessarily have to put all the information in all those shares.

So for instance, the information that is necessary for your heirs to be able to recover their inheritance in Bitcoin doesn't necessarily have to include the data that is about how do I connect to signal and how do you get my signal history and all that kind of stuff.

Those can actually be intertwined so that you can recover, you can divide up your shares in a fashion that is appropriate for their potential future use.

And then I'll say there are also a lot of weird problems because Signal for instance, doesn't use SecP, and there are very specific problems with 25519, which it does use.

So they cannot do HD keys in a safe fashion like Bitcoin do is they can do some derivations.

They can do any hardened derivation, but you can't do any of the unhardened derivation safely.

And there are problems with other systems, SSH in this fashion, et cetera.

So, in all of our designs, I'm trying to think, okay, so how do we do this in a fashion so it'll work for Bitcoin, which I think has a better security properties in Sec P, but still be able to allow us to secure things like Tor, Signal, et cetera.

I mean, Tor is yet another one.

It's like they have this one way transform that happens in there.

So we had to go through a bunch of testing different apps and whatever to discover, oh, there is a universal donor seed that is possible to create a public and private key for that can then be made children of on both the public side and on the private key side that will work with Tor because if you just back up the Tor keys, you know, there is not an equivalent of BIP 85 that allows you to reverse that.

Well, I think somebody listening to what you're saying might be confused because you talk about backing a mnemonic out of a seed and that's not at all what BIP 85 is about.

>> I know that.

I know what that is.

I mean, it's creating a whole new seed based on a derivation of the original seed.

>> Exactly.

>> And it does two SHA-256s and all that kind of stuff and whatever.

So I understand that, but you can't prove.

.

.

- Into the weeds, my point was, I'm looking to simplify the lives of mere mortal ops guys so that they can have one hard point and a document that does not have to be maintained secret.

One secret plus something that they perhaps encrypt using that secret, but then almost every other application, as many as possible can then be extracted from that seed into the full forest of the things that they need to support.

So for instance, I don't care if I can derive anything hierarchically deterministic out of my signal key.

What I want is the ability to tell signal, use this as the basis for your key.

And if I can do that, then all the other use cases I can work through in an administrative fashion from those two constituent pieces.

- Well, I do really want to, I mean, A, I want to serve regular users.

So, you know, we've done, we've had SSKR out for a while, but you know, one of the things that was missing was you couldn't put in the policy and the descriptors and all this other data.

So we've solved that.

That'll be coming out this summer with Gordian Companion that at least three or four wallets will be supporting.

But there are other interesting problems.

So for instance, you may, especially like with Noster, you may at some point want to be able to prove that your new Noster key is related to your old Noster key after the fact.

Okay, so it's like I'm using a Noster key at some point, maybe prudently, I'm rotating it after a year or whatever, and I've now got a new one.

And you may need to prove to a third party in a safe way that, oh, this new one actually is associated.

And so there's some interesting ZK proof alternatives.

There's also other ways of doing derivations or whatever.

We don't need to go into that, but we know how to do some of these things cryptographically but we haven't made it easy for people at your level, at the ops level, much less regular users.

And I think things like the crypto request stuff will help the developers create better tools to be able to go, "Oh, I need this type of thing from you.

Please generate this proof or generate this sub key or whatever.

" So there's that kind of developer level.

I think there's this ops level where we have, you know, things like the command line utilities, et cetera, that will be able to do all of these different kinds of things for you, you know, at an ops level.

And then of course, user level, where we really wanna make this as easy and as painless as possible, and yet still help people avoid foot guns like single points of failure and single points of compromise.

I hope you've seen our multi-sig scenario.

That was what we did with Sparrow and foundation devices and seed tool for a multi-sig with no single points of failure.

the Sparrow can fail, the foundation devices can fail, the off-site can fail and the seed tool can fail.

So, and all of those, if any single one of those is compromised, you still don't lose things.

And there's a subtle distinction between compromise and failure.

So we did a really good job on that and we wrote that all up, but it turns out nobody wants to do it 'cause it's still too hard.

I mean, yeah, it's 20 minutes rather than, you know, the day long thing that, you know, Glacier and some of the other multi-sig things that are out there do.

But with Gordian Envelope and QRs and URs and some of these other different types of things, it should be, you know, utterly easy for a user and it'll be very difficult for them to foot gun themselves.

So Ken is involved in that.

I know Simon, who I don't think has arrived late.

I was hoping he was going to show up.

He said he had a last minute thing come up.

He's doing SSKR for the biometric ring.

So he very much cares about this capability as well.

So we're definitely working on it.

We will probably support BIP 85 directly, but we actually think we can do a little better and offer it.

And I think that's kind of the same thing we've got like with PSBTs.

and legacy Bitcoin.

We wanna support those.

If you need a legacy Bitcoin signed object for some tool, we'll be able to provide that.

But then we also wanted to do it right where we have some of these other future capabilities that will really make lives easier for not just developers and ops people like you, but also users.

So that's our goal.

And I feel like we've got some good architectures for this.

Ken, any thoughts on this one.

I mean, have you looked at this key derivation to back to-- We actually have BIF-85 support coming out in the next update.

So that's coming.

And we also just have a PR out.

I put a comment in the chat there.

We have a PR out about multiple derivation paths for Nostra keys that we're also supporting with the wallet and with Passport right now.

- Cool.

So that's definitely stuff we wanna support.

Again, there are pros and cons.

Each of these additional Nostra keys, you can't really prove were associated with the original Nostra key, and that can be an advantage in some scenarios.

But there are also other kinds of ways we can offer cryptographic proofs to demonstrate this.

- I feel like Nostra's an area though where it's like just evolving so quickly.

Like now is a great time to get in if you have value to add there because they're moving quickly and breaking things.

You know, like the very first version of this, there was only like one fixed derivation path for a Nostra key.

It's like, okay, well, that doesn't seem good.

I guess it is your key is compromised, you're kind of toast.

And that's already happened to somebody on our team.

So this is kind of what the source of this PR was, was being frustrated with that.

- Yeah.

So that's exactly those things.

I mean, and this is very related to my problem with, for instance, the lesson that we're learning from Ethereum, which they only do one key derivation for your account key in Ethereum.

So that means you're using the same account key for authenticating your website as you are for signing your transaction.

And, you know, we're kind of repeating that And also, your ChristopherA.

eth ENS name uses that same key.

We're trying to eliminate that problem by having multiple keys and doing it right and having proofs between those things that are necessary so we can do key rotation.

And we've been saying for five years that we need to do this.

We need to allow people to rotate keys.

I mean, even ITF has been saying, keys should not be long-term.

They need to be rotated on a regular basis as a general practice.

I mean, NISQ says this, but then we keep on writing protocols that rely on a persistent public key that can't be rotated.

So somehow we've got to make this easier for everybody.

And that's kind of what the mission of Blockchain Commons is and why we want to get more people contributing not only as to our code bases and using our tools, etc.

, but also financially.

I mean, we need organizations to back us thinking about kind of these bigger problems and doing it right, solving these larger problems.

And key rotation is one of the biggest, especially when it's not strictly just a Bitcoin transaction.

Same thing I think is going to happen with lightning node identifiers and things of that nature.

Blockstream has been using the same lightning node identifier for what, three years, four years now.

And they're saying, "Oh no, lightning isn't an identity.

" Well, sorry, it's an identity.

You've firmly established that it's run by blockchain commons.

Well, if something goes wrong, how does block, not blockchain, you know, Blockstream, how does Blockstream let people know, oh, you know, this new site isn't, you know, I could see somebody coming along and saying, oh, you know, blocks, you know, Blockstream is rotating their key, use our site instead.

And, and then you go, well, wait a second, no, that's, that's a fake site.

How do you prove that.

Well, we want solutions where you can prove that.

And they're available.

It's technically possible.

We just haven't figured out how to to make it easy for ops and for users.

And we're going to solve that problem.

Ian, Irfan, Xavier, any other comments or questions before we close for the day.

- No, no, thank you.

I was just willing to join, to observe as we have implemented the UR ourselves.

So yeah.

- Which wallet is yours again.

- Engrave.

- Oh, that's right, right.

So yeah, please, you know, we don't have your details and in those links.

- Yeah, I made the notes.

- And then of course, we would love to have, you know, a demo unit for each of us so that we can, you know, continue to test things, et cetera.

We just got the latest version of Ken's wallet and some other wallets so that we can do testing and try-- - To be clear, we don't support PSVTs yet.

So the testing is limited.

We support the UR formats for QR codes between our mobile app and our wallets.

And we are going to support PSVTs.

And at that point, we might send you one, might be more useful then.

- Cool.

I look forward to seeing more with that.

And I appreciate you coming in and joining in this call.

And hopefully we'll see you in upcoming meetings and in the Signal Chat and GitHub channel.

>> Thank you for all your work.

>> Thank you.

Okay, ciao and have an excellent week.

>> All right, thanks everyone.

>> Thank you everybody.

See you soon.

Bye.

Thank you.
