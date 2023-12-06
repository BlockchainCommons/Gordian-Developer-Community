Okay, welcome everybody to the Blockchain Commons hosted Gordian wallet developer meeting for December.

This is the last one of the year.

If you've not been here before, what is Blockchain Commons?

We're a community interested in self-sovereign control of digital assets.

We bring together stakeholders to collaboratively develop interoperable infrastructure.

We are a neutral, not-for-profit that enables people to control their own digital destiny.

In particular, this year we've been working together on Gordian envelope, which enables sovereign and collaborative recovery.

We have a number of sponsors this year that have helped us be able to accomplish what we have been able to do.

We encourage you to join and become a sponsor yourself.

So last month we had a discussion about output descriptors and some of the challenges of making it work in the CBOR ecosystem and some discoveries as we have evolved them, which also led to some discussions about the envelope CLI and we had some initial discussions on the CSR reporting and a little bit about some of the recent articles we've published at Blockchain Commons.

Today our agenda is to talk a bit more about the Blockchain Commons repo, more on output descriptors, including a specific proposal, which we'd like your feedback on.

We have a brief demo of the Gordian depository.

If there is time, I would like to talk a little bit about open development and for remembrance.

So the repo overview.

Shannon, do you want to talk about that a little bit?

Actually, that's something that I had planned on talking about because I have something I want to share.

Take over.

Yeah, so I'm Wolf McNally.

I'm the lead researcher for Blockchain Commons and I'm, you know, even though Shannon is one of the primary maintainers of the repo and make sure that they are all up to snuff in terms of our quality standards and making sure the documentation is all there and all that.

I'm the one who actually commits most of the code to it.

And I wanted to provide a brief overview of how our repositories on GitHub are constituted and because I think that'd be valuable for the community to understand, especially because there's been talk about, you know, how many dependencies there are and things like that.

And of course, I think it's impossible to build anything without dependencies.

And what we try to do is create a very kind of logically structured hierarchy of software tools, some of which are libraries, some of which are end user applications like the Gordian seed tool for iOS and some of which are command line tools.

So I wanted to give a brief overview of that, the tool I'm using to show you this is Flying Logic, which is a tool I actually wrote to as well.

But I wanted to start by pointing out that we're primarily working in three languages right now, C, C++, Swift, and Rust.

And as you can see from this high level overview, our Swift libraries have some dependencies in our C++ libraries, but Rust are pretty much all pure Rust.

They have pretty much standalone.

All of these have certain third party dependencies, which you'll see alluded to as well.

So let's start by looking at the C++ or the C and C++ libraries real quick.

These are all usable by themselves if you want to use any project itself, but they include things like our crypto base, which is some very low level cryptographic algorithms that pretty much everything else uses.

Our Shamir secret share in the library, which actually is used by our SSKR, which is used for backup keys and self-sovereigns and social backup recovery.

Our life hash algorithm, which is used to create visual hashes of various kinds of things like keys and seeds and so on.

And then some things are shims on top of other things like libwally.

We have a library which shims on top of that, which we use for various things like Swift and so on.

We also serve high level CLI tools.

One is called KeyTool for deriving keys, SeedTool for generating and deriving seeds, and BiteWords, which is essentially a tool to wrap and unwrap sequences of binary in our BiteWords format, which is part also of the UR format.

So as you can see, there's the UR format library.

Now let's go to the Swift.

And these libraries start with, again, Swift shims on some of these things, Cryptobase, SSKR, and so on.

And then DC-Bore is our implementation of Gordian deterministic C-Bore.

And then these basically are used by a lot of the high level things.

These are third party dependencies.

We won't get into those right now.

But as you can see, it builds up through things like our cryptographic algorithms, all shimmed properly for Swift that sometimes depend on third party libraries, secure components, which is where we start introducing things like seeds and keys and so on, Envelope on top of that.

And then Swift Foundation, where we introduce a lot of various kinds of various Bitcoin specific things like output descriptors, which we're discussing.

We also have tools, libraries for reading and writing NFC cards.

We have our life hash, which is built on top of the C implementation.

And then our UR kit here, which is a standard implementation of UR, including the fountain codes for breaking up, which we'll also be discussing.

And then URUI, which is iOS affordances for, for example, the admin QR codes and so on.

And then various kinds of ways of bundling these into things like our our Gordian C tool, which is kind of our flagship iOS app.

And a new version of that was released today on the for our beta program, a new version of beta 1.

6 that actually includes the new output descriptors that we'll be discussing the version three output descriptors.

So some of these are demo apps.

For example, there's a demo app to demonstrate fountain codes with URs, a couple of demo apps to show off life hashes, things like that.

This is a work in progress Gordian coordinator, but you get the idea.

And finally, I want to show off our Rust stack.

Close these up here.

What you're seeing here is, again, these are third party dependencies.

These are all crates that are, you know, kind of well-regarded in the community.

We don't need to get into those, but everything you see here is standalone pure Rust.

So at the very low end, we have our tools for random numbers and pseudo random numbers, which are often used for fuzzing and other kinds of testing in the rest of the libraries, which is why there's number dependencies on those.

Our cryptographic libraries, which essentially are leveraged third party crates for all the core cryptographic algorithms and, you know, preferably reviewed crates were possible.

And then our pure Rust implementation, Shamir and SSK on top of that.

Our DC board implementation in Rust.

Our UR implementation on top of that.

Components, again, same analogous to the components library in Swift.

And then our envelope implementation on top of that.

And then the depot API, this is basically if you want to build a client for our depot server, which I'll be discussing soon, then you'll use that.

The depot server itself uses that.

And then we have a couple command line tools written in Rust for envelope, which is analogous.

We talked about that last meeting.

And then a command line tool for DC board itself to ingest binary DC board and then output the diagnostic format.

So that's a high level overview.

And I just want to make sure that, you kind of all have that picture in your mind, because if you just do cargo run or cargo build on any of these, it'll pull in everything that's necessary automatically.

Some of these things in particular, like envelope, has a lot of feature gates that if you don't need certain things like cryptography or whatever, you can turn off the feature gate.

And ultimately, that will all compile out.

That won't bloat your code.

So obviously, we'd like feedback on all of these things.

So you can either open issues or you can contact me personally with questions or whatever.

So this is your code, essentially.

This is the community's code.

I've written a lot of it, but there's also been significant contributions by other people.

So we want your feedback.

And we ultimately-- but also remember that not all of this has been deeply reviewed.

Some of the C++ libraries have been deeply reviewed.

We actually had a third party security company coming in and review our, in particular, our Shamir and SSKR implementations.

And so that has been officially reviewed.

These have not at this point, but they are basically based on the C libraries.

And so ought to be the same, but until it's been reviewed, we don't know.

So you are to certain extent using these at your own risk, but we believe that they are useful and they're going to become more and more stable over time.

So that is the first thing.

Are there any questions at this point about that?

I would like to raise a lot of people-- we've had at least a few people say, oh, well, there are too many dependencies.

And I feel like that that's a mischaracterization of what we're trying to do.

What we've been trying to do is very careful layering so that different parts of the tools can be reused in different ways.

And to make sure that at any particular phase that if something changes or new technology emerges that we have planned for, we can basically put in something into that particular slot to adapt it.

So as an example, somebody brought up again this last week about, oh, can't we do color QRs?

Wouldn't that be a lot smaller?

And due to the way that we've written this stuff, it would be fairly trivial for us to switch over to some emerging color QR standard.

Whereas for many other libraries that are out there that do things in this category, they wouldn't be able to easily switch.

They wouldn't, for instance, be able to do fountain codes or do some of the other different types of things.

So there's a lot of careful layering.

But we also are being very careful to not have too many security dependencies.

So we're not using lots of oddball crates and things of that nature.

So it should be pretty easy to review.

And then there is sort of-- we do have kind of some opinions about keeping layers separate.

I think we've seen the decision of what happened when we kind of, with addresses in Bitcoin, put in the policy along with the keys.

So like, you know, a number one at the beginning meant that meant more than, oh, this is just some identifier byte.

It's very explicit.

This is a legacy policy.

So then we extended it and tried to do more policies.

And then we had X pubs.

And then we had Y pubs.

And then we had capital Y and Z and all this hodgepodge of things that really made it difficult to be able to do a lot of the things and future-proof ourselves to emerging things in Bitcoin.

And that's because we've combined into what is really the intent is, how do we transport reliably an address that you can send to along with a lot of other policy type stuff that was too tightly bound to it?

Sometimes when you really understand something and there aren't a whole lot of other choices, that's great.

But the reality is we want to kind of keep those types of things separate when we can because it does allow for future-proofing and future ability to be adaptive.

Wolf, do you want to say anything more about that?

No, unless there's any other questions that we can move on.

Okay.

Let me go back to sharing the screen.

Okay.

So at the last meeting, there was a lot of discussion about output descriptors.

We had a previous research paper on this, which was really deserved to have become what we call a whip, which is sort of the next stage in the open development process for these, because it was implemented by multiple companies.

But we also ran into both some problems with some variations that were going on there, some changes in Bitcoin that were emerging, as well as we were trying to do a binary version of this that was compatible with ITFs and the IANA registry, and ran into some challenges.

So we wanted to address these, and I don't think we did it in as graceful way as possible, but I think we're now ready to make a proposal.

To be clear, this is a proposal.

It doesn't deserve to become a wallet improvement proposal until we have some review by the community and some commitment and/or actually implementation of the new output descriptors in your code basis.

So, Wolf, do you want to talk a little bit more about the.

.

.

I also have the paper in a tab.

Yeah, I'll pull up the paper.

I'll share my screen and pull up the paper.

One second here.

Okay, you should be seeing the UR type definition for Bitcoin output descriptors version three.

And it's a shame we have to have three versions.

I'm really.

.

.

But we are iterating here and finding out what people want and need as we go.

So I'm going to just go over the kind of.

.

.

I'm going to skim through this document because I recommend you definitely read it on your own.

It's BCR 2023.

010 in our research repository.

And our research repository is deliberately named as research because it's not final ready for deployment necessarily.

And if you do so, we appreciate the feedback.

But we're trying to solidify the higher levels of stability at this point.

And so we want to make sure that any wallet developers who build this.

.

.

Some things we think we are regarding is very stable at this point, like URs and DC war and things like that.

Other things, you're seeing this for the first time now.

So this is not anywhere near stable.

And we're introducing, as Christopher mentioned, higher levels of stability designations that we want to work with you guys on to make sure that you feel confident moving forward, implementing certain things that they are in fact stable.

