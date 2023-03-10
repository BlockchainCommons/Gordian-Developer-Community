
## Transcript

**(raw unedited)**

I did want to talk about the minimum viable architecture for this Gordian architecture.

So what do I mean by minimum viable architecture.

There's a long tradition on the internet of companies that build something that is the minimal product that customers can buy and use, and that gives you an insight as to the viability of the product and your strategy.

But there is a problem with it which is a lot of times it comes with a huge amount of technical debt that the market kind of tells you, "Oh, but you should be going in this other direction," or it's a different use.

I mean Bitmark kind of was doing NFTs five years ago and it took a while for the market to come around and say, "Actually, that actually might be useful.

" So what we want to do is create architectures that have some flexibility for the obvious choices without totally locking us into a pure minimal project.

So again, it focuses on the larger strategy, the ecosystem viability and the ability to expand.

But you do want to constrain it for so you can actually ship it out the door.

If nobody can see it, there's no way to make it real.

So it's a way of future-proofing an MVP.

So we've kind of done this with some cryptographic choices for the MVA for Gordian.

One of the things that we're doing is we're trying to combine carefully chosen cryptographic things in groups, which is very similar to Cypher Suites in TLS.

If you know my work in there, that's a lot of the reason why we did it there.

It's not a kitchen sink where you can arbitrarily choose this hash algorithm and this signature, et cetera, because there are foot guns there that can challenge you.

Initially, we're gonna use these choices for our test code for an envelope CLI app and Swift that just allows us to play around in the territory.

It's not intended for shipping and the architecture may change, but more importantly allows us to go to Ross, Radically Open Security or other reviewers to review the architecture to make sure we didn't do any foot guns.

I mean, there was a couple of places where we're doing some stuff that it's like, there might be something there that we weren't careful enough about.

So what are those, the high level categories.

There's the data size, which hash, there's the, the symmetric cipher, the curve, the signing, the sharding, some, what is the techniques that we're going to use for non-correlation disclosure, and then some data architecture stuff.

So each of these can have different choices.

In data size, we've specifically chosen for this suite, they really want to focus on 256-bit because we want the input and output values to be indistinguishable.

We want hashes, public keys, other values to really look-- not really be easily distinguished from each other.

And the reason why is it allows us to have non-correlation techniques that are easier to do.

You'll see that in CID and some of the other stuff Wolf will be talking about a little bit.

256-bit matches Bitcoin security.

There are some cons when in this particular set, there are some things that aren't 256-bit right now, the nonce for the Cha-Cha, which we'll talk about in a minute.

And then the Schnorr SIG itself is twice the size.

So, you know, when you see a Schnorr SIG, you know, it still may look like randomness but it's twice the size of a public key.

We have decided to go with Blake three, although this is, you know, more of a little bit more radical.

There are a different number of different types of outputs with Blake three, we've chosen the 256 version.

And part of the reason why we've chosen it is that it allows for streaming and incremental updates.

And what do I mean by that is that you can have a very large thing like a movie NFT and you just change scene three.

It is in theory possible for you to just change scene three and still, and not have to rehash the entire movie.

- You can verify in a stream of data that that stream of data came from the master hash, essentially, because if you know where you are in the stream of data and you know where you are, you can basically compute basically a Merkle tree.

So, you know, per frame basically.

- I'm not a big fan of the name Blake 3 'cause it's really Blake 2 with some improvements, but it's not a fundamentally different algorithm than Blake 2.

And Blake 2 has been for a while, been through a lot of testing.

The biggest weakness is there's no hardware acceleration.

In pure software, It is faster than SHA-3, but almost everybody's doing SHA-2 right now, which is hardware accelerated almost everywhere.

So we won't get that if we're doing like three.

So this is something that, you know, we may have another suite for to talk about.

We'll talk about that in a minute.

For the Symmetric Cipher, we're using ChaCha Poly.

It's an ITF standard.

It overcomes some AES weaknesses.

Again, it's faster and softer with AES, but there's no hardware acceleration for it.

And it's probably too strong.

Like it's overkill.

You know, an eight or 12 rather than a 20 would probably be fine.

It also does streaming.

It also does some other stuff.

There's a variant of it called X ChaCha Poly, which is attractive because it's like, like cash has some advantages in streaming and the non-size and things of that nature.

But we're, since this is one of the critical cryptography things we wanted, we wanted to choose something that was really modern, robust, an IETF standard and worked.

But I do believe, I mean, Simon, can you recap.

