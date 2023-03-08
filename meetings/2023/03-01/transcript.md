# Gordian Developer Community - Meeting 2023-03-01

> TRANSCRIPT: _This is a transcript of the meeting of the Gordian Development Community held on March 1, 2023. The archive of the overall presentation is available as a [YouTube Video](https://www.youtube.com/watch?v=WekNVLdvNvM), an [MP3 Audio](audio.mp3) and the [Slides PDF](presentation.pdf) are available on GitHub. See our [meetings directory](../../meetings) for a complete list of meetings.)_

> ABSTRACT: _At the first new monthly Developer meeting (to be held the first Wednesday of every month), Blockchain Commons noted its new community channels and the increasing success of the UR specification. It also discussed its new work on dCBOR and signing with Bitcoin keys._
> 
> SUMMARY: See https://github.com/BlockchainCommons/Gordian-Developer-Community/discussions/105 for a complete summary. What follows is a rough (computer-generated with some edits) transcript.

## Introduction

Great. So thank you everybody for joining us today.

To recap for a couple of people, what is Blockchain Commons? Well, we're a community interested in self-sovereign control of digital assets. And our goal is to bring together stakeholders to collaboratively develop interoperable infrastructure. And we design decentralized solutions where everybody wins. As such, we're a neutral not-for-profit that enables people to control their digital destiny. I'm Christopher Allen. I'm the principal architect and executive director. 

So what are these meetings? 

There are a lot of developers who are members of the community that desire to use specifically the Gordian specs, which allow for a lot of open, interoperable, and compassionate infrastructure.

The goal of Gordian for this year, again, pending feedback from the community, is initially the dCBOR libraries, which is an underpinning for Gordian Envelope, Swift and Rust libraries, trying to drive this through standards process, and in particular in allowing for some crypto-request type of work that is in demand that supports Collaborative Seed Recovery. And ultimately, we'd like to move toward more advanced things like Collaborative Key Management with Frost and Multi-SIG and other kinds of operations. So it's It's kind of our big scale for the year.

Our last regular meeting was in December, just kind of figuring out a schedule that will work for everybody. So we've decided we're going to do monthly first Wednesdays that will be consistent. We'll probably be meeting more often that with special topic calls for individual topics, like we had one last Friday on envelope signing and bringing sign in with Bitcoin-ish type features. So that transcript is now available and the YouTube channel also has it.

Today, this is after discussion with a couple of different people on the agenda. I wanted to talk about our community channels briefly, make sure everybody was aware of them. We've had some success with UR interoperability. I wanted to talk briefly on that and what our next steps there. There's the community review of dCBOR. I hope people have had a chance to take a look at it. It was on Friday, we discussed requirements for crypto request for signing and Wolf has a prototype for that to demonstrate how that works. But we really do wanna prioritize some future proofing. So we need to talk about that and we can't do it all. What are we going to do 1st? And then what are the priorities of the community for the rest of March?

## Community Channels

So, community channels is the first topic. Obviously, we've decided to do this regularly. First Wednesday versus the old approach of doing it every other week. And then sometimes we canceled and sometimes we pushed and whatever just, I think, confused everybody. So we're always going to do a first Wednesday one and hopefully some more. There is the question of how do we handle EU versus Asia? For instance, I think we may only have one person. Who here is in an Asia time zone?

Well, our team is in Asia. We are actually in China.

Right. 

So it is 8 a.m. in our time zone.

Okay, so we've had similar problems on the other end of things. It's midnight right now in Europe and I know Craig couldn't do, can't do late hours. You guys can't, any earlier than this is probably hard. And then it gets worse in like three weeks with changes in summertime and all that. So we may have to oscillate some times, maybe take turns based on what the topic is and whatever, but it'll always be the first Wednesdays.

Signal is around, is available around the clock, 24 hours, but it really should be considered ephemeral in the sense that don't trust that conversations on there will remain. We haven't turned it on, but there is a feature signal to turn off, like to erase everything after one month.

The more persistent solution is to use the Gordian developer community GitHub, because we're all using GitHub anyhow. It's really easy to go there, say watch, watch only messages, watch only whatever different things in the Gordian developer community repo, because we're not really using it for PRs and issues and things of that nature. So it should be relatively low noise for you to do it. And it's persistent, it's searchable. So far, the community has been doing most of its discussions in Signal, but we need to move more of it to GitHub so that people can discover us and figure out how all this stuff works.

We do have some announcement lists. I should probably share what all of this is in

-- oh, yeah, I see. Thank you, Shannon. Shannon's sharing some of the links.

https://www.blockchaincommons.com/subscribe.html

So the goal of the announcements list is it's using SendinBlue because we've had problems with some people saying that, you know, mails from anything that isn't one of the giant domains gets caught in spam filters and things of that nature. We hate it. You know, SMTP used to be one of the most decentralized standards, and now it's become one of the least. So anyhow, do sign up, we won't spam you. It'll just have announcements of, hey, this is coming up, or this file you may wanna pay attention to, but it's not a conversation medium. We also have a Silicon Salon mailing list if you're interested in kind of the lower level type of conversations that we're also having in Blockchain Commons.

## UR Interoperability

So interoperability success. I polled around and got some responses. Some are not in here yet. 

Sparrow has done a great job, that's Craig Raw, in supporting a variety of things. And has also, I believe, he submitted a crypto account to solve a particular problem where he wanted to be able to have a bunch of accounts be all signed up all sent at the same time. So we created a crypto tag for him. I think that's just a good example. If there's this particular thing you need, let's do it. 

Passport also a major supporter and they also created one of the libraries. In addition to the crypto account and PSBTs, They also are doing this interesting health check, which I think is a potential pattern. Do we wanna create a standard for health check that isn't just specific between Passport and CASA? 

CASA I think is kind of interesting 'cause they don't have a wallet. It's a multi-sig coordinator, which I think is a really great demonstration of these standards beyond just straight up wallets. Obviously our seed tool reference wallets handles a bunch of different choices. 

Keeper, fully noted, and support all of the PSBT work. Not clear yet on their other work. 

Do-it-yourself, Bitcoin, Jade Wallet, Keystone, and Seed Signer have all responded that they are using PSBT. I just don't know whether or not they're doing it as UR Bytes, which is not recommended, or with crypto-psbt. And I've heard that there is a Ledger implementation not available yet. I've heard lots of rumors about other things. So there are people that are not on this list.

Shannon, could you share the URL? 

So we've added this to the Gordian repository. If you have other things you would like to do, we probably should create another one for libraries that support all these and list them in libraries, let us know.

And there is a link in chat now.

https://github.com/BlockchainCommons/Gordian-Developer-Community#urs

Thanks!

Is there a specific reason why Sparrow doesn't support SSKR?

It is -- we've talked with him a couple of times. I think it's just there hasn't been critical mass. I think he's been interested. But, you know, he's doing lots and lots and lots of different things right now. We'll see how that shakes out. I mean, one of the questions is also using SSKR and/or crypto envelope for things like backups onto SD cards or through NFC. And I think we have some unique advantages for that over some of the other approaches to doing Shamir. So we'll see. We will have more discussions about that, actually, next month.

Before I continue, does anybody have any comments or thoughts about the success or what I'm missing from this list? 

I think for this one, we are heavily using the URs. So we have fully adopted the Crypto PSPTs and HD keys and a lot of other UR types. So I just send some message in the channel. So if you need more details about the status, we are, how we are using the URs, I can give you our full summary after the meeting. 

Great. So yeah, and we'd love to get you involved in some of these things that are emerging. Some of the stuff, for instance, Friday, we may not have gotten to in time I think it would have been your Saturday. 

## dCBOR

The, so next agenda item is dCBOR. So, you know, we've really decided in a lot of these different types of things that CBOR has a lot of advantages. If you haven't seen them yet, we have a good video on why we chose CBOR over ProtoBufs and, you know, a lot of other different things. We just think there's a lot of options there. It's the right architecture or it's the right solution. And we're even seeing stuff where a variety of problems continue to be happening in standards communities like W3C because of JSON and trying to mash in these things into JSON that is just very natural with CBOR. So we have two libraries released now for Rust and Swift that should cover Android with a little bit of work. and obviously very easy on Apple. So the mobile ecosystems, we wanna talk in this call about other options in the future. There is a kind of a utility, it's not intended to be a full, do everything create CBOR, It's more of a verifier for CBOR on the command line, which makes it really easy for you to read in some CBOR and see what in heck is going on and is it deterministic. And that sort of comes to our next step, which is why did we have to build this dCBOR library? So I'll pass it on to Wolf to take over for that.

See https://github.com/BlockchainCommons/Gordian-Developer-Community/blob/master/meetings/2023/03-01/transcript-dcbor.md for the dCBOR Presentation transcript.

Thank you. 

So, you can see we've done a lot of work to create something that will make your lives easier at the bottom. Because you're going to probably find that there are certain types of things where you want to specifically have create your own tags, create your own little structures, and then be able to have them be legitimately deterministic CBOR that you put on an SD card or you're converting into a UR for a QR or whatever. And this will make sure that you can't make any accidental mistakes with it. And then, of course, our other libraries are already being modified to support this library underneath it so that this will be a basis for Envelope. And if you're using some of our other UR libraries over time, we will be linking this as a dependency for it. 

Any questions? 

You mentioned, Wolf, that when you're doing these validations, you're doing things like making sure that map keys are in sort of in lexicographic order, like it sounds like without a bit of overhead. Is there any way to disable those if it became a problem? 

You know, I feel like I'd rather be correct first and then worry about potential processing bottlenecks if it turns out that's an issue. Again, there's plenty of generic CBOR libraries out there that won't throw errors about that. That wasn't our goal here. Our goal was to do something that was basically, as I said, was strict about what it writes and reads. And yeah, it does take a little bit of time to do that. But I've tried to isolate that to the actual deserialization phase. These maps, I can say, as you insert things into it, it encodes the key as dCBOR, uses that as the key, but it actually keeps both the unencoded form that you can still parse and the encoded form in the map, but it uses, you know, like internally uses a second map that uses that encoded form as the key. but presents you with the actual key that you gave it in CBOR, in the symbolic CBOR format. And so, you know, it does a minimal amount of re-encoding as it does that. And of course, when you're reading it in, it has to read the binary, which becomes the key, and then it deserializes that, which is what something was going to do anyway. 

So my expectation is this isn't going to be a huge bottleneck for processing. But if it turns out to be, then I'd love to hear more about that. I think I'd like to experience that in the field rather than try to add switches right now to see that, you know, I just want to avoid premature optimization there. 

Yeah. Another quick question. When you mentioned serializing floats with no fractional part as integers when possible, what exactly does when possible mean? 

Since there's no sort of, there's integers that can be represented as floats and vice vice versa, even without fractions? Right, so that's a good question. So for example, if you have the floating point value of 1.5, it doesn't matter whether you give it to it in what floating point value, what floating point precision you give it to it in. It tries to convert it down to lower precision floating point and-- well, first of all, actually tries to convert it to an integer. And it compares these things. It actually uses the processors and own encodings. It does a test conversion to a large, like a uint64 of it. successfully converts with no loss of precision, then it tries to convert it down to smaller integers until it reaches the smallest possible. So you'll see in the code itself, there's a cascade of calls where if you say, "Encode this uint32," it will basically attempt to encode it as a uint16 or uint8 before that, before it actually accepts it as uint32. And I think I've cleared it. 

Sorry, to convert the integer, does it truncate? To attempt to convert the integer? 

No. 

Truncate to attempt to convert the integer?

No, you never lose precision. So for example, if you give it a 64-bit floating point integer or a floating point number that cannot be represented as an integer that's, say, for the exponents too large, and it can't even be represented as a uint64 or an int64 as a negative, right? So it's outside the range because it has an exponent that doesn't allow that. Then it accepts that and encodes it as a 64-bit floating point number. 

But if it discovers that it can, without loss of precision, encode it in a shorter format, it will. And so, for example, if that floating point number ends in dot zero, and there's no fractional part, then it may choose an integer value, but only if it's within the range of up to a uint64 or an int64 for negative values. So, yeah, so you will never lose precision under any conditions, and I try to fairly stringently test this in my unit tests.

Right, so it will encode up to like, whatever, 54-bit integers basically, or whatever.

Yeah, well, if you have a number that can be encoded as a 64-bit integer, it will, without loss of precision. But if it can't, either because it has a fractional part that's non-zero, or because it has, say, a large exponent on it, it will default to floating point. But it will also try to reduce, say, 64-bit floating point number to a 32-bit floating point number. And if that number, when converted down to 32-bit, is identical to the number when converted back up to 64-bit, it accepts it. It says, OK, then this can be a 32-bit without loss of precision. Again, it does that also for 16-bit. So for example, again, if you give it the number 1.5, which can be encoded as a 16-bit half precision float, but you give it to it as a double precision float, it will do test conversions and discover that it can be encoded as a half precision float, and then it will proceed to do that. That only happens at serialization time. It does not happen when you just say, this is a CBOR floating point number. That only happens when you serialize, and it only tests these things when it deserializes. It does not happen once you have the successfully serialized CBOR structure in memory.

Thanks. Okay, so you feed, could you feed the, what has been decoded to the encoder and then get the same results if you do that a few times round robin? 

Yes absolutely. In fact, you'll see that my tests do that. They take a value that is identical and they also do a number of testing of casting. You know, can you take a floating point value and encode it, decode it, and then extract it as a different precision of floating point? And can you properly get an error, say if you encode the number 1.5, and then try to extract that as an integer to properly throw an error? Because obviously I don't want you to lose precision. I want you to maintain full precision while also maintaining parsimony of serialization. 

Sorry, it was more a general question, not not only about floating points but the whole, whole structure, I think it could be interesting to know whether you've seen a certain data set earlier. only be done when it's when it's round robin always know what's coming out CBOR and you feed it again to the encoder yeah doesn't produce the same result over and over again so it does so let's um yeah it should be fully round trip rain rain codable nets again And the whole point of being deterministic. So, um, all right. Okay, that's that's a language thing. I'm sorry to bother you with that. 

Sure. So not a problem. And if you discover any cases where it doesn't work as we're advertising it, it's a bug. So we'll fix it. 

So on the community review that we consider this a phase before calling something. This a phase before we go for security reviews. So one of the things external, excuse me, so one of the things that we're asking is, can you help us test this, you know, sort of internal security reviews or any particular things that you care about, you know, if you want to have help us with some buzzing tests and other different types of things in our process. We'd love to have that. Are these APIs expressive enough for your ease of use and for your needs? Wolf has added a number of special functions to make it easier for some of your common use cases. And then, of course, we're doing this in multiple languages. Are the APIs sufficiently idiomatic and yet consistent across two language platforms. 

Sort of related, we have people that are looking at converting these. We have a junior engineer that is start who is familiar with Kotlin and Swift and Kotlin have some relationships and we're going to also try to port it to Kotlin and work on that. Similarly, Python, which is going to be a lot harder, is under investigation. 

Ryan, go ahead. 

Sure, so I sat down with a Rust expert and did some review of the API level. We didn't get into security aspects, but we tried to look at what about the Rust CBOR interface really worked well. And I can talk about that for like maybe a minute or two, or I could just submit that via email or something. Any preferences here on that? 

I would say, personally, I would say if you have specific recommendations or specific areas where you feel we're falling short, I mean, if you want to summarize them quickly. But these are things that we would consider necessary to fix. 

I'm not-- I've started using Rust a couple of years ago, and I wouldn't say I'm a Rust expert. But I do think I have somewhat of a grasp on the items what's expected, but I'm sure it can be improved. In fact, in the past few days, I actually added a number of to and from protocol or trait conformances to this. So if you haven't checked out the most recent version of the code, you might find certain things lacking that are in the most recent version of the code. But yeah, if you want to, I would say specific recommendations or places where you feel like we're falling short, probably writing that down and getting it to us somehow, either an email or as an issue on the GitHub repository would be best. 

Cool. So, this review is current as of the 22nd, and I guess in 30 seconds I would say, you know, we looked at about 5 to 10% of the total coverage, but we skipped things like Map Editor and Simple, and we reviewed the code in cbor.rs, and basically the commentary was, you know, looks solid. It's got good modularization, minimal dependencies. And there's some conversions that we noticed. Like from data could be from the from trait allowing a try into. And one of the other things was it seemed to-- if you had a hash map, a VectiQ, or a hash set, it was hard, it wasn't a like one function import, like an into function, instead you had to basically loop through your existing data structure and create the new one. And so that was, those kind of like helper functions and converting between other things in the standard library were the main gist of comments.

Great, yeah, I think that's great. And, you know, like I said, I think in the past few days, I did add some from-to conformances, but maybe not in the areas where you are -- where you were seeing them. And so if you could, you know, write those down, maybe even say, "You should be able to do this kind of thing," I will figure out what I need to do to make that possible and implement it. But, yeah, I really appreciate that feedback, Ryan. 

Another

Yeah, that's awesome. Exactly what we're looking for in community review if other people are willing to do that, too. 

Thank you, Ryan.

Yes, thank you.

Some other areas that we know we're gonna need to find some more review on to get to the, to finish the community review is to examine things like, do we need to support more constrained sets of Rust, for instance, for constrained devices? There are a variety of other types of subsets of either SWIFT or of Rust that we need to be sure that it's ready for. 

But our goal is after the community review is that we're gonna be passing the hat and to try to get this, have a formal security review where they will be doing everything like they did with the SSKR to the what, 1200 some odd lines of the Rust code initially. and so that we really can have confidence in a firm foundation for dCBOR. Obviously there's not any cryptography in dCBOR itself, but this type, this area is an area that historically, has been a risk surface to cryptographic attacks. So we wanna make sure there's nothing that can be done there. But my hope is that a security review will not be expensive. 

And then obviously we're submitting this to various CBOR standards groups that are using CBOR, but not necessarily, you know, I mean, I'm fairly certain that COSE is doing deterministic CBOR, but it may be by accident. And it could be there's a whole bunch of engineers out there going, God, I wish I had a dCBOR tool to use because it would have solved a lot of problems. I don't know. So we'll learn more about that. 

And then obviously helper functions, as Ryan pointed out, what others are useful there. We do have this dCBOR CLI tool as well. Part of it's just priorities. like I want to be able to add a bunch of additional tags, and just sort of say in the command line, here's this list of tags that are non-standard, our own or whatever, and it would just basically grab them and do all the right thing. The APIs support that, but the CLI app doesn't. And this might be a good project if you guys, if any of you are really wanting to tackle learning about CBOR and whatever is, help us add to the CLI tool.

Yeah.

Ryan, I don't know if your Rust expert is available or if you know other Rust people. But if you know Rust people, obviously one great way to improve libraries is just submit a PR as well. Just even if it's at a small level compatibility or functionality related to the standard libraries or whatever, that would be awesome.

I mean, does anybody have like a PowerPC anymore? I mean, also testing it on more in challenging compilers and things of that nature would be great. 

Another thing about the Rust library is, you know, I think it has two dependencies currently. It has a couple of development dependencies, too, but those aren't really important. But it has a couple of dependencies for like the half library for 16-bit floating point. And 16-bit is kind of necessary, actually, I guess, for because, you know, CBOR itself says you have to use minimal encoding, whereas Rust doesn't have a native float 16 or F16 type. That might be necessary, but for example, a no standard version of the Rust library that has compile flags or whatever in there to remove dependencies or to create subsets of this as possible might be a great add-on and would be something that other Rust coders would probably could do in their sleep. 

Okay, well, thank you, everybody. 

## Signing with Bitcoin Keys Example

Now, a major change of topic. 

So there was some discussion on the Signal Channel over the course of this early winter around various people saying, "Hey, we really need to sign using Bitcoin keys." keys and sort of confusing. Some people say, "Oh, well, we need to do sign in with Bitcoin like you can do a sign in with Ethereum. Oh, no, we need to do legacy messages. Oh, no, there's some new spec that requires a signature, etc." 

So we got together a subgroup on Friday to kind of begin to articulate what is the need. and Wolf said that he would come back with a quick demo of how this might work using Envelope. So why don't you take over, Wolf? 

So I'm Wolf Agnelli, the lead researcher for Blockchain Commons, and I'm going to basically walk you through some example code. This is not deployment-ready code, but this is basically code that is intended to both teach about and show the use of part of our stack. 

We have other videos where I've talked about CBOR and deterministic CBOR, dCBOR. In this presentation I'm going to go into some actual Swift code that uses our stack including our foundation framework. These things have CBOR or dCBOR kind of at their base but they also add other things for things like encryption, for things like key derivation, for HD bit32, HD keys, things like that. 

But we met with some other developers in the community recently, and they're dealing with how to do things like signing with Bitcoin keys or Bitcoin addresses. And so I wanted to whip together something which kind of showed how I would think about approaching that when using Gordian Envelope and the other associated technologies that we've been developing at Blockchain Commons for the community. 

So I'm gonna go through several code file here. You don't have to know Swift to follow along here, but I want to just, and this code is available as a separate repository called Example Signer, and it's available on the Blockchain Commons GitHub repo. It is all very heavily commented and to kind of help walk you through it. 

So the basic scenario here is that one user wants to send a message in to be signed by an offline device. Like in our case, we're talking about using a cold card as an exemplar. They have the cold card as an offline device that stores an HD master key, and then you can send it a string of text that can then be signed, or actually a key can be derived along a path from that, and then the text signed and sent back to you. 

And so I wanted to create a more general kind of signing service that could do that plus other things. So you'll see where I've kind of stubbed out where that would happen. 

So this is the actual test harness. So because we're kind of doing test-driven development here, so this is the XCTestCase, which is a class that gives us the test cases down below here. So this is, like, for example, the first example case. So I'm going to walk through this very, very quickly. 

We have what-- here's a common ID. A common ID is a 32-byte random identifier, similar to a UUID. Generally speaking, our proposals, our proposed standard for sending transaction requests and responses identifies each one with a CID, which basically makes it universally unique. 

We start with a seed, which is this, for example, you can imagine this being the seed or the HD master key that's on the cold card. We're going to tell our example signer what that seed is here, so we actually create an example, an instance of our example signer here. 

And then because we're going to be printing out the envelope notation of envelopes here, so we can see that we're getting back the right things. We want to make sure that we pass a set of known tags. As envelope is built on CBOR, when we encounter CBOR tags, we want our output to show those. This allows you to customize a number of things. 

Our standard for requests and responses also includes two other kinds of CBOR namespaces, function and parameter. You'll see how those factor in later, but we're using strings in this example for the functions parameters, so we don't need to provide human readable names for those, but our tags, we do, so we're doing that here. 

So in our first example, we're going to send a message to the signing service in a cold card compatible way. We're not going to give it a derivation path, so it's just going to sign it using the master key. 

So we have a message, and this is the exact same string that cold card uses in this example, and the URL is somewhere in the code. You'll see it here. So we're going to start by creating So we're going to start by creating the request body, which is a structure. All we're going to give it is the message stream. So now we have our body, and then we package that inside a request. The request includes the transaction ID, which again would normally be random, but because we're in a test harness here, we're making it the same, our body. And the way we set up transaction requests is they can also have a timestamp if you want it and a note that's to be displayed to the user, since we're often sending these things across, since we're often sending these things across using QR codes to AirGap devices, we want the receiver of the-- whatever the service request is to be able to audit it. So we'll show them what's in the transaction request as well as some kind of request. In this case, this is a human-readable message. "Please sign me." 

So once we have that request, which is just in this case a SWIFT structure, we're going to encode that as an envelope. And this basically is not in its final UR form yet. This is the symbolic form of Gordian envelope. which I've talked about in other presentations. I'm not going to go into detail here, but it's basically a nested cryptographically strong structure consisting of a subject and then a series of assertions. The subject here is request. That's a CBOR tag with our CID inside it, which is basically another CBOR tag, and then our 32-byte string, which is abbreviated here to 8 bytes. So that's the subject of the envelope. The actual assertions, there's two of them. There's the body assertion and the node assertion. assertion. The body assertion itself is an envelope. In fact, that's one of the nice things about envelopes is it's nested envelopes. So in this case, the body is an envelope where the subject is the function name, cold card sign. And it has one assertion. It's a parameter, message, and then the actual message to be signed. So you can see how we're using the power of nested envelopes here to form this request. So we have an identifier for the the whole request, we have metadata like this note, we have the body of the request, which itself is an envelope, which is the function to be performed, and then its parameters, one of which is optional. We're not using it here, which is the derivation path. 

At each point here, we're making sure we're getting back from the test harness what we expect. So in this case, we're using the envelopes format, which outputs the envelope in what's called envelope notation. And I talk about that again in videos I've done and in our documentation. It knows we're passing the format context. So it knows how to label these things as that are known for example, particularly body and note. It knows that those are CBOR tags and it knows to give us the human readable forms of those. 

So now we encode the envelope as a UR and that's just asking for a UR string. This is the actual data that you would place into a possibly animated QR code using our UR kit. As you can see, it's basically a URI, begins with the scheme UR, then it has a type identifier, which takes the place of the tag, and then a byte words string here. And of course, this can be as large as you want and still be encoded as a QR code because URKit uses rateless fountain codes as a way of creating a continuous stream of never repeating QR codes that nonetheless coalesce into the final image much faster than just displaying, segmenting, and just displaying the same sequence of QR codes over and over again. 

So now that we have this, And basically, also, it's very efficient to encode URs and QR codes, but you always have to transform them to uppercase before you do that, because QR codes have a very efficient way of encoding a very restricted subset of characters. So this is the canonical way to just manipulate and show them, but before you put them in your QR code, you uppercase them. 

All right. 

So now we're going to simulate sending that to our signing service. So we have a static variable here, the signer. We tell it to handle the request. This is an asynchronous call. We're not actually doing any real asynchrony here, but that's kind of similar. This could be a remote call. So we pass the request to our string, and we get back a UR string, or it throws an exception if it had--actually, it doesn't throw an exception. In this case, even an error, it will always hand back a UR string, and you'll see how that's processed. 

So now we're gonna parse the UR string back into an envelope. So now we have the response to our string. We basically parse it, and it obviously does all kinds of error checking in this thing, but once we get back our response, then we're going to examine the return envelope by again printing out the response envelope in envelope notation. 

Now, because we're using cold card signing, it sends back a very kind of PGP-style message here that begins with-- this is all one string. You can see there's new lines here. But here's the original message we signed, and here's the actual Base64 signature. So this is what we're expecting back. When we use this message, here's the actual response envelope. So here's--this is an envelope. In fact, if I look at the type here, you see it says it's an envelope. Then we extract that result, we tell it to expect a string for the actual result. And we get back the same message. 

So we're now just going to print that out. And we get the exact thing the cold card would send back. Alright, so that's the first scenario. 

The other two scenarios are much faster to go through because you already know the basics now. 

In this case, we're saying the same message, we're going to give it a derivation path. And this is, you know, the standard kind of asking coding for derivation paths. Our structure is not a string. It's a compound type that can parse, validate, and output path strings, but also contains a sequence of derivation steps, substructures that make it easy to handle the path and code, including ranges, wildcards, things like that. Our derivation path structure also conforms to the CBOR tagged codable protocol, which basically enables it to seamlessly integrate with our whole dCBOR library, essentially, and envelope itself. 

So if we actually output the actual diagnostic notation, and I've talked about this in our other thing, this is our, this is, we're actually saying the path object, which is C, which is CBOR encodable, encode that as CBOR and show it as CBOR diagnostic notation, annotate it, and here's, and use these known tags. And so as you can see, this is what it outputs. And we can also say, do that same thing, but with a hex dump, annotate it, show us known tags, and you actually get the actual binary that will be encoded. 

All right, so now we're gonna do the same thing. Create a body, create the request from the ID in the body, create an envelope from that, and then we're gonna format that, so now we see what the request looks like. Looks the same except now there's a path here, which identifies a crypto key path, and there's a CBOR map. And as you saw before, that's what this is. This is the CBOR map right here. So we can code that as a UR, do the exact same thing, and get back a signed message. 

Okay, so that went even faster. 

This is the error case. So in this case, cold card says you can't have more than four spaces. So we're going to put five in here. We're going to do the exact same encoding. Here's our request with the five spaces in it. We do the same request and response. So we get back the response envelope. But instead of a result assertion, now we have an error assertion with a message. So we're going to just validate that. So now you see it from the client side. 

So now I'm going to switch over to... 

Okay, so this is the actual implementation of the example signer service. The example signer service is just a structure in this case. It keeps a master key. We initialized it with a master key, recall, from a seed. It derives the HTTP key from the seed, stores that. Now we have utility functions. This isn't what handles the incoming envelope. This is the utility functions that actually do the signing. You know, it's very straightforward. I'm not gonna spend a lot of time on it. It gets the message as a data blob and the derivation path, if any. It derives the key if necessary from the derivation path and then performs an eCDSA signing on the message. It also can throw a message, this class can also throw errors. You'll see where that happens down there as we validate the actual cold card requirements. 

So in this extension to that, we're actually gonna implement the cold card requirements. This is where those docs are, where I worked from, but we didn't actually, I haven't actually had the time to validate this to make sure it's cold card compatible, so don't rely on this code. So, but they require certain things about the string you send. There's actual string you send, not just data blob. It has to be less than 240 characters. It has to be all in a certain ASCII range, no more than four consecutive spaces. So I'm using a regex to validate that. They trim, leading and trailing whitespace. And so basically some of these are erroring validations. Some of them are just transmuting validations where they're just trimming certain things from it before they perform the signing. 

If you make it that far, then you actually perform the signing, which uses our method that you saw above. Then it composes the string, and that's what it returns as a result. We haven't touched envelopes yet, but now we're gonna go into that area. 

Okay, so this is the actual router or request handler. It receives UR strings. It's asynchronous. Again, we're not performing asynchrony here, but that's it would be if it were actually a server. it's going to try to parse out a transaction ID and compose a response. So the first thing it's gonna try to do is compose an envelope from the string. You already saw how this worked from the client side. It's the exact same process on the server side. Then it's going to try to compose a transaction request. It's gonna be thrown, given a closure here, it's gonna be given the envelope that is the body, and it's gonna try to figure out, okay, based on the function identifier here, what is the, you know, actually create the actual, In this case, it's going to say, oh, if it's the cold card signing function, then it's going to create the actual structure that's going to be used elsewhere. 

If it gets this far, then yeah, okay, we have a request ID. If it throws at any point, then it might have been a bad UR or something like that. So we may not even get a transaction ID. We have to handle that case. But assuming we got this far, we know there's a good transaction ID. And then we're basically going to say, okay, based on what kind of body we have here, perform the operation. We only have cold card signing in this, but there could be other arms to this switch statement here. But we're just going to do result cold car sign. You already saw that code. We're going to compose the envelope with the response transaction ID and the result. And this is a standard kind of-- this is a standard idiom for envelope. When you're doing a response, instead of composing it with a subject and several assertions, you just say, "This is the response, and this is the result," and it already knows that, and it puts that in the standard format where, for example, the transaction ID tagged properly as a response and all those things. So you don't have to worry about that. It's just one line of code. If it's called, we don't recognize. We throw an error. 

If we catch an error, we compose an envelope response. And you can see in this case, we got a transaction ID, so we say this transaction ID was an error of this kind. In this case, we didn't even get a transaction ID because, say, the UR was malformed. So in either case, we return an error to the client. 

And that's the entire implementation. 

There's one more thing to go through, which is how we actually compose the actual envelopes, which are the body, essentially. So to do that, we need a function identifier. This is in the envelope, the Gordian envelope library. It has function and parameter identifiers. There are separate namespaces from CBOR tags. In this case, we're just going to find one function for cold-card signing, and we're going to find two parameters, which could be used across different functions, but one for the message to be signed to be signed and one for the path, the derivation path. So now we're going to-- this is the actual structure that represents the request body. It includes just the message to be signed as a string. In this case, this is actually the cold card, so this is the cold card only ever takes a string. We're going to store a string and an optional derivation path, so that's very straightforward. 

We have a protocol here, which is, for example, if we had many different kinds of signing that the service does, then we want them to all conform to this protocol where the message to be signed can be gotten as just a data blob. We only have one of them right now, which is the cold card signature request body, which we make conform to that. As also conforming to the transaction request body, we have to declare a function so we can recognize in the envelope which function we're implementing here. We have to be able to return our message as a data blob, which we just decode the UTF-8 there. And then we have to explain how we encode ourselves to an envelope and how we decode ourselves from an envelope. 

So this is what decodes this from an envelope. And so basically we say, okay, I'm sorry, this encodes into an envelope, sorry. So we say it's an envelope which has a function. It's a function call. We add the assertion, which is the message and the message string, and the parameter, which is the derivation path. If it turns out the path is nil, this doesn't even add an assertion. This whole thing kind of automatically drops out, so you don't have to have to conditionals. If you try to encode nil values for assertions or whatever, the envelope library just doesn't even encode an assertion. Just assumes you didn't want to in that case because it was null. 

This is how you decode from an envelope. You basically are given the envelope, and we're essentially coming up with a signature request body from that. We parse the message out, we say envelope extracts the object which is a string for the parameter message. We also try to extract an object for the derivation path. it automatically decodes this because it conforms to CBOR tagged codable. So it knows how to recognize this, it knows how to encode it and decode it. We don't do anything special, even though this is a specific kind of CBOR structure for this parameter path. So it may or may not get one, this may end up being nil, and we just initialize the structure. 

That's it.

Now, I know that might seem a bit involved, but again, I've worked with Serde, I've worked with Rust, I've worked with Codable in Swift, And, you know, this isn't much more, this is actually as simple or simpler in many cases. And you get cryptographically strong structures using envelope that these things can be signed, they can be alighted, they can, you know, all kinds of things that, you know, I did a more complex key sharing or key, a key segment key recovering using SSKR demo a while back where every envelope or request was cryptographically signed and the signer was basically used as a form of a trust on first use identifier. It wasn't much more complex than what you're seeing now. Once you've kind of achieved this baseline, you can add all this additional cryptographic functionality without much effort or many more lines of code at all. 

So any questions? 

Yes, I got one. I'll paste it in the chat. 

If there's no other questions, then I will be happy to throw it back to... Oh, actually... Okay, so this is... "The demo uses HTTP on cold card. In general, isn't it a bad idea to sign with the master key of Bitcoin address that has UTXO on it? I've learned that signing always leaks info that could be used by attackers or the process of prevent leakage." 

Now, in this case, we're just trying to show what the general process of signing would be. We're not necessarily saying that this is a way that we would have you deploy. We're basically doing what Coldcard did as a way of showing how you might implement a signing service for a generic string based on a master key. We're not saying that, you know, obviously if you want to verify that there's funds on UTXO that you're showing control of, then that would be additional steps. That wasn't our goal of this demo. Our goal of this demo was to show you basically how easy it is to incorporate this kind of structure into your workflow. 

And of course, you know, if you have questions about that, I'm always available to answer, you know, how would you do something with Envelope to do X, Y, or Z thing? But yeah, I mean, obviously, if you have a more complex workflow that you want to support, that's your business logic. But Envelope is there, and all its other layers, like dCBOR and all that, are there to support the reliable serialization and deserialization and all this other cryptographic functionality, like elision and encryption, that we support. 

Thank you. 

## Signing with Bitcoin Keys Discussion

So we've lost some of our community 'cause our calls run a little bit late, but let me just quickly close out. As per Henk's discussion or question, there's sort of an implied thing, how do we do this stuff safely? And that's not what that particular presentation was about. Last Friday, there was an assertion of, oh, well, some people are coming out with their own animated QR techniques maybe for doing a particular legacy Bitcoin signing thing with cold card happens to be one of the, a particular interpretation of that. We're not saying that that's safe, but if you wanna do it with a crypto request, this is what that demos. 

But really for what we really need to do is figure out how to do this right, which includes both signing and authentication and do those in a safe as possible fashion, including potentially limiting some choices and giving UX, making some UX choices that we, I'm not sure we can mandate, but at least strongly encourage. And a lot of that has to do with dealing with the kinds of mistakes that sign in with Ethereum did that we want to address. 

Initially, you know, single round trip for legacy messages and stuff, but we want it to be future-proof for multi-round trips, where, you know, or I shouldn't even say it, it's multi-device would be like Simon's proxy ring where a request comes from Casa, goes to the iPhone wallet that can interpret the request and do some network proofing and get consent from the user, which then sends a different request with the same CID to the ring to sign a hash because the ring can't parse or network confirm the request to start off with, which then returns back to the iPhone, which then goes to your final, back to the coordinator. Those types of multi-device. And then of course, multi-party CASA, you know, allows you to have multiple parties, be able to cooperate together in a quorum multi-SIG. And, you know, in fact, you know, all the quorum members may be asked at the same time. And, you know, when the quorum is finally established is the final operation done. 

We want to support those things, but first simple round trips, which this was, First, a legacy message, which just was other future uses. Been a discussion in Bitcoin dev around pairing, being able to do a Diffie-Hellman for pairing two devices. We wanna be able to do that. We wanna be able to do music frost. This demo was ECDSA. We wanna be able to do Schnorr. Some devices can only sign a hash because the object is too large. Obviously we're already signing PSBTs, but we could do so better. Legacy, which this discussed. Other kinds of payloads, not just authentication payloads, but maybe capability payloads. Signing with things that aren't precisely signatures, like pay to script hash, or complex objects like tap root or bit 3344. And then, you know, there are definitely people who want to do sign in with Bitcoin. And we, again, do not want to repeat the mistakes of sign in with Ethereum. 

So there is a special call that we had last week, which where we discussed some things. But I really encourage everybody to go to the Gordian requirements, which is here. So this is in the Gordian developer community. I've started throwing some requirements, potential requirements in here. And it really needs people to either ask clarity on some of these requirements or vote on them so that we can prioritize like which of these scenarios do you want us to focus on first to help you with? I've been hearing CASA and Foundation have a health check that's involves a signature. Maybe we should have a health check standard that isn't just between two companies, but that anybody can do a wallet health check with. So, but we need to understand it. And the best way is start participating in this requirements for you are signing. 

## Priorities

We ought to close with priorities.

Obviously Blockchain Commons, we're working on finalizing the Envelope Rust library. Something that slowed us down was we originally had designed it for Blake3, but for a variety of reasons and talking with a lot of different people, we're gonna be using the SHA-256 as it's required the hash algorithm. This month, we're hoping to present envelope at the ITF. Last month, we presented at W3C. 

And then we wanna do more with the SSKR based crypto envelopes. We have some parties who are already doing SSKR, Proxy is implementing it. In fact, they will probably be talking next month about a constrained Java card version of SSKR that allows them to reconstruct the keys on a safe card rather than in the less safe iPhone. And then, you know, maybe we can get to the next step of taking this demo and actually having a little app that demonstrates it. 

So our next meeting is April 7th. I hope that you guys can all join us then. 

And I will open up to any closing questions with the group of people we have. And then we'll call it the day. 

I see some questions in the chat.

Ken, do you have any early thoughts? I mean, we're trying to respond to Friday and it was a little quick.

Nothing that I wanna say right now really. I mean, like we have, I mentioned this like on Friday, but like we have some signing cases that I think I'll run by you, but I haven't got them all cleared up yet exactly which ones we wanna support. But like one of them might be, you know, for example, signing requests for things like Apple pass keys is one thing that we're considering using a future password version for.

Okay. Also, you know, is there some viability to generalize the health check? 'Cause that's a-- 

Yeah, I don't see why not. I think they'd be open to it as well, but we'd have to just coordinate on that. And probably we'd have to support both standards for some period of time while people update.

That would be great. 

Aaron, so you can see there's a lot going on with URs and a lot of things that we can do with a variety of different companies and a lot of different companies that are involved in compatibility. And it isn't just wallet companies, it's companies like Casa and identity companies, et cetera. etc. 

Any comments or questions for the future of URs and maybe for your device? 

Yeah, currently we are building the next generation's device and I can share some details about that. First, we will fully support SSKR and second that for the new UR and QR types we have planned to fully support that. And third, we have previously used Rust for our development. So we are really excited to see the whole community going out that way. So that actually, there is quite a lot of information today, so I will digest that a little well and if I have any comments or questions I will send that in our signal channel. 

Great. 

So one thing to be certain on, obviously people can use the SSKR stuff that we developed last year, but I do encourage you since there really wasn't a large groundswell of support in various things to move up one more notch and do it as an envelope. The advantage of an envelope, you can do it pretty much straight now, just do the seed like the current standard does. But what Envelope then does is allow you to add other information. So in particular, one of the concerns around securing the seed is that in multi-sig, you need to have a descriptor. Without the descriptor, you're not backed up. You may need to have some metadata. It might be some transaction data that is private to the user that they want to move to their next wallet, and it's all gone when they switch. It might be lightning channel information or a key that's used or other information that's private. And your future, if you're using the envelope version of SSKR, which is a little larger than the raw SSKR, the advantage is that you're future-proofing yourself to be able to restore a lot of other different types of things. The only advantage of using the original SSKR thing is it is designed to be small. And if that's of vital importance, we can talk with you about how to do that very efficiently and some ideas about variations there. 

But what we're discovering is people aren't putting stuff on metal, they're buying metal and then not stamping it. Like they, you know, They're not necessarily doing the hour of work that is necessary to do this type of stuff. So we've got, if they're not doing it, then we really need to do things better. And I think the collaborative seed recovery and the different efforts in that direction will address a broader set of users, allow us to have much greater safety and no single points of failure or compromise. And so, but I really want you to do SSKR.

Yeah, gotcha.

I'm glad to hear you're working and Russ will be doing more. I think, and I think Ken said that, they're doing more with Russ too. So let's make this the best community for sort of the wallet side of these choices.

Sure.

Any last comments before we close for the day? 

Well, thank you again, everybody, for joining us. Again, join us in a month, and we'll have more for you. And use the Signal channel. Please subscribe to the announcements list so we can tell you about any changes, for instance, to be more friendly to the European time zone or alternate or whatever. So also, if you're using Google Calendar, I can add you to the Google Calendar for these meetings. And it'll automatically be changed if there's anything that happens. So again, thank you very much, and have a great evening. 

Thanks, Christopher. 

Thanks, both. 

Thank you. 

Thank you. 

Bye. 

Thank you, everybody. 

Bye. 

Thank you. 

Bye.