So I'm just going to read a little bit of this just so.

.

.

And if you have questions or whatever, please either jump in.

.

.

Jumping in verbally is probably the best thing.

Just go ahead and interrupt.

So output descriptors are a way of specifying Bitcoin payment outputs.

And you all know that.

We're describing a native Seaboard encoding for output descriptors, as well as a uniform resource type.

And a UR type includes a textual description for when it's encoded as a UR and a Seaboard tag.

And notice the Seaboard tag is in the 40,000 range because we were using lower number tags before.

And now we switched using high number tags because these require less review by IANA.

And we want to get these registered so that we're not we're not contending for these code points in the Seaboard tag space.

I'm going to switch over real quickly to the IANA registry of Seaboard tags.

And as you'll see, there are three ranges they identify here.

0 to 23 is standards action, which basically by standards, they mean RFCs.

They mean actual completed RFCs approved by IETF.

Where specification required is not at that level of scrutiny, but it does require review by IANA experts.

And that was where we ran and started realizing we're running their issues when we tried to get a number of tags registered for Gordian envelope in the low number range, 200, 300 range.

And we started running through resistance because the way that they view it, this has to last a number of years in terms of it's especially the lower number tag, especially what they call the 0 plus 1 tags.

These are all 1 byte.

The lower number of parts, these are actually 2 bytes.

These are 2 or 3 bytes and these are 3 to 8 bytes.

And so they do take up more storage, but in this range, they say first come first serve.

So as you'll see, if I go down here to say 200, this is the tag we finally actually did acquire for Gordian envelope.

And so it's part of our internet draft.

That was what was required.

And that had to be reviewed by IANA experts before they would grant this code space.

But that is forever now a Gordian envelope if you see C4 tag 200.

So that's a baby step towards standardization.

It's not standardization of the Gordian envelope, but it is basically the assignment of a code point.

And so it doesn't mean it's been independently reviewed, but not approved as an RFC at this point.

So if we continue going down, you'll see that as we started getting the higher numbers, especially after we get up to 32,767, here's 32,768.

So some of these have been assigned.

Nothing in the 40,000 range has been assigned yet.

You see 32,767 through 42,599 are currently unassigned, which is why we chose to start asking for tags in this area.

And this is the first come first service.

You see that these aren't associated with RFCs or proposals.

They're associated with people in many cases.

Sometimes RFCs and so on, but that's not required.

So this is the first come first service range.

And so we've, as you'll see in a moment, I've implemented a strategy where we're using what's called type 2 tags now.

And if you go through the papers or the version 2 tags, if you go to our research repo and look at our -- let's see.

Sorry.

So if you look at our registry of uniform resource types, BCR 2020.

006, again, BCRs are not like RFCs.

They do get updated, whereas RFCs are fixed.

And if they update them, they assign a new RFC number, whereas BCRs are living documents.

So as you can see, as we go down here, some of these types, for example, let's look at seed.

So tag 300, this is now deprecated but still supported.

So we're actually modifying our code base so that it will read crypto seed URs or 300 tag seaboard with no complaint, but it prefers now to write seed, UR seed, and this tag, which is -- and all the new tags are basically just the old tags incremented by 40,000.

So it's very clear which ones have been assigned version 2 tags here.

And all the other documentation in the repo has been made -- has been updated to reflect this.

And our Swift code base has also been updated to reflect this.

Okay.

So moving forward with the actual output descriptor.

So this document gives an overview of the other two versions of output descriptors.

The first one was pure seaboard.

But we also realized that this used the lower number version 1 tags, and that would make it difficult to have these tags to ourself.

And another standard for output descriptor accounts was based on this, and deployed by a developer, and we're very happy that they're excited about that.

We still want to support that.

Obviously, we realized that -- and so this document and the other document that was based on it, while we're calling them deprecated, we're still saying these are still supportable in terms of backwards compatibility.

And we want to make sure that nothing that's out there in the wild gets, you know, completely abandoned because people are relying on these things.

So version 2 was an attempt to move away from these low-numbered tags by basing an output descriptor format on Gordian envelope.

Gordian envelope is a container for various kinds of structured data.

I won't get into the details right now, but those of you who haven't seen it before, please check it out.

It's actually extremely useful when we're basing a lot of our stuff going forward.

But we did meet some resistance in terms of this format because some developers expressed a concern that was too complex for their needs.

I think that's debatable, but it's true that the format is not quite as simple as pure seabor format would be.

And plus, other things were raised, like, for example, can we use -- because this format relied on the textual output descriptor format.

It's basically a Gordian envelope wrapper for the output descriptor textual format.

And so there was no real size gain or anything like that on that.

And so the actual -- actually making the output format -- the output descriptor format much more compact while still providing for metadata and things like that, you know, the community told us that was important.

So we've deprecated this now.

And we're not recommending -- we're recommending anyway support this for backwards compatibility either.

So where does that leave us for this version?

So we wanted to make it pure seabor without requiring Gordian envelope.

We wanted to have a compact encoding of keys.

Now, we're getting keys are part -- an essential part of output descriptors, but output descriptors can also include things like, well, HD keys, BIP32 keys, EC keys, private or public, and Bitcoin addresses.

And these all have textual formats, but they also have more compact binary formats that we've already defined using seabor.

And so those are actually smaller.

So we also want to be able to represent all output descriptors that can be represented in the text format, not just a subset.

We also want to be able to adapt to future changes in the text format.

And part of why we didn't entirely move away from the text format is because it's a living spec as well and still evolving.

But we also wanted to add the ability to support metadata such as name, note, and whatever else the community deems important.

So the solutions we decided is we're going to use Gordian decibor, which is the same thing we've been using.

Decibor is a deterministic subset of seabor, and it's compatible with existing seabor implementations.

So it's basically just a restricted form of seabor that affords determinism.

And not all applications require determinism, but we're basing everything we do on it.

So we're also using the text format for output descriptors, but we're replacing the keys with index placeholders.

And this is something that SeedHammer brought to our attention.

And so we definitely appreciate that because this is a great idea.

So we are extracting the textual versions of the keys.

Actually, we're doing it in our unparser, which is what turns our internal format into the textual format.

And as we unparse it, we're basically emitting the keys themselves as the internal format, the Swift format, as well as these placeholders.

And then the seabor encoded keys are included in a separate array corresponding to the placeholder indexes.

And you'll see some examples of that in a moment.

So this affords compactness while allowing text format to evolve without requiring changes to the seabor format.

And using text format means that clients of this format still need to be able to parse the text format.

But there's pretty much third-party libraries for that purpose already.

And we have our own as well in our BC Foundation, the library I showed you earlier, that basically parses and unparses output descriptors according to the specification, which is, again, a living specification.

It's not a fixed specification at this point.

So encoding this format may be a bit more challenging because the text format will either need to be output with placeholders or the keys will need to be extracted from the text format either by textual manipulation or specialized walking of the abstract syntax tree, which is what we're doing.

And the use of placeholders, though, is optional.

And the ability to parse and orientate the output descriptor textual format are not required for writing this format because you can just basically wrap the textual output descriptor if that's all you need to do because complete textual output descriptors can simply be wrapped without using placeholders.

However, to read this format, the ability to parse placeholders and substitute the decoded keys for them is a requirement.

So we realized that part of the effort here would be to include compact representations of the keys.

And that includes HD keys, EC keys, and Bitcoin addresses.

We already have specs for those, and those now have been graduated to version two tags in the 40,000 range.

And so if you go to any of these specs, you'll see that there.

Other than that, these haven't changed.

And all our code now accepts both version one and version two tags for reading and writes version two tags only.

And that's essentially what I'm saying there.

So now the CDDL.

The CDDL is the concise data definition language.

This is how you define the syntax of Cebor.

And I briefly want to note here that I mentioned the cosigner type, which is essentially something that we're-- because it's now part of the textual descriptor here, it doesn't need any special treatment, but it is still there.

It was in our previous output descriptor format version one.

And so-- but I want to continue to support that so that we're declaring that it's supported here.

And then here's the actual formal description of the output descriptor.

It's just the Cebor tag.

And then the source text, which if the key is replaced by placeholders in this text-- and you'll see examples of that in a moment-- then an optional array of keys.

So you can either use placeholders or not.

But if you have at least one extracted key, it has to be in this array.

And then an optional name and an optional note.

And so as you can see, it's trivially easy to add additional metadata if we need to.

But that does need to be part of the spec because you need to know what keys to expect.

This is a set of key value pairs in a Cebor map.

And these are the actual integer values that are assigned to these.

So this is not text in our Cebor.

This is actual encoded integers.

And that's important to keep in mind if you're not too familiar with Cebor.

And so this key can be an HD key, which is defined in 20.

2007.

EC key in '08 and address in '09.

It can be any of those.

Let me also briefly talk here about some of the design considerations that are longer term.

As we move to a world where we can have multi-sig described in an output descriptor, but it could also be a world where, in fact, something is happening offline using, say, Frost or Musig or whatever that results in a single key that is used in an output descriptor, we need to be able to have this additional metadata because you may need to describe, oh, well, this in fact is a Frost aggregated signature, or this is something unusual that is happening offline.

Some kind of adapter signature needs to be added in.

We don't have things for that, and we wanted to be able to have the flexibility to add that kind of information.

There also may be other very trivial things that we really would like to have sooner than later to add to this metadata.

Like maybe you would like to put in the date that the descriptor was created for some reason.

Or this descriptor is exclusively used for some other protocol like Lightning or RGB or whatever.

We would like to hear from you, what are these other things that are not part of the Bitcoin output descriptor format, but you would really like to see as metadata about it.

That's it.

I think I've redundantly included the talk about co-center here.

I'll edit that.

Then I give some example test vectors here.

These are basically drawn from our other test vectors.

If you go to our Swift code base and look at all our test vectors, they're very good examples of how this actually plays out.

For example, this is a paid public key script, and it's 70 bytes as text.

This is what the substituted output descriptor looks like with a placeholder.

This is the actual what's called diagnostic format of CBOR.

The actual binary itself is much more compact than this, but this is the human readable format of CBOR.

It begins with a tag.

Then this is the key value pairs, one, two, one is the source, two is the actual key array.

Here's the array.

Here's the version two tag for an EC key.

Then three basically is the actual key data.

The actual hex encoded CBOR is 54 bytes.

In this case, the original output descriptor is 70 bytes.

The new CBOR encoded is 54 bytes.