You said it was like how long to do it with the library you found.

- I don't remember, I'll have to look it up, sorry.

- But I think the idea was that if it wasn't overused, that it was, if it was mainly used for restoring keys and other different types of things.

There wasn't being used all the time.

That if it took one, two seconds even, and I don't know if it took that long.

- Yeah, and none of these are, just to be clear, none of these are a problem on the MCU.

And Ken, I don't know what MCU you have, but I assume it's some sort of an M4 or similar.

- It's STM32H7 is the current one.

It's the big boy of the STM1.

- Yeah, yeah.

480 megahertz.

Yeah.

Yeah.

So like none of these things are really a problem on MCU or Blake 3 I haven't really Blake 2 is certainly okay I haven't I haven't looked at like 3 but sounds like it's similar enough and cha-cha and Polly and Polly 3005 another problem on modern MC use it's only when you get to Executing these on the SE directly that you run into problems because that's where you need the hardware support And then see you can just do it in just optimize C code for that specific architecture.

So I ran this proposal through one of my cryptographer friends.

Now he specializes in symmetric ciphers.

That's most of his cryptographic work is in that area.

And he was saying, you know, he much more trusts AES and because it's well known and he's got concerns.

But he was sort of saying, "Why aren't you using AES-XTS, which is the block cipher used by Apple's FileVault.

" The problem that I found is there is no standard for it.

Yes, it is used by Apple's FileVault.

Yes, it is relatively well understood, but there isn't a true IETF standard for it.

There is, so I don't know, but it is fast.

I mean, it's very fast, but it's also a block cipher, which means that it comes some interesting challenges with block ciphers, but it is tweakable, which is a pro.

I don't know.

It's a pretty hard toss-up.

Since we're wanting to use CBOR and we're wanting to register a bunch of tags, I felt it was safer to go with ChaChaPoly first.

Obviously, we're doing SecP.

The alternatives of Curve25519 is just not multisig safe, and there's some other inconsistencies.

I was just watching a video of RealWorld Crypto that was basically saying, "Hey, the ITF spec for 25519 has a bunch of inconsistencies and different people implement it slightly different ways.

And, you know, we really ought to go back and, you know, firm this stuff up.

I just don't want to deal with that.

The con of course, is it's not ITF or NIST and it's not in any chips yet.

Hopefully it will be soon.

- The other kind of comment on the K1 curve maybe it's that it's, and maybe this is just a purely a perception thing, but it is very Bitcoin centric, right.

Because that's, that's kind of, that's, that's the perception of like, this is the thing that Bitcoin uses.

And then other things use, you know, either NIST curves or 25519 if they don't want to use NIST curves.

Although I will say it's been interesting, you know, Deidre Connolly is a modern cryptographer involved in Signal and a bunch of other different types of things, both as a cryptographic engineer and other stuff.

And in a recent podcast, she was basically going, you know, well, maybe we need to revisit because of the low cofactor in, you know, SecP, you know, because there's a lot of work to make Ristretto work.

Obviously she's putting a lot of effort into Ristretto which is fixing the 25519 problems and and things of that nature, but she was basically giving a little bit more credit to K1 recently and I would consider her one of those people that would have that were in that category you just mentioned.

On the other hand, you know, she's not a regulator, she's not a government buyer or any of those kinds of things who will also, it's Bitcoin, don't use it.

Yeah.

Also, just one comment on XTC mode from the previous page.

XTC is like, it explicitly states that it's not suitable for data in transit.

It's designed for block storage on a storage device, for long-term block storage.

So if you want something that's kind of versatile enough to use in both use cases, whether it's for storage or for like request transmission, things like that, then it's probably not the right one.

- Yeah, there are definitely issues and there are other AES ones.

Had a bit of a discussion about that.

I mean, John's comment was these are very distributed operations, the function calls are, you know, may not be replied to for a day.

So in some ways they are kind of like- - Kind of like storage.

- Storage.

So that was an interesting observation.

- Yeah, okay.

- Obviously, you know, we're doing a little bit more of a, we're not doing with this initial one, ECDSA.

That's the easy alternative.

Maybe I'm wrong, but I just feel like we really want to, at least with this move to the next level.

The couple of advantages of it, the public keys are not embedded in signatures, which has certain kinds of non-correlation things and advantages.

The signatures are 512 bits, plus you need the, you know, in order to verify it, you need the X-only public key.

But it enables for the future frost quorums, adapter signatures, and then this is what will be added in the crossbar family chips and hopefully some others, Tropic Square and that other one that was discussed at the last Silicon Salon.

