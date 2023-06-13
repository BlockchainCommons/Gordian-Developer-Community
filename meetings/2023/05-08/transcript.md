Okay, I hope everybody can see that. So I'm Christopher Allen from Blockchain Commons.

Our big goal is how do we create an open, interoperable, secure and compassionate

digital infrastructure to enable people to control their destiny and to maintain their

human dignity online. We are particularly focused now on working with developer communities

around tools for digital identity, digital assets and responsible key management.

But these are based on our Gordian principles.

Our Gordian principles are for independence, privacy, resilience and openness.

And those in turn are based on the self sovereign identity principles.

So that is really kind of the context where we came into this discussion.

So obviously I've been involved in DIDs and verifiable credentials for a very long time.

I'm a co-author of the DID 1.0 standard, and then I'm also a co-author of the TLS standard

from the late '90s.

And I really wanted to talk with you as, you know, we, I think you guys have done a great

job with schemas and the VC group has done a great job creating a data model.

I just really wanted us to take the next step.

And the next step is significantly more privacy.

So clearly, digital credentials are a better way of sharing.

I mean, we wouldn't be in this meeting today if we didn't believe that to be true.

I mean, they simplify administration.

You just create this thing that is a digital version

of what you've done in the past.

You digitally sign it, you put your public keys in a PKI,

and to a certain extent, that's relatively simple.

You're publishing.

They allow you to simplify your usage.

The students can use them as they will.

It's not necessary for a staffer in an institution

to verify because the signature does that.

And of course there's no phone home.

That's actually one of the first useful things

from a verifiable credentials model

is that the holder can basically get it verified

without having to call home,

which could cause privacy problems.

But I also feel like digital credentials can be dangerous.

All that we've done with them is right now,

make them better, but we haven't necessarily addressed the problem.

So in particular, how do you protect student privacy?

So, you know, a subclass of that is how do you protect against discrimination against students?

But possibly even more important, especially given this group, which is working directly

with universities and other educational institutions, is how do we reduce liability,

especially given laws like GDPR, the CCPA in California,

and I've been involved with even more digital privacy

laws that are emerging.

So what are the problems of digital credentials?

Well, obviously, an important one is identity theft.

You get three points of data about somebody,

and you're well on the path of understanding who they are,

why they are, what are their weaknesses, what

their strengths, et cetera.

So we're always trying to minimize this.

And credentials, even educational credentials, contain a huge amount of info.

And a lot of stuff is, you know, not properly boxed.

So oftentimes you'll have, you know, personal identification issue to allow for authentication,

which has really nothing to do with the credential data.

So you know, oftentimes in there will be things like birthdays, you know, real names, various

ID numbers.

And these are often used by other parties as identity questions.

But specific data can cause problems too.

So let's talk about that a little bit.

Gender discrimination.

So at the last rebooting, we had a young woman from Eastern Europe who was a doctoral candidate

And her basic thing was, you know, A, she's already dealing with gender discrimination,

but then she also graduated from a Central European University.

So she's also discriminated against as a Central European.

And her name sounds ethnic, and so she's also potentially discriminated on a religious.

data that's going to be on her credentials. In addition to that, it may have their birthplace,

it may have various issuer location information, other things that can be used for racial or

other things. There's age discrimination. When I last taught in an MBA program, a number

of my students were in their 50s and, you know, in the years since that I've communicated

with them despite getting their MBA and such, they felt discriminated against because of

their age and at least the initial interviews with people.

So faith-based school information, whether or not it's a religious school or something

that gives a clue about religious details, can also be used.

And then, you know, the basic problem is the more data, the more problems.

So how do we solve this?

And one of the simplest solutions is something that we call holder-based elision.

So what is this?

Our basic position is that data-filled credentials shouldn't be out in the wild as much as possible.

Instead, let the holder redact the information as they see fit.

Now note very carefully, I'm not saying subject, I'm saying the holder redact information.

Yes, the subject is the first holder.

But there are a variety of reasons as these go out to HR departments, out to various accrediting

bodies or loan review bodies, etc., where they become holders and they too may need

to be able to redact potentially in different ways that meet their needs.

So this allows all the parties to eliminate potential discriminatory information or partially

reveal it.

But the holders still have the full credential when it's needed because the signatures will

still verify.

Thus, the question of data retention, deletion, inclusion, et cetera becomes more of an issue