How big is that in binary and how big is that in say a UR?

So, UR is essentially -- so, okay.

This is the binary format of CBOR.

So, if you emit just the pure CBOR, and this is the hex representation, which is double that, so this is 108 characters, but it's 54 bytes if you actually admit it as binary.

When you wrap something as a UR, you are taking each byte and turning it into two English letters that are from the byte words gamut from 0 to 256.

While that's not efficient in itself, it is very efficient when encoding QR codes and it's easy to handle for gamuts.

The point of UR is not necessarily the most efficient way of handling things when it comes to pure binary, but it is actually better when it comes to putting in QR codes.

It's better than base 64 or anything like that when you put them in QR codes.

The actual UR would be about this long in terms of number of characters plus a four character CRC32 at the end and the type at the beginning that replaces the tag.

So, it would be UR colon output descriptor, then approximate and same number of characters, and then eight additional characters for the four byte CRC32 at the end.

So, it's recognizable as opposed to just a pure text string like this.

It's recognizable by its type, UR colon output descriptor.

It's handleable.

It is a conformance URI.

So, you can use it anywhere a URI is syntactically accepted.

It's also very compact when you use them in QR codes.

That's basically one of the design parameters of the UR type.

It's important to understand that when going forward.

It's not trying to replace base 64, but if you put base 64 in a QR code, you actually get less efficient encoding.

You actually get a denser QR code than if you use a UR because UR's are very limited in terms of the number of characters they use and therefore they take advantage of the QR codes, alphanumeric encoding mode.

All right.

So, take another example here.

This is another one where we have an output descriptor, which is an address, and this is a testnet address.

And it codes down to address with a placeholder.

And then this is our described address format, which includes coin info saying what type and network this address is intended to work with and whether it's a private or public.

Not private or public address, but that's for keys.

But I forget what field two is.

Oh, it's depth.

No, no, it's not depth.

I forget.

I forget.

I have to look it up.

But, yeah, this is key value two and key value three is the actual public key hash of an address.

So, but this is the format of the address that's described in our VCR that I mentioned above.

And, you know, it looks for both here, but it's actually compact binary-wise.

So, in this case, because this is already base 58 encoded, this is 48 bytes.

In our case, the actual hex encode C-bor is a little bit larger, but it's consistent with everything else.

We could, if we really care, actually not encode this.

We could actually use the base 58 encoding here and regain some of that space back.

That's totally allowable.

But as you'll see, in most cases, the actual format results in a reduction in size, not an increase in size.

So, moving on, we have a public key hash here.

This is a WIF format.

So, this is when you're going to put an EC public private key into an output descriptor.

Then it's in WIF format and our code parses and unparces the WIF format for that.

This is the actual output descriptor representation of that.

And this is an EC key.

This true means this is a private key and this is the key material.

And so, this is 57 bytes.

So, we only, we actually gained one byte here with the bio format.

And again, this isn't the primary example of how this will be used because I'm about to move on to a much more vivid example of how the compactness actually plays out.

So, this is the descriptor for a two three multisig wallet, including the use of a name field to give it the name Satoshi Stash.

And you may recognize this is the seed hammer's example.

So, this is a wallet script hash, a sort of multi, a threshold two.

There's three keys with a path, both with a derivation prefix as well as a child derivation suffix.

And these are all defined in the textual format for output descriptors, but these are also encoded in our binary format for output descriptors, which is why when you extract them out, all you get is at zero, at one, at two as your placeholders.

So, the actual seaboard with the HTTP diagnostic notation, I've made it for brevity.

You can look at the full diagnostic output here.

But it's basically the actual text format followed by the array of the three HTTP keys and the name Satoshi Stash.

So, the actual original output descriptors 448 bytes.

In our case, the hexa encoded output descriptors 405 bytes.

And then I note here that this encoding is 405 bytes.

Well, the text format is 448 bytes, even without the user to assign names.

So, the user's name, of course, is taking up some space as well.

So, it's not like direct apples to oranges comparison.

Seedhammer's proposal comes in at 396 bytes, slightly smaller.

So, for this example, the present seaboard coding base is only larger by nine bytes, which I think basically to base things on seaboard and establish standards and also gain the advantage of fully supporting the output descriptor format, including all the edge cases and things like that.

I think that's a worthwhile trade-off.

I think that Seedhammer's proposal got the conversation going.

I don't think it addresses all the cases that we actually ended up addressing to create the spec.

And I think seaboard being a standard.

We can discuss this if there's any questions or concerns, but I think that this does meet the requirement for being compact as well as expressive of the full range of output descriptor values.

So, I'd like to take some questions.

Well, I also want to add here again, we're future-proofing ourselves in a couple of different ways.

As you will see in a discussion about the depository tool, these things can be put inside other objects that are seaboard objects that are, say, encrypted or use SSKR or use other different types of tools that we're building.

And this gives you a lot of flexibility in your designs to be able to do different types of things.

There also may be some advantages in the future when we talk about different kinds of hardware keys that these structures can be alighted in a variety of interesting ways or can refer to another seaboard structure in the overall object, et cetera.

So, I think there's some real.

.

.

We've tried to think about this in the context of a larger ecosystem, which might not necessarily include, "Oh, you trust this output descriptor and it's potentially valuable identifiers that could be used to track the parties that are involved in the multisig and be able to add some privacy to it.

" So, I just wanted to say that this does fit into the larger picture of why we chose seaboard and DC bore and some of the different types of things we've chosen with envelope and with the Gordian.

.

.

Sorry, Gordian Seal.

What's the name of the.

.

.

Gordian Seal transfer protocol.

And I'll explain that a little bit later, what that's about.

I did want to say it fits into a larger context.

Yeah.

And I wanted to.

.

.

I was trying to show that context when I showed the depository overview at the beginning, because that kind of shows that we're trying for very clean separation of responsibilities between layers.

So, you only use the layers you need.

And we're trying to basically build solutions, which once they're moved to your language or platform, then they can be built on by other people in a very kind of uniform way.

So, for instance, in Rust, we have our own UOR implementation of our own standard, but we're actually not using.

.

.

We're assuming a third party's UOR development, UOR library in Rust, because it does pretty much everything we needed to do, but we wanted to kind of modify its API slightly for.

.

.

To be consistent with the rest of our code.

So, we just shimmed it.

But we didn't have to implement our own UOR spec for our Rust UOR library.

Now, we might eventually do that at some point, but it doesn't really matter because the third party library works great.

So, we actually saved ourselves some effort by working with the community, with the community stuff.

So, that's a big part of the idea of our open development cycle here, is that we're all working with each other here to create a better set of tools for the ultimate benefits, the end users.

So, are there any questions on this at this point?

Obviously, this was a big point of discussion last time.

This is the fruits of that labor that I've been doing since then.

And if there's any initial reactions to this, I'd love to hear it.

Gregor, Ken?

Seed hammers?

I'd like to comment.

I think it looks great.

It has the same features as the other proposal.

It's compact.

It's expressive still.

You could discuss whether to include EC keys or not.

I'm not expert enough to know whether that's a good idea.

And I guess the elephant in the room is the underlying format.

C-board versus PSBT.

And I'm guessing what are your comments on that?

I don't know if you've seen my posting on the Bitcoin Dev mailing list.

One thing I did compared to the original proposal, #135, is to ask whether the proposal should not be a separate file format.

Using the PSBT encoding.

But instead, the PSBT extension.

And there was at least one response that pretty much said that's.

.

.

I can think to it here.

But the pertinent part is that the response is I think the goal of such a format should be that it is already a valid PSBT.

Or can trivially convert it into one.

So I guess the alternative to our original proposal is proposing it as a PSBT extension.

Which gets around all the questions of a different file format.

And also somehow it gets around the issue of the file form being proprietary.

So the original proposal just happened to use the same encoding as PSBT itself.

But it's correct that I think that Wolf brought up that it's still a proprietary encoding.

It's still a different file form.

But it's still a different thing.

Even though you can't just happen to be able to use the same codec libraries that you use for PSBT.

So I guess my question is, with that, with the proposal being an extension to PSBT, what's your comment on that compared to this and the output description version 3?

Yeah, the main reservation I've always had about the idea of extending PSBT is it was designed, I think, in.

.

.

I think the original PSBT specification was actually kind of designed in a vacuum.

And they probably did not review other things like CBOR because there's no rationale for why, for example, they did not go with CBOR at the beginning.

And so in the absence of that, I have to assume they were either unaware of it or deselected it for unknown reasons.

But when we decided to, as part of building our stack, we looked at many, many different binary formats.

In fact, if you go back and look at my CBOR, why CBOR video that I did some time ago, I have a slide with literally dozens of formats on it that we reviewed and compared.

And we chose CBOR because it has a wide.

.

.

It's an RFC, first of all, it has a huge amount of community support around it.

It's got an active working group on various extensions, which is how we're working with that community to proffer the CBOR, deterministic CBOR, our deterministic subset of CBOR, which is now an internet draft and hopefully will become an RFC someday.

And there's just a huge amount of tooling and support around that, including things like CDDL for defining schemas and CBOR.

me, which is for inputting and outputting diagnostic format, translating back and forth between hex and diagnostic format.

There's just a whole ecosystem around it that there just isn't and I can't believe it ever will be around PSBT format.

And so we're trying to do things in a way that we're trying to do things for the ages.

And so I think it would have been nice if PSBT had been based on CBOR, but because it doesn't tell me that that's not compelling reason to me personally to say, well, now we should start basing everything that touches Bitcoin on that format.

It's not a bad format.

It does what it needs to do.

So I'm not knocking it for its singular purpose, but I think that we're trying to access a larger number of purposes.

And to do that, we really want to leverage things that have a basis in the standards community and give us the advantage that we need, which is why we took such a time to so carefully review the various kinds of binary encoding formats that are out there.

Yeah.

Also, like earlier this year, there was some discussion about using, forgetting the bit, but it's basically being able to sign with Bitcoin descriptors and other different types of things.

And there ends up being some interesting policy implications.

There may be some interesting variants and stuff.

And we really wanted to be able to support a variety of these futures, whereas Bitcoin descriptors was very much oriented to what the limitations are of Bitcoin Core.

And I don't see Bitcoin Core signing messages ever again.

We'll see.

But I think there are a variety of things that wallets will need to do that are important there.

And then there are maybe scenarios where you can't trust the medium that you're transporting.

We're already copying too much to the clipboard, and there are too many tools that look at the clipboard.

