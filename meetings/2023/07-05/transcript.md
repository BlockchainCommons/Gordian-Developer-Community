Okay. So welcome to our Blockchain Commons Gordian Developer Meeting. We meet every month,

at least once, the first Wednesday in order to discuss the priorities for our community.

For those of you who are not familiar with Blockchain Commons, we're a community interested

and self-sovereign control of digital assets.

Together, we bring stakeholders to collaboratively develop

interoperable infrastructure.

We design decentralized solutions where everyone wins.

And we are a neutral not-for-profit

to enable people to control their digital destiny.

So I'm Christopher Allen.

I'm the principal architect and executive director.

These meetings are focused on expanding and using

the Gordian specs to create a secure, compassionate

infrastructure that is open and interoperable for all.

Our big goals for 2023 are our DC-BOR libraries,

Gordian envelope, collaborative seed recovery,

and setting a foundation for something we call

collaborative key management

with much more sophisticated cryptographic functionality.

At our last meeting in beginning of June,

we talked about updates to Shamir,

some discussions about the ledger,

Shamir and verifiable secret sharing proposals

that they had.

We talked about moving from SSKR

to the collaborative seed recovery.

We had a brief demo discussion about seed hammers product.

We offered Gordian use cases for education and wellness,

in particular providing privacy for those.

and we announced the Gordian libraries for Rust.

Today, we wanna talk again about UR's in general

and in particular animated QR.

So that is only part of it.

We have ThunderBiscuit who is gonna be offering

some experience with implementing UR

and some discussion there.

Craig, in particular, you started using LiveHash.

We're trying to encourage more people to use that.

I'd love to hear his story there.

And in general, what are kind of the next steps for his work?

We are gonna be meeting at IETF

if you're in San Francisco for the IETF 117 meeting.

I wanted to talk a little bit about self sovereignty.

Wolf has a first sort of demo

of collaborative seed recovery with Gordian Seed Tool.

And then just in general, how are we gonna standardize that?

What's our roadmap and priorities?

We really need to hear from you.

We're not a wallet company.

We're here to support your wallets and tools.

So returning to URs and animated QRs,

we're working on, obviously,

a lot of exciting stuff like envelopes,

which use URs, but the existing URs continue

to be the foundation for our success.

So we have released a new developer document here,

uniform resources and introduction,

where we talk a bit more in detail about what you are,

and then leads you to other places.

We also have another docs specifically on PSBTs

and some examples of them,

hopefully we'll get some more wallets

to support that functionality.

And then we want to talk about animated QRs.

We did this little video,

what a month and a half ago or so on animated QRs.

And the basic idea here is

how does it actually work for a regular user?

Why is it important?

Why should they ask wallets to care?

So we basically have in here a video of a passport.

I think we also have some stuff from Sparrow,

but I'd really like to see this become something

that the community can use and share and point people

to say, "Hey, we support this interoperable functionality."

So my specific request there is that

that you either leverage the video we already have,

we can give you the images or whatever to use

for whatever your purposes are,

or send us a little video or clip of your tool,

either generating or receiving animated QRs

so that we can incorporate that

and spread the word about that functionality.

Does anybody have any questions on this?

Okay. Thunder Biscuit, it's your turn.

All right.

You're welcome to share your screen if you like, or I can, you can just walk through it.

- Yeah, no, I mean, if I, maybe if I have a few things

I'll share my screen, but I mean, it's not that I had much

to say, I just thought I'd share insights.

I showed up at the meeting last time and my feeling was

that you were overwhelmingly sort of looking for feedback

and interested in hearing, you know, experiences

of the developers looking into your stuff.

So I thought I can tell them a little bit about it

from my perspective.

First of all, I just want to say I'm a big fan of blockchain commons.

I a while back sort of like learned about it because I went through learning Bitcoin

from the command line, which had been recommended to me.

So this was a fantastic resource.

I'm the guy who opened the issue 555 on maybe porting all those markdown files into a sort

of web book format or something.

Still a cool.

I'm still going to go in.

And I maintain the language bindings

for the Bitcoin development kit.

So we produce bindings for Kotlin Android,

Kotlin JVM, Swift, and Python.

And I think Spotbit uses our language bindings,

Bdk Python.

So that's how also I sort of like was looking

at who was depending on our libraries.

And I found Spotbit and I was like,

oh man, this is about to come.

And so I hope you're having a good time

with the library.

Yeah, so that's also a big fan of Sparrow, so Craig.

- Great. - Shut up.

- So a couple of questions.

- Yeah, sure, go ahead.

I'm an Android dev, so just wanted to say that too.

So my expertise is I'm an Android engineer.

I came into the Bitcoin development kit

because I was a user,

and then just ended up getting more and more involved.

- So given limited resources last fall,

we made a decision, basically, you know,

among the financial sponsors of Blockchain Commons,

everybody was really needing iOS

for both Mac and iPhone and Android support the most.

Back end stuff, things of that nature, you know,

people had a lot more flexibility,

but those were the highest priorities.

We had a really tough time deciding

do we do a Kotlin native implementation?

There was some discussion about some tools

that's convert Swift to Kotlin,

but ultimately we decided to bite the bullet

and dive into Rust.

But obviously we have a lot of little details

in so far as making sure that we're friendly with Kotlin.

And we really would love your advice on the,

you know, all of our Gordian libraries

to bind them, allow binding to Kotlin,

in particular on Android.

So any advice you have there?

- Sure, I'm happy to talk about that at length for sure.

One of the cool things is that Kotlin and Java,

of course, are interoperable.

So I've been able to use some of Craig's libraries.

So for example, my first contact with UR

was with Hummingbird, which is developed by Craig.

So that's how I ended up playing with my jade.

I had a jade and I was exploring other things

that I wanted on mobile that are not offered

by the Bitcoin Development Kit.

And long story short, our bindings,

one of the decisions we've made over the past few months

is to limit the scope to only what is offered

by the Rust Bitcoin Development Kit.

Because the Bitcoin Development Kit

is fundamentally a Rust library,

and it's sort of like dependencies.

So that's Rust Mini Script and Rust Bitcoin.

So the API that's offered to you,

if you're a Rust developer

and you're using the Bitcoin Development Kit,

that's what we expose,

but we're getting requests for so much more than that

for bindings, 'cause everybody,

if you're offering bindings for mobile,

there's requirements for, you know,

of course all the coin-join implementations,

the Bit21, there's Bit47, there's message signing, there's all sorts of stuff people want.

So one of the things we decided was to narrow our scope and stick with the Bitcoin development kit,

but part of my role this year is to expand our range of templates, documentation, and example

libraries to produce bindings from Rust into. So like sort of following our journey a little bit

and our approach to the tools that we're using.

And for me, that included looking into what else I wanted on mobile.

And the Bitcoin DevKit is just one part of that.

So that's how I ended up into UR.

But we have a whole workflow we're using, uni-ffi-rs.

If you're not familiar with that, it's a library

written in Rust developed by the Mozilla team.

They use it because a lot of the Firefox features

that they want to offer like password manager,

they have like bookmarks,

they want to write that once in Rust, of course,

and then have it available on iOS and Kotlin and Android.

So that's how they ended up developing UniFIFIRUS,

but it's a system that has,

they're developing with sort of like plugins.

So you can basically write your own plugins

for different languages.

So they have plugins for Python, Kotlin, Swift,

but there's also different teams working on a C#

and a Go implementation.

So using UniFFIRS, you can produce bindings for a lot of languages.

That's what we do.

And frankly, starting from one of our templates,

you can get something going in a few days kind of thing.

I'm writing a whole example website that I can share later on.

Thank you.

Now you say here that you're doing animated QRs.

I do encourage you to do a PR.

This is the developer community main page to add Cashew Wallet

and which you are formats you support in here.

But also, are you doing just PSBTs animated

or are you beginning to play around with it in other ways?

- No. Well, for me, it ended up being just sort of exploratory.

I was wondering how I would do it. If I was to do it,

I wanted to learn more about it.

And I don't have a wallet that does it to right now.

I was looking at whether it was the type of thing

I should have in Rust and then expose in bindings,

or if I should have in Kotlin directly for Android

is my question.

And then you go down the rabbit hole,

and that's where I ended up.

But for this, what brought me back to it,

because I had looked at it a few months ago,

and what brought me back to it was a few weeks back,

guys at Cashew were saying, oh, you know, we need to, some of the tokens are too big for a single QR

code. Does anybody know anything about this? What should I do? And then they picked some sort of like

JS library that I don't know what it does really, but it's like, not super, super sort of like,

foolproof. And so I just commented on the repo and said, well, I think by now the absolute standard

to this, the way if you want to skate where the puck is going is the Blockchain Commons

U.R. specification. But when I was trying to write this out, it's issue number 31 on the

nuts for Cashew. You'll find that I actually had to write a whole thing and then realize like

my links were all over the place and there's documentation, there's specification.

Some of the feedback I got on the chat, people were like saying, "No, no, this is their research.

where's the spec? I was like, no, no, the research is like, you know, it's, it's in a repo called

research, but it's actually the spec. And so that's what sort of got me thinking, hey, I should,

I should write this down on these ideas down. Great. I don't have a wallet. But yeah,

I know our intent is that as things get deployed, that we, you know, move them to another repo that

that is more spec-like, you know, or--

- Or even start proposing RFCs.

- Yeah, and BIPs and things of that nature.

Some of it has been a resource problem,

but some of it also is that we're really trying to focus

on, on implement, you know,

places where two or more companies are interoperable.

So it gets out of research when there are two companies

or shipping something, but we also have to be careful.

I mean, we ran into this problem where we did a demo

in research of a animated PSBT and blue wallet

immediately jumped on it, called it 1.0

and we weren't quite ready.

So where the improved version is the UR crypto PSBT.

So we were only trying to figure out

how do we transition to say,

hey, this is beyond just a demo

or we're seeking feedback, which is why we released this,

but actually to a conformance standard.

So for instance, I feel like crypto PSBT

is really ready now to maybe be a BIP,

especially now that I think both,

as of like this week, both Sparrow and Seed Tool support

the multi-path descriptor

versions of public keys and a few other things.

So I think we've got a good, solid demo for that.

But I really wanna see animated QRs

in a variety of other places,

especially with things like foundation devices

and other parties that are gonna be coming out

with air gap wallets that are independent,

that we wanna be able to support not just Bitcoin.

I'd like to be able to have my signal key, for instance,

on a air gap device rather than having it bound

to my telephone number.

So those are the kinds of things we'd like to be able to do.

We'll talk a little bit more about that in a minute,

But Craig, I noticed when I was with a recent update,

there was a little tiny life hash,

which I was very appreciative of.

And I wanted to ask you a little bit about

what, you know, how was the experience of doing that?

Have people noticed?

Is it making a difference, making it easier for people?

And then just in general, what's next with Sparrow?

what's on your roadmap that other developers here

in the Gordian community might be interested in.

And then who else is gonna be implementing LifeHash?

So Craig?

- Sure, let me just make a few comments

before I get into the LifeHash stuff.

So first of all, Funderbiskit,

thank you for your kind words, much appreciated.

Secondly, I just wanted to make a comment

around the naming of the research repo,

the finalizing of things into BIPs.

I don't wanna name any names,

but I don't think that the UR spec

is quite as, is considered,

should I say, quite as universal as you might imagine.

And I think that if you feel it is ready

to take to a more formal level of specification,

And I would encourage you to do that sooner rather than later.

Because what I hate as an application developer

is multiple specs that compromise the UX.

That's, for me, the worst thing to have happen.

And if we have multiple animated QR specs,

then that will undoubtedly be the case,

because ultimately, you can only show one QR spec at a time.

So I would just encourage the Blockchain Commons team

to go ahead with that work if you are thinking about it

and to do it sooner rather than later

so that we have a more formal standard to rely on

rather than just pointing people at a repo called Research.

I just wanted to make that point.

- Sure, so let me ask you a question

directly related to that.

I mean, one of the issues here is that,

instance, the crypto PSBT portion of that is really the only part that is Bitcoin specific.

So do we submit just that part as a bit? You know, of course, they're going to say,

but wait a second, that's encoded in CR in URs. Oh, wait a second. That's a CBOR encoding. Oh,

well, no, it's too complex, which is part of what I don't know. I mean, and then, you know,

when we talk about the larger animated thing, should we just, we do have a repo, Shannon,

what is the name of the repo that has the, is it WIPs? There it is. This is where,

this is the repo that we intend to put them into, I think. So,

Yeah, yeah, yeah, I don't have a particular view on the right place to sort of do it. I'm sure that

you'll you'll be better placed than me to determine that, you know, it probably is true that a BIP is

not the right place. But, you know, if there was a more kind of, you know, it would be ideal that

if it was some kind of a shared sort of repository spec, you know, one one where there was a general

kind of industry view that this was something that everyone went to. I don't know whether such a

thing exists much. You know, we have slips, not great. We have VIPs. I don't have any great ideas

there, but at any rate, I just think it would be good to kind of make it a little bit more

formal in the next few months. That's just kind of my thought on that.

Obviously, we've been developing a stack of technologies and some of them are like

crypto, PSBT in particular, which is basically CBOR wrapped PSBT is very specific to Bitcoin.

But things that it depends on like CBOR, which is already an RFC, which we adopted,

and then DCBOR, deterministic CBOR, which is a profile CBOR that we are working with IETF,

C-BOR working group to standardize is another layer. And then there's UAR, which is a packaging

method for C-BOR-based binary data, which could really be any binary data, but it is based on

C-BOR headers and so on, and a minimum. And in that layer, that also includes the ability to create

anime QR codes. So some of these things are very broadly applicable to a lot of things and some of

them are very specific to Bitcoin. And so there's a question of how do we best publish these things

so on a per spec, per implementation basis so that the widest audience of people can rely on them.

Yeah, sure. And I think... Go ahead.

If I was to choose which one of those things I need, that needs specification the most,

I would say it is the sort of you are part and in particular, the particular method of

creating the fountain codes. There's a particular approach, which to my knowledge hasn't really

been very well documented. There is a specific way in which it must be implemented. And

And ultimately, the only way that you can reimplement it

is to read the source code and kind of take it from there.

So that's kind of what I was thinking more of in terms

of what needs a better spec.

Yeah, obviously, the running code is the baseline.

And there's certain things that we say we depend on,

like the Zoshiro 256 star sit-around number generator.

And those things are easy to find out there.

But yeah, there are certain things

where we're doing certain things