for the holder and of course the holder's wallet, not the educational institution.

So how does this work? So I'm going to talk about one particular approach to it. This is

from Blockchain Commons. Wolf is the implementer. And it basically starts with a hash. I presume

that everybody here knows what is a hash. I mean, it's a data fingerprint. You can see here

The input is hello world and it has a 256 bit hash.

We also have beside it here something called a life hash,

which is a visual version of that that was invented by Wolf.

Because it's really hard to read those numbers.

I mean, everybody I know looks at like the first three and the last three,

which isn't as secure.

But if you see both the hash and a live print,

you can feel much more confident that two hashes are the same. A very small change,

just changing the input from an O to an OOM Lotto makes for a drastic change both in the

hash and in the light print. So that's what hashes are. They're fixed size no matter what the size of

the input is. You can kind of consider them to be, you know, the ultimate in lossy compression.

And hashes are one way, you can't back them out.

And they're really a long series of numbers,

but again, they can be made more visually visible.

So what is hash-based deletion?

So right now when you sign a document

and then you remove the data, you can no longer

verify the signatures.

So you're kind of stuck without the data.

So how do we allow the holder to remove the data without

invalidating the signatures?

So instead of signing the input, we're basically

signing the hash.

Now, you could say it's pretty obvious, because that's

actually, technically, underneath the scenes what

actually is happening.

But we're making this even more explicit in designing it

in the system.

But the key thing is that when the data is removed, the hash

remains in the document.

When the data is restored, you can verify that the data's hash

matches the hash in the document.

So let's take this up to the next level.

What is a tree of hashes?

So data can be arranged in a tree.

Oops.

For some reason, I'm not seeing the tree image.

There it is.

The all similar data is kept in the same branch.

For credentials, all of a student's

personally identifiable information

might be in one branch.

all of their qualifications might be another.

This organization continues down from there.

Now, this allows us to align specific types of info.

So how does this work?

Every bit has its own hash, and it

is reflected all the way up to the root hash.

This is a really old and considered

to be mature technology.

The Merkle tree was invented in 1979.

It was one of the first cryptography things.

So we know how to do this well.

So what is hash-based elision?

Well, if a document is a tree of hashes,

then any change anywhere will invalidate the signature.

So, you know, we see here we sign this root document

and it's basically, you know, anything changes and below,

boom, it propagates other upward

and now the signature no longer verifies

because the hash is different, right?

them pretty basics.

But with hash-based elision, the document is a tree of hashes,

not a tree of the actual data.

Then any branch can be removed while leaving the hash behind

so that all the higher-level signatures can be evaluated.

So in this case, the root is also signed.

But we can choose to align this particular document,

let's say that this is my age.

And I don't want to send that to somebody.

It removes certain information about me.

I can send this along to someone else.

And given that alighted information,

the signature still verifies.

And maybe they don't care or are not

supposed to care about my age.

They don't need that extra alighted information.

So this really allows for data minimization, which

is the cornerstone of privacy.

The basic reveal, reveal no more than what is needed.

That's the bottom line.

Any kind of data minimization, in my opinion,

requires some system of selective disclosure.

There are a number of other approaches.

I think this is one of the better ones,

because holder-based hash-based elision makes students--

allows student holders to make all of the initial decisions

about how things are going to be shared.

So, you know, as people creating these credentials, why do we care?

So we want meaningful credentials, but we also want to protect students and their futures.

We want to protect vulnerable populations that are coming to our schools.

Students are particularly vulnerable.

They're young, they're away from home, they're away from their support systems, they're away

oftentimes from their own cultures.

We have to protect them.

And then of course we value diversity and we want to protect the diversity in our institutions.

And but we also want people to be able to leave our institutions and get great jobs

and careers and support our institutions in the future.

Some other ways that it helps institutions is you don't have the admin of alighting credentials.

The institution does not have to understand what the risk

requirements of a--

somebody who is the third party in a verifiable credential.

The person that is hiring the student

now has some information about the student's credentials,

and they have very different needs.

They may need to prove, hey, I've

got 10 people in my organization who have these qualifications

to some other body, but they don't

want to give the people's names or anything

allows other parties to poach those employees.

So they have a different holding and a collision requirement

than what is needed.

The institution doesn't need to have to understand this

and how this works or enable it.

It's just automatic with Gordy and Envelope.

Thus, they also don't have the liability