And so we also have the ability in the future to do things where we're wrapping these in various kinds of tofu encryption stuff so that a sneaky snoop on the places where we transport these kinds of things can't grab this information.

So I feel like there's some important things there that are beyond just the narrow definition of a Bitcoin's descriptor that can be used by Bitcoin Core.

But I'm open to other people have other opinions.

Yeah, this is the time.

This is our discussion forum.

So please, if you have other thoughts, fully baked, half baked, whatever, please, let's move the conversation forward now.

I think we've stepped up.

We've created this thing to try to address concerns.

If you read the document itself, it basically lays out all the concerns we've tried to address and how we've chosen to address them.

And so we need feedback.

Can we at least agree that PSPT is still already very embedded in the Bitcoin community and with respect to communicating between the controllers?

Sorry, coordinate.

We support PSPT in our code base.

If you support PSPT, yeah, you have to.

But not as a generic binary encoding format.

No, no, no, but you have to support PSPT.

And that's part of the point.

I think the point of PSPT versus CBOR is that it's very, very, very simple to implement.

I did a few, as I said, a few hundred of lines.

I think it's not complete.

It's only lacking very few features.

And it's still-- Our code base supports it by using libwally.

So we're using libwally's implementation of that.

So we did not even have to implement that because that was implemented by libwally.

So when we encode and decode PSPTs, we're using libwally.

And we're writing our own shims on top of that to make it more useful for Swift in a more natural and Swift environment.

But we did not have to implement that ourselves.

And that's one of the advantages of going-- of the existing PSPT format.

But that doesn't apply to all these other formats that might be based on a similar schema to PSPT.

Libwally is probably not going to implement the output descriptor format you're proposing.

So-- Yeah, but that's what I'm saying.

And a very end of my proposal is because it's using the same PSPT encoding, the libwally will support output descriptors as well.

It'll just have a-- yes, because it's just an unknown identifier.

It will still use the same-- I would have to see that because right now, it's API doesn't include anything to do with generic PSPTs.

It's just-- it's basically all the APIs say PSBT this, PSBT that, not anything else, not output descriptor, nothing like that.

So what you're proposing, I think, is really just a new binary output encoding format that would compete with C4.

No, no, no, it's not.

It's an extension to-- PSPT has extension-- is extensible because it has this field identifier that says this is the kind of field, this is the kind of-- it has a key.

Very basically, it's maps.

So where every map entry can have a key and a value.

And it has an ID in the form of an integer.

That integer tells what is the purpose of this entry.

What is the semantic meaning of this entry.

But there's no-- in my proposal, I'm not encoding the output descriptor a different way.

I'm just-- like you, I'm reserving.

I intend to reserve it, at least if I push this forward, and tendred reserve an identifier, a PSPT map entry identifier saying output descriptor or whatever, and then specifying that the value will be the text that you've shared.

Yeah.

Yeah, let's-- I mean, we should-- at this getting into a little bit detail, and I'd love to go into it.

But let's just be clear on two different issues.

One is that there is sort of a weird collision of layers here, one of which is a storage format that allows you to store these things securely, transfer them securely versus something that maybe is something that is more manipulable, copyable, copy and paste, select text, et cetera, et cetera.

And I feel like those are not absolutely incompatible.

I mean, I imagine that you could probably coerce your kind of text format into a binary storage format and back very easily.

But I also feel like this is also where we have put down some details of a particular proposal.

But in the end, if you, Craig, can other people all say, no, we want to use the descriptor format that you have recommended or some variation thereof, then our answer would be, OK, well, this was a useful discussion.

And let's just wrap your format in a different 40,000 tag if that's what the community wants to do.

So I just want to be clear, this is an open-- we are an open development organization, and we're trying to serve what we heard as the needs.

But this is not a standard.

This is a research document, and it's really kind of up to the community that is actually shipping wallets to leverage it.

So we will adapt to whatever the community decides, which generally is two unrelated companies wanting to interoperate.

Yeah, I'd also like to just raise one other issue, which is that if you are going to extend PASBT-- and I understand it was designed to be extensible.

I understand it's a map.

And of course, we're using a map in CBOR as well.

So that functionality has some parallelism there.

The question is, OK, so it started out as partially signed Bitcoin transactions.

Now you're extending it for output descriptors.

The next thing that comes along, you're going to extend it again.

The next thing that comes along, you're going to extend it again.

Where do you draw the line between when you continue to use that and when you say, well, why didn't we just use CBOR in the first place?

We're supporting PASBTs because they are already widely deployed.

But a binary form of output descriptors is not already widely deployed.

And we're trying to-- and we're basically drawing the line ourselves and saying, going forward, we think everybody should be using CBOR for as much as possible.

PASBTs, the horse is already out of the barn there, so we support it.

We wrap it with a tag.

Whereas everything else going forward, including things that are much more sophisticated, Gordian envelope and things like that, we're choosing to base on CBOR because it's designed to be way more flexible in terms of its ecosystem and its support and its community and standardization than PASBT was ever intended for.

So it does require a full decoding library, right?

No, but yeah, but you can decode CBOR in a very small number of lines of code.

Yeah, there are some very tiny CBOR encoding libraries that are designed-- and CBOR was originally designed with minimal codecs in mind.

And there are numerous third-party implementations, some of which are extremely tiny.

So I suggest you take a look at some of those implementations and see how tiny they really are.

We also last month discussed hard coding specific implementations.

If you're in a resource-constrained environment, you can just encode or decode the tags that you-- Yeah, you don't have to be involved.

You can't do that.

No, you can't do that for decoding.

That's not true.

If you decode, you have to support everything that is specified.

That's not true.

That's not true, depending on the format you're decoding.

Because if you know that what you're getting is an output descriptor, you know there's no floating point values in it, for instance, then your CBOR decoder does not need to support floating point values.

So that's one trivial example, but there's many others.

Yeah, and also because it's a deterministic CBOR, I mean, everything kind of rolls the same way.

You can create a fairly primitive parser for well-known values of things.

So you don't have to at least to parse or write CBOR.

You don't have to have a full parser.

Even if you're doing PSBT, really, if we look at what's on screen here, this is just some identifier and some map keys and some values.

The code is very, very similar.

For me as an engineer, I would rather use something that is intended from the beginning to be extended and has the ecosystem as Wolf says versus sort of take the fact that there happened to be a couple hundred lines of code already written for PSBT shouldn't be the reason, I think, that you choose a particular format.

Yeah, I would agree with you there, Ken.

I think this is a good proposal.

I like the fact that you've listened to the community and gone for a version update rather than just something which was completely different.

So I think that is noted.

I like the code reuse, which you've done here.

I think that that's very helpful.

And I like the fact that it's just really quite simple in terms of the approach.

We haven't, there's no, feels like you have to get the version three, which is a step back from the version two and kind of just does what it needs to do.

And it feels very much like that is the case here.

So I like it and it seems like this will work.

Thank you, Greg.

Let's move on to, because this sort of is beginning to also touch the territory of our next question.

So there are 13 plus wallets now that support the UR format, in particular the animated QRs for PSBTs.

I don't know how many wallets support some of the other UR things.

I know, you know, Greg supports the old UR for the old crypto output, but I'm not quite sure if as many people do it.

And then we really, as far as I know, never really had anybody adopt some of the more advanced UR variants.

So the 13 plus wallets are all PSBTs.

Qoinkai recently introduced BBQR, which also does animated QRs.

It's slightly more compact, but mostly because it doesn't use fountain codes.

It only does PSBTs and is kind of locked into that and it's incompatible with UR.

And, you know, assuming good intentions, you know, why did they do that?

Well, one reason why they say they did it was, oh, there were too many dependencies.

And I'm kind of like, okay, well, maybe you misunderstand the dependencies, or maybe we can write some kind of mono repo or something of that nature.

Because right now, I will say, you know, we, you know, partly just because of constraints on our team's time and budgets, you know, our revenues as a not-for-profit, you know, getting money from patrons and not selling product is lower this year.

We just haven't received as much this year as we have in previous years.

So we haven't done a great job in kind of having, okay, here is a single document that describes everything you need to know to do a PSBT in a UR.

It's kind of spread across a couple of different documents and such for good reasons, but there's no reason why other than just the time, we couldn't write something.

It was just about that.

So in theory, based on the two, you know, comments from CoinKite on why they want to use BBQR rather than URs, I think we could address them.

But I think it's more important, you are the real community.

I invited them here.

They're not here today unless somebody snuck in while I wasn't looking and would welcome them to participate in this community.

But you are the real people who decide on what our priorities are.

So, you know, are we not meeting the requirements?

Can we make it simpler with a more dedicated, don't want to call it a fork, but a subset of our reference code just to do one thing or a minimal number of things?

And, you know, do we really need to spend the time to write that kind of combined, you know, wallet improvement puzzle and turn it into a sort of a BIP style singular document, which, to be honest, will just take a lot of time when we want to, you know, move forward on some of these other things.

So I also have a demo I'd like to give when you finish, because I think it would actually I'd like to kind of make sure people understand the value proposition of what we've done compared to what CoinKite is proposing.

Sure.

But so at the end of that, you know, think about what is that you're looking for?

And if some kind of you are 2.

1 in particular for a PSB T's or maybe PSB T's plus crypto output, a couple of others, you know, would help you and how important is that compared to some of the other things that, you know, we can facilitate because our job is to serve the wallet community and make sure that those people who want to interop and want to work together and want to do open source and want to do open development together is served because when we have that interoperability, we're really serving the user and that's the, you know, it's indirect, you know, we don't get customers coming to us directly, but we're trying to preserve the, the, you know, privacy and security of the self sovereign users.

So that's our real goal.

And, you know, we're, you know, what do you want to see us do?

Okay, go ahead and take over the screen.

Just say quickly, like, as far as CoinKite is concerned, you're going to have a hard time getting them to adopt you are as it is, because they're going to have to implement their own version of it, because they're not open source anymore.

So they're a source of usable source available, but their license is not compatible with a lot of open source licenses now.

So our licenses is, is, is, is, was it BST?

No, what's, what is our license?

What's our what?

It's BST plus patent, a BST plus patent.

So I mean, as far as I know, they could use, I mean, I'd be very surprised if, I mean, are have they warranted that they use no open source software whatsoever?

That seems like they replaced all the treasure code with their own implementation, I believe.

Okay, well, their commons clause license.

So it just might, I hope maybe there's a way to do it, would be great if there was, but as far as I know, but that kind of walked them out to a bunch of open source code.