for like pseudo random distributions and so on,

where we've adopted well understood algorithms,

but we've implemented it ourselves.

And we've converted this to several different languages now

or third parties have too, including Rust.

And it's all right in the same across all platforms.

So in a sense, the code is the spec and the,

but I understand that a formal specification,

that's a whole other layer of effort

that we have yet to undertake.

- Yeah, well, I definitely would like to,

part of the thing is we also have

pretty strong architectural desire

to keep a lot of these individual pieces

unentangled because they can be used in many different ways.

So that's also contributes to the problem.

So for instance, you might argue

that the Fountain Code Library

might be useful for something else.

So do we segregate that out, make that a separate spec

just for the Fountain Code stuff,

completely separate from URs.

URs uses byte words and other stuff.

So it's, we've got a little bit of a tangled thing.

I think the architecture is good, but you're right.

the documentation in particular as spec,

we need to move forward on.

- The way this has been emerging is,

over the past several years,

Christopher and I have been having conversations

about the kind of duplicated effort in the blockchain

and wallet community and beyond that too,

distributed identifiers,

verfable credentials, things like that.

And what are the problems they all share

and how can we start building this stack

to address these problems one by one?

And so, you know, that's how this has been kind of emerging,

but we've been basically making it,

so it is very stratified.

It's just also very, there's a number of layers now

that are meant to be separable, as Christopher mentioned,

and try to figure out how we,

how we make those available to the West audience.

That's the hardest part right now.

- But anyhow, it is definitely on the roadmap.

It's a pretty high priority.

That's why we've kind of come back.

That's why I was kind of back here saying,

hey, we really need, we did,

we've got a newer UR intro for people.

We have a newer PSBT doc, both of those we welcome PRs to.

That's basically, I believe, nope, where is it?

Yeah, here is the new intro updated a bit.

And then this is a brand new document

that Shannon worked on.

So, you know, we welcome issues, suggestions, et cetera,

you know, some of which Shannon and I can work on,

others will require Wolf to detail more.

So that is your requirement.

- I think something that might help

what Thunderbiscuit was saying in particular

is that we are working on an outline

for a new developer's website that's going to consolidate

all of the information so that it's not scattered.

And I don't know that that'll help

with the specifications right now,

but I've just written myself a note that we should

at least have all the specifications well-linked by then

so people will know the research is the right place.

And it looks like Thunderbiscuit had a question,

Chris, our point.

- Yeah.

- Go ahead.

- Yeah, well, I think it's all going in very much

in the same direction,

I would-- part of the feedback I wanted to provide

was sort of in that vein.

I wanted to say that it felt like at this point,

there's a lot of things, a lot of directions,

blushing, comments been going into and doing specs and whatnot.

But this one is particularly sort of taking hold.

And I felt like one way it could be helped

was by having a life of its own in terms of website

documentation, that sort of thing, because it still feels

like the you are thing is very much entangled with the internals

of blockchain comments. So for example, just the name of the

file is something like VCR 2020 005. And that's, I assume

metadata about when it was created, then it must have been

the fifth in 2020. But you've see a lot of these projects have

their own sort of thing. And, and then from there, you jump

into maybe some of the documentation.

I saw you point at new docs there.

That's really interesting.

But similar to what you said, I guess

they're a little bit everywhere.

So you need to dig into Blockchain Commons to find them.

Whereas you could buy URstandard.org or whatever.

And then from there, it'd be everything

you need to know to implement this standard.

Are you looking to get animated QR codes?

This is where you start.

And that's that would have been the one link I would have given, for example, to the cashew guys.

Okay.

Started with myself. At this point, I'm familiar with the repos a little bit more. So I find my way

through them. But I think I remember a few months ago, I was just like,

where am I? And there was actually really interesting documentation, but in a few different

places. I think it's a great suggestion. I think we should have, you know, a single kind of

jumping off place for our major standards that we feel like are ready for real deployment out there

like you are simply to animate QR codes and not too far off, already on envelope.

Yes, Shannon, can you pull up the HackMD or send it that you had on the developer

site org? Because I will say we've been challenged that we're literally trying to design

new kind of unified subdomain, it would be like Gordian or developer.blockchaincommons.

Do you have that URL, Shannon? >> Yep.

Well done. >> So if you want to pull this up,

since you're screen sharing right now, I just put it over chat.

Okay, so yeah, so you know, a lot of as you as people have said, we have, you know, the crypto

commons, we have the Gordian repo, some people may not be familiar, but I've been writing at kind of

a higher level, you know, a series of musings on which are more of kind of my architectural

approach and how we're thinking about these types of things. We have a whole bunch of videos,

obviously, there's the research repo. What are we trying to do? We want to support developers and

people who show up. There's this smart custody problem that we've got because it gets entangled

when we're trying to increase resilience and people don't understand what we mean by

sort of a separation of, you know, of interests, things like single points of failure being

different from single points of failure and single points

of compromise are not exactly the same.

And they cause complications when you're designing things.

So we ended up with these three different approaches.

One was kind of an operational thing

that what is our architecture?

What are the roles?

What are the specific things within that?

And how do they support our principles?

And then our various cases.

Then there was a more topical oriented one,

which would be architecture, data formats,

communication formats, key management,

and then a more entry oriented.

You're a Bitcoin developer.

Well, you're going to be interested in animated QRs.

But if you're coming in from digital identity,

maybe you're interested in the SSI articles.

Or if you're doing layer zero stuff, you wouldn't do there.

And then there's the principles one.

So if any of you have advice of which

of these four organizations you would think would work best

and would have solved your problem when you're entering,

especially somebody like ThunderBiscuit

who has just been browsing all of this,

which one of these would have made your life easier

would help us?

- Yeah, Christopher and I were kicking that back and forth

just last week.

So that's something that we're really wanting

to get out there and to start helping people

get to these specifications easier and all the docs.

- Anyhow, back to Sparrow.

What's going on with Sparrow, Craig?

and why did you add life hash?

And we're really glad you did,

but you're the first one in the wild.

We thought it would be useful.

- Sure.

So let me describe the use case,

which is basically this.

As most Bitcoiners know, we have the concept of a seed

and the seed is based on the BIP39 spec

and the BIP39 spec allows you to,

in addition to your seed, your 12 or 24 words,

you can specify a passphrase as a sort of a 25th word,

if you will.

Now, the interesting thing about the passphrase

is that I consider it a relatively advanced feature

because the user has to remember it

and it's not like a password

in that there is no incorrect passphrase.

Every single passphrase will create a new seed

and thus will create a new wallet.

So a UX issue that I was having in Sparrow

was that users were creating new wallets

with BIP39 seeds and pass phrases,

and then making a typo at some point,

either when they created the wallet

or when they'd loaded the wallet up

and were forced to reenter their pass phrase,

because the BIP39 spec makes it quite clear

that the point of the pass phrase

is it is something that you have to remember,

it's not something that is stored within the wallet.

So that was creating a lot of questions,

a lot of people getting upset because they were losing access

to their funds, even if the answer was effectively stored

in their head, if they just couldn't remember the right

passphrase, they could get access. But it was nevertheless

an issue which needed to be addressed through some kind of

UX mechanism. And the approach that one of the approaches that

I took, one of many actually, is to use the life hash. So what I

I do here is I take the master fingerprint as it is defined as the first four bytes of