of overfall credentials, having too much data in there

because it is all-allidable by the holders.

This lowers your responsibility.

I probably should have put a legal caveat here.

You still have responsibilities in GDPR,

but it lowers your responsibility for GDPR

because some of it is specific to the holder.

Institutional compliance-- a lision

can also protect institutions from violating laws.

So for instance, oftentimes institutions need to be able to say, this number of students

graduated to somebody that is loaning money to students and wanted to make sure that the

institution is doing that.

How do you exchange all of this thing to know what is the status of, you know, these students

without violating their privacy?

Well, with a collision you can prove, yes, we have these number of students and this

number of students is employed and the hash tree works and compliance rules work for this.

But I'm not giving you the names of the students and the names of their employees.

This is particularly important in the United States because of FERPA and the PPA, which

which has very, very strong requirements as far as how information about students is passed

forward.

And I think a lot of institutions are in violation in the sense that, you know, they're doing

stuff that allows others to violate the privacy.

So I don't think there's any case law that pulls it back to them, but institutions can

clearly do better.

In Europe, there isn't a specific law around student information, but GDPR is pretty broad.

And of course, CCPA in California is, you know, kind of a variant GDPR-ish, some pros

and cons, but there's a whole bunch more coming.

Data -- supporting data minimization can really help you provide compliance for a lot of these

different kinds of rules and regulations.

So that is in general what is a lesion and why it's important.

Specific to Gordian envelope are some additional features.

So there's this concept of something called a proof of inclusion.

So instead of having an individual certificate, you can basically sign the root hash and publish

it with no other information.

When someone reveals their document to say, "Oh, I'm a student," only the necessary

hashes are revealed between the student's credential and this root hash.

And that allows for a lot of interesting use cases.

So that's one thing we really wanted to support natively.

One of the particular ones that I really like with this is something called herd privacy.

The institution can give every student their credential like they do now, but with some

additional information that says, you know, where are they in the cohort?

And then all the institution has to do is publish the public route for the entire cohort.

So instead of giving out, you know, a thousand graduation credentials, certificate credentials,

grade credentials, and all this type of stuff for a cohort of students, you can just publish

a public route and the students can choose to prove that they were part of that particular

cohort, the graduating class or the quarterly ending public route of something.

This allows for a lot of additional anti-correlation capabilities and such.

It is, however, different than the classic verifiable credentials model.

So there would have to be some adjustment to think about it.

Because in some sense, this is a giant verifiable credential

for everybody in the class, rather than

a per individual, per subject.

There is more-- oops, I'm going the wrong direction.

Sorry.

So again, the student can prove inclusion in a cohort.

Also another aspect of Gordian envelope

is that we allow for a lot of different kinds of allusions.

So Gordian envelope,

I'm sure all of you are comfortable

and familiar with triples.

Alice knows Bob in this particular case

in the Gordian envelope,

a node is the kind of the leaf hash of Alice.

it's assertions and the nos and bobs.

That's kind of, you can see the hat,

there are five hashes here.

We can allide the subject.

We can say that somebody knows Bob and have it be signed.

We can say that Alice has some relationship to Bob,

but not what that specific relationship is.

We can say Alice knows somebody,

or has some predicate there.

And we can also just say Alice has a number of assertions,

but we're not going to tell you how many.

And of course, there is just the ability

to have the single hash root where everything is alighted.

This gives for a lot more choices as compared

to some other allusion specs.

So right now, these are the four major ones.

There's SD JWT, which is being run through the IETF.

It leverages the verifiable credentials, JWT ecosystem.

DIF uses a lot of those.

It's also related to the ISO, MDL, and MDOC standards

that are being used for mobile driver's license.

For a lot of people, they like it

because it doesn't require schemas, which--

If you're familiar with this area,

that's a complicated pro and con.

A particular con is that the hash list is not a tree.

They basically allied a whole claim from a list.

So they basically have a list of claims, and they say,

well, we're going to allied three, five, and nine.

So it is not quite as flexible as a tree version of it.

There's LD Merkle disclosure,

which I think is a little less mature,

but there is a W3C dock on it.

The particular advantages of it

is that it leverages the JSON-LD ecosystem,

which I believe the BCEU community is losing.

It's particularly convenient for node graph data.

But again, it is a hash list, not a tree.

You're just basically being able to allude an entire claim.

And it does require you to have a node graph structure

for your data and a schema for it to properly work.

Gordian envelope is ours.

It's data structure agnostic, meaning you can do graphs.

You can do lists.

You can do schemas or no schemas.

You can even do different kinds of graphs.

You can do node graphs.

You can do edge graphs, et cetera.

So that gives it a lot more capability that this is why we can offer things like redaction,

inclusion proofs, herd privacy that I discussed earlier.

But we can also encrypt data.

We can put, you know, something in escrow and still be able to verify it signed.

If it's a large object, we can compress it.

And then we have some special capabilities as far as secret sharing.

The cons is it's not W3C VC-centric.

In some ways, it's a little bit below the VC.

It's useful for many other purposes also, including DIDs and other data, but it's not

on a standards track.

We have submitted it to the IETF, and we hope at some point it will be standards track,

but it's not been, you know, accepted by an existing working group yet.

Finally, we have BBS+ Signature, which is being run through the IETF, but there are

active people in both the DIF and W3C communities and regarding it, its main advantage is that

it allows for anti-correlation of signatures.

That's something hash elision can't do because what happens with it is you're offering proof

of knowledge of an undisclosed signature and then correlating that.

powerful feature. It doesn't use hashes and instead uses a brand new cryptography. I would even argue

two layers of it. It uses pairing cryptography and then it uses new cut cryptography on top of

pairing cryptography. The combination of this makes it more complicated and also there are,

it's a little bit more complicated to do holder-based deletion scenarios. But it's still a very

powerful technology. Some final notes, digital credentials are powerful, simple credentials

do not protect privacy. Both the holder and the issuer have risks. They're also transient,

they can be lost, there's too much information. We need strong, safe credentials with control

by the holder, the ability to align, maintenance of signatures through hashing, and proofs

for further data minimization. And I really need to put this call to action here. Holder-based

deletion is crucial for privacy. It can do more -- I mean, if you're supporting BBS-plus

proofs, fabulous. That doesn't mean that you shouldn't also be considering holder-based

deletion. We really need to turn some of these, oh, well, maybe we can do some privacy things.

we should do some privacy things and start putting them in mists.

I'd like to see more specs, more groups saying this must be done.

Because legally data minimization really is a requirement.

So why aren't we doing that?

Ethically, if you're part of the self sovereign community, you've also said that user control

is a requirement.

So we need to turn these into mists.

I'd love for you to use Gordian Envelope because it has some of these additional features,

capabilities, perd privacy, etc.

But if not, please, please use one of these other Allision specs for your base.

So more on Gordian, tiny URL Gordian Envelope.

There's also a bunch of very useful videos and transcripts of videos, et cetera, at this

URL, tiny URL, tiny URL Gordian-videos.

And then specifically there is this educational use case where we've tried to describe, you

know, the utility of Gordian for that.

And I'll quickly show you what that looks like.

So this is the educational use case.

You know, we talk about various--we call this a progressive use case, various official credentials.

She restricts them.

Somebody wants to hire her.

She gives them their information.

Later, there's an open badge and then three kind of progressive herd privacy credentials.

We'd really like to see contributions from this community to take this educational and

credential industry use case forward. I think that's it.

Thank you, Christopher. It's a lot, but also really interesting and important. I'm

for you to the queue. I see if we have Phil in the queue, but I have a question for you.

Could you explain to us how would a wallet, how would a VC wallet implement something like

the wording envelope so that an individual would know

that they have the option to share limited pieces of data.

And also how would a verifier request that?

So how would you apply this to the software,

kind of the software we have now?

- Correct.

So I mean, one of the problems

with any of these types of things

is it does put a greater burden,

not just on the provider of the information in the form of the holder,

but also the verifier of the information.

So my kind of take on it is it needs to be incentivized hand in hand.

Because to a certain extent, the holders don't want the information --

I mean the non-subject holders don't want the information either.

It becomes toxic data.

So we really want to, you know, create systems where the verifier goes,

This is the information I must have.

And so we've actually kind of written a,

at rebooting, we have this draft paper

called Selective Disclosure,

I'll send, put the link in the chat,

that talks about a different way of thinking about things,

which is we really need to deeply understand,

what we want and need to be correlated.

So that's part of it.

I think there's a lot of exploration in UX of how to do this without overwhelming users.

My hope is that as we look carefully at these schemas and such that we maybe break them

apart a little bit more, it's one of the advantages of the tree structure that Gordian has.

Because on one hand, an institution who is, you know, making statements about authentication

information of a user which allows, you know, the, you know, it's kind of like the student

ID type stuff, for the purpose of then separately being able to validate the credential, keeping

those separate really helps.

And then within the credential itself, you know, having it have subcredentials and things

of that nature will also help UX in this.

So one of the other things is I've written an article on something called progressive

trust.

I think that anybody who's implementing this type of thing has to think in this sense.

There's a desire among developers in this community which is, oh, I'm going to get this

blob, and I'm going to throw the blob into a box, and the box is going to glow green

and say go you're done okay. I just don't think that's the way the world works in the in its

patterns of trust. Things are much more gray than that. You know you only want the information you

need for the risks that you're having at the moment. So that means the verifiers need to be

able to throw these blobs into the box and box come back. It's okay but I just need one more

thing and then go ask for the one more thing and then the user can basically say, "Oh, do I really

want to do this? I mean, why are they asking me for this one more thing?" And I basically can decide,

"No, I don't want to give them this one more thing. You know, it's, I don't need that job that

bad. I've got other applicants who aren't asking for that information." I hope that helps.

Yeah, I'd like to add something too, if that's okay.

Oh, that's helpful. Sure.

Yeah, so what we tried to do with envelope is design a substrate that is very flexible.

And because of the tree structures, Christopher mentioned, you can have these triples,

which are assertions, but you can also have assertions on the assertions as many levels

as you want. And so there's many possible structures that could emerge to make this

easier for users. One would be, and of course, you know, now that we're in the substrate,

we'd like to see people start to create tools and standards around this substrate.

For instance, you could provide templates that say,

"Okay, for a particular purpose,

here's the required information from this credential that we need."

Then you apply the template,

and it shows you in one step essentially what's being elided,

and only with the required information is left.

Another possibility is that issuers can actually put assertions

on various parts of the data saying this is potentially discriminatory.

The user can just use a tool to say,

eliminate all potential discriminatory information or let me review it so I can decide what to

alight.

So there's a lot of ways that these documents can be both constructed and manipulated such

that the user actually has a lot of transparency into the kind of information they're providing

or choosing not to provide.

Yeah, just to be clear on that, one of the differences between the sort of the node graph

model of JSON-LD is that you have this triple and then you have one more value that you

can add to that triple which allows for the quad to function and do ordering and other

different types of things.

We're not limited to that kind of structure.

So you can basically have multiple assertions or multiple predicates around the same claim.

So you can have all kinds of sub-annotations of things.

And in fact, even the predicates can be envelopes.

So they can have multiple assertions about the predicate to say, oh, this is an owl schema.

This is a, you know, this is a, you know, belongs to such and such a template or whatever.

So again, it's a lot depends on whether or not you want to go up to the full flexibility

of Gordian Envelope.

If you're using LD JWT or-- no, it's not LD.

It's anyhow, if you're using one of the selective disclosure alternatives in the JWT or JSON

LD system, you won't be able to take advantage of those.

But you can at least say this one claim, I don't want to share.

Right.

Yeah, I'd also add that Christopher went through those five illusion points in a document.

Of course, that applies all the way down the tree.

But any of those illusion points can also be symmetrically encrypted, public key encrypted,

split into shares, which can be distributed to a group of parties where a quorum is required

to actually reconstruct the secret and compressed,

things like that.

They're all available.

Illusion obviously is one way of protecting information

such as the holder has to provide the information,

but it could be encrypted or other kinds of escrow.

So it's very flexible.

- That's very interesting.

I'm gonna oversimplify it and then really Phil,

I'm gonna hand it over to you in a second.

We work with the OpenBadge aspect quite a bit

in this space right now,

because it's the one that's really aligned to VC so far,

pretty closely in education.

Could it be so simple as that spec includes a property

that says this is where you put this

if somebody just wants to know

that this person say it's a diploma.

They just want to know if they want to graduate.

And then we add a property for that to accommodate this.

With that being said.

- There has been discussion in some other places

where amidst another format,

you know, you know, JSON or whatever, there is a,

a Gordian spot inside it.

Gordian uses CBOR if you're familiar with that.

So that's a binary expression language that is determined.

We use a particular variant of CBOR called DCBOR,

which is a deterministic variant.

So our data is binary, but that being said, it can be,