Well, that would indicate why they're being trying to be low effort.

So, but let me let me show you this real quick.

This is, we have demoed this in a different, in a different, in a different video.

At some point, you should be seeing my iPhone screen.

This is actually my Mac screen showing my literal iPhone screen right now.

So, and it's running your kit demo.

I also have the iOS simulator on my computer running the same demo.

So if I pull up my screen here, see there is the actual, I'm showing you the simulator itself now running that.

And this is the, this is right now, this is the UR kit demo app.

And right now it's looking for QR codes.

And so if I start, for example, just say I'm going to choose one kilobyte, 250 byte fragments, which is totally 24 four and a max by our fragments, I have to 250.

You'll see that as soon as I click this, it starts reading and it's basically finished reading it at this point.

I'm going to actually turn on sound here so you can hear that a little bit.

So let me see, we do here.

And then I'm going to actually come back here and choose a much larger one.

And I'm going to let it run for a moment here as well.

I'm going to put it mostly off screen so it can't read the QR code, but you will still see it.

And you see it's actually going through a fairly high map data here.

And as you see, it's actually reading pretty big chunks of this data.

You see the progress bar at the bottom is an estimate, but the point is it didn't have to actually cycle through all the fragments of this.

You can see it's actually each fragment is sorry, let me read the camera here, is a mix here.

So there's a mix of fragments in each one.

There are XOR together.

And this is the rateless fountain codes.

Now, of course, the density of the code and the speed at which you run it are all variables that you can adjust.

But let's actually try, for example, 10 kilobytes here.

So I want to point out that you notice how it's actually, actually, let me try 10 kilobytes at much smaller fragment size.

Let's see.

Yeah, 10 kilobytes, 250-byte fragments.

So notice if I just move it away and move it back, it's actually caught some of the initial ones coming through.

And now it's going back and filling in the gaps.

And I can basically miss as many codes as I want to.

And it still actually recovers very quickly.

And that is a big part of the value proposition of this.

The first cycle of fragments is just the actual original data.

So if you catch it from the beginning, you only need one read of each QR code.

Whereas if you catch it in the middle or miss one along the way, you don't have to wait for all of them to be recycled.

That's the actual value of using fountain codes.

And it really is an opt-in thing.

You don't even have to use the fountain codes because what we're doing at the beginning with the initial set of fragments is essentially the same thing that BBQR is doing.

And of course, because these are URs in there, they're encoded using the very efficient alphanumeric format, which BBQR says, hey, we're using the very efficient alphanumeric format.

That's great.

Glad they arrived at the same conclusion we did.

We're using URs.

They're using-- there was a base 32 or whatever, base 36.

And they're using a compression format on top of that.

Gordian Envelope supports that if you really need something like deflate compression.

So I think we're offering a lot of advantages that are opt-in, whereas they're saying this is the way that we're basically going to be the 600-pound gorilla.

Personally, I think the community should be the 600-pound gorilla.

So that's my opinion you need to take on this.

We had a question from Ori.

So yes, there is very good references for all of this in the research repo.

Good reference code.

It's implemented in, I think, five or six languages now.

What we don't have is kind of what I would call an ITF style reference to it.

Or a BIP style complete reference.

It's a little bit split over different places because some of the individual components are reused.

So although the animation is very efficient with the fountain codes and things of that nature, part of that efficiency works because of the text URs that we use that could also be used over signal or over other non-QR transports.

But if you'd like some tips to do that.

There also are some interesting things.

Fountain codes have some interesting patent issues for some variants of them.

And we chose one that was, as far as we know, free and clear.

So there are some more efficient fountain code variations out there that are patent and comfort.

So I hope that helps.

Yeah, the actual to Ori's question, and to address what Chris was saying, we don't have a single document that you would implement UR and fountain codes from at this point.

And what we do is if you look at the actual UR document, I'm actually going to put the link in the chat here, is we describe our methodologies in general.

And then we do refer you to the reference implementation in Swift, and particularly the actual unit tests, which are built up in a logical way.

If you implement the unit tests in order, by the time you're done, you have a completely working UR implementation.

And that's how several third-party developers have gone through and implemented this.

We should at some point actually turn this into an IETF style standalone implementation guide that you should be able to implement from without any reference to the code.

But we haven't had the resources to do that at this point.

And that hasn't stopped people.

And I think that's really important.

People have had success doing this at this point.

And yeah, if you don't need the fountain codes, the implementation is actually pretty trivial.

And you probably can implement that from the UR stack alone.

If you want the fountain codes, you do need to look a little bit at how we're doing it, how we're choosing random numbers, because they're pseudo-random that both sides have to agree on, how we're creating the probability distribution of what we're going to include, things like that.

There's specific code for that that's based on well-understood algorithms that we've chosen and documented in the code.

So that doesn't need to be at some point broken out into a separate spec.

But for now, what's there is useful and stable and several people have implemented it.

And like I say, even for a Rust library, we went and implemented our UR additional functionality on top of a third-party UR library, because it already existed in Rust.

Sort of related to that, in the non-fountain code, that is, you could print those on multiple sheets of paper.

So it doesn't have to be an animated medium.

You could start at the end of the fountain codes and go to the beginning, end of the stack and go to the beginning, and it will order them properly after you've scanned all the images.

And basically, it's designed for anything that is binary CBOR.

So it isn't locked into only, say, Bitcoin PSBTs.

It's generally useful for anything that can be described in CBOR, which is part of why at the beginning of this meeting, we were talking about, oh, to do proper CBOR, we had to do some renumbering of our tags and stuff, because we really want it to be layer independent and be able to serve a future where we're sending completely different types of things than what we're sending today, and it'll still work.

Wolf, should we go any questions on-- oh, sort of back to our requirements.

That was kind of like, anybody have any-- is it worth our time to-- I mean, what would be your priorities as far as what you would like to see us next to do or to address the BBQR fork?

Chris, I've made this point in a previous meeting.

I do think that a single document that specifies this completely is a useful thing.

I don't think it's ideal that part of the-- and I'm using air quotes here-- specification is in the code.

I understand why.

I get that, but if you were to ask one thing that I think would help, I think writing it all out, putting it in a document would help.

That's my feedback.

Thank you.

Anyone else?

I'd like to add on that.

I think, actually, I think that the CBOR encoding for the UR themselves is overkill, because it's such a simple structure.

And it's almost unfortunate that you had to, at least in theory, have the complete CBOR decoder to be able to decode just the fragments.

But I think if you do write it out, it's possible-- as we talked about the last time with respect to the output descriptive format-- I think for URs, it's very possible-- it's likely that it's possible to write out the complete binary representation without specifying to CBOR.

And just know that it just happens to be-- happens to be compatible with any CBOR-compliant decoder.

And I think that's very valuable to do, because one of the things I like about BBQR-- I don't like it because URs are widespread, so it's kind of too late.

But as a single-- as an isolated specification, I like it because it doesn't have this very-- it doesn't have a reference to another binary format just for encoding fragments.

I can understand why the more detailed formats such as output descriptors and so on, that you want to be-- you receive over that.

But just for encoding, fragments in QR codes, that seems like overkill.

OK.

Well, I'm going to put a call out to continue this discussion.

Shannon, can you take a note to maybe talk about a-- I don't know what the right term for it.

I keep on calling it mono-repo, but I don't think that's the right term, but mono-spec, et cetera, just for QR, UR, PBST, and some reference code that maybe doesn't parse all of-- doesn't use a traditional CBOR parser as a goal and see if we can't get some of you to kind of help us do this.

Again, I am-- it is a budget issue.

Because the crypto winner has not ended for us, despite Bitcoin and other currencies coming up, our donations are significantly down.

And so we're trying to be very careful.

So let's marshal the community.

The more people that are interested, we will up the priority of writing this.

Else, we will help coordinate us all writing it together and maybe sharing some resources to do it right.

I'm back.

I apologize for the drop.

It doesn't even have to be-- I apparently decided to crap out.

OK.

It doesn't even have to be a single specification for my sake.

I agree with Craig that I just want to see a specification that doesn't refer to reference code.

It can't be, of course, pseudocode or something.

But I'd prefer to not just use a specification that does not refer to, say, a Swift or Rust or whatever.

I think we all would.

We all would.

OK.

That's one of the things-- I did re-implement all this in Go when we did the seat hammer implementation for it.

So I've been through this.

And that was one of the-- it's not like the code is that difficult to read.

It's just once you go to the level of code, you have to build up an abstraction in your head from that code.

Whereas when you read specifications, they're designed for humans to transfer the pertinent knowledge and not all the extra stuff that programming language is fortunate to do.

It's also my-- Absolutely.

I absolutely agree.

This also might be something on your teams if you've got a junior engineer or somebody you're trying to bring up to all of these things to give us some percentage of their time to help work on these and test them, et cetera.

That also is something that could help make this come out faster.

I was just going to ask if you guys have an estimate of how much work that is remaining to do that?

Probably a couple of weeks.

It's always a matter of juggling priorities.

And because we're already seeing very good adoption of who you are without having done that, there maybe hasn't been enough impetus.

Although we're completely acknowledged that we need a better spec.

Again, it's a matter of do we have the resources to get that better spec while people are actually adopting you are.

I think Christopher and I completely agree that especially if you are is going to advance through some kinds of standard process, which we'd like to see it, including the fountain codes, then it really should be a standalone spec, as you suggested.

Right now, I feel like it would be half an FTE or MFTE monthly full-time equivalent.

So like half a month or so to write a better spec by a senior engineer.

If we're also writing a reference library that kind of competes with Bbqr that only does one thing and does it well and efficiently, that's a bit longer.

But sort of a BIP quality document standalone, only about QR, UR, PSBT.

Actually, it only has to be about the fountain codes, because once you have the fountain codes, then you can refer that spec in other higher level specs, such as you are.

The only need to get to the combined payload, in my opinion, that's covering everything that Bbqr is.

That's what I would focus on.

I think the PSBT2 that we are using right now, isn't it just a crypto bytes or something?

No, it's a specific PSBT wrapper, which is a CBOR tag with the actual binary string inside it, which is the PSBT.

I mean, you don't have to have a CBOR parser to turn that into byte words.

No, it's two bytes at the beginning.

You just look at them and you say, "This is a PSBT," and you discard them, and then you just process the rest as a PSBT.

There's a length indicator as well.

It's only if you want to do things generically and handle more kinds of things that you need some kind of limited CBOR support.

Anyhow, let's move on to Gordian depository, because this has been something we've been working on for a long time.

Can I just ask two questions before you move on?

Sure.

The last time we talked about the unfortunateness of the previous output-discrete form, not being widespread enough, and one of the suggestions was to specify the format as a BIP, because as someone brought up, BIPs are, for better or worse, the reference and specifications for the Bitcoin community.

Is that something that you plan to do with the new format?

Yes.

Again, I'll be clear.

For instance, this Gordian depository, we consider to be very significant, because if we can get this rolled out and get parties like Human Rights Foundation, Museum of Modern Art, etc.

to participate in this, maybe we will get more donations into Blockchain Commons, because we are now offering a legitimate competitor to some of the vendor locked in social key recovery things by Ledger, and I'm hearing some things from Spiral and Square about this type of vendor locked social key and sovereign key recovery.

I have been prioritizing Wolf and Shannon in my time and a couple of other contractors to focus on this, because I believe this is going to help us get the kind of patronage that we need.

And then hopefully there's enough time, people, I want to bring some more people on board in the coming year as sort of journeyman engineers, journeyman self to work on things like BIPs, reviewing code, etc.

So it's sort of a budgetary thing.

But yeah, absolutely.

We wanted to do this as a BIP for a long time.

So you're not suggesting it for widespread implementation before it's for BIP.

That's what I want to be clear of.

I want to have whatever the format ends up with, I want to see widespread support for it and not end up in the same situation.

We don't want to be in a chicken egg situation, though, because we need to know the community actually supports this before proceeding with a BIP, because what we don't want to do is bother with a BIP and then have the community say, who are you?

So we want to know that the community feels like they're behind this.

And so we are creating reference implementations and people are able to try them out and see if they work.

I'm not suggesting that people base their entire product strategy around them at this point.

But I think it would be a mistake to just ignore it until it's a BIP.

Yeah.

And again, it's for us, one of the biggest signals is at least two companies working on it together for interoperability.

So I mean, here in this room we have, well, Craig isn't here right now, but he was here earlier.

We have Ken and Craig from two major Bitcoin wallets, and they basically said, yeah, we want to make this work, we want to make this interoperable.

That raises, it's a signal for me to raise a priority of also writing in a BIP so that we can get it out to the next three people, dozen people, the world.

And that's how I try to prioritize these types of things is one of the signals is donations and what a patron says is our priority.

And another signal is when I look at the donations from the Bitcoin community to Blockchain Commons, it's $1,000 a month of small donations.

I'm not including the patrons.

I mean, we have Ken and others who are patrons in the Bitcoin community.

But that's a signal.

I mean, it helps do it.

And then of that very important signal of priorities is, oh, there are two or more companies that are saying this is important and we want to implement it and we want to make sure we interoperate.

Does that make sense?

Sure.

Okay.

So Ken, and so what's the, I'm looking for, what's the next step on the operative script performance?

That's basically it.

What's the next?

Is it wallet implement, implementers like Ken and Craig?

Is it, is it you writing BIP?

Is it, what's the next step here?

I think next would be basically that, you know, developers who are in a position to use this need to, you know, satisfy themselves that it is what they're looking for.

And then they need to at least voice their full-throated support for it to the community, you know, to make some kind of public declaration, you know, tweets or whatever, or a co-signed letter or something like that, saying that, you know, we support this proposal becoming a BIP.

So this is something that once we actually refer to it, then, you know, in our BIP proposal, that people understand there is support for this.

And so, you know, because, you know, there's undoubtedly people once we start that process that have no idea who we are, who have never seen our, one of our proposals before, and who are going to put up resistance.

And so we, they need to understand that this is not coming to Ethel and Denova.

That's actually something that the community has already reviewed and is already supporting.

Anyhow, we're making, as Christopher mentioned, making donations would be a good idea too, because that actually shows that people are willing to put their money where their mouth is.

Yeah.

So we're down to just the five of us at this point.

I had really hoped to do this demo, but it's not clear to me that we shouldn't defer this until January, unless, you know, Ken or, I mean, do you want to see this now?

We are recording it.

People will be able to see it later.

What's your take?

That's your call.

I'd watch it if you're going to show it.

Okay.

Well, let's go ahead and do this.

Wolf, when you, I think I'm going to separate this out into a separate video.

So if you can reintroduce yourself and Blockchain Commons, and we'll have this as a little standalone demo for the people who weren't able to be at this meeting today.

Yeah.

And if you could, there's a Zoom setting, I think you should probably go over and review between meetings, which actually a lot of people do full screen shares, but right now I can only share one window at a time.

And for this, I really love to share everything.

If you wouldn't mind making me a host, I think we've established that I want you to interfere with your recording, then I can have host powers and share part of my screen, which I think would be helpful because I wanted to play more than one window at a time for this demo.

Okay.

I just made you host and I'm stopping my share.

Okay.

And let me see here.

I'm not seeing share.

I'm still not seeing share portion of screen.

So I've never been able to get that to work.

Well, I mean, obviously it works for me when I'm hosting.

So that's because I use it all the time.

Let me try one more time.

No, it says you are the host.

Okay.

Well, if this isn't going to work, then I'm just going to go ahead and make you the host again.

So because there's no reason for me to host if I can't use the the superpowers.

So I will, I will make do with what I can here.

So pull up the window before you introduce yourself.

Yeah.

Okay.

So you should be seeing my VS code here.

Blockchain comments depository.

Okay.

Okay.

So I'm Wolf McNally.

I'm the lead researcher for blockchain commons.

And this is a walkthrough of the work we've been doing on the blockchain commons depository.

And as the introduction says, it's a, it's survey software that provides for the secure storage and retrieval of binary objects without regard to their contents.

And typically use cases would be shards of cryptographic seeds or private keys created using Shamir secret sharing, which, or our layering on top of that, which is called sharded secret key reconstruction or SSKR.

And so various, various parties around the world can run these depositories or depots, as we call them, to provide a distributed infrastructure for secure and noncustodial social key recovery.

So the idea being that you're providing a public service anonymously and securely to various people to not store entire keys, not store entire, entire, you know, keys to their Bitcoin, you know, wallets or anything like that, but shards of keys.

So it doesn't matter if, you know, so there's, and generally speaking, these are broken up into several shards.

But what we're going to be talking about is kind of generic binary objects or blobs as they're sometimes referred to.

So this is software written in Rust and it uses a MariaDB, which is based on MySQL backend.

It's a very simple database schema.

The instructions here show how to install it on a Mac, but it should run on anything that runs, that can run Rust and MariaDB.

And you can probably substitute MySQL equally because MariaDB is designed to be a drop-in for MySQL.

So don't be put off if you're not familiar with MariaDB.

It's basically just MySQL.

This is early stage software.

So right now our code basically logs into the database's root with no password.

Obviously that's not deployment level, but this is just a community preview.

And then this is basically how you install it, and how you run it.

And when you run it with Cargo Run, you'll see welcome messages, including the server's public key, which is a UR Crypto Pub Keys, which is based on our uniform resources format, which is the public key of the server.

And you need to use this to access its API.

And this is a, I mentioned the root no password.

So once you actually are sure that it's running, then you can basically actually just do a GET on localhost at 5332, which is the port it uses.

This can of course be put behind other services like Tor.

But other than this one GET endpoint, there are no other GET endpoints.

It's all post.

And because part of the protocol here is to be as anonymous and as generic as possible.

And in fact, even the API is designed to be what's called Tofu, which is trust on first use.

So trust on first use.

So there's no account actual creation.

The first time a client stores a blob, an account is created for it.

The client's public key is used to identify the account.

So if you want to shard your key and then store on several different depot servers, or depot servers actually, it's the right way of saying it, depot, into the T, depot, it doesn't.

But because it's short for depository.

So you identify your account with the public key, which means you have a private key associated with that.

Now, how do you avoid losing that private key?

Well, there's fallbacks as well, because the idea is to have fallback methods of retrieving your data.

So if you lose all your data, including your public key, you should still set up a fallback method.

And we'll talk about that.

So all requests to the API include the client's public key.

Then that identifies the account, but must also be signed by the client's private key.

And because this is public private key cryptography, the server can then verify that, oh, yeah, the public key that's asking for this is also the key that signed the request.

And then also has to be encrypted using the server's public key.

So there's no man in the middle attack.

And when I say no man in the middle attack, I want to be very clear.

This is an HTTP server, but the protocol we're running is designed to run on anything, including QR codes.

So we can't rely on parts of the stack like SSL, because they aren't always going to be present.

We don't know what this protocol is going to be running under, even though this current implementation uses HTTP.

So understand that the encryption that's going on here is going on separate from anything else.

So we encrypted to the server's public key.

So basically, there's no repudiation of the request, and there's no man in the middle attacks, because it's not clear to a man in the middle what's actually being exchanged, whether it's a request to retrieve a shard or to store a new shard or whatever.

So the server validates the public key and the request matches the key used to sign the request.

All responses from the server are encrypted using the client's public key.

So the process reverses for the response and are signed by the server's private key.

So when the client gets back the response, it verifies that there's no substitution or man in the middle by checking the server signature based on the original keys it received.

And again, what you're storing with the server isn't even something that can be used on its own.

It shouldn't be.

The server never cares what's actually stored there.

It might put limitations on how large a blob can be stored by people or rate limiting, things like that, which we haven't implemented yet.

We do have a maximum blob size that can be stored currently implemented.

But we haven't, for instance, done any kind of other attack prevention like rate limiting or things like that that would deflect DDoS attacks.

But that's something that obviously we want to make sure we are resilient against.

So once you verify the server's private key, you decrypt the response with the client's private key, because you're the client.

And the client needs to verify the signature when sets are encrypted.

And then basically the integration tests are one of the best ways to learn about the actual API.

But let's break down what the API actually includes right now.

There's nine supportive functions.

The first three are about storing, retrieving, and deleting blobs.

First one's called store share.

Stores a single blob associated with the client's public key and returns a receipt.

A receipt is just a piece of random data that is the key of that blob.

And yes, the client needs to track of the receipts.

But remember, if I'm breaking something up in like a three of five, then I'm using five depot servers to store these five shards and I'm keeping five receipts.

Now, all I actually need to retrieve all my blobs is my private key.

But if I want to retrieve specific blobs, I need the receipt.

So you can say, you know, give me just the blobs associated with this receipt or these receipts.

Or you can say, just give me all my blobs on this depot server if you have any.

