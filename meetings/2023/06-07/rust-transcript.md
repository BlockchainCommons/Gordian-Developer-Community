Okay, so we should probably move on to, you know, the update of what's going on with Quick,

with Rust.

This has been a good six month long process now, a lot longer than we had originally planned.

Amidst other things, we had to do DC bore along the way, which meant we had to go back

and rewrite some of the Swift work that we'd done.

So I think it was a good, not side project, but a good--

Yeah, so it's a milestone on the path,

even though it wasn't planned for.

Sometimes these things come up and you just

have to bite the bullet and take care of them.

It does make everything better down the road.

So Wolf, we are recording now, but I'm

I'm gonna make a separate part of a separate recording.

So if you would--

- Re-introduce myself.

- And introduce yourself and everything.

- Yeah, I wanna show, there's only two slides

if you wanna show the first one.

And I might share my screen a little bit as well.

- Okay.

Where did it go?

Second, I don't wanna reproduce the problem I did before.

to go. Shannon, can you pop up that URL again? Yeah, I can get it. Must have closed the window.

Sure, no problem.

Whoever can find it first can share first.

Actually, well, I can probably do.

I can probably share.

I should go ahead and share, Wolf. I'm sorry.

Yeah, that's okay.

Yeah, one sec here.

My usual environment.

Yep, one moment here.

Because I'm going to be talking anyway.

Okay.

Okay. So first I'm going to share this. Okay. You should be seeing my browser.

Yep. I'm already in the browser.

Yep. So, yeah. I'm Wolf McNally. I'm the lead researcher for Blockchain Commons. And I'm just

going to give a brief update on our progress in porting what we're calling the Gordian ecosystem

over to Rust. The primary place we're starting is Swift. That's because I'm an Apple geek from a

long time and I think Swift's a great language. And of course, it directly drops into iOS and

our reference apps like Gordian C-Tool are on iOS, but the world is much larger than Swift. And

so Rust is one of the other platforms we've targeted, software platforms we've targeted,

because it's basically pretty much interfaces with everything. So really briefly, I wanted to go

over these libraries. At the bottom, or the top of the list there, is DC-BOR, which stands for

deterministic concise binary object representation, or deterministic C-BOR. And this is a variant or

profile of C-BOR, which we are actually working with the C-BOR working group to try to get it

closer to an RFC. There's a few details we're working out. But just basically, when working with

C-BOR, the C-BOR spec itself, think of it like binary JSON. So it's more compact than JSON.

And it describes certain ways of making things more deterministic. Well, for our higher level

needs, although at the bottom of this you see envelope, envelope needs deterministic encoding

because it does a lot of things like signatures and encryption and things like that where it's a

hash tree. So you want basically two separate creators of the same envelope with the same

starting data to come up with the same envelope essentially with the same hash and make that

comparable. And so, you know, a very simple example of non-determinism is like if you think

about JavaScript, how many ways are there encoding the number one? Well, you got one and one point

and one point oh and one point oh oh, you know, there's an infinite number of ways of encoding

the number one in JavaScript. And there's things like JavaScript canonicalization,

things that standardize that. And they're quite complex.

C-BOR has it a little bit better. But in other ways, it's left certain gaps in terms of,

for example, how numerical numbers are encoded. It has a number of ways of encoding.

Like, again, the number one can be coded as one byte or two bytes or three bytes, four bytes, that

is. And so, you know, we hope we want to harmonize that with the term of C-BOR. And our approach,

you know, I'm not going to get into detail here, but this is one of our two reference implementations,

the other one is in Swift. The implements are still slightly evolving specification for DC-BOR.

We have an internet draft, which is like, you know, not an RFC, but it's kind of like on the

on the early path to R and RFC for this.

But the whole point is, you know, you put certain data in,

it should always get the same serialization in C-BOR.

So that's the goal of that.

On that is our UR library.

This is actually based on a third-party UR library,

but because I'm the kind of ped into the IAM,

I wanted a specific kind of interface on it.

So this wraps that third-party, which is just called UR,

and that's available on most, these are for the most part,

Well, DC-BOR is on crates.io, which is the repository for Rust crates.

None of these other ones are yet.

The one that BC-UR is based on is, it's called UR.

So you can find that there and start using that today.

It includes the fountain codes, all those things.

But this is kind of our flavor on that, wrapped on that.

The next level is, actually there's one I should have put here that's not.

It's the crypto layer.

So, the BC Crypto, Rust, I should have mentioned that,

you'll see that in the next slide actually,

is kind of our repository for all our cryptographic

implementations and those are usually based on third-party

reviewed cryptographic implementations when possible,

not all of them are,

but we wanted a way of easily swapping those in and out

and have the same kind of interface on all of them.

So, the BC Crypto is where those live.

