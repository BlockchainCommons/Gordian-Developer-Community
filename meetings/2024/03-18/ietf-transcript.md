Shannon, are you on the call?

Yeah, right here.

And Christopher Allen will be joining for any comments, questions, etc.

So my name is Shannon Applecline.

I'm with Blockchain Commons.

We're working on creating infrastructure that's open, interoperable, secure, and compassionate.

Next slide.

So data is the heart of the internet, but still the wild west.

There's few controls on how it's shared or reshared.

Data privacy is all or nothing.

Once data is breached, it's out there.

It's being shared with little concern for human rights.

We need to make the internet more humane.

Next slide.

So we have three challenges.

The first issue is that data is not minimized.

Most interactions involve more data than is needed, even in the face of regulations, such as the GDPR.

Next slide.

That becomes even more problematic when data gets out there.

You can combine one batch of excessive data with another, and suddenly you know a lot about the data as subject.

Next slide.

Worse, when you have lots of data, you can use it in ways totally orthogonal to what was originally intended.

You might have given your address to receive a shipment of vinyl records, but when that gets correlated with the financial data, you provide it to your bank as KYC, suddenly the burglars are knocking at your door or rather pry barring your window.

Next slide.

These challenges are all cumulative.

More data is disclosed means more data correlated means more secondary use means more problems.

Next slide.

Worse the amount of data being collected, it's growing every year.

It's more sensitive and it's more often placed online.

We show some activity trackers here.

I have one on my wrist.

They're a great example.

They can record where you are and to a certain extent what you're doing.

How can we protect data that sensitive?

Next slide.

Digital identity is the next big frontier.

It's really coming of age right now with DIDs, MDLs, IDEs, but it's been around for a while.

I shockingly discovered I have 410 online accounts that contain a lot of personally identifiable information.

If that's all correlated, everything about me is out there.

Next slide.

Honestly, though, identity, credentials, healthcare, they're just the tip of the digital iceberg.

How much information could a competitor gain if they accessed shipping records?

How much espionage could a foreign country commit if they tracked the executive office's Fitbits?

How much trouble could hackers cause if they broke the chain of identity and software releases?

We need to get in front of this now.

Next slide.

So IETF has some solutions.

RFC 6973 and 8280 which talk about privacy and human rights considerations.

Next slide. 6973 talks about privacy and the design of internet protocols.

Next slide. 8280 expands that with a look at human rights considerations such as open, secure, and reliable connectivity.

Next slide.

Unfortunately, these RCS are not enough because they're not concrete and more importantly because they're just considerations.

They're not required.

They're not being used.

Even if they were, new privacy innovations and requirements have appeared in the last decade.

The RFCs are dated.

Next slide.

For example, take a look at 6973.

Its first three recommendations for privacy are to incorporate anonymity, pseudonymity, and data minimization.

Next slide.

>> Channel.

Excuse me.

And you got a lot of slides.

And so please focus on this first question.

>> Yeah, we're going to get to what we're doing and then we'll ask questions very quickly here.

So Bitcoin is an example of why pseudonymity isn't enough.

We've seen you contract information through it.

Next slide.

Meanwhile, data minimization, though it's definitely a foundational requirement, it causes problems with some of the human rights needs in RFC 8280.

Next slide.

So there are some kind-edge technologies like zero-knowledge proofs, for instance, BBS proofs which can deal with this.

Next slide.

But we need privacy tech that's simple, well understood, and in production, but still more advanced than 2013.

Next slide.

We need a middle ground.

Next slide.

So that's where we come to our solution, which is deterministic hash data illusion.

It's that middle ground.

Next slide.

Deterministic means the data is always stored in the same way.

Next slide.

Hash means that a cryptographic hash is created for each element of data.

Next slide.

Next.

And illusion means that the data can be removed, and in particular, we want the data to be removable by any holder of the data, not just the subject or the issuer.

Next slide.

So the format we've been using for this with working code is a Merkle tree.

There's other options.

Next slide.

In a Merkle tree, leaves hash the data of their branch, nodes hash the hashes beneath them, and a root hash, which is what you're seeing at the top here, verifies the entire structure.

Next slide.

When you elede data, you remove one or more branches, but the hashes remain validating the integrity of the data.

Next slide.

So what you do is you sign the root hash, and then you can have authenticity even when material is eleded.

Next slide.

So here's some of the core advantages.