So store shares.

So you store the API currently supports storing one share at a time because why would you need to store more than one at a time?

But you can get multiple shares at a time.

It takes lists of receipts and returns the blobs associated with the client's public key and lists of receipts given.

And if you pass an empty list of receipts, it just returns all the blobs.

And that's what I was referring to before.

You can also delete a set of blobs according to receipts.

And of course, below you'll see you can delete your whole account too if you want, if you just want to erase all your data, including your account information from the server.

So account maintenance, you can rotate your public key, because internally on the server, public keys are not the primary key of the account.

It's a random identifier and the random identifier doesn't change.

It's never divulged, but the public key can be rotated.

Update recovery.

So updates are removed with the client's recovery method.

This is the fallback I was referring to.

This is a second factor authentication method that's used to authorize assigning a new public key.

And I'll show you how that process works in a moment.

Excuse me.

So this returns your client's recovery method if you want to verify that you have a recovery method installed.

And then to start the recovery process, you include your new public key and the second factor.

So let's say it's my phone number that I want a text to.

And we're not actually literally supporting SMS.

Not yet, this is to do, but understand that normally I would declare this is my recovery method.

This is the new public key I want.

And then what happens is then what would be SMS to me is called a continuation.

We're currently just returns a continuation key, but the continuation itself is a stateless packet that basically says the server is encrypted to itself saying, yeah, if I ever execute this, I'm going to update this old key to this new key.

And it's totally opaque to the person who receives the continuation.

All they can do is send it back to the server, sign with their new public key to say, yes, I'm the person executing this continuation.

And that completes the process.

So how you get the continuation to the user depends upon which second factor authentication method you support.

And finished recovery, this is where you hand back the continuation you've received using the second factor authentication method.

There's also a time limit to avoid replay attacks.

So if the continuation hasn't expired, the client's public key is updated to the new public key.

And finally, delete account, which I mentioned before.

So there's two crates, Rust crates here.

One of them is the depot server itself.

And the other is the depot API crate.

And this is used to provide the REST API for the depot server.

And it's intended to be used by clients that want to store and retrieve blobs from a depot server.

So if you're writing a piece of Rust code or any other code on top of Rust that just needs access to the depot server, you include the depot API crate because it will basically marshal and un-marshal all the envelopes and stuff like that for you.

You don't even have to think about the other layers, even though we are using our stack, including Gordian envelope and so on.

The higher levels really don't need to be concerned about that.

What blobs do you want to store?

What are you going to do?

How are you going to deal with receipts?

And everything else is taken care of by the depot API crate.

So you don't have to be aware of all the details, even though I'm going to go into a couple of them here.

Okay.

So that's your high-level overview.

So here's the depot crate and here's the depot API crate.

Real quickly, I'm going to look at some of the unit tests here because unit tests are actually really, Rust integrates unit tests very nicely.

So here's what a request looks like for a depot server.

All the stuff popping up.

And this is essentially Gordian envelope format.

This is Gordian envelope notation.

So if you're familiar with JSON, you're not looking at JSON.

And if you're familiar with Seaboard, you're not looking at Seaboard diagnostic notation.

This is for Gordian envelope.

It's a hierarchy and it's a tree of nodes essentially, but you don't need to worry about that.

Right now at the top level, you have the subject.

The subject says this is a request with a random identifier.

ARID stands for apparently random identifier.

And we have a document that documents what they are, but basically it's 32 random bytes.

You're seeing the first eight here.

And then within that, so there's a subject and there's a set of assertions.

And there's one assertion here which says the body of this request is the function store share.

These double angle brackets here basically means this is a function Seaboard tag that is used to tag function calls.

And we have a way that we support within Gordian envelopes of saying this is a function call.

These are the actual parameters.

And that's the heavy angle brackets you see here says these are parameters.

Now, why are we real briefly, why are we calling these out as separate and why not just use strings?

Why are we tagging them separately and putting these angle brackets around them?

And that's so you can have other assertions that aren't actually parameters and things like that.

So Gordian envelope is very flexible about that.

But because we believe that function calling using Gordian envelopes is going to be a major use of that, we're providing some special affordances for that in our envelope notation here.

But these are just Seaboard tags, this and this are Seaboard tags.

And then these can either contain strings, which they do here, or they can contain integers, which makes them more compact.

But right now we're just using strings.

So in this case, the request here is to store a share, stop it, of just four bytes.

Obviously, most shares you store would be bigger than that, at least 64, 128 bytes or something like that.

And then the key is a public key base.

Public key base is a user's public key.

And so that's what a typical request might look like.

Now, what does it look like when it arrives to the server?

When it arrives to the server, it's just encrypted.

It's an encrypted thing.

It's encrypted message.

And it has one assertion, which is has recipient sealed message.

Now, what is the sealed message?

The sealed message is the actual key, the symmetric key, stop it.

I got to throw up my presentation.

The sealed message is just the symmetric key of the encrypted message that's been encrypted with the server's public key.

So the server can decrypt the encrypted message with its private key.

And so the envelope that actually arrives, you can't tell who the signer is.

You can't tell who sent it.

You can't tell who was supposed to receive it.

You can't tell anything about it.

And that's part of why this is why we consider this to be a very secure format.

It's because there's very little information exposed, except this is an encrypted message.

So what does the message look like once it's been signed, but before it's been encrypted?

Well, as you can see, here's the same request we had before, but it's been wrapped.

And wrapping envelope is something you do when you want to basically do something to the whole envelope, like sign it or encrypt it.

And then it has a verified by signature.

And this is the client's signature that they added to it.

So this request envelope has been wrapped and signed by the client.

And then it's encrypted to the server.

So again, you see the human readable format of this when this is transmitted on the wire or in the QR code or this is all binary using Seaboard.

So that's basically what the request response -- and the response is also very simple.

I'll show you what a couple of responses look like.

But it's basically the data you requested or an error of some kind.

So in the depot API crate, which is again, marshals and un-marshals these nine calls, for example, let's look at the store share call here.

So this is again, this is the unit test for this.

So it's basically composing.

It's saying let's create a private key.

Let's derive the public key from that.

Let's create a store share request with a new random ID and our key and the data we want to store, which is just the byte string DATA.

And then we're creating an envelope from that request.

So the request basically emits an envelope, a gory envelope.

And then we basically want to assert that envelope has a specific format.

And this is it.

Okay.

So -- stop hovering.

So as you see, it's basically the same thing we just showed you.

But now it's basically doing the check that yes, if you use a fixed ID, which normally wouldn't because this will be random, then you get this thing.

And then -- and this is the actual store share request.

This has two parameters, data and key.

And then the response would be this is your response to the same ID.

See, they match.

The result is byte32.

This is your original -- this is actually the receipt that was generated from your storage.

So I mentioned if you want to give a specific share, you need the receipt.

This is the receipt.

And it has one assertion on it saying is a receipt.

This is basically a way that envelopes use to identify types of objects is they use an is assertion with some kind of type after it.

And this basically means that we don't need to like use C-board tags for everything or anything like that.

We can actually -- this is how the kind of the semantic network community does things.

They'll put assertions on things saying this is a kind of thing.

And so you verify that yes, it's a receipt.

It's the result.

And this is the 32 bytes that is the receipt that you use to retrieve it.

So if you look at the -- if you look at the -- let's see.

The get shares call.

Same thing.

All the code you see above here is all the stuff, all the boilerplate and so on that marshals and non-marshals, the format.

So here you see a request to get shares.

It's got your key.

It's got one or more receipts.

So here's a receipt assertion.

A receipt assertion.

You can have more than one.

And so you're passing it back the receipts you want.

And then this response includes a result okay and then the actual bytes.

So it's the receipt is the key and the bytes that you asked for is the value.

So you can correlate your request to the response.

So it's saying, yeah, for this receipt that you handed me, here are the bytes.

For this receipt you handed me, here are the bytes.

This is the bytes you originally stored.

So, you know, and then, again, these all go through the same signing encryption process you saw earlier to make it secure and anonymous.

So now that we have that, I want to actually show you what the -- what the server looks like when it's running.

Now, since I can't share a separate window at this point for some reason, I would show you this running in a separate terminal window.

But I'm going to open up the terminal window here.

And then I'm going to go to the actual depot server.

The actual depot server is running.

Actually, I can probably -- I can do it this way.

I'm going to go into depot.

And I'm just going to say cargo run.

So this is actually going to run the actual depot server.

And as you can see, it's a starting block chain commons depository on port 5332.

Here's the public key.

And this is basically the your crypto pub keys that you need to use to encrypt all your messages to the server.

And, again, the get endpoint gives you this.

And then this is basically the -- we're releasing our server on a library called warp.

And so it says yes, it's running.

All right.

So now that we have that, we can split this.

I didn't plan on this.

Okay.

Hang on.

Let's try that again.

All right.

There we go.

Now we split the terminal.

Okay.

So now we have a terminal running a separate process here.

And we're going to go to the actual depot server here.

Depot source tests server test.

And this is basically -- there's several different tests here.

And if you just do a cargo test, it's going to run them all.

And if the actual depot server is running separately, it will run on the depot server itself.

If it doesn't, it will run in-memory tests and local server tests.

So what I'm going to try to do here is test server separate.

And this basically says I'm going to connect to a client running on this machine, which we're doing in this window over here.

And so it's actually going -- this is where it gets the public key.

It's actually going to -- there's a -- and all these calls are asynchronous.

So it's calling get public key.

And then if it can't connect, it will skip this test.

If it can, it will go into test depot scenario, which is with the public key it actually retrieved.

And so here's the actual test depot scenario.

And this is basically two users concurrently, Alice and Bob, who know nothing about each other, are basically storing -- concurrently storing and retrieving shares.

Alice starts by storing a share.

She generates her private key.

And generates public keys from that.

She has a four-byte blob that she wants to store.

She generates a store request.

She calls the server with that, which, again, it's in this case actually going to literally do a call to MariaDB in the background.

And I have another tool.

I could show you the schema right now.

I'm going to skip that because I can't share another window here pretty easily.

But it is calling back to MariaDB.

And then it's through the HTTP server.

And then it's getting the request.

And that's basically making sure it has the receipt because it's going to use the receipt later.

Bob stores a share.

Alice retrieves her share using the receipt.

There's actually a number of different things that are happening here because it's testing a lot of edge cases.

But I'm just going to run this.

So let's go to -- here.

I'm going to basically say run test.

So what you see now is this is from the original -- this is the test server.