There is a potential risk, which is X-only signatures might buy this for some advanced protocols.

I don't know.

We'll find out.

The advantage of X-only signatures is they're always 256 bits.

And that's great, but we'll see.

We've chosen Shamir with groups.

Shamir's mature.

SSKR adds to Shamir the ability to do groups that gives us scenarios that increase resilience against collusion.

I think that's the main advantage.

And of course it's been reviewed.

We have security reviews of both our Shamir library and the two layer SSKR.

I would have loved to have done VSS and I really hope we can integrate it in the future but it feels unstable, but it's close.

I mean, maybe, you know, maybe this spring, but that may, you know, we'll see.

We're also going to talk a little bit more about this more, but we're choosing to do a redaction hash tree to help us do non-correlation and selective disclosure things.

Data can be redacted with a hash tree, and we're using Blake3.

But one of the things I really like about it as compared to sort of the ZKP approaches is that holders can redact information.

So what do I mean by this for some of the people that don't know the language.

Certificates and signers and whatever of these different types of attributes are, you know, issued by the party who's making that attestation.

So you as the subject of it may receive something that has, you know, all these different things that are signed.

But if you want to use some kind of zero knowledge operation to basically go, I don't want to give the bar owner my birthday, and the issuer didn't set that up in their design, you're stuck.

You have to give them your birthday.

With redaction trees, I can give them other kinds of details without doing a ZKP.

But even more importantly, sometimes I might have a certificate or some claims or whatever that aren't about me even.

So there's some, I'm just the holder, I'm the pharmacy, you know, the doctor signed something, this patient received it, now the patient gives it to the pharmacy, while the patient may want, may not want to give the pharmacy, you know, all the information, etc.

So So none of these zero knowledge things really are designed for holders to redact.

I think it's pretty elegant and such, but I do believe we need some cryptographic review on variable sites, salts, and there may be some signing malleability things that you have to be very careful about.

As a software engineer, you just can't say when a signature checks, is that enough.

No, you have to be able to dig in a little bit to basically go, yeah, it checks for what I care about at this moment.

But because there may be things in there that are redacted that are valid in the signature but are not correct.

And then there are some malleable things where we want to make sure nobody else can fake something.

We'll deal with that.

Wolf's also gonna talk a little bit about the data architecture.

He talked about it some last week, the directed graph that we're using for our envelopes.

They're triple subject predicate object.

There's some real advantages to using these with C-BOR.

It addresses the canonical problems of JSON, et cetera.

It allows us to be schema-less, and I'll talk about why that's important.

But if someone really wants to do quads, which is what's required for RDF and some of these other more advanced directed graph things, you can, but you don't have to.

And I think that's one of the things I like about this.

There's a lot of people who get very frustrated with RDF, things like JSON-LD, et cetera, or go back to the roots of RDF and go, that's just a failed standard and don't want anybody to resurrect it.

Of course, the purists in the RDF field will say, well, why aren't you doing JSON-LD or Seaborg-LD or something of that nature.

One of the advantages for us, these do not require schemas.

You can use them, you can validate schemas, you can have them.

We support the ability to add them in the future.

It's designed to support them, but it doesn't require them, which is very different than JSON-LD where you have to have the schema.

So obviously there are other possible suites.

I mean, one of the ones would be, you know, a suite for constrained hardware, which would be, you know, AES and SHA and ECDSA, 'cause all of those are accelerated.

We could go with a ZK optimized set, use Sim, I don't even know how it's pronounced, Sim Minion for the Cypher, Poseidon Hash, BLS 12 or Halo Curves, pairing signatures, BBS reduction.

These are all things that you can do.

cool, modern, zero-knowledge Starks and Snarks and other different types of privacy enhancing type of things, but they're all way, way ahead of the curve and evolving.

I mean, two years ago, it was JubJub was gonna be the curve that everybody was gonna be using for this type of stuff.

And pretty much everybody in that community has moved to Halo.

So who knows, maybe in two years, they'll move to whatever the next one is.

But the point is they can be suites where there's a group of things that are all together that meet a particular need.

So any thoughts, concerns about our MVA choices.

Before Wolf starts working on a prototype.

Ken, any thoughts from your end.

Nothing jumped out at me as being any sort of an issue.

I think we have a processor that's fast enough to handle all those.

Cool.

Okay.

Well, that was definitely part of the design.

We wanted it to work on that class.

.