And then BC Shamir is essentially just the Shamir's

secret sharing algorithm. It can split up to a 32-byte 128-bit secret into up to 16 shares,

and then recombine them if it's given a quorum of shares. That's all it does, but that's very

considered to be very core. That's separated out. That's based on our C implementation.

And then SSKR is built on top of that. The sharded secret key reconstruction basically

not only can break a share up into multiple shares, it can break them up into groups of

shares. So you can say, I want not just two or three, but two or three of two or three. So you

can have three groups, the unique quorum of two of those, and then each group unique quorum of two.

So that enables a number of different secrecy scenarios or backup scenarios that aren't

available with just a one layer Schmear secret sharing. And then finally, there's envelope.

Gordian envelope is a generic container for hierarchical data. It's built on the idea of a

Merkle tree, a hash tree. And then it has a number of different advantages in terms of use,

holder-based deletion, and so on. We have other videos up and so on, other talks I've given where

it goes into that. But that's built on all this other infrastructure. The second slide I want to

show is just the hierarchy of these right now, the dependency diagram. The blue ones are out of

the libraries I was just referring to. BC Crypto Rust has a lot of dependencies, but these are all

either very well regarded or sometimes they're security-refused crates, but they're all pure

Rust. Except for currently SECP-Tortisticate 1, there is an alternative I've looked at,

which is pure Rust. But this one actually, if you bring this in, it does actually underneath

cargo, I guess, compiles the C librarian and brings in pretty seamlessly. So, but this is used for

ECDSA algorithms. So, but all these other algorithms are used at higher levels in this.

And I also have put like our pseudorandom generators, because we primarily use this for

fuzz testing and things like that. But because I wanted to unify how we're generating random

numbers as well. So, you know, there's the BC-Shameer, there's BCS-SKR, this is the Deceibor

layer, which has minimal dependencies, BC-UR-RUS, which depends on the third-party UAR create.

These are all combined together in what I call BC components. These are higher-level components.

These tend to hand back things like arrays of 8-byte integers or 8-bit integers, whereas this

actually tends to deal with objects itself and kind of bends higher-level objects to other clients.

So this is kind of like a high level toolkit. And then BC envelope is built on that and the other

layers as well. And so the other thing to note about this is I've only begun to review which of

these if you're a Rust programmer, you realize that sometimes if you're building a constrained

environment, you want to be able to use the no standard version of libraries. Most of these,

if not all of them, have no standard versions. And I'm going to be reviewing that very closely

as a later phase of the project to make sure that ultimately our whole stack can run in a no standard

way. Another thing that, you know, so today basically, you know, these are available as

separate repositories currently. They're not all up on crates.io. Like I say,

DC board is and the U.R. library is, of course, all third-party stuff is. But most of these just

you have to put in the same directory and compile together in the same workspace currently. When I'm

When a little bit further down, I will launch them all as actual crates on crates.io.

And we'll begin actually semantically numbering them and things like that.

The other thing that I will add at a later time is feature gates so that if you don't need,

for example, compression, you'll be able to tell the envelope library, I don't want compression.

That will tell BC components that we don't want compression, which will basically mean

minis oxide, which is the deflate algorithm won't be brought in.

But that's for a later phase of the project.

So right now, a lot of the functionality is there in Envelope, including SSKR.

That we just committed today on the master branch. So you can actually see the unit tests. In fact,

that's the other thing I'd like to show you is I'd like to really briefly flip over here to...

Let's see. It's my code here. This is just a unit test of the SSKR library. I'm not going to go

I just want to kind of show you the scenario.

This is how SSKR, which is, of course, again, is for backup and recovery, but SSKR only

splits 32-byte secrets or up to 32-byte secrets, whereas with envelope, crypto envelope, the

big advantage is you can split secrets of any size.

And so in this case, you know, we have a scenario where Dan has cryptographic seed, but it's

not just a seed.

The seed object has metadata.

It has name of any length, optional creation date, and a note, which could be of any length.

So really, this is an arbitrary length thing.

And we want to be able to-- for Dan to be able to back up

his seed along with all of his metadata to, say,

three parties and then by recovering any two shares,

be able to recover the entire seed.

So in this case, we generate a symmetric key for encryption.

And again, this is part of the tools

that are in the components library, asymmetric encryption,

public key encryption, SSKR, all those things.

And then we enclose that in an envelope.

So we say, OK, put stand seed into an envelope.

And then we want to encrypt the subject of that envelope, which

is the seed object itself, with this content key.

And that unwrapped app, if you know anything about Rust,

this basically means you were checking for errors here.

And we're assuming there will be none,

because it's just a unit test.

So at this point, we actually have an encrypted envelope.

And we have the symmetric key, the content key.

So now we're going to define a group.

this group means two, three shares.

That's the three shares, the quorum is two.

We're only defining one group in this case.

And then we're trying a group spec, the quorum is one,

and then we're giving it the vector of groups.

So we've created a group and a spec.

So this can have any number of groups in it they want.

And then we're gonna split that using SSCareSplit,

Encrypt is the envelope split with the spec

and the content key, unwrap that.

And now we have basically a list of lists of envelopes

for however many envelopes you see.

It's a vec of vec of RC, which stands for reference counted

envelopes.

So each group is the inner vector.

Each-- the group's the outer vector.

The shares in each group are the inner vector.

So now we're going to flatten that.

So we just call it flatten.

So we have a list of things.

And this is-- and then we're converting this into UR.

So we're basically have a map here

where we're just saying, just convert this to UR.

And now we have a vector of UR.

And this is-- assume what we're sending in our fake scenario

we're saying, so we're just going to check when things are going to say, here's what we expect

our envelope to look like. It's an encrypted message with an SS one assertion, which says,

this is an S-QRS share and here it is. So we're just basically going to format that envelope

and verify that, yep, that's what the envelope contains. So now Dan sends one of these envelopes

to each to Alice, Bob, and Carol. That's the symbology I have for that, those envelopes

traversing the internet. Alice never, or lost hers, basically. So we're going to say that's

That's unrecovered.

So Bob and Carol take their two envelopes

and they check them out.

So they get things that it looks like this.

They can't recover the message by themselves.

So at some future point Dan retrieves one,

two of the three envelopes so that he can recover his seat.

So these are two recover,

that he covers Bob's and Carol's,

the clones just because reference counting in Rust.

The recovered seat envelope,

he basically says SSKR join with the recovered envelopes.

And then that's just debugging information.

Just make sure you got it there.

That should remove that because that's not properly

part of the unit test.

And then he recovers the seeds.

He just extracts the subject with the seed.

And then he just compares.

Here's the original seed.

Here's the recovered data.

They're all equal.

If Bob just tries to use his share by itself to join it,

it's an error.

And so if I run this unit test, it'll pass

because everything, all these unwraps don't throw errors

and all the asserts pass.

So that's pretty much as simple as it is

through basic SSKR using Rust.

And that concludes my report.

I'll take some questions.

- Yeah, so Wolf, what's the kind of,

I mean, you've talked about having,

looking at the no standard and other things.

What do you think is,

Well, let me back up a step.

So we have, obviously this is not reviewed code yet.

We consider the first stage of our process

is what we call community review.

And I would say we're even a little early

for community review.

So, but we did the Rust version

because we had a number of parties

that were basically saying,

hey, we love your reference code in Swift,

but we need to do it on Android.

And so we have kind of this trade off.

Do we do it in Kotlin?

Or do we do it on something that also works on Android,

but is a little more rare than pure Kotlin stuff.

And we really would like to see some people

beginning to play around with this that are

in the Android ecosystem.

And then of course, Rust is kind of the leader right now

in security implementations with most signal,

even Bitcoin, everybody seems to be moving more

toward the Rust ecosystem for things.

So then are there people that have some specific needs there

that can help us.

And then I would ask you, Wolf,

what areas are the ones that would be the best

for either a Kotlin Android type people

to take a look at now that you're ready for

versus the people that are doing deeper,

more secure cryptographic apps?

What feedback do you need?

- Well, obviously, right now, if people,

obviously they're not up on crates.io yet,

so they're a little bit more of a pain to kind of set up this,

but basically you throw all these projects

into one directory, open them up in a middle code workspace

and you can just build them together

and run the unit tests.

I have a script I use just run all the unit tests

of all the crates together.

But I mean, obviously, for example,

showing right now just the hazmat part of the Shamir algorithm. This is basically as much as

possible a line for line conversion of the C code. So it should be pretty easy to review

as correct or not. I also basically on the SSK level, I wrote a buzzing algorithm to basically

try a huge number of different kinds of groupings and so on and then make sure there's a quorum

that are always recoverable of those. But obviously, making sure that this stuff is reviewed.

I mean, for example, my understanding is the original author of this code,

try to make sure these are all constant time algorithms, as far as I know, I've preserved that,

but not being a cryptographic expert, I can't say for sure. This is something for actual

cryptographic experts to look at at some point. But it's certainly ready for, as you put it,

community review to start poking at it. It's not very well documented yet, but again,

It's mostly a direct version of the Swift code at the higher levels.

Also, as I've been realizing that certain things have been rushed, could actually make sense in

the Swift code, I've been back pointing that. The master branch of these various Swift libraries,

I've been committing to that as well as I realized, oh, yeah, that's a good way of doing things

that Rust made more natural and it works in Swift too. I've been up porting that back to

the Swift libraries. So I'm not sure whether I'm answering your question or not, but basically,