the master of the key of the seed and I use that in the life hash algorithm as an input

to create this unique little image that gets shown on the screen as you type your pass

phrase in. So as you enter in your pass phrase so this life hash image will change and gives

you the impression that your seed is actually changing with every key because, you know,

people don't understand that every single change you make to your pass phrase is in

fact creating a new seed. So it's a visual indication of that. And then of course, once

you reach your correct pass phrase, you can recognize that the life hash is the same one

that you used, hopefully when you created the wallet. And there's a prompt in Sparrow

to suggest that you take note of the colors and the shape

of the life hash so that when you re-enter your passphrase,

you can identify it.

And this kind of visual cue, I think,

is a lot more easy for people to use than, for example, just

showing the master fingerprint as a hex value.

I think that seeing that it's sort of a red mark with four

lines across it is just an easier thing to kind of deal with.

And I think it has helped.

It's not the only thing that I've done

on the passphrase front,

but I do think that it has helped people

be a bit more confident

when they use the passphrase feature.

- Okay.

Yeah, this is what we call the information block.

So obviously, so this is our reference 128 bit seed,

you know, test vector.

And when we basically have,

we know that it's a seed because it's a crypto seed.

We know we give the seed a value

because the seed is different than the master key.

So we, especially 'cause there can be other kinds of,

there are other ways to transform a seed

into some kind of master other than BIP32.

- Yeah, what you're seeing there is actually,

because whenever you produce a life hash,

it does a shot to be six of whatever data you give it.

That is the last seven digits of the shot to be six.

And that so that pairs with the life hash.

One changes, the other changes.

So it's meant to be kind of a second mode

by which you can verify this.

And the thing below it though,

is the fingerprint of the master key

that would be derived from that seat.

- So this should match what's in the descriptor

if the descriptor is referring to the master key.

Now, obviously, we'd love to work with people.

I mean, I actually have it as another agenda item

down the way, which is,

there's all the others, BIP38, there's BIP85,

which wasn't on here, but that's another one, et cetera,

that how do we be consistent to say,

oh, it's got us, it's a derived key

because it's got a password or it's a BIP85

and it's a different kind of derived key.

It's a seed that is now used for something else.

And then of course there's things now

like a bit 384.

So we'll be talking about that more in a minute,

but yeah, that was definitely,

I'd like to come up with some better approaches

so that we're consist,

everybody's kind of consistent in some fashion

as to what do we show here?

Like, I mean, I would love to, this is open source.

I would love to see more people maybe use

this diagram to say, yeah, this is a seed,

as opposed to, I mean, Wolf could probably do a demo

at some point of seed tool,

or maybe when he does his demo later, he can point out,

we have a couple of other different types of things

here to show, oh, this is a life hash of a public key.

This is a life cache of something else, so.

- Yeah, the object information blocker, OIB,

is what that whole top level header is called.

And we do have another BCR, another research document

explaining what we intend for each of these parts to be used

so that if people want to do something similar,

we're not kind of stepping behind each other

in terms of how we're kind of showing a life-hashing

combination with some other data

that we want people to be able to easily identify.

- And to be honest, I'm very uncomfortable with BIP38

because it's the number one law

among all the Bitcoin developers that I've spoken to

when I did interviews for Smart Custody,

that was the number one failure,

to the tunes of millions, if not hundreds of millions

of dollars worth of Bitcoin because of errors in BIP38.

Anything we can do to make that better.

And your suggestion in so far as at least eliminating

certain class of errors, but the fact that DIP38 doesn't have a checksum and some other

challenges with it make it a security risk, not so much in compromise, but in failure.

But we need to do it. We need to figure out something there because there are people who

use that, use it in sometimes very complicated ways, et cetera.

So I just wanted to be clear on why I use the master public

fingerprint.

Basically, Sparrow is built around output descriptors

and PSBTs.

And obviously, the output descriptor

contains that information.

You don't always have the seed.

In fact, you usually don't have the seed.

You might be working with a hardware wallet or just a watch-only wallet,

but you do have those four bytes, and that's why I use those four bytes.

So in fact, the life hash is shown for every wallet in Sparrow.

It's not only a passphrase thing.

It was developed with that in mind.

But in fact, if you load any wallet in Sparrow,

it will be you will see the life hash for those four bytes that are so integral

to the output descriptor format.

- Yeah, I think I basically have somewhere where I also talk

about how to take a public key

and derive a life hash image for it.

But I'm not sure if we're in sync on that,

but it may not matter, I'm not sure.

- Yeah, in the key export in our reference tool,

see the seed tool, you can actually see the,

a variety of different life hashes.

And we have some iconography for it

and we even have life hashes for,

and a little icon for it for like Bitcoin addresses and such.

So, but in the end,

as developers have unique needs

for your particular approach.

Obviously, a descriptor-centric wallet

is going to have descriptor-centric information

blocks.

A seed-focused thing like SeedTool

has seed-focused information blocks.

But I'd like to be just consistent whenever

you happen to drive, show a seed,

or we show a descriptor or anything else like that,

that we're all consistent across these various things.

- My hope would be that, for example, if you use C tool,

you'd say, derive a private key,

which is when you tell it to derive keys,

it drives the private key first,

and then you tell it to drive a public key

along a certain path, it shows you a life hash for that.

And we have documented the way that's done.

It's not just the code itself,

so there's also documentation.

And it'd be nice if somebody imported that public key

into something else that they would see

the same life hash, that's the intent or hope.

- Anything in that particular UX area

that you're planning on doing, it's on your roadmap

or what's the...

- No, I mean, look, I do take the point

that life hashes can be used in many different places.

I think if we use them in too many different places,

you're essentially putting the burden on the user

to try and remember which life hash goes away.

Was it the red one that applied to the wallet

and the green one that applied to the key

or was it the other way around?

- This is why life hashes don't stand alone.

That's why we developed the object information block

because life hashes is part of identifying the object.

The other elements here, which is a type, for example,

a type icon and the fingerprint,

the truncated fingerprint and then the title,

these are all intended to build a picture

in a person's mind of a rapidly recognizable digital object.

- And we're open for what this should,

we're like I would say for the Bitcoin community,

you are correct that it's really the derived

from the seed value, which we point to here,

that is the one that is important.

We might argue, you really ought to have store the seed,

But ultimately, it's up to the wallet developers

to make some decisions about those types of things.

And if it's different, we'd like to help standardize this

in whatever way possible for that.

Well, we've also documented how to display

live hashes from BIP32 keys.

So--

OK.

Yeah, sure.

No, look, I take all of those points.

I think you may be overestimating the conceptual framework

of many users coming into this space for the first time.

Do they understand really what a seed is?

Do they understand what a public key is?

Do they understand what a derivation path is?

- I think the idea is more that,

if you do something in one tool and it's the same object,

you should go recognize it in another tool, visually.

That's all, that's the main point.

- And also, to be honest here,

I just got, a month ago or a month and a half ago,

got into a long argument with some Bitcoin core developers,

former Bitcoin core developers, I should say,

because they didn't understand some aspects

of the master seed that Bitcoin uses.

And it was like, wow, you know,

I mean, most people don't realize that, you know,

BIP38, excuse me, BIP39 words is basically a weird hack

that actually uses the words to generate the hash

because it's the hexes of them or whatever.

It's a real mess.