Any holder of the data can choose to elide data at any time.

That supports data minimization because it's suddenly easy to exclude information, but the signatures, as I said, remain valid.

Next slide.

A hash data elision system can go much further.

Inclusion proofs mean that you can elide parts of a tree and then give proofs leading to the elided hashes, which allow for the verification of data even when it's not there.

Heard privacy takes the next step.

You can publish only a root hash and give out inclusion proofs to data blocks, allowing individuals to reveal that data are not as they see fit.

Next slide.

I spoke earlier of the dangers of correlation, but it's actually not all black and white.

Sometimes you want to correlate, sometimes not.

An advantage of deterministic hash data elision is that it allows you to match the requirements of your data set by choosing a hash method that either supports or hinders correlation, as you prefer.

Next slide.

For the IETF, the advantages are it supports these two RFCs, and in particular, it supports the authenticity, decentralization, and integrity from the human rights RFC that were kind of left out if you do core data minimization.

Next slide.

We think it's important because it can cover a whole lot of areas, credentials, data provenance, et cetera.

Next slide.

We'd love to see support for any version of deterministic hash data elision, but we have one called Gordian Envelope.

It includes all of the fundamentals that we discussed already.

It's built on a Merkle tree, and it also does additional things like encryption, operational functions, other cryptographic data, and lots more.

We have a full working prototype of it in a reference CLI.

Next slide.

Okay.

Here's our questions.

Next slide.

Most generally, how can we advance the start of issue?

It feels like there's not a good venue, but we have three specific things.

Next slide.

First, we feel like these two RFCs have been largely ignored.

So how can we do better on this?

In a recent working group charter, we heard there just wasn't a lot of support for these RFCs.

How do we improve respect for what we've heard called core IETF values?

Next slide.

Specifically on data minimization, how should we create a group for it?

Should it be CFRG?

Should we run a BOF?

Should we join another group?

Next slide.

More specifically, for Guardian envelope, our specific implementation of this, we did great work with the CBOR group on it, but they ultimately said they weren't the right venue.

Some say we should try and work with COSA, but they do have legacy constraints.

So do we farm a working group here?

Do we take it to an area director, or do we do a BOF here?

Next slide.

If you want more info, these are our two drafts.

Apple Klein hash deletion is this problem statement, and McNally envelope is the write-up of our envelope.

Next slide.

Next slide.

Thank you.

And this is contact info for myself and Christopher.

Okay.

Thank you.

Paul Hoffman.

You gave a list of, the chairs gave a list of possible dispatches at the beginning of the meeting.

I think this goes into a different place, which is the IRSJ.

There is, I've read, or I've skimmed over carefully the two drafts.

There's a lot of statements in there about this will cause that, that you'll get certain features and such like that, that are far outside the protocol space.

I would propose this would be something that is very strongly research, and it's not just cryptography.

So I would say it would be somewhere in the IRSJ, and I'm sorry, in the IRTF, and would interact with CFRG, but not be in CFRG.

Thank you.

Tobias.

Yes.

So Tobias Sivich, MPI, and I would actually second that.

So HRPC maybe might actually be the most fitting place.

Okay.

Thank you.

Eckert.

Yeah.

So I think part, you've asked a number of dispatch questions.

You know, I guess to answer the initial one, those documents you're citing were not produced by the IETF.

And so the fact that they are being not like widely, even on IETF, might be partly due to that.

There are a number of places to discuss things like this, as people suggested, perhaps somewhere in IRTF, though I don't think HRPC is probably the right place, since it's not really doing anything meaningful for this protocol specification.

This is a technology that other people might use.

And so in terms of dispatching it, in terms of IETF work, I think the threshold of question, as I sort of said earlier, is anybody in IETF want to use this or something?

And if the answer is no, then it gets dispatched to dev null.

So I certainly don't think it should be dispatched to any IETF work right now.

And I think that the next time you put out this, what you should be asking is to demonstrate a desire for people in IETF to want to use this technology.

Okay.

Thank you.

We're going to need to close the queue.

We just did.

And so, Michael.

Yeah.

Thanks so much.

Yeah.

Appreciate this.

I will strongly concur with maybe IRTF for some of this.

I'm not 100% sure exactly what was being proposed there.

It seemed like a whole bunch of different related things.

Maybe there were some technical drafts as well that I know have bounced to COSA and CBOR and feedback's been given back on that, right?