because of the, you know, how we've done the layers,

You can encode it any way you want. You can turn it into boring hex.

You can have used various other compression things or whatever.

But it is a self-describing format and there are some real advantages to

using CBOR directly and that is a you know an ITF standard and there's lots of tooling out there for it.

The it

but it isn't JSON

not directly. I mean you obviously can you know put it into a JSON statement.

But it's not Jason

That helped it does help thank you so long you have the floor now, thank you for your patience. Can you hear me?

That was a really helpful

Orientation to clearly a complex topic. I just had a really simple question at the very beginning you mentioned that you were able

doing this

eliminates

the check the sections of the tree that you're lighting and

Presumably that means it's actually not transmitted. It's it's not hashing those things that the individual receiving it can't

Do and or

Translate or otherwise

Recover the information in it. It's removing it from the actual credential that is that is transmitted and received by the recipient

That is correct. So I mean there are some subtleties here.

Again, we're trying to keep this simple.

Not use a whole bunch of advanced cryptography and things and you know

I can talk to you exactly when you must really do BBS plus proofs or things of that nature.

But most of the time, 99% of the time, you just basically either want to provide the data,

don't provide the data and then there's sort of an orthogonal question of are you going

to solve the data for anti-correlation.

So again this requires a different sense of thinking.

We do have a sense sometimes in the, you know, as a trust architect it's like, oh, everything

should be selectively disclosed, you know, nothing should be correlatable, etcetera.

But I think you have to turn that upside down and say no, you need to design very carefully.

are some things that must be correlated or it won't work because that's the whole point

of a credential is you're correlating that somebody graduated with the person who graduated.

And so there is correlation things that are important, but you know what is the persistence

of that correlation?

You know an institution doesn't need signature privacy.

A user might.

You know so you consult things such that you know things can't be reused or somebody can't

try to play games, but in some cases, salting,

not salting can be advantageous.

So there are some design considerations.

- If I can give a quick, yeah, really quick,

intuitive kind of understanding of this.

If a person's name is John Smith and you hash that,

you get a particular fingerprint back.

And if you know what that fingerprint is for John Smith,

you can search a large database,

find every hash that's identical and say,

Oh, this correlates to John Smith.

So theoretically, if you have unsalted hashes,

you can find every John Smith database

without that data being actually present just by its hash.

So Christopher referred to salting.

Salting because it's a tree, because you

can have assertions on anything.

You can have random data asserted on--

which is called salt--

asserted on a name.

And therefore, what that does, because that's

part of the tree of that name, when the name is elided,

the hash is unique in the whole world.

And so you can have 15,000 John Smiths

and every single one of them in this kind of document

will have a different hash on their name

and you won't be able to correlate them.

So that's the kind of thing

Christopher is talking about there.

- That's a good example, I think.

Thank you, Will.

- And just to be also clear,

so the SD Jot and LD Merkle

both have salting in them,

But in order to save space in the case of the SD Jot,

they basically have one salt

and then they basically create children salts

from that one salt, which has some pros and cons.

It means you're only salting the individual once.

You're only having to put a few bites in

per the entire credential.

But it also really limits what you can do there.

And one of the consequences of that is they often,

You know, they kind of have two blobs.

Here are the things that can be elided,

and then here's the things that can't be elided.

In Gordian, there isn't really a difference.

Everything can be elided.

- If I can ask one other quick question.

You mentioned that Gordian aligns with both edge graphs

as well as node graphs.

That would suggest then that property graphs

are natively supportable within--

- Yes.

Okay, just wanted to clarify, thanks.

- Thank you.

Maharsh, I see you in the queue here, you have the floor.

- Thank you, great presentation, Christopher and Wolf.

Just a quick question,

maybe this is very clear to everybody else,

but I just wanted to clarify.

So in the example you just gave about,

let's say that John Smith really wants to reveal his name

to an institution so that they can know

that it is John Smith.

So how does the verifier actually decrypt

any piece of disclosed information, right?

Whatever they disclose, how do they decrypt

and know who you are, right?

- So in that sense, if you give somebody your name,

so I'm John, I'm Christopher Allen,

I graduated and here is my credential to a hiring

institution.

You have-- that particular institution,

that hiring body has that information.

It's not encrypted.

And it's very easy to tell that the educational institution

has issued it because there's a signature associated with it.

And, you know, and there's the ongoing problem, okay,

so now how do you identify that I'm Christopher Allen?

And that can be done within the credential in some way

or some external method of doing that authentication, et cetera.

The harder problem is that, let's say, I'm applying for a job, okay?

And the job says I need to have a laser welding safety certificate for that job, okay?

So I have that.

I can basically prove that I have that.

And I can give them a DID and how to contact me with it,

whatever.

But I don't need to give them that I'm

Mohammed something.

And I got my degree from an accredited institution

in Central Europe.

I can just basically say, I have a degree

from a European credentialed school,

and I have this particular credential

that you were asking for.

And now, are you interested in interviewing me?

And if you're not interested in interviewing me,

I'm not gonna give you any more information.

So this is what I mean by progressive disclosure.

And again, I have a whole article on

kind of what the implications of that are.

So the next step is that the company comes back and says,

Yeah, you know, we really like, you know, what information you've given you.

We've given you, we'd like an interview.

You may reveal some other information, which might be how to contact you and

zoom links and other different things of that nature.

Endorsements in the form of badges.

Personal endorsements.

I've been long encouraging Kim Hamilton to put

peer endorsements into the schemas that you guys are working on.

He'll present a few of those.

Again, being sensitive to privacy.

And when they actually make you an offer,

and you accept that offer,

that's when you might actually give,

oh, here is my equivalent of social security number.

I might prove that I have,

I can have a field that basically says,

social security number is alighted

and signed by another institution that basically says,

yes, we have their social security number.

So he actually does have a social security number.

I don't have to give it to you until you give me a job

because you don't need it until you give me a job.

So that's progressive trust.

I think increasingly how we have to think about our designs.

- Super, if I might slip in another question,

I was really curious about the graphic display

of the hash itself.

Seems very fascinating as a human way of kind of,

interpreting what is just a jumble of numbers.

So is that something, can you say a few words about it

as to what kind of technology that is?

- Sure, so what I'm gonna do is I'm gonna put in

the link to the LifeHash page.

And if you take a look at that page,

Wolf will talk about it.

- Yeah, so LifeHash was my conception and implementation

as a kid I became familiar with an algorithm

known as John Conway's Game of Life,

which is not really a game, it's a cellular automata.

And it produces these patterns which are very,

can start with very simple,

it's a simple grid of black and white squares,

and it evolves along very kind of organic lines

as you watch it.

And I was inspired to create what's called,

often called a visual hash,

based on the idea that because you give it unique input,

you get unique output,

and using a number of techniques

to kind of retain the whole history

of this evolving pattern called life,

and then using mirroring and coloring to make it even more interpretable

by people's minds, I was able to come up with a system where pretty much

any two pieces of data can go in, and even if they're very similar,

they come up with very different visuals.

And it's very difficult to come up with two pieces of data

that actually come up with visually indistinguishable hashes,

Naiwal and Impossible, I think.

And so we've published this as an open source specification.

We have several different implementations.

Other people have converted the implementation of the languages.

So we're very happy to see that it's being adopted and inspiring people as well.

And that's part of our mission is to be compassionate about these kinds of things.

Working with long strings of numbers, especially trying to find where they might differ,

is not a very easy cognitive task.

And so from a UX perspective, this isn't the only system that does these kinds of visual hashes.

this is the one we developed and we think it has a lot of kind of approachability compared

to some others.

And yeah, so and all the information is there, like Hashshot Info, in fact, you can enter

strings and see the life hashes change, you know, generate random life hashes and kind

of compare them and kind of see for yourself and then download the software and and deploy

it yourself.

So it's just open for anybody to use.

Of course, to be clear from a cryptographers perspective,

we do not have a proof that this is as strong a hash--

this visual hash is as strong a hash as a SHA-256 or even MD5.

But that's not the point.

We do have strong machine readable hashes

that allow for--

that have the cryptographic details that we need.

We just need to be able to give an additional hint to users.

And this helps.

Yeah, we often recommend this be used in conjunction with at least like eight digits of the of a hash itself of the actual hexadecimal digits.

And that way users have kind of multimodal ways of quickly verifying that a hash is the same across providers.

Excellent. Thank you so much.

>> Thank you for the question. Christopher, and well, thank you very much for coming here

today. We appreciate this. I'll get the minutes published soon. So thanks again. Everybody,

thanks for being here. Have a good week. See you next week. Take care.

>> Thank you, everybody.