And there are a lot of people including the, you know,

the treasure folk who really hate BIP38.

No, yeah, excuse me, BIP39.

And there are people like Peter Woolley who wrote the spec

who basically goes, I kind of regret it in some ways

'cause people are misusing it.

So, and that's developers, much less users.

And that's kind of why we sort of settled on the,

hey, let's try to use one.

We thought the seed was a better one for it

because one it's...

- And yet when we derive the master key from our seed,

which is just a pure random number,

not derived from words or anything like that,

we go through the BIP39 seed stage,

which is actually where we internally convert it

just the way it's the same way other people who use BIP39

convert it to a mnemonic and then back, essentially,

internally, but we suck that all under the rug.

So we're compatible with other websites and so on

that do BIP39 seed generation or key generation.

So we're compatible,

but it's like the redhead step shot,

we don't have to talk about it.

- Yeah, well, and the core people do not like,

I mean, they basically say,

"No, just create a Bitcoin master key."

Don't, you know, they call what we call the seed entropy,

whereas we're, I mean, I don't know, it's a mess.

And when you start talking about outside

the Bitcoin community,

their own community is relatively anti-BIP38.

And, you know, even and BIP39 as well, for that matter,

they only do one derivation, you know,

they don't even do, you know, more than a lot of things,

which causes lots of problems

because they end up having the same key doing, you know,

all the operations, authentication, transfer,

et cetera, et cetera.

So they even have it worse.

So, you know, I'd like to, you know,

have the wallet community think hard about this

and become better at it.

- And I think Craig offered us two great things

to think about.

First of all, that if we do use life hashes

for too many things that we could be confusing the users.

I think that's a very valid point, especially

that they're not going to know the difference.

And so they'll just be asking why are these life hashes different?

And the second is that a wallet might not have the seed and only the master key.

And so we might be standardizing on the wrong thing.

>> I do give that some fairly careful thought.

And this is a conversation that I think we should continue to have with the developer

community about how to, obviously life hash isn't the only strategy for doing a visual

hash.

I think it's fairly unique and has some unique uses.

But the idea is the problem we tackle was not just,

we won't ever use LifeHash,

but how can we have people readily identify digital objects,

objects that have no form other than their numbers.

So the research we did, which we published,

is basically our best answer to that at this time.

- But again, I think that if we,

even for people who don't use BIP39,

if we always in general for seeds recommended,

use the life hash of that to identify it.

That might be useful.

I don't know.

We'll figure it out, but it's an important discussion.

- Yeah, I just wanna say like my comments have,

even though we started off with BIP39 and the past phrase,

the actual application is completely BIP39 independent

because it obviously is just the master fingerprint,

which is defined by burp32.

It's got nothing to do with burp32.

- You're right, correct.

- Yep.

- So I don't know if anybody here is gonna be

at the IETF meeting in San Francisco,

or there's also IETF 118 in Prague.

Anybody gonna be attending that one?

Well, we'll skip that for now, but basically, we are trying to standardize the DC-BOR.

We've had some acceptance.

We'll see.

We'll know more in the CBOR discussion.

So we have 15 minutes scheduled for that there.

And then we're going to have a side meeting to talk about Gordian Envelope.

And do we want to run that through ITF?

Or is it just another wallet improvement protocol type of spec that's coming up?

Obviously I've been credited for popularizing the term self-sovereign identity and self-sovereign

in general, and there have been a variety of different interpretations of that and such.

So I've tried to do some new articles on how, you know, where are my origins around this type of

thing, but in particular, you know, this is kind of the self-sovereign, you know, computing

thing kind of really fits in with a lot of the stuff that Blockchain Commons is talking about and

things that we've talked about in Silicon Salon, etc. And I basically have a new analogy metaphor

for this, which is, you know, you're on a digital journey on a vast and unpredictable digital sea,

you want to stop being a passenger, you want to be a captain. And that one of the things is together

as fleets, we can work together and have unity on the digital ICs. So if this is something that

might be interesting to help people explain self-sovereignty in a new way, I'd be interested

knowing if this was useful or not. So let me know if that's something that resonates for you or

or someone on your team.

Wolf, I think it's your turn.

- Hi, okay.

Yeah, so I'm gonna talk a bit about the progress

we're making on the C-tool.

We're getting closer and closer to our 1.6 release,

which is going to include a number of improvements,

particularly like the low-level architectural improvements,

like including Gordian envelope and things like that.

So we have videos up on Gordian envelope, what it is.

It's built on DCVOR, making the packaged as URs,

the other things you've been talking about here.

So you'll see me kind of go back and forth

between all these things in the demo about what to do.

And I want to, let's see, let me.

For some reason when I'm not the host,

I can't share a portion of my screen.

And so I might have to flip back and forth.

This is...

I made you a co-host in the hope that that solved that problem, but we'll find out.

- Yeah, actually, so I'm gonna, I'm gonna,

it's your multiple windows,

so I'm gonna try sharing three windows here and see how that goes.

You're gonna have to tell me how this looks.

You should be seeing-

- I see three windows all at once.

- Okay, good.

So you should be seeing, I don't know if there's,

arranged the way that in the, here in the middle,

you see my actual physical phone.

- Yes.

hand side you see the iPhone simulator and left hand side you see the terminal. I'm mostly

going to switch back and forth between these three things. So the Guardiancy tool on my

phone already has a number of tests. I'm going to click on my screen and tap on my phone.

Has a number of test seeds in it that I use for various things. Dark purple, aqua, love

is our human blue, kind of our main test vector.

I'm gonna start though over on the simulator.

I'm going to create a new seed.

I'm gonna use the quick create function

and create a new cryptographic seed.

And I'm also going to, before I save it,

I'm going to give it a note.

And then I'm going to, I think I dismissed it, damn it.

I'll have to figure out how to do it.

Dragging down a sheet dismisses it.

So, okay.

Doesn't matter really.

Click Save.

There we go.

All right, so I have a new seed here.

And again, this is the type, the fingerprint,

the master key fingerprint, the name, which is editable.

And of course, these things are all--

there's several pieces of metadata here.

There's the name, the creation date, and the note.

And these three things are optional,

because the seed itself is just, in this case,

16 bytes of random data.

And you can even see that here by authenticating

on the actual device that would ask you for your fingerprint

or face ID.

And then if you just say share, share text, well,

that's the actual seed right there, and it's hexadecimal.

But obviously, because you're going

to protect a lot of things with this, you want to back it up.

And you might want to drive keys from it and things like that.

Real quickly, I'll go into the drive keys

because this is something we've already

kind of talked about in this meeting.

So I just want to make sure we're all on the same page

about it.

There's a workflow here.

It goes from top to bottom.

So you start with your seed, and then you

enter some parameters, like whether you're

dealing with Bitcoin or Ethereum,

whether you're on the mainnet or testnet,

and what kind of key you're driving.

And so, for example, if I'm driving a co-center key here,

you have a derivation path.

And from that, you get the private HD key.

Notice this has a specific life hash here.

And also notice that this is more filled out.

It's red.

It's a private key.

It's marked as private key.

It's a Bitcoin private key.

It's a main net Bitcoin private key.

And so all these things are being added to this to kind of--

so at a glance, it's not just a life hash.

It's all these things.

And so the whole idea is to give you

a picture of what this digital object is.

From that, we derive the public HD key.

And so this particular derivation path

and turn public yields this.

This is now green, says pub, same things here.

And finally, the main address from this,

for this public HD key, which is right here.

So, and all of these are shareable.

Notice we're all using color cues here.

Like for example, the private HD key is a sensitive.

So if I say share this, all these are yellow,

indicating this is sensitive information.

By the way, the QR code is animating here

because this is using the fountain codes from our uniform

resource, UR library.

These QR codes never repeat their fountain code.

So they basically are based on the pseudo random sequence

and you can dip into this fountain at any time.

And the nice thing about it is you converge

to the solution a lot faster than if you actually have to

have a lossy camera where you're missing QR codes

and you're likely to take longer and longer to converge.

So anyway, but some of them, if it's small,

you don't need it, you don't need animation.

But if it's big, then you do.

But the reason why these are larger

is because they are actually a Gordian envelope

and they have all the metadata associated with them.

So for example, if I say share a Gordian envelope,

copied clipboard.

And then I'm going to go over here to--

let's see, get a paste board.

OK, so I'm going to go over here to the terminal.

And then I'm going to type envelope, which

is our command line tool, and I paste.

And notice that what I copied from the simulator over there

was this URL.

You are calling envelope.

So this is a URI, like a URL, which begins with like HTTP

or whatever.

You are always self-contained.

They don't point to things.

They are things.

And it's an envelope.

This is a gory envelope.

And this is the envelope tool.

So if I put this here, kind of you are in it,

it gives me a picture of what's inside that envelope.

And so the key itself has 33 bytes.

This is the subject of the envelope is the key.

All the other things are assertions about it.

And that's kind of the general format of envelopes.

There's type information.

This is a bit32 key.

This is also a private key.

So even if you don't know the care of it's a 32 key,

you can say, is this a private key?

and say, yes, it's a predicate key.

The asset that's associated with it is Bitcoin.

That asset has type information as well,

and it has a network.

This is a main net, and this object is a network.

And so I'm describing basically metadata.

The nice little envelopes is you can have assertions

and you can have assertions on assertions.

So this is, you know, subject, predicate object,

predicate object, predicate object.

This particular object has its own assertions,

predicate object, predicate object, and so on.

It has a chain code because it's a bit32 key.

It has a name.

This is the actual name that's exported from C-tool.

It has a parent.

Now this is a crypto key path,

which we've documented elsewhere.

This is a C-bore structure.

And this is C-bore tag it's saying here.

This is tagged as a crypto key path.

It's a C-bore map.

Now the envelope tool doesn't give you more information

than that, but when you parse this as C-bore,

you basically get the object of this assertion,

of this assertion.

and then you can basically parse this to keyboard.

So, okay, so, and then parent fingerprint,

which is just an integer.

So basically this is how we were kind of structuring keys.

Now, this is a parallel spec with a crypto HD key,

which is still fine and you can still use it.

This is actually kind of more transparent.

And the nice thing about envelopes

is you can add things to them

without disturbing what's in them to begin with.

- You can also make a version of this and say,

elides the private key,

but gives some public key information.

You can, you know, elide your transaction data,

if you're storing your transaction data in there,

or only, you know,

don't only keep the transaction data

and the transaction details to give to your CPA

and you don't give the rest of the stuff.

- Yeah, I mean, envelopes are basically smart lockers.

They let you do holder-based collision,

encryption, compression.

They're basically a Merkle tree,

so you can tell whether they've actually

been semantically altered or not.

And this is also probably why we want to determine

a succeed board because two people constructing envelopes

in separate times and places,

but with the same information,

should actually construct the same bit-for-bit envelope.

That's the goal.

So that's a big part of why we're pushing

for deterministic seaboard as well.

Okay, so I just want you, that's the bit I want to talk

about kind of keys, mostly we're gonna talk about seeds now.

So when you wanna actually back up your seed,

there's a couple of different ways of doing it.

You can say, for example, back it up as a Gordian envelope.

And so if I do that, then it just shows me a single cura,

'cause it's not very big, but what I'm gonna do here

is I'm going to go to my physical phone,

tell it to, I want the video here,

and it's going to be pointing at the QR code.

And then you'll notice it's just imported that,

and it's imported everything about it.

It's imported the name, the creation date, and the notes.

And so if I actually, again,

I'm going to do the same thing I did before.

I'm going to copy this as the envelope to clipboard.

Paste board over here.

Let's look what a seed looks like.

So this is a seed.

The subject is 16 bytes.

That's the actual seed.

It is a seed.

This is the creation date.

This is the name.

This is the note.

And so again, these are the assertions

that come with the seed kind of standard,

but you can add your own.

You can package this within other things.

And you'll see how we do that in a moment here when we actually

talk about SSKR.

So as you can see, and this is basically--

I displayed a Gordian envelope in one on one device

and imported it on the other.

So if we actually go to the other option here,

backup as SSKR multi-share,

SSKR stands for sharded secret key reconstruction.

And it allows you to basically distribute pieces

of your key to a group of people

without any of them being actually without,

assuming they can't collude sufficiently,

they can't actually reconstruct your key.

And we have a spec for that,

It's called crypto S-S-K-R, which is a UR,

just directly encoded as C-BOR, and that's still usable.

Gordian envelope is becoming our preferred way of doing this

because again, it has all these other options, things.

Of course, you can also embed any C-BOR in Gordian envelope.

Envelope itself is a C-BOR structure.

So you start by choosing what kind of split you want,

let's say three or five.

So I have five friends or say three friends,

three friends and two coworkers and a spouse

or something like that.

And I want them to hold these issues.

So any three of them can reconstruct my key.

So I've chosen a Gordian envelope.

So I'm gonna say next.

Now the split has been performed.

This split is basically ephemeral.

So if I leave this page right now,

the next time I come back with the same split,

it's gonna be split differently.

So I wanna make sure I get all my shares

of Gordian seed tool right now.

We do have it on a roadmap to create kind of persistent

So if you want to do the split once and then take your time to distribute to other people, you can.

But right now, it's important that when you're on this page, you get all your shares out of the app at the time.

Did you have a comment, Christopher?

No, I'm fine.

Okay. All right. So anyway, but we do warn people about that.

So for example, you can print your shares and you see there's a preview here.

You can decide whether you want a summary page on the front, which lists the key byte words from each share.

share. You can decide whether you want the notes on that front page. And then the other pages

essentially have the life hash, the option recognition block for the seed, and then the

QR code, the byte words, and then the actual printed UR that would be exported. So these are

the actual five shares, any three of which can reconstruct the seed and all its metadata.

And that's what's important here is because before I did the split here, I should have pointed this

out. If you use the legacy UR, you only split the raw bytes of the seed because SSKR has a limit

to 32 bytes, which is exactly how long a seed can be. And so you can split the seed, but you can't

recover the metadata with that. All you split is the seed. The low-hanging fruit advantage of using

guardian envelope is all the metadata, name, notes, etc., will be split as well. And you'll see how

how that works in a moment here.

So I'm going to go back here.

Now I'm going to say, and of course you can copy them

all to clipboard at once if you just want to do it

in once fell swoop.

So you can just say copy clipboard.

And if I do that, all the,

all the URs will be copied in one step.

But I'm going to go to export shares individually here.

And here you see the five shares.

There's four characteristic words for each share.

And you can export them as various things.