if you want to start understanding because there's not much documentation on the REST

version of envelope, yeah, there's a lot of documentation on the Swift version at that.

But for example, you can look at, for example, say, core tests, where you're just testing various

kinds of tiny envelopes, making sure there are various things like they're digests at the various

parts of the tree are invariant, and so on. These have all been tested to be identical to the Swift

version. But it should be... And there's a lot of things that the Swift version does that this

doesn't do currently, like diffing and mermaid output and stuff like that. But I think most of

the essentials are there. I've still got a couple little things to work on before I really start

documenting. But yeah, I mean, by the end of this week, there'll be... I think I should have it on

on crates.io and ready to really kind of start poking it more seriously.

But will they be ready to ship a product with?

Probably a little bit longer.

But part of that is also who's going to join us, poke at this and say,

oh, yeah, this is, you know, I tried to do this in my app

and it was very awkward using the API.

Can we improve the API and then kind of go back and forth on that?

So of course, because I'm using this the low level stuff

at my high level stuff and envelope, I am getting a chance to kind of say,

oh, that's awkward and then fixing it at the lower levels.

- So another, obviously Wolf is using the Xcode

development environment for running all of this.

In theory, all of-

- Swift, I'm using VS code in for the rest.

- Right, right.

But I mean, but you're, okay,

you're running on a Mac environment, I should say.

- Yes, I'm running on a Mac.

- And we have run into things in the past

where running on a 32 bit processor on Linux

or whatever caused a problem.

So we are looking for people to bring this

to other environments and just make sure

that you can run the scripts that test all the dependencies.

It's possible that some of our Mac is notorious

where some of the shell scripts and things of that nature

are just slightly different than what is shipped with Linux.

And-

- Of course for Rust, I'm only using Cargo.

I'm not writing any custom build scripts or anything like

that, so if Cargo works, it should work, you know,

but you know, I, the proof of that pudding

isn't somebody else doing it too.

- Right.

- And then of course, you know, how, you know,

you know, we are not idiomatic Android engineers.

So somebody basically taking a look at this and going,

"Okay, this is what is necessary to include this

in an Android build that we're missing."

Or, "Oh, it'd be easier if you did X."

So I kind of consider this to be the pre-community

review stage at this point.

But we really want to get to community review

by the end of the month.

and that will be a formally labeled release.

Everything will be in cargo that we have,

but it's still not,

could not be considered ready for production.

We're trying to be more careful about this.

- Well, certainly we're not calling anything 1.0.

Everything's gonna be 0.1.0 for now.

- Some of the things that we really want to do,

the most sensitive parts of the code are that has MATC

and a couple of other parts in the Schumier and SSKR.

So, you know, we either need to commission somebody

like a radically open software or somebody of that nature

to do a formal security review

of the more important little parts.

And generally what we do is we pass around the hat.

So all the parties who think that they're gonna be wanting

to ship those, you know, this year, we'd love people to,

you know, throw some money in the hat to try to commission

a formal, you know, proper security review

by an independent third party of these.

When that happens, then we will,

and hopefully, you know, some people are beginning

to do some proof of concepts or prototypes of various forms,

we'll be ready to declare a version

to be a 1.0 release.

I don't think that'll happen before the end of the summer,

summer being September.

And it might be after that,

depending on how much support we get

from the community on priorities for this.

Am I missing anything, Shannon, Wolf?

- Sounds right to me.

- So we are gonna begin to,

so we have a code base in Swift

that is called a seed tool for,

Gordian Seed Tool, it's on the app store.

We would really love to see somebody tackle

the rough equivalent of that as a reference Android app.

We're not quite prepared to do that right now.

I think our resources are, we could and we will

if we need to, but I'd love to see that parallel.

In the meantime, we're gonna be returning to Swift

to start building the rest of the CSR stack.

So you can actually have a real app

that you can send shares to request,

please store this share for me,

only return it if some mutually agreed upon authentication

is acceptable, which can be done.

That's kind of what happens today,

but we wanna be able to offer those types of things.

So we're hoping to have some at least working prototypes

of that, you know, also up and running over the summer.

So obviously, you know, if we can do it just

between the reference apps,

that's not gonna demonstrate what we really want.

This is where Andy, I would love to see if we can, you know,

select some subset of what you're doing

and be able to demonstrate that a QR request for,

please save this seed works with your app as well.

Even if you aren't necessarily doing all the Gordian stuff

that is a full support for envelope.

I know that we've been talking with foundation devices.

We had hoped that proxy was going,

they had said here in these meetings publicly

that they were working on it.

That's why they did the SSKR,

but being that they were just acquired

by the Our Ring company,

they're in the midst of that merger.

So I don't know what their plans are.

Anybody else working specifically on Shamir or SSKR

or CSR things in the next couple of quarters.

( g