This is the test scenario running.

So it's basically saying it's doing these things.

Some of them failed because they were deliberately designed to fail because they're testing edge cases.

For example, someone attempts to retrieve all shares from an on-assistant account.

Or someone attempts to retrieve all shares from Alice's account using her public key.

But not signed properly, basically.

Alice attempts to retrieve her shares using the incorrect depot public key.

So you have to address the depot server correctly.

And so on.

And finally, they end up deleting both of their accounts at the end of the scenario.

And that resets the database to the start.

On the other hand, on the actual server side, this is the actual server log.

You actually see that it's basically said, okay, I'm receiving a request to restore a share for bytes.

This is the key.

This is the receipt I'm handing back.

This is the key of the user.

So this is actually a user identifier.

Again, this is just eight bytes.

This is the CRC32 of the UART it was sent.

So this is uniquely identified as a server.

So if I continue -- if I search for -- if I search through this throughout the blog, you'll see these are all the same user.

So that store share function sends back a receipt.

This is the receipt.

This is Bob storing his share.

He has a different user ID.

And again, this is created automatically because it's trust on first use.

It sends back a receipt.

Alice retrieves her shares.

So you see that here's the key again.

Same key.

Alice's key.

And basically she's saying, I want this receipt back.

So it says, okay.

You get back -- here's the receipt.

And here's the four bytes you got back.

Same thing.

And then you see there's some errors here.

For example, get shares from using unknown public keys.

This is a completely new un-public key.

So we don't know this.

So we return an error.

Sometimes if you can't even decrypt it because, you know, the request signature doesn't match the request key or it's not encrypted to the public key, you get back a generic error because you can't even get into the envelope at that point.

And so on.

And so you basically see all these things happening.

And you also see where Alice and Bob are basically updating their recovery and they're having to start through it.

Here's where Bob starts the recovery.

He -- it's doing it wrong so he gets back an error.

Then he does it again.

Here's his second factor.

Yes, it's the prefix of it.

It's an actual email address.

Bob, I'll go to example.

com.

Start recovery.

It returns a continuation.

And here's where the continuation is being returned to reset it.

And then he basically tries to use his old key and can't do it anymore.

So this is basically telling a whole user story essentially around this.

Using this stack.

And the stack itself we're calling Gordian sealed transport protocol as opposed to HTTP hypertext transport protocol.

Because as you noted, every message is just an envelope with a single sealed message in it and an encrypted message.

And so there's a document forthcoming which is basically a detailed spec for the Gordian sealed transport protocol.

But you're seeing basically the initial implementation of it.

This is again for community review.

So we want your feedback.

This is the time to make suggestions for improvement and all that.

And as we continue to -- you can run this right now and start stepping up the code and see what it does and ask me questions.

And that's what we're hoping will happen at this point because this is something that as Christopher mentioned, we want to see widely deployed.

We want to see people saying, yeah, we're running a depot server.

Here's the IP address.

Or our wallet is depot compatible.

So you'll be able to -- it will select depot servers either once you give it or at random and store your keys and store the receipts and help you set up your fallback method and all that.

So if you lose it all, you can still get back your data, use the fallback and reconstruct them using SSKR or whatever.

So this is part of the ecosystem.

It's another piece of the puzzle for distributing key backup and recovery.

And yeah, I'd love to take some questions.

I also wanted to add just a little bit about sort of the requirements or why it was designed this way.

Among other things, I mean, what we're really trying to allow for is user choice.

So some users may decide they want to be completely self-sovereign.

So they're going to print maybe QR codes onto paper or use the seed hammer to put it to steal, put it various places, give it to various people.

Maybe they have multiple devices so they could put it on their iPhone and their Android and you'd have to attack both ecosystems in order to get a quorum of shares.

They may decide to use any one of a number of self-sovereign choices.

But then they can also, for instance, we're hoping to demonstrate this using QR's using a future version of the Gordian Seed tool.

So you would be able to use the same seal protocol where it's basically doing exactly the same thing that the HTTP server is doing, but it's doing it over QR's to someone else's phone or someone else's dedicated device, a foundation devices maybe, wallet could store, maybe has some room to be able to store some of your friends shares.

So now we're kind of entering into the territory of what we call social key recovery, but then you can also do things with various partners.

Maybe we can get the Human Rights Foundation, which has funded Blockchain Commons before in the past, to host a server, maybe EFF for the Museum of Modern Art or any one of a number of institutions, Internet Archive, that want to offer key recovery services would be able to offer this type of server.

If privacy of in particular is required, we can also do it over tour where maybe the keys are actually the onion keys that are generated rather than using the current keys that we use in the seal protocol.

And then at all levels, we're trying to future proof ourselves.

So we want to be able to potentially be able to use Frost's VSS rather than the current Shamir secret sharing, because there are some advantages in Frost that allows for parties to not have to reconstruct the key, they can just sign things.

So we might add some calls to this where it's saying, no, we don't want you to return the shard.

What we want you to do is do a Frost on this.

So we're really trying to design this for a wide variety of things that allow for future proofing and user choice rather than being locked into a single ecosystem or a single methodology, two of three, where one of the partners is your wallet provider and the other one is somebody they chose and the other one's your device.

That just does not feel that that's the right choice for a world that wants to support self sovereignty.

So there's a lot of deep thinking in some of this and also other kinds of future proofing.

I mean, right now we just do a very simple trust on first use.

It can be very easily substituted with some other authentication methods, same thing with the recovery methods can be substituted for more advanced recovery method and even the particular seal mechanisms we use right now are potentially vulnerable to what's the term, to failures in the future.

Well, they're not necessarily quantum resistant, but they are IETF standard cha-cha poly IETF encryption.

What I'm talking about is the forward secrecy.

So right now in theory, since this is being done over and over again, partly for state reasons, we want this to be as stateless as possible.

But if you add in some simple state, now we can basically ratchet the key such that breaking an old key is not going to break future things, basically what signal does.

Well, the same actual technique we're using for continuations, which is a stateless form of transfer can be used for ratcheting keys as well, where each message that's passed has to be a unique key that is generated from the previous messages, essentially, so from history.

So that kind of technique can be used in a stateless way as well.

A lot of things we need more further testing.

I think one of the clients we'd really like to see is a low cost NFC card.

Obviously, in that particular case, we would push to the card and envelope and that envelope, the card would basically read and do the various functions.

And there are limitations of how much a NFC card can do in the brief amount of time that it has power.

So we've kind of designed this from the beginning to, in theory, all these things are potentially relatively small atomic operations that even a low powered device can do.

We already have an SSKR library that has been optimized for Java card NFC and works in that very constrained environment.

So we want that potentially to be another Gordian Seal Transport Protocol platform.

But it all starts with this Rust stack.

And we're hoping that this is enough to help you decide, hey, we want to work with blockchain commons to make this work, make it work for maybe our specific scenarios, get our advice on how to do different recovery methods, test the code, help us mutually.

Some of this is doing cryptography that is we have to be careful about.

And so together, we should all contribute to getting a professional third party security review of the code before we go into any kind of broad deployment.

So let me let me make sure something is actually very crystal clear.

You just seen three things demoed here.

You've seen an HTTP server written in Rust, which implements a specific protocol, the depot server protocol for storing or shooting blobs that is implemented using Gordian Seal Transport Protocol, which is essentially a protocol for anonymized transfer across any kind of conveyance, whether it's HTTP with or without SSL, QR codes, NFC, any of these things whether it's sneaker net or internet or Tor or what have you, it's applicable across all these things.

And it's a very compact binary representation.

You see UR is used with the actual on the wire stuff is CBOR, so it's small.

And so yeah, we're trying to think in terms of a holistic way that a lot of people can accomplish a lot of things that aren't what you just saw demoed here, but that use your imagination, because there's a lot that can be done here by third parties that we haven't even thought of yet, but we're trying to facilitate and we're trying to do it as Chris was mentioned, a very open development way with the community support and guidance.

Thank you.

This is right up my alley for stuff that we've got planned for the coming year.

So I didn't realize quite what this was.

So this demo is actually really helpful.

Awesome.

But now I totally get it.

And I'm definitely interested to talk more about it once you get a little bit down the road, but a couple of the parts.

Yeah, that's great.

Any other comments or things you would like to see us do sooner than later?

Like one of our big questions is, you know, do I have Wolf go back to the Swift code and start implementing this in our Gordian reference iOS app?

Or should we focus on fleshing out the documentation and the alternatives to how this might work on NFC or Tor or any one of the other different transport protocols?

And I don't know, there's just a lot of choices, especially in December and January that we're seeking feedback on what to prioritize first.

Another thing we've discussed is we started with Swift because we support iOS in terms of like, Gordian C tool and things like that.

But there's been at least one case now where we've started with a Swift reference base and then created a C reference base and then basically folded that into our Swift base.

And that would be life hash, our visual hash generator.

So our Swift life hash library now actually brings in and compiles our C code.

So there we have one single, you know, one reference implementation rule of all.

And, you know, that may end up being Rust as well.

So one direction we might head is to start making Rust the definitive reference versions of these and make our Swift code base start to depend on those in addition.

So, you know, that's another thing that so people have one true implementation to work from, essentially, rather than more than one.

And, you know, and that's just one possibility that's fairly effort intensive, but that's also one direction.

And that's how we're doing things with our Envoy app.

It's a Flutter app.

And then all of the, a lot of libraries we're using with BDK are Rust based libraries.

And then we're just, you know, calling those.

And that's going to be true.

We're pretty heavily bought in on Rust, I would just say.

Yeah, I think Rust is becoming dominant in many fields now.

And I think that that's something that we're, you know, that's obviously one of the reasons why we're putting so much attention on it.

Well, we're past our scheduled time.

Thank you, Ken and everybody else for hanging around a little longer.

Any closing remarks on our depot efforts?

Nothing I haven't already said.

I'm looking forward to working with you guys on it.

Thank you.

Yeah.

And we're looking forward to the people who had to drop off reviewing this in our YouTube channel later.

And we'll be talking more about this in progress in early January.

I'm not sure yet.

Shannon, when is the first Wednesday of January?

I think it's the third or fourth or something.

May need to postpone a week or a puzzle.

Yeah, it's the third.

So we might want to push that back to the 10th.

Yeah.

So definitely add that to the notes.

But yeah, we'll make, we'll make some progress and report out and hopefully we can really begin tackling these and implementing them in the new year.

Thank you very much, everybody.

Thank you.

Thanks, everyone.