You can export them as pure byte words.

You can export them as a QR code.

You can write them to an NFC tag if your device supports that.

So if I just show an envelope here,

there's the UR of the envelope.

And again, if I copy and paste this over here,

you'd see something similar.

In fact, I'm going to do that because I want to show you

that what you're going to see in a share

is not the same thing you saw before when you saw a seed.

So we go to the Paste Board Envelope.

OK, so here's the envelope for this.

Now what do we see?

The subject of this is encrypted.

So what's encrypted is this envelope,

or something similar to one's act,

it is this envelope because it's the same seed,

has been wrapped and then encrypted with an ephemeral key

that has been split into SSKR shares.

And each of these envelopes has a different SSKR share.

So you're really distributing this smart document

that has been embedded and then encrypted with a split key.

and it takes a quorum of three keys

to reconstruct the actual symmetric key

that was used to encrypt the seed.

So what I'm going to do to demo this

is I'm going to instead of display these QR codes,

and I'm going to again take my physical phone over here,

try the camera,

and then I'm just going to scan the first QR code

and notice that it says, "Recover from SSKR."

it recognizes because it read the envelope

and looks at these one assertion on it and says,

oh, there's an SSKR share

and there's an encrypted payload, a pre-encrypted subject.

And so I need two more

because it was able to derive the information

from what is available in that thing.

So now I'm gonna hide this one.

I wanna say show number three.

And there we got another segment, the middle segment lit.

And let's go number, show number four.

So, and there it is.

So, you can see all the information is there.

The name, the creation date, the note,

it's all available there.

And if these QR codes were too dense,

they would start animating as well.

And, you know, the seed tool on the other end

can read them because that's what you are for.

You can put as much metadata as you want

and the QR codes will dance around

and transmit the information in a very efficient way.

And that is very, you know,

tolerant to a lossy channel like this.

- We also had a demo last month by Seed Hammer

where they were able to get fairly dense QRs onto steel

with their engraving device.

And we're also gonna work with them

on how to have multiple QRs that are printed

in some fashion, whether or not it's on steel

or on waterproof paper or whatever,

if you can't do animation.

So we wanna support offline keys.

Obviously these are UR's, which means they're URLs.

And since it's encrypted,

this is actually reasonably safe to transmit,

say over a secure channel like Signal to your share partner.

Or you can enter into a relationship with a service,

which would encrypt it one more time.

And you would then be able to recover,

use a third-party recovery service.

I don't know if you want to do.

- Yep. So I just copied, this is actually is a long,

it has a longer metadata on this one over here.

So I just copied this from my physical device,

paste it into the simulator

and you see how it's already recognizing this is here.

I just copy and paste it the actual text URL you are across

and then it's giving me the preview and then I say save.

And so now I have this seed over here

and just copy and paste it the whole URL

without splitting it.

If I then want to split this one

and say backup as multi share and say three, five,

next export shares individually,

export as QR codes, if I show them,

they're gonna be dense or they're gonna animate.

And this is something I have to still fine tune

before we do the next release

is this should probably be animated now

because it's pretty dense, but it's probably still readable.

Let me just see if that's true.

- But not with Sparrow probably

and that's what we need to test.

- Maybe not.

Yeah, well, that's the thing.

Yeah, that's true.

And of course, different cameras have different qualities.

Yeah, this is pretty small right now.

If I actually increase the size of the window probably,

it probably could get to the point where it's readable.

There we go.

But the threshold at which you start to animate is tunable.

And that is something that I'll be playing with

before we do the 1.6 release.

So, that's pretty much the demo.

I would just want to show you how we move back and forth

between QR codes and the scored envelope

and SSKR shares and all these kinds of things.

It's all a very unified system.

And I think there's a lot of benefit

for people who are considering adopting this.

And on a documentation for envelopes,

we have a lot of examples

and Shannon has put together some really good user stories

and use cases for it.

And we think it could be,

Gory envelope could be really useful,

both within and outside the blockchain community.

- Thank you. - Any questions?

- So sort of a quick, this is an AMP,

what we call in minimum viable architecture for CSR.

There's a lot of capabilities, features, et cetera,

that could be added to it,

but as we've kind of felt like this

demonstrated a variety of important architectural features,

but is unlikely to be exactly what you would choose to do.

We also have some inclusion of descriptor metadata

that is kind of minimal choices.

And of course we do the seed reconstruction,

but there's still a lot more to consider

and we need your advice on prioritizing there.

I know proxy and Bitmark both had this concept

of a progressive SSKR split.

We've identified some problems because SSKR

is different every time you do it.

So we have to have some persistent state

until you've given your shares

to whatever parties you wish to share to

and it's complete.

So there's some questions of UI there.

And then we've had a number of people

who would like to have unencrypted metadata

to assist recovery.

So these would be things outside the envelope

that might have some other details,

maybe the fingerprint.

- Not outside the envelope per se,

but outside the actual sharded part of the envelope.

- Correct.

- Yeah.

- And again, that's one of the nice things about envelopes

is you can mix and match encrypted parts,

non-encrypted parts, charted parts, non-intrarted parts.

It's very flexible.

- Right.

The other things right now,

seed tool does not support BIP38.

And so we could define another UR type for a password

that would be the BIP38 marked as being a BIP38 password.

So you could, if you wanted to,

you could add that to the envelope.

Similarly, there's some weird scenarios where you could say,

"Hey, you can get the master key,

but in order to get the BIP38,

you need to get one more share."

So it would be like two different splits,

but not all the data is in both splits.

There's BIP85 support, which I know we've had some people interested in, but causes

its own complications because it's basically generating a new master key, but it's not

actually generating a seed, which drives some other blockchains and people crazy.

And then there's 384 is a new bit for transaction data.

So the name of the account that you've named it,

all the transactions that you have done on it,

who to, what level of privacy, et cetera.

- By the way, I just remembered there's the other thing

I did not demo, which is, which I could if you want,

is the request responses using envelopes as well.

So, and again, that's something using Guardian envelopes

as a way of conveying requests for say,

a seed based on a hash of a seed or a key based on

a derivation path and things like that.

So it's a way of basically facilitating communications

between devices where there's a series,

one or more requests and responses involved.

And again, the structures being passed are very flexible

because they're-

- So the advantage to say Sparrow would be right now,

Sparrow when it's working with seed tool says,

go to this option, go to this option,

go to this option, go to this option,

and you've got a,

we can now get an account from you or similarly.

But instead what it can do is just simply when it,

it can just simply show a little QR code,

which is pretty small,

that says this initiates the whole thing

and it will basically just ask you,

whatever doesn't have to be our tool, whatever tool,

please do this operation for me, sign a PSBT,

or give me a cosigner key,

'cause I wanna prepare to do a,

create a descriptor for a multi-sig

or something of that nature,

which should make it easier for everybody,

'cause hypothetically, there's no reason why

foundation devices with their air gap device

or Kobo with their Eric app device or our iOS reference app,

could all use that same QR code,

which will make life easier for everybody.

But we really need your feedback on what to prioritize.

So we're gonna basically get this MBA out

in the next few weeks, probably pause,

depending on what your roadmaps are,

when you're gonna start implementing

if any of these features.

I mean, if you tell us,

hey, I can't get into it until October or November,

we may not do more than just get this reference app out

and go back and do the rest of the Rust documentation,

the other things that people are requesting.

But we really need your feedback.

So that's where we get to kind of the end of this call,

which is I would like to kind of get a feeling from,

each of you, is there something coming up on your roadmap

where you're seeking interop

and are willing to do some effort there

and we will focus our efforts on those types of things.

So I'm actually gonna, Dario,

This is, I think, your first call.

Anything you want to introduce yourself

and say anything about where you're interested in

or if you're just investigating

or if there's something that's a priority

that we're not even thinking about?

- Thank you, Chris.

No, right now I don't have really too much to say,

but my own interest is I've been following you

and the work that you guys are doing for a while,

lurking as it were in the background,

I've helped put together a hardware wallet team in the past.

So, you know, I have some sense for where the ledgers

and treasures and bit boxes of the world are doing good

and doing less good.

So you guys are doing great work

and I'm trying to keep myself up to speed on the future.

That's it.

- Thank you.

Nicholas?

I know you are working with Kotlin.

Thunder Biscuit.

- Hey, well for me, right now I'm focusing on

a bit of Kotlin multi-platform thing.

I think I see a lot of adoption for KMP in the industry,

including some of our clients for the Bitcoin Development Kit.

Block is using it extensively in their new app,

and I want to help support that and dig more into that.

And so that's part of why I'm looking into a UR

and exploring how I can understand the standard more.

And that's kind of where I'm at.

I'm building my own sort of internal version

of the documentation so that I can dig into it.

- You can always shoot your questions on Signal as well.

I'm on Signal, I'm in several of the blockchain commons

you can slip me up there and send me questions

about these specs and I'd be happy to answer them.

- Cool, yeah, I think I'll join the Signal group.

- That'd be great. - Thank you.

- Craig, you're busy.

(laughs)

Where are your priorities right now?

- Yeah, as usual, I've got a lot of things on the go.

I saw actually in the notes

from one of the previous meetings,

I think it may have been two or three previous,

that the legacy message signing request

that we put in at the start of the year,

there's actually some work on that.

I haven't unfortunately got time or had time

to dig into it yet, but I do intend to do so

and to see what came out.

I obviously missed that meeting,

but I'm intent to kind of dive into that

and see what work was done there.

Yeah, the only other thing to say

is just to reiterate what I was saying earlier around,

don't assume that UR is already the standard.

I think that it was still early days

And if we have a different standard that comes to light,

all of these things that are built on UR like SSKR,

have a lot less chance of succeeding.

So focusing and getting those specs out

and getting the whole approach well documented

is I think an important thing to focus on.

- To be clear, SSKR is not in any way built on UR.

URs is just one way of packaging SSKRs, period.

SSKRs are entirely independent of URs.

- Okay, sure.

- On the architectural later, yeah.

- But Craig, one of the things I know, again,

you've got a lot of BIPs

and various kinds of requests on your plate.

I know for me, we've published some scenarios

for how to do better multi-sig,

which starts off with, you know, give me a co-signer,

give me a co-signer pubkey.

And, you know, from a variety of different kinds of devices,

we would really like to see crypto request demos soon.

And since we do not have a Bitcoin coordinator,

you know, ourselves, you know, we need someone like you

or Casa or Unchained or somebody else who's got a coordinator to implement that.

And then of course, we'd really like to see crypto,

be it PBST move toward crypto request as well, or at least having that as an option.

So that you can request other things besides signing

PSBTs such as legacy Bitcoin or other different types of things or either of these something that

is a Q3 thing, a Q4 thing beginning of next year. We're just trying to get a feel

and if you don't feel like you can commit to anything now that's not a commitment,

you're just trying to get a feel. Yeah, I mean, I try to focus on things that

the users of Sparrow will want. And obviously they are interacting in a world with all of these

hardware devices and that's sort of the focus really is what devices are they interacting with.

They're also obviously interacting with hot wallets. But here we're really talking about

the interoperability between devices and the coordinator.

So without some kind of demand-- and I understand your chicken

and egg problem here-- but without some kind of demand

from the device side, am I going to invest a lot of time

in building something which isn't supported on any device

which is out there?

It's also true to say that I'm--

and this is maybe a broader philosophical point--

is do I want users--

what is the UX like when users exchange these QR

codes between the device and the coordinator?

What kind of a feel is that?

I haven't really thought deeply about it.

it feels quite different to what Sparrow is today.

So it's not just a, you know,

am I gonna implement this feature kind of thing?

It's also a, how does this fit into the broader

overall UX architecture of what I'm trying to build here?

Those questions feel a little way off to me right now,

if I'm honest.

It doesn't feel like an immediate need

that people are asking for.

So that's just the most honest answer that I can give.

It's certainly helpful seeing Wolf's demo today

and getting a sense of what the sort of envelope

can be used for.

And that certainly might plant some more seeds

and we'll see where that goes.

But I have no immediate plans.

As I say, I think my next step is to look

into the legacy message signing,

which I think does involve the envelope

of I'm not mistake-stricken.

And that's perhaps the way in which I'll start

to become more familiar with it.

- Okay.

So clearly, I mean, so Foundation Devices

has a new app and tools associated with their product.

And they have said that they're committed

to moving in this direction.

So it sounds like maybe the three of us

should coordinate a little bit on that.

I know one of their particular interests

is being able to backup shares.

It'd be great if Sparrow could accept a share,

even if it doesn't,

or transfer a seed and made a data safely

to foundation devices and such.

So that would be,

I don't know where they are in their roadmap,

but that's of interest.

I know that Unchained has been, you know,

a Blockchain Commons sponsor for more than a year

because they really would just like to be able to throw up

a QR code on the screen and basically initiate

the whole process of doing things.

So that's Unchained.

CASA should be interested in that as well.

but I've never been able to get them to come

to one of these meetings.

But they are supporting PSBT.

I think they like it.

Another thing that people have asked us if we should do,

and everybody can answer this one, is a QR debugger.

There's something kind of like the QR storage app

that we had at one point as an experiment.

but it would basically allow somebody to, you know,

go, is this legit?

Is this cute?

You know, there's been some people go,

well, I don't know what's in that QR.

And we could offer something that, you know,

for the general public,

which is simply help identify what this is that's,

you know, somebody's trying to send you

and is it conformant in various ways.

So, and then for developers, you flick a switch

and it'll basically help you debug all of this.

Is any of that of interest to any of you right now

is our priority or do we save it till the fall?

- I think I would certainly be interested to support

any of the feature development that the various entities

that you mentioned are doing, you know, where the foundation is doing something or unchained,

that's certainly something I would look to try and support. So keen to hear more as and when that

happens. Great. Okay. Well, it's 1134. So we're a little bit past our hour and a half, but I wanted

to thank everybody for being here today. Obviously, you know, if you you can talk to me on Signal,

all of us on Signal or on Twitter through ChristopherA and we look forward to more details

in August. So in August we're going to do an Asia friendly time zone again and then in September

we'll do back to EU and so we're going to go back and forth for a little while.

see how it settles out. So we clearly have some European parties in this call. And of course,

all of this stuff, we will excerpt key portions to our YouTube channel. Well, thank you again,

very much. Thank you, Wolf. Thank you, Shannon. And we'll talk to you in a month.

Thank you, everybody.

Yeah, I'll come down.

Thank you.

Bye bye.

Goodbye.

2

you