So maybe let's complete the work already in progress at COSA and CBOR that has some relation and then go from there and see once again to Ecker's point, if there's follow-on tech that someone at IETF wants to use, maybe we carry those pieces into IETF very explicitly with one or two slides, not 41 related to a broad problem statement.

So thanks.

David Schenazzi.

David Schenazzi, Internet Architecture Board.

I was kind of confused by this presentation in that it started off explaining how what we have in terms of abstract properties that we want was insufficient in terms of our human rights documents or our privacy considerations documents.

And then proceeded to say, "And we have a technical solution."

To me, that was a leap that you kind of lost me there.

So I would say if the goal is to move forward with this technology, then I don't see a need for it at this time.

I don't see any protocol that could use it.

And if that's wrong, please come back with those implementers in mind.

But if the goal is to say, "Well, maybe we need another human rights document that has these properties that we want," then yeah, that should go to HRPC, but that's not what these documents are.

And just like saying, "These privacy documents aren't doing anything."

Well, if you look at the decade since the privacy one was published, we've done quite a few improvements to the protocols that the IETF owns in terms of privacy.

So in terms of dispatch, I would say dispatch to nowhere for now until we have clear interest on what protocols should be improved specifically and what problem this solves.

Thank you.

Alyssa.

Yeah, thanks.

Hopefully you can hear me.

And someone confirmed that you can hear me.

Okay.

I agree with the comments of basically everybody who came before me about the dispatch question.

I didn't see anything here that seemed ready to be dispatched to someplace inside the IETF.

And just wanted to note as an author of 6,973, the point of 6,973 was in fact to just provide guidance.

It wasn't specifying any protocol and it was not meant to be mandatory and that was a conscious decision.

Could you be a little bit louder, Alyssa?

Sure.

What I was saying was that it was a conscious decision to make 6,973 advisory and not mandatory because we thought that making it mandatory would just cause it to become a check-of-the-box exercise that nobody would pay attention to.

And instead, I think if you look, there's actually a good amount of evidence of how it has been used in certain cases.

There's also been discussion about updating it.

So if that's something that you're interested in, definitely we'll be interested in talking about that because there's lots of things that have changed in the time since it was published.

But it's meant to be advisory and guidance and not protocol.

And I think it seems like the authors are after something different here.

So I think using that as the motivator doesn't really work.

Great insight.

Thank you.

Colin Perkins.

Hi.

Colin Perkins, IRTF chair.

So we are always, of course, happy to discuss proposals for new work in the IRTF, either in the particular research groups or directly comes to myself or the IRSG to talk about that.

As a process issue, though, I do want to remind the room that this group cannot dispatch things to the IRTF.

Noted.

Thank you.

Andrew Campbelling.

Hi.

Andrew Campbelling.

Yeah, as Lisa just said, 6973 and in fact also 8280 are both informational RFCs from the IRTF.

So maybe the authors hadn't understood what the purpose of those was.

But it would be surprising if they were applied to all protocols given they're informational.

So that maybe that's a misunderstanding by the two authors here.

On the dispatch question, noting what Colin just said, I was about to say perhaps the IRTF would be an appropriate place to discuss the topic should the esteemed chair of the IRTF be minded to take that up afterwards.

Ted Hardy.

Thanks very much.

I think the basic problem here is there are three different things being yoked together.

And the fastest way to get progress here is probably to unyoke them.

So if you have small scale things that relate to the work that's already going on in COSA, unyoke them from the larger scale question and go to COSA with it.

If you have large scale questions of data minimization and how it affects human rights, you can talk to Colin or to the working group chairs or HRPC.

But those people can't do protocol work in the IRTF just like we can't dispatch things to the IRTF.

So I think you've got multiple different things kind of all put together into a vision here.

But the actual work needs to be taken back out and sent to the right places and there's no single dispatch for the whole.

Some of it's just frankly out of scope for the IRTF as a whole.

So I just encourage you to go back and break this into the chunks of work that needs to get done and then ask again with the individual chunks separated out.

And I think the answers will be much easier.

Thank you.

Do you want to summarize?

Okay, so for this work and it seems currently it's not clear where should go.

No, I mean in IETF.

So in probably in IRTF and so first to break down the work into more specific pieces and go to the related research working groups to have more discussion and feedback there and then maybe come back to here and have more specific feedback here.

Great.

That was all very insightful.