We have six people here. Do we want to have like the brief introductions before we jump into slides?

That sounds good. I'm Shannon Applecline. I'm the technical writer at Blockchain Commons.

Did learning from the Bitcoin command line. Most of our other stuff that we've written about URs

and a lot of our other docs and information to date. Wolf?

Yeah. I'm Wolf McNally. I'm lead researcher for Blockchain Commons.

I've been a technologist for over 40 years and I'm the author of the UR specifications, the Gordian envelope specifications.

And obviously I consider those to be a community effort even if I'm kind of in the intellectual lead.

These are ongoing conversations and I'm looking forward to moving forward today.

Great.

I'm Ken. I'm the CTO of Foundation Devices. We make a Bitcoin hardware wallet called Passport.

And so this is directly some of the stuff we talk about in these meetings and also the one particularly we're here to talk about.

It's of interest to us. I'm a software engineer by trade.

Obviously C, C++ device drivers, low level stuff but then also later all the way up the stack to GUIs and web development and stuff.

So I kind of run the gamut in my history but that's me in a nutshell.

Seedhammer?

I'm Craig.

Go ahead, Craig.

Don't be...

Yeah, so I don't believe Seedhammer. He sent us a chat note just saying that he doesn't have a mic.

So I don't think he's going to speak.

But I'm Craig. I developed Sparrow Wallet I think from the small list of people here but I don't need to introduce it.

So you guys know what I do. Yeah, happy to crack on.

I do have a microphone. I don't know who the other E is.

I'm the one that is locked on as E from Seedhammer.

I am going to. I hope to make a small presentation today.

I'm pretty much the technical guy from the Seedhammer side.

Seedhammer is very, very briefly an automatic metal backup solution for Bitcoin wallets.

So we produce and sell machines that can engrave, in a secure way, your seed phrases and your public information for wallets.

And today that's the scriptures in the URL.

So, yeah, that's me.

Great. All right. Let's go ahead and get going.

I will. And if the E listening wants to type something about himself, then we'll read it.

Yeah, but welcome everybody. Go ahead, Shannon. Definitely. Thanks, Will.

All right. So we are Blockchain Commons.

We've been doing these meetings bi-monthly lately.

And this is our usual spiel about what we do.

We're, of course, interested in self-sovereign control of digital assets.

And this year, our main focus through that has been on Guardian envelope and on collaborative seed recovery.

Our goal is to give people choice in how to control their digital assets.

And we definitely want to say thank you to our sponsors.

We would not be able to do anything if we did not have sponsorship since we are a not-for-profit organization.

So thank you very much.

We also encourage everybody listening to this to become a sponsor, which you can do obviously at the link there.

Definitely. So September was our last meeting.

It was a pretty big meeting because we talked about the results of IETF 117,

where we were able to push forward on DC-BOR and also we really figured out what numbers we were going to be able to get registered for my IANA for our CBOR tags.

And that had some big results on Guardian envelope.

And it also had big results on our older UR specs, which are exactly what we're going to be talking about today.

Also, at September, we talked about attachments, which are a new methodology for envelope so that individual companies can stick their proprietary or their own specified information into envelopes.

We talked about our developer web pages, which are now all at developer.blockchaincommons.com.

It has everything or most everything that we've written to date.

So we encourage you to take a look at that.

We talked about some formatting for disclosing under YAML and also that our REST libraries are in community review, and we're going to be expanding on that because we've done some building with them ourselves.

So that was last time around.

Hey, Hank, glad to see you. We're just getting started.

Okay, today's topics.

Go ahead, Hank. You can introduce yourself briefly if you like before you continue.

Yeah.

Okay, sorry. I was late.

I couldn't do anything about it.

It's Hank here. I live in Portugal, originally from the Netherlands.

I work a lot on Cary.

And they sit easy on that kind of stuff.

Caesar as well. I think that's enough connections to the topic here at blockchain comms. Thank you.

Great. Great to see you, Hank.

Okay, so today's topics.

We're going to start out with a discussion about put descriptors, which we have a couple of different things running around on.

And then Wolf's going to show us how the new REST based envelope CLI looks.

He's going to give us a preview of what we're going to be doing with our first DSR server, which we think we're probably calling depository.

And we're going to talk about some of our future looking that we've done in some of the musings that Christopher has been writing lately.

So onward.

Okay, output descriptors.

We clearly need an interoperable way to store descriptors.

They're the future of weld interoperability.

It gives us a way to not just store the keys, but also the scripts, the derivation path so that we can go back, you know, five years later, 10 years later, or just when we're exchanging it with another wallet and actually retrieve where our addresses are.

Unfortunately, given the need to make something interoperable, we actually have three different things that we're looking at today.

And we're going to get to each of these in turn.

So just to briefly talk about them.

We had our original proposal, but we put out in 2020, which was a you are format for crypto output that basically said, how do we take a descriptor and put it into a binary farm that works well with seaboard.

And Craig expanded that I believe with the account, which puts together a bunch of outputs, as I recall.

Yes, for various reasons, which we'll get to momentarily.

We've had to back off of that and we're going to talk about what the best way to actually do that is.

But our current proposal is a guardian envelope with the descriptors, but also with metadata.

And SeedHammer also has a proposal which is a PSBT based one using some of the formatting for PSBTs right now to instead store descriptors.

So let's just jump into each of those.

So our original proposal, Wolf, you want to jump in and talk about what was going on here?

Yeah, feel free to jump in and fill in any gaps anywhere you see any.

So our original idea was to base a big part of our stack when it came to both static data at rest as well as data in transit on seaboard.

And seaboard, we've basically defended our choice in a number of different ways.

There's videos and papers and so on. You can go to read it on Y, so I'm not going to dwell on that.

But if you're not familiar with seaboard, think of it as like JSON, but for binary.

In addition to that, we've advanced an IETF internet draft, which is called the DCBoard or deterministic seaboard,

which is a set of rules on top of seaboard, which limits the way certain things can be encoded that basically incorporates some suggestions that the community was already

dealing with, but adds on top of that additional things that we felt were gaps when it comes to determinism.

And determinism is obviously more important when you care about high security or various kinds of participants converging on a single binary sequence for a set of data,

even if they're encoding it separately.

So because if you want to assign hashes or check hashes and you want to have various parties doing these things and having a deterministic encoding method is important.

And DCBoard makes it in at the roots as opposed to tries to add on top proposals like JSON canonicalization and so on.

So part of our adoption of seaboard involved our working with the seaboard spec that stands.

One of the great things about seaboard is if you design structures right, they're self-describing.

And this is often done through what's called seaboard tags.

Seaboard tags are numerical identifiers.

There's quite a large numeric space, but the lower numbers require fewer bytes under 23.

It's one byte, 24 and above.

It's two bytes.

And then each time you double.

So three bytes with the header plus a two-byte length gives you a four byte.

Sorry, it gives you 65, 535, and then so on.

It doubles to four bytes and then eight bytes.

So you can have a very large space.

It just depends on how many bytes you want to spend.

And part of our goals was to make Gordian envelope or not Gordian envelope, but all the seaboard stuff we did compact and not waste resources unnecessarily in terms of bytes on the wire or bytes at rest.

So we embraced the idea of IANA numbers. And if anybody's interested, I'm going to post paste into the I'm not going to take over the screen share at the moment, but I'm going to paste the IANA registry of seaboard tags.

So you can refer to that. That's in the chat now.

If you wish to refer to that.

And when we first read this, Christopher has worked on IETF proposals before. He worked on versions of SSL, TLS, I believe.

But as you can see, if you go to the top of this and I'll just describe it, you don't need to see this.

But if you're looking at it, then you'll see what I'm talking about.

It gives ranges of seaboard tag numbers and the registration procedures.

And for zero to 23, it's a standards action, which basically means unless you finally get an RFC, you're never going to get into that range.

And RFC is a finalized standard in the IETF.

And 24 through 3277 says specification required.

And if you look to the list below, a lot of these specs are not RFCs. That's great.

But they occupy these higher numbers between in this range.

And so we presumed incorrectly, as it turns out, that that numbers in that range, we could publish a spec and then ask a guy in the register and they'd say, oh, yes, there's a spec for this.

And this is a previously an occupied code point. So it's granted.

And then above that is 3768 to the maximum you can have for eight bytes, a very large number, which says first come first serve.

And that basically means if you take one of those positions and you send, you basically tell them I'm registering this for this, they'll say, OK.

And it turns out that's true. OK, the problem is with the middle range specification required because it's not just that you publish specifications required, but it has to be reviewed by IANA experts, which in this case turn out to be the currently appointed IANA experts are the some of the leaders in the seaboard working group in IETF.

And so we were basically advancing two proposals to the seaboard working group.

Well, specifically, the main proposal we were advancing to the seaboard working group is our specification for DC.

And there's been a lot of conversation in that working group about that. A lot of very supportive, some of the critical.

But we took it to heart. So we've we've basically improved the proposal due to that.

And we believe that it does have a chance of becoming an RFC eventually, depending on adoption and interest.

And then on top of that, we advanced our proposal for guarding envelope, which requires DC board.

And to do that, the initial specification for an envelope allocated a number of seaboard tags from the range 24th or 32st and 67.

And it also, because we had been working with this for a while, a number of other proposals, including the ones we're going to be talking about for output descriptors and some of the proposals they're built on also allocated tags.

So if you look at our reference code, we have quite a few tags in the 300 range, 400 range, 500 ranges that are not used in this registry that we just said, OK, we're going to use that when time comes.

We'll just publish a spec and I will say yes. Well, what we learned when we delivered our Gordian envelope spec to IANA is they passed it back to the same people who've been talking about DC board in the seaboard working group.

And they said, why do you want all these tags? These are low numbers. This is valuable real estate because these only take two to three bytes to encode.

And Carson Borman, one of the main people who was the one of the developers of seaboard originally basically said, we can only allocate so many of these per year in order to have the lifecycle that we want for seaboard.

And so he pushed back on that pretty hard.

And we took that to heart. That was particularly some of the things we talked about at IETF 117 in San Francisco.

So we came back after kind of understanding their needs much better.

And I actually went back to work on the Gordian envelope spec and reworked it.

So it ended up only needing one tag, which we proposed would be the tag 200.

And so we basically took that and reworked proposal. And as a matter of fact, the Gordian proposal became much more tight, much more because rather than using the series of tags we proposed, we basically started using the structure of seaboard itself.

So for example, seaboard map can have any number of key value pairs, but we specifically use maps for assertions.

So predicate object becomes a map with two elements, exactly two elements, never more in it.

And the subject followed by its assertions is an array.

And because it's an array, the first element being the subject of the envelope and then the elements after it being the predicate object pairs of the assertions of the envelope, it turns out we didn't need tags because we could basically use the structure of a valid seaboard object as the actual structure of the envelope.

And so we basically eliminated the need for all the other tags.

Now we do eliminate for all tags forever, no, because the leaf of an envelope can be, first of all, it's tagged 24. 24 is an existing low number tag, meaning this is embedded seaboard.

So we're using that for our leaves. That's how you know you reach a leaf of a Gordian envelope.

Meanwhile, above that, we can use anything in a leaf.

So you have a 24 tagged something else entirely, and we do that as well. But we realized that the tags in the 300, 400, 500 range that we've been using and promulgating in our BCRs for this are in the range that IANA and their experts, which are the leaders of the seaboard working group, are going to push back on hard.

And that brought us up short. So we realized that because inherently there's nothing wrong with the you are output descriptor as we defined it. It's a compact seaboard structure.

And it basically uses a number of tags that aren't likely going to be available to us unless we basically wage political campaigns that probably none of us want to do.

If there's one potential solution is we can move to much higher tags. We can move into the first come first serve range, which tend to be in the higher three byte to five and nine bytes.

And they're just going to grant those. So that's one choice we could make, but it's a breaking change. And that's something that we as a community need to consider.

But because of this, we realized, OK, well, moving forward, we need a solution. And because we've been developing Gordian envelope, we realized that envelope would be a great extensible way of containing things like output descriptors and all kinds of other things because you can do signing, elision, compression, things like that with envelopes.

And so they're extremely flexible. And so we started developing a series of proposals based on how to structure envelopes for specific purposes.

So we developed a set of proposals for that and including an output descriptor.

And we decided for this rather than go into the detail we did with our output descriptor, we would adopt the textual format that is pretty much now standard in the Bitcoin world for conveying output descriptors because there's already a lot of code that exists to parse that and also because the moving target.

So because output descriptors are not like official finalized standard, not crystallized, there's no official version one because certain things are moving forward.

We realized that rather than try to track that ourselves, it would be better if we rely on existing code to parse and output descriptors rather than make a separate parallel thing that had to capture all that nuance.

And so our way of representing output descriptors, which I presume several of you have seen, but I'll show a slide of it later, is basically very simple, allows a certain amount of metadata attached to it and is also very minimal.

So when we did this, we actually go back one slide. Yeah, we'll come to that. Go back to one slide.

One more.

You wanted, I think, the new envelope format.

I actually want to go back a couple more because there's a point I wanted to make on a previous slide.

One more.

Great. So basically, because we realized that there's no chance of getting IANA recognition for the tags we wanted, we marked the existing proposals of 2010 and 2015 or actually what we've always called research papers as deprecated.

And as the slide said, this doesn't mean that we superseded it. It doesn't mean you can't use it. It doesn't mean that we realized that it has certain shortcomings, in this case, with the standards bodies.

And we'd like what we produce. We don't consider ourselves to be a standards organization, but we do consider ourselves to be an organization that works with standards organizations.

And so basically, you can squat on C-BOR tags. It's not looked upon favorably. You're not likely to get anything ever moved forward to an RFC unless, for example, it reaches such major adoption, they kind of have to give it to you and they don't like doing that.

Or unless you basically make a very strong case that you need those tags for a specific good purpose. So we were able to get, again, if you look back at that registry, I post, you'll see tag 200 is now Gordian envelope.

After seeing our revised Gordian envelope spec, they granted us tag 200. Yay. So now whenever you see a C-BOR tag 200, you know it's a Gordian envelope.

And we'll see an example of how that matters a little bit later. But so we marked these as deprecated and this rubs some feather storm away.

We understand that now we did not mean to say that these things are useless or that you shouldn't use them.

We would prefer to have a conversation moving forward about the best way forward. We can continue as a community to squat on these tags and use these.

We can deprecate, you know, if we chose to all chose to do that, then we could deprecate the Gordian envelope version of output descriptor.

Now I'm fine with that, too, if that's a decision that we would undertake because, you know, or we could move to a higher number of tags that that break backwards compatibility.

So we have a number of options for us. And then Seed Hammer also has his proposal, which is a completely separate format, which we've discussed some on GitHub.

And I'm sure we'll talk about that, too. So, you know, we are working with the community as part of a learning process.

Again, we, you know, other than Christopher's work with the ITF, sometime back with SLTLS, I have no experience working with these standards bodies.

And so this is learning experience for me.

And so, you know, we're basically trying to, you know, being a central place for conversation.

And VCRs have always been about conversation. They've been conversation backed by running code.

But, you know, and we'll talk about this a little bit more, but, you know, we've always basically said that, you know, look, these aren't final draft.

These aren't final standards.

These aren't approved by any standards body.

If you use them using your own risk, they're for community review.

And, you know, and so we really appreciate that people have gotten given us the enthusiasm they have.

But this is something where, you know, we feel like, you know, we're all learning how to work together here and we want to work together for every benefit.

So and the last point on there, you know, we're small. We need resources.

It's basically, you know, Christopher, Shannon and myself.

And, you know, obviously there's many kinds of resources.

There's contributions and code.

There's writing more VCRs.

There's the conversations like we've been having and their sponsorship.

So, you know, we appreciate all those things.

And we think that, you know, we can move these things the best of what we do towards standards and work with standards bodies.

OK. Next slide.

Yeah. Hold on. Before we go there.

Yeah.

One of the things that we learned during this process is we need to bear track who is using which of which of our proposals because we need to be able to move proposals to a different state.

And so that's maybe what the next slide is that in this case, we now better know.

And we kind of knew before because I've used the output in account descriptors on Sparrow, but that Sparrow uses some of these.

And that's one of the problems that we had here.

And so we need to better track that so that we can take a slightly different direction when we have something that is in more wide applicability.

So we're going to talk about that.

But Craig, I wondered if you could maybe respond to some of what Wolf said.

We've offered a couple of different options.

We could just squat on these tags.

We could move them to higher numbers.

We could push more heavily for people to use the envelope methodology, our seed hammers, for that matter.

We could talk about if the word deprecated is the right one or something else for something that we're no longer pushing.

Do you have ideas for what would work for you and that would make sure that things that are currently stored as crypto outputs aren't going to get lost at some time in the future?

Yeah, thanks.

So, you know, I've been giving this some thoughts since last week.

And I think, you know, fundamentally, we have slightly different goals.

You are obviously working towards sort of a long term standards approach in the sense that you understand a standard to be defined by one of these international bodies.

Whereas, you know, as application developers, hardware wallet developers, we have users that we need to service now.

So you say that, you know, the BCR are research papers and meant to encourage discussion.

But of course, if you put something out there for three years and people use it, it becomes an adopted standard.

And I'm saying standard with air quotes here because I understand there are different views on those things.

And we could argue that none of the BIPs are in fact standards.

You could even say that something called a request for comments doesn't sound much like a standard to me, but clearly in the eyes of certain people it is.

Right. So I think we can sit here and.

Well, they've moved the official definition of RFC to mean a standard now.

It no longer stands for request for comments.

And Bitcoin improvement proposals are BIPs. You know, they're pretty much at this point.

I don't know what the process is of getting a bit published, but I think it's probably further along than we can tear our BCRs.

But please continue.

Yeah, I mean, to be honest, I have got gone through the process of getting a bit published and it's really it's actually not not super hard.

And I guess the point I'm trying to make here is not to encourage debate on what is a standard or not.

I'm just trying to make the point that when something gets put out there and gets used, we just don't have a choice anymore.

It's simply a black and white thing.

We either can support our users going forward or not.

And I think we're all on the same page, I hope, in terms of that.

So I don't really have a strong view on what the way forward is.

I understand the reasons that you have led you to deprecate the U.R. types that you have.

You know, they make sense.

They seem logical engineering reasons.

Whether that's going to make sense to users is a different matter.

But I do see where you're coming from there.

I don't have a strong view on what the path forward is.

What I do have a view on is that I am reluctant to change sparrow to support anything else until I have more certainty.

And I think that your your BCP, I believe, root forward makes sense because I don't think we can wait on getting an RFC, which I understand can take years.

So, you know, some some more certainty, I think, is required.

Some more idea that this this thing is not going to go away.

And once we have have that, I think then I can look at it and say, this is something that sparrow can move to.

But what I don't want to do is to have, you know, two or three or four of these these things that doesn't sound like a good place to be.

And so I'd rather stick with what we have, as you say, squat on those tags for a while until we're clear on what the path forward is.

And then we can, you know, communicate a way forward to users.

We can explain to them what the advantages of the new route is.

We can reassure them that the old path is not going to be removed.

And that's, I think, kind of the best we can do to do here.

You know, I'm certainly not here to accuse anyone.

I think everyone's trying to do their best. I just I just realize that I have a deep responsibility to make people make sure people don't lose funds.

And and that's really going to always be my number one concern in terms of building this space.

And those are more or less my thoughts on it. And yeah, I'm happy to hear from others.

Yeah, if I may quickly respond, I totally am in alignment with your responsibility to your users, because obviously we all care about the crypto assets we're protecting and how people will use that.

And a thought occurred to me while you're speaking that because, again, the nature of Seaboard is actually really great because it's self describing.

You know, we do have a tag for crypto output. It's in lower numbered range.

It's what it's how we start the tag currently. But that what is inside that tag at this point is the fine Seaboard structure.

You know, that is the is the tag we define in our VCR 2020 10.

But that could also be construed as being version one version two that can also be inside that tag is an envelope containing the the structure that we were developing that we think is more future proof better for moving forward.

So it's possible with basically without even changing the external tag by defining that when you open up that tag, you can find a version one, which is the structures would find it or version two, which is an envelope of the structure we define that basically we can say that, you know,

systems that are care about legacy support, support versions one and two, preferably right to and read one or two and and versions, you know, and applications that have letter less concern for backwards compatibility could just read and write version two.

And I think that would be a way that users could still work with you are is that say crypto output and understand what they're for and and have, you know, essentially know that what they're using them for is safe and without any change to the current specification, except an extension that a version two has an envelope inside it.

And this would allow us to eventually eventually possibly move version two towards, you know, something that we can actually well, in fact, the envelope doesn't require tags at all.

And I'll talk about that more a little bit later. But other than the 200 tag on the outside, the specs we're developing require no interaction with IANA at all because of our no value system.

And, you know, I'll describe that a little bit more in detail later.

But yeah, so I think there's a way of moving forward here, which doesn't compromise backward compatibility and maybe instead of calling 20, 20, 10 and 20, 15, I'm deprecated, maybe better just to relabel them version one.

I really like that idea. Well, that sounds like a great solution to this, you know, it kind of means that those users who have and those developers who have gone ahead and and adopted version one aren't feeling like they've made a mistake.

So, you know, it kind of just feels like there's a natural upgrade path that that proposal that you make really sounds worthwhile to me.

Okay, so yeah, I totally agree that and I was about to ask the same question basically before you started talking about that, I think, but I think like deprecated kind of is the right word to write, even if you don't necessarily communicate it to users that way.

There's a lot of connotation to that and calling something 2.0. Who wants to stick with 1.0, you know, if you have to, you know, so like it just means like, well, this is still even like an API, right, like deprecated API usually still works for some amount of time, it's fine to keep using it, you just have to understand that we've moved on to version two and that perhaps at some point in the future, you know, using this format is maybe not going to be so well supported.

That was the connotation we intended we did not and say this is, you know, nobody can use this anymore things going to break, you know, and so on our intention of using the word deprecation was in that sense can.

Right, that's what I thought.

Yeah, our expectation is that we'll be keeping these BCRs around permanently. So that if someone comes in five or 10 years from now and says hey how does this work so I can get my assets back, they'll still be able to look at the BCR and see what the format is and figure out how to pull it out.

So, when we say we're deprecating something, we're definitely not erasing it. We want it to be there, because resilience is one of our prime responsibilities.

I would also say like, as far as like the squatting on the tags like I think it's a pretty minor minor issue as well because like you're already in the context of, you know, this crypto descriptors it's not like you're going to get confused I think with some other software that maybe eventually adopt some of the other tags.

So if there's an issue there since everything that's the seaboard is valid seaboard of how we play within the larger seaboard ecosystem and another tooling and documentation that's intended to support that like the honor registry somebody looks up, you know, 300 and they expect to be something that's in the

way that they're not there, or something entirely different, or these tools that say output seaboard and they get, you know, entirely wrong semantics, then that can cause confusion down the road and I think that's what I'm gonna end this evil working group are trying to avoid.

Right, I was just saying from a practical point of view.

First, if I look it up and it says something different that's one thing but if our expectation is consistent in itself. I don't think it will cause any problem.

Yeah, I totally agree that it's internally self consistent.

Yeah, and I think the issue here is, we just really can't go to Yana or it anymore with 2020 10 as something we're presenting to them, at least in its current farm and so that's that's what deprecated meant to us that something we can't show anymore.

IETF has been known to you or, you know, and again we're talking about the what the technical chain is, you know, these are the IANA experts who happen to be members of the seawater working group.

But, you know, IETF has been known to create our allow RFCs to be created around things that have just emerged as de facto standards to once they've gotten enough adoption and there's no point in, in trying to perfect them they are as they are, they're essentially documenting and solidifying what's

already actually out there and use de facto so that's another route, it's not the preferred one but it's it's a possibility.

Okay, so to talk a little bit more about our specification process I'm glad we were able to get a good answer there.

I've always had the the BCRs, our research papers, and as Wolf said, they're fluid, they're stuff that, you know, usually are based upon our own coding API, and Wolf then pushes them in as research papers to explain in detail how they work.

And as just as a side note, which is going to be relevant when we talk to SeedHammer momentarily, we're happy to see external BCRs. If someone wants to present a possible methodology for doing something within the space that we're working in, then yes, please submit a BCR that that's what

we're going to be doing in the next couple of weeks. So, I'm going to start with the research papers. So, I'm going to start with the research papers. So, I'm going to start with the research papers.

So, I'm going to start with the research papers. So, I'm going to start with the research papers. So, I'm going to start with the research papers. So, I'm going to start with the research papers. So, I'm going to start with the research papers.

raise up some of our BCRs to the next level because they are in active use.

And our criteria for the next level is are there at least two

external parties who are both using the the specification and if so,

we are at this point going to push them up to be what we're calling a BCP,

blockchain Commons proposal, and if you went and looked in the directory there aren't any right now though

we know there are some that meet the criteria.

And certainly things like you are the basic Gordian envelope because it's already an ITF draft things like that.

And you know certainly I don't know Craig if there's other users of

crypto account yet, maybe.

Obviously Gordian C-tool doesn't count because it's the iOS app because even though we output it, you know,

we don't consider ourselves to be a qualifying party

for usage because you know, we're not an independent wallet maker or anything like that. We're you know, we are what we are.

But you know, but you know

once something does become entrenched and and maybe you know, the idea is to promote BCR 2010 and

and 15 to

2010 and 2020 2010 and 2015 to BCP status,

then you know, but give them version numbers, you know that essentially are backwards compatible.

You know, then

you know, that's well, I'll let Shannon continue at this point.

Yeah, so our main goal with this is

they might still be fluid because we haven't actually pushed them into a full standardization process and

certainly as we've learned

going into the full standardization process can force changes on us.

Often very good changes,

but they can force that. But when something's a BCP, we're gonna try and do less of that.

We're not just gonna change it on our whim. Not that this was on our whim, but but some of the BCRs certainly are.

And

more importantly, we're gonna know who's working on it and we're going to talk to them when we're making changes. So

if

something like this came up in the future,

we'd expect to be able to have that conversation say in this case with Craig

beforehand about the best way to push forward on this.

So this has occurred to me, Shannon, that our BCPs should probably have a paragraph near the top of section

explaining our rationale for promoting it to a BCP. Like who's using it?

Or you know, how far along it is in the standards process, things like that that basically, you know, give us our motivation for elevating it.

Yeah, yeah, that sounds terrific.

We have the criteria for what is, but putting that into the actual BCP would help us track things. So this is our

intent going forward to try and make sure that in a situation like this where there are changes that are required,

we know who the other stakeholders are and can move forward with them together in a more coherent,

collaborative way.

Seed Hammer says and Ken confirms in chat that

SeedSiner uses crypto account. So that's two parties and

you know, so yeah, and of course crypto account uses crypto output.

Yeah, so did anyone have any thoughts on our work here?

Okay, I

just wanted to add the thought that if we are

deprecating

crypto output and

moving to a

replacement, we should consider the same for crypto account. What is the replacement?

You know that seems important.

Absolutely, and just like it wasn't hard to define crypto account once crypto output was written,

I don't think it will be very hard at all to do a crypto account 2.0,

which is essentially a bundle of

crypto output 2.0s.

Okay, so we should definitely get that on our 2.2 and it's great to hear that it's being used by multiple parties.

Mm-hmm.

Okay, so

this

which Wolf already alluded to is what our current proposal is for an envelope based output descriptor. As he said, it just

includes the text and has a flag of his output descriptor and has some metadata.

Now just briefly for people who aren't too familiar with envelopes, the actual output descriptor begins with the quote and the contents inside

the

WPKH.

So the actual output descriptor is the subject of the envelope.

And you know again, you have to go back to understand what subject predicate and objects are, what subjects and assertions are.

But Shannon, if you scroll all the way to the right in that little pane there,

you'll see that on the right at the very end is an open bracket.

And that, go ahead and scroll back to the left, and that open bracket is mated by the one

directly underneath the output descriptor. Yes, that one. So that is itself, that is the conformant

output descriptor, which is basically the subject, which is the string beginning WPKH,

and three assertions. Is an output descriptor, has name example, and note. This is the note. And the

items without quotes here is an output descriptor, has name, note,

are what's called known values, which basically means they're not represented as strings in a coordinate envelope,

they're represented as numeric values in a namespace we define.

Is a, is like, is a known value of one, because it's basically being used in all respects for as a type descriptor.

But, and then this basically kind of follows the semantics that, or at least is,

it is meant to follow the semantics in the kind of larger kind of anthropology definition community

for various kinds of smart documents. But in this case, it declares its type, and then has two pieces of metadata.

And this is essentially what all envelopes look like. They have a subject and zero or more assertions.

This is then contained, this output descriptor is then the object of an assertion. The predicate

of the assertion is output descriptor, the lowercase output descriptor, colon, and then the object

of the assertion is the output descriptor itself, which is everything I just described. And this is,

and together, this is the one assertion on the string example. So as you can see, it's very recursive,

and I've talked about it in other videos and so on, so you can tell. And this is all a very compact

seaboard structure, and we'll talk about it a little bit more. All I can say is once you dip your

toe in, you realize it's not as intimidating as it looks, and it's much nicer than JSON to work with.

Since I worked with the sensor with JSON, now obviously, okay, I'm biased, I developed an envelope,

but it's actually really easy to work with. And has some really strong benefits to it that we've

designed it from scratch. So go ahead, Janet. Yeah, so that's basically our new format.

It uses envelope. It's built on seaboard. And that's what our proposal is for moving forward.

And I think possibly based on what we talked about here, we may also incorporate this as a V2 of

2020-10. If you want to read the full spec, it's at that tiny URL, guardian-descriptors. That's

just a pointer to our VCR that describes this new format. But there's not much more than this. It's

a very simple description because things are simple to describe in envelope. All right. So

I think at this point, I'm going to turn over to SeedHammer because SeedHammer said,

hey, I have some concerns about seaboard and wanted to offer a different proposal. So let me

get out of sharing. And if you want to jump in, E from SeedHammer. Thanks.

So I have a very short, I hope everyone can see my screen. I have a short presentation because I

think we all know the basic technical differences and issues and also to leave some time for comments

and so on. So what I have, we have from SeedHammer is an alternative format. It's described in

I'll share the link momentarily. It's an alternative format based on the PSPT,

which is the binary format, serialization format used for partially signed bit conversations.

First and foremost, I'd like to share that I am very biased because I come from SeedHammer,

which is a Bitcoin only company. And in such these, I have, I mean, I will make some claims

and some comparison and some value judgments that is from the perspective of Bitcoin. So in the

larger perspective, I don't have much comments on the envelope format itself. I mostly have an

issue with using envelopes for Bitcoin descriptors. Being from SeedHammer, where we want to

engrave these descriptors or wallets or whatever you call them into metal, we'd like to achieve

compact encoding size, but also a very simple, as simple as specification as possible, because we'd

like to in the future, be able to do all these things from microcontroller, which has limited

size available space for both memory, of course, but also for the amount of code you can include

in Flash. So the problem as I see it or we see it, is that there is no currently no widespread

standard for exchanging wallet setups. There is the blue wallet format. I'm sure that everyone is

familiar with that. It's textual, but it's also inflexible because it's pretty much made for

what they call vaults, which is an M of N multisig setups. So their format is very

targeted to that. They have a policy separate from the keys and they have some metadata,

which is a good thing, but also that standard is not really extensible to

generic output descriptors. I also think that the format predates output descriptors, so

there's good reason for this, but it also means that where I believe that the blue wallet format

is probably the most widespread, it's also the one that is least useful. So the next one is the one

we've discussed earlier today. It's the VCR 2020.10 crypto output. It's deprecated, which is one thing,

but as Craig and Wolf said, it's not like it's going anywhere. The problem with that is more,

is both the IANA, the standardization problem, which as Ken says is not as big a problem for us.

The biggest problem is it's inflexible in the sense that every time the output descriptor format

adds a feature, you will have to describe that in C for or in VCR or whatever you call it. You will

have to have a mirror description or specification for that feature in binary. Whereas both our

proposal and the envelope proposal for output descriptors simply use just the textual description.

I'm not even sure what the bib is. It's a bib and the concor and all many other wallets are

implemented. It's a textual representation of the output description. That's not as compact as a

binary representation, but it is very simple in the sense that you don't need to update

the encoding specification every time the output descriptor specifically changes.

There's a small difference. One point of clarification I want to make quickly is

BCR 2020.10 and 15 are based on CBOR as well. Even though you don't explicitly state it there,

you say envelope space in CBOR, all of our specifications for data storage are now based

on CBOR. That's just a point of clarification. Yes. Being spaced on CBOR is the binary format,

it's a bit compact, which is what we love. So BCR 2020.10 is perfect for our metal plate because

you can get very far with not that much space. So they're both of the blockchain commons

formats are based on CBOR, whereas this proposal is based on PSPT.

So the technical differences are primarily, I'll get to that in the next slide, the technical

differences is primarily between the encoding, the underlying structure of the encoding where

there's a CBOR versus PSPT. The only other difference is that the metadata-wise,

we want to follow the, or try to follow the wallet policy, which extracts or separates the keys from

the from the description. So the description, instead of having the XPUPs or whatever embedded

in the text, you extract them to a separate structure, which makes it the advantage that

you can refer to them several times from the descriptor. And also you can compactly encode

them because there is a compact binary representation also from PSPT of an XPUP that takes

quite a lot less space, quite less space than the typical textual XPUP representation. But again,

that's not a big difference because that can also be added to the blockchain commons format

in CBOR. So the biggest difference I see is CBOR versus PSPT. CBOR is a more complex specification

that PSPT, I don't think that is controversial. The controversy is about is it worth it, is the

more complex specification, which is CBOR and envelopes on top, is that worth what we came from?

The PSPT is also standard, or at least again from the biased viewpoint of coming from the Bitcoin

community is, I would say, just as much a standard, if not more a standard because it has a bit of

backing it, which at least it's, that's again, it's the sense, it's not a necessary fact, but I have

the sense that bibs are more respected, or at least more seen as appropriate to Bitcoin than the IETF.

And again, I could be wrong, but that's one of my claims. And again, PSPT is already required for

every signing device in the sense that if you have a signing device at all, hardwood wallet device,

software such as Pero, you need to support PSPT anyway, because otherwise you can't read the

unsigned protections that you need to sign. You can understand, you can't show them to your user.

And PSPT already contains metadata such as names and XPUPs, binary encoded compactly,

free in the sense that it's included to the standard. And my proposal, which is on GitHub,

on blockchain columns, research GitHub repository, is pretty much just PSPT, but with fields that

are specific to descriptors. So it has a field for the opt-in descriptor itself without keys.

And it has what is in PSPT called a map. Still wearing shorts because you have no clean pants.

Hi, your microphone is open. You've got to get over this laundry block that you have.

Oh, I'm sorry. No problem. So PSPT already has the concept of key value mappings and a map,

which is a set of these mappings. So it already has a standard for representation for binary XPUPs,

and it has a representation for numbers and so on. And that's enough for my proposal to

specify the descriptor, which is text and a key map or a map for each key, which includes its binary

encoding and its name. And that's probably it. And you can of course include metadata such as the

name and the birthday or the birth block of the descriptor. I wrote a from scratch coding in Go.

And when I say from scratch, it's I can just link it here so people can actually click on it.

When I say from scratch, it's both the PSPT decode and encode and my extension to it,

output descriptor representation. I call it card compact output descriptors,

and it's all in 300 lines. So that's just to give an idea of and it's complete.

Not that PSPT but that there's enough decoding and encode so you can represent,

you can both read and write output descriptors in this proposal. So that's, I think that's a

short description of the differences. If you have any questions of how is the PSPT

actually structured, you can ask it, but I don't think it's that relevant about it after this.

So the next problem I have is probably bigger than the keyboard versus PSPT. It's more of a process

and we probably, we could say it's an overlapping of the issue of the duplication of crypto output

and crypto account and so on. And in the sense that how do we avoid not doing the same,

getting into the same situation as we have as we are the output. And again, from my perspective,

for crypto output, we don't really use crypto account as much, but I see a lot of readers,

I see a lot of software and devices support crypto output as for reading, but I don't know

any writers except for Sparrow and ourselves. And we only use it because Sparrow uses it.

C-tool, the iOS app that we produce does it as well. Even though we don't consider it to be a

third party app, C-tool outputs, crypto outputs and crypto accounts.

Yeah. Okay. And because again, because I come from the Bitcoin perspective, it's my question is,

again, this is a process, it's not a format. Why wasn't crypto output a bit? What is the difference

between the Bitcoin proposals, blockchain commons proposal system? Why don't you use just a bit?

Again, that's maybe that's a lot of questions, but it's also part of this issue of how do we avoid

this, this case more this non standardization issue three years down. And again, and this is more,

the last thing is, is maybe a little bit controversial in that if you, if you assume that

that BIB is, is a good way to get more widespread support among wallets, I would like to know or ask

myself, that's how I started this proposal on my own, is what would be more likely to be, to be

bit a specification based on C-more or a specification based on PSBG. And again, I have my

reply to that, but, but I will just skip the question out so you can, so you can make up your

mind in that sense, if that's, I guess that's, if you don't consider that important, of course,

that's a different thing. But I think that's a very important question, whether it could be bit.

And again, and finally, what will it take to make whatever comes next a successful standard? And

this is these are minor suggestions, again, from the Bitcoin perspective, almost all topologies

that simple is more likely to be accepted. And in my mind, PSBG is much simpler to read than C-more.

I think we should learn from the control board, PC, PCR process. I think we're already doing that

with the PCPs and moving forward to version one, version two, or whatever. I think it's important

to propose whatever comes next as a bit. So if it's the envelopes, then it should be proposed as a bit.

And I'd like to see like Craig from Sparrow before we move to something else, also our own format.

If you can call it that, I would like to see some more buying from wallet developers before

assuming that whatever format is standard. So a good question for wallet developers would be

what would make you switch not to reading this new format, because most wallets would read most

anything, because it's not that difficult to add more formats into it. But what would make you

switch to it as an export format so we can move towards a world where there are fewer things you

need to be able to understand to understand wallet descriptors. So I have a few responses,

but I'd like to give other people present, say Craig, Ken, or anybody else who wants to

ask questions or respond to your presentation. Thank you, by the way, for your presentation.

And before I kind of give my response, which as you know, we've been discussing on GitHub. So

questions. Look, I do think the point that if we are if the goal here is to create standards,

and I use that term loosely, that are adopted by wallet developers, then certainly in the Bitcoin

world, my experience has been that nothing, you're not going to get too much success until things are

a bit. And once they are, it's a very different situation. My my that 329 is a one that is for

labels and wallets. And, you know, I could have just gone off and built my own thing, like many

other wallets developers did. But I felt that, you know, once it becomes a bit, it really gets a

mark of it's reached a certain level. And there is much greater acceptance and interest from other

wallet developers to build on. So I can certainly vouch for that personally, having experienced it

myself. Yeah, I think we certainly agree with the importance of BIPs. Our BCR and now BCP,

they're really intended to be a pre standard track where we can work with the community,

see which things actually have buy in and advance them through that. And at the point where they

have buy in, the whole point of BCP is that it is something that has been adopted, and we feel like

should be pushed into a standard. So kind of DC bore and envelope were our first endeavors where

we actually pushed them onto the standardization track. But our intent has always been that we

expect we will advance some of ours to BIPs as well. Any other questions for E or statements?

Are any comments on anyone who's done any work on seabor and constrained environments?

Ken, did you have any thoughts on that with passport? Yeah, I just wanted to see I know,

one of the things you had said was, you know, you've been one of an external reliance on a

specification is complex with seabor. I wonder if there's a way forward to say something in the

BIP, say something like, okay, well, this is based on seabor. However, if you're in a resource

constrained environment, here's everything you need to know, you know, here are the numbers you

need to put in to make this envelope, you know, here are the numbers you need to, like right now,

building a PSBT is just the same, right? It's just a matter of what number do you put in that spot

that it's seabor versus what number do you put in that spot that makes it a PSBT. So if we could

make a specification as a BIP that was internally complete enough to implement if you if that was

all you wanted, I wonder if that would satisfy that requirement. But then if you if you already

have a seabor encoder, because you're doing more than just that, you could just take advantage of

it not have to write, you know, any of that seabor parsing code yourself just rely on your existing

library. I would love that. That would be perfect for me. Assuming assuming that and I think that's

important to us all that whatever specification comes through the big process. So if you can

have it accepted as a BIP and it's self describing and you can write write a note if you have a

compliancy or decoder encoder library, then you can pretty much skip all this, I would be perfectly

happy. Whatever what I want to notice is because we've both and I have been discussing this on

GitHub is that there's a subtle difference between being able to write a format. And I agree with

Wolf it's very easy probably very easy to write a from scratch envelope descriptor writer, but to

write to create a reader minimal or from scratch or self self-sufficient without that much many

dependencies, you need to be able to read all of the possible or at least ignore the fields that

you don't know. Yeah, I was just gonna say like in your case, for example, if you're receiving this

file in cten where you could just say, oh, I don't understand this and reject it. And actually,

that's quite easy to do a seabor. I will say I'll get into that when I when I speak. But yeah,

seabor actually makes it really easy to skip what you don't understand.

I'll jump into that. Okay, the only only other thing perhaps is I'd love for and this is for

this is based on on being one to compact descriptors. So this is a little bit more

specialized, but I'd love to have in the envelope standard to have binary or compressed x pops. So

instead of having them in the in the descriptive text itself, I'd like to have them separate somehow

very similar to my proposal and to the wallet policies that I also think to.

I think Christopher was asking for that too, if I recall.

Are you okay though with this text based encoding of the descriptor itself?

As far as the size? Yeah, no, well, yes and no, we're not okay with it in the sense that we wanted

us compact as possible. But as I started to say, and Wolf was also mentioning, it's I don't think

it's realistic to to expect a specification that can binary encode all descriptors because we'll

have to have these mirror specifications for every text because the text for better or worse,

the text format is the one that is very widespread. So each and every time they add something new,

for example, Craig's change address proposal, we don't have need to have two different descriptors,

we can have a variation that specifies both the change addresses and the NRC that versus

or miniskrypt or whatever comes, it's going to be a maintenance burden. It's possible,

but it's going to be a maintenance burden to specify those and that's the direction that

and that's the primary reason I don't like the crypto output format because I like its compactness,

but I don't like that everything has to be mirrored to the descriptive world. So I think

the envelopes and my own proposal is that's the best compromise we can do. It's not a compromise.

And that is one of our motivations for also backing away from the crypto output specifications

because the output descriptor world is still floating moving forward.

Yeah, that makes sense. But I would also say like, if it does change, if something changes,

you're not going to recognize the text version of that descriptor anyway, right? Like it's going

to have stuff in there that you don't know how to parse. Yeah, absolutely. It's absolutely the

problem is that it had little had to be specified and tested and so on, where in a specification,

so you have to extend the specification every time becomes so it's a specification problem,

not as much in the way the way forward with that would be to be really tight with, you know, whoever

is if this becomes a standard and it's binary, you just have to say like, if this bit is going

to be approved, you have to evolve it because there's a bit that extends the descriptor format,

you'd have to work with the team working on blockchain common. So let's say that was what

was going forward. Yes. And as a coordinated say, oh, this is the time we have to use.

Yeah, for sure. But like it gets you it gets you the compactness that you know,

we hopefully all would prefer. Yeah, well, again, that's what is my a compact seaboard or a PSPT

whatever presentation would be ours, such as us from seed hammers, the perfect world. But I think

I don't think it's realistic to require every output descriptor developer or new clips to also

have to specify their binary representation. If that is appropriate and accepted by the

bit community, then we're all very, very happy. But so it's more, it's a compromise more than

than the idea. Yeah, so I mean, I would rather shoot for the moon and fail, maybe. Like, but maybe

maybe there's a way to do both. Can we can we have it? We'll find a version two that it can be

a string or this other encoding or I think you run into the decoder problem problem again, if you

have an or you'll have every decoder need to support both the text and the binary. Well,

and also there's, you know, obviously, if we continue advancing our, our, our Gordian

envelope based up as crypto format, then we have three formats to deal with. And that's obviously

something that we'd all like to avoid. So one true format. All right. Well, you know, we already have

a version one and probably version two, you know, but yeah, I mean, or, or again, if we decide that

we just want to go back to crypto output and, and skip the ground up, that's also a possible

decision. This, this, this community can make. And shooting for the moon is appropriate when

you develop software, but I don't think it's, it's appropriate necessarily for specifications

because specifications are meant to be widely accepted and implemented. And the more you have

in that specification, and again, that's one of my critiques of C4, which may be moved is that

the less chance you get off of people actually adopting it. And of course, one of the biggest

shortcomings of crypto output is, as mentioned, not just the fact that we're using, we're squatting

on seaboard tags, we're not likely to get, we're also, you know, not able to attract very well,

the moving target that is output descriptors. If I may, you know, go into a little bit more about,

you know, the conversation Ian and I have been having and kind of, you know, my rationale for

why I think that, you know, Gordian envelope is actually quite viable for this purpose, even in

constrained environments. I'd like to share my screen here. Let me do that here.

That's interesting. I seem to have lost the ability to share. Am I still a co-host?

Shannon. Are you still what? Am I still a co-host on this side?

You should. Yeah. Okay, that's interesting. All right. Well, all right, this will work.

All right. So this is a part of the GitHub thread that Ian and I have been having on,

this is a research repo issue 135, if you want to follow along. But this is his response to mine,

but I'm going to cover what I said here. Because one of the things I wanted to demonstrate is that

despite the fact that, you know, seaboard has a certain amount of complexity to it, then DC

board restricts that complexity. And then envelope is built on that, but it's designed to be very

compact. It's designed to make simple things simple and hard things possible. And that's one

of the guiding principles we had when we did this. I can make this a little bit bigger. Oops.

So I gave a demonstration where, you know, a minimal output descriptor with no

name or note metadata, but just the ISA assertion output descriptor here. Here's the actual textual

output descriptor, which is, you know, as we've seen before, I've truncated the binary here.

But as you can see, it's basically only got 12 bytes of overhead on it. And depending on the

other features you want to support, the overhead would go up a bit. And also the complexity of

parsing and writing would go up a bit. And I'll discuss that a little bit. But if you knew that

you had a constraint environment, which was going to receive envelopes, which just had the minimum,

which was just the ISA output descriptor. I mean, obviously, if it knew it was going to receive just

an output descriptor, you could have set in the string. But let's assume that you want to have a

forward looking thing where you're sending and receiving envelopes. And you want to be able to

use that as your standard that maybe later on you can support metadata or you can support other

advancements in the kinds of things people want to do with metadata around output descriptors.

But this is like the minimum starting point. And I want to demonstrate that it's not hard at all to

even read and write this without any knowledge of Cibor or Envelope. And so I asserted that and

E challenged me to say how I do that. And this is what I came up with. So if you know nothing about

Cibor or Envelope, then you have header bytes and you have suffix bytes. And you have a variable

int for a length and you have the UTF-8 string of the output descriptor. That's it. You don't even

need to worry about what these mean or what these mean. You can check them to make sure that they

are in fact what you expect and that these values have to either be 68, 78, or 79. Other than that,

this is not followed by any additional length bytes. This is followed by one. This is followed by two.

There's also variants for four and eight, but we're not practically going to support those. Those

don't need to be part of the spec. So in this case, as you can see, the text has 78, which is

one byte length, and 9A, which is 154. So this string has 154 bytes. And if it's, for some reason,

less than 24 bytes, then it would be 0x60 and you add the immediate length to that to get whatever

hex value for that one byte. And that's all valid C-bore and it's a valid envelope, which basically

means that once you have this, any C-bore parser can decode this and you can just parse it as C-bore.

Any envelope decoder can parse this and understand this is an assertion with known values for Iza.

Remember I said that that's one. An output descriptor, which is 5 with 7, these are not C-bore tags.

These are known values, which is a namespace we control, not IANA, not C-bore working group.

So we can sign low number of tags to what we're like. Eventually, I would hope that if we

advance this to an RFC, then something like IANA would take that registry over.

Because again, we do have a vision for this. And I said, that's it. No mention of C-bore at all.

Any code that implements C-bore can read a gory envelope with a minimal output

descriptor structure, not including any other metadata. Now, what would be required to skip

past those things? Or to say, for example, validate the Iza output descriptor and skip past this?

Because this is a map, this is a map with a set of key value pairs that has one element.

This is key value, Iza output descriptor. And this is an array of two elements. This is the leaf

array, which is tag 24, which is just encoded C-bore. Inside that is text, a string figure length.

This array for each assertion gains one more member, and it has to be a map, a one. Then it's

going to have probably a single byte for if we're using known values for this, in which case it's

going to be a single var int. This is an example of var int. And it's going to have some amount of

length information after it, which again, if you figure out how to just parse a length in C-bore,

then you can skip that many bytes ahead. So you can iterate through this on the parsing side,

trying to find the map that has the key value of a one and the value of this to verify that it's

an output descriptor. And you can skip past all the other assertions. So it's actually really

simple. On the writing side, if you want to write assertions, it's a bit more complex because you

need to essentially follow the Gordian envelope rules, take the shot to take the hash of this and

sort them by hash order. And those are all very deterministic. And the reason for that is so that

the assertions aren't randomly ordered. This is the deterministic idea that both C-bore and

envelope are deterministic, that if you have certain assertions with certain semantics,

then they will always converge on the same binary output. So but just merely parsing C-bore in a

constrained environment, just parsing this as C-bore, you don't have to have an envelope parser,

you can use a C-bore parser and outputting. Yeah, you don't have to have an envelope writer,

you can have a minimal C-bore writer as long as you have a shot to six algorithm at hand,

then you can determine the proper order of the assertions. So but I wanted to deliberately show

the minimal case, how simple this is, but also that it's future proof. Now, I would point out

that the PSBT is a de novo spec. It's not based on any other previous existing binary format.

It doesn't have its own independent spec of how you would encode various things in PSBT.

And therefore, even though PSBT itself is a bit, its binary encoding format, as such is not. And

whereas this is based on both the C-bore as well as envelope, which are documented, which are both

IETF internet drafts, which basically means they're potentially standards tracked. And,

and honestly, I would hope that if PSBT if if the PSB spec had been written with the knowledge of

C-bore, it might have ended up to C-bore as well. So because it really is, I think, a better format

for general binary encoding, they are obviously trying to solve a problem. And they they created

a de novo way of doing that. Yeah, we have it now, and we're going to be continuing to use it.

But that doesn't mean I think we have to personally, I would feel uncomfortable

adding another spec based on PSBT without a separate document, which actually gives a future

to that kind of general format. And my general feeling is why do that when we already have

something that's very solid and this simple to read, write and parse. And then let's see,

I think he basically said, he said, I certainly believe in an old decoder for envelope description

is feasible from scratch. And yeah, I actually think the code for this is easily as small,

and even skipping over unknown assertions, I think only adds a few lines of code, actually.

A writer is not very hard as long as you have a sort algorithm and a shot to fix algorithm handy.

And let's see.

The name, note, or the metadata is key. Will the middle decoder be able to successfully extract

the descriptor from every envelope, including those metadata? Yeah, the distensor that.

So anyway, that's my basic approach to this. And I'm happy to answer questions or address

other concerns. Well, will the structure use the same binary structure if there are more fields,

for example? That's what I refer to when I said leaving out the metadata is at least an issue.

So if you add that same name and birthday and all these other structure to, as you say,

it's extendable and it is, but it's only extendable if the minimal decoders will be able to read it.

Right. Well, a minimal decoder that can skip over what it doesn't know and only parse what it does

is actually still very minimal. It depends on how you define a minimal. But if you need to fully

validate something, for example, as a valid envelope or something, then you're going to want

more code to do that. If you decide that's already happened before you receive the structure and you

trust it, then you can parse it within full faith that it's compliant. And then if you find it run

into anything that doesn't comply, you can just reject it. So I guess my concern reduces to

if a bit can be written that specifies how this form of books like for output descriptors.

And that specification just happens to be a subset of the much larger C4 or DC4. Then I'm

perfectly happy with it. Do you think that's what I've effectively just demonstrated? I hope.

I don't think you did because, for example, 82, just to take an example from your example,

is the Mac with two elements. So if I add a name and that birth block, for example,

then that 82 will be different. Is that correct?

Right. Yeah. So the right, exactly. So if you're going to support, for example, skipping past

once you don't know, then you have to treat 82 as it's in the range. In fact, let me show you this.

So this is basically a slide which demonstrates the one byte header of Seaboard.

And so the 82, if you look at 82, that is a two element array. And so if you expect something in

the range of array, then you know how many, you know, if you find an array at all, you know it's

what's called a node in an envelope, which is a subject followed by a series of assertions.

And you can always assume that an output descriptor is an envelope. It's always going to be an array.

There's always going to be a node with at least one assertion. You can expect something in this

range. It's not going to be zero. That would be illegal. It's not going to be one because it's

going to have the output descriptor. It's going to be two or greater. If you see three or four,

then I mean, even if you see one, you basically take the count from here and then you basically

iterate through those structures. Now, because Seaboard is self identifying, if you have,

you know, a very simple, you can use a jump table for this. It's only one byte. Then you essentially

know how much data you have to skip. And then, and so, and essentially known values in envelope

are not tagged Seaboard. They're literally an integer. They're the only bare integer in an

envelope is a known value. So you don't have to do anything special. You come into it, you come

across an integer in these spaces, you know it's a known value. You just know it. There's no other

way of encoding an envelope. And so if you come across these things, this range in an envelope,

it's a known value. It has to be. Now, if it's like a leaf that's tagged 24, which has an integer,

well, that's just an integer of some kind. And you have to know from context what it means. But,

you know, on some envelope, a bare integer is always a known value. So, but basically what

Seaboard does, because if you know this table and it's actually a very straight way, if you,

you know, you learn, you have a very low code to, to this range here from zero to one B is a variant.

Okay. It's basically has, you know, this is all one byte, two bytes, three bytes, five bytes, nine bytes.

Okay. But I'm going to stop you. Can we at least agree that an existing proof of you showing

one encoding of one particular descriptor is not the same as a specification that says

how to write a decoder that can run, that can understand everything?

Yeah. Well, okay. You need by everything. Okay. So for example,

everything does of course, specific to operative descriptors. It doesn't have to understand

everything. Well, for example, let's say you want to support compressed output descriptors. Okay.

Gordian envelope has a built-in compression standard based on deflate. You can, you can

compress any envelope based on deflate. And because everything inside an envelope is an envelope,

you can take that text string, that UTF text string and re-encode it, transform it into a,

into a compressed envelope, in which case it's understood to be compressed. It's the exact same.

It has the exact same hash in an envelope hash tree. But it's essentially the same thing

compressed. And if you come across that, well, then you need to obviously support the deflate

algorithm. But you don't, again, you still don't need to support all of envelope. Everything

envelope can do. You don't need to support cryptography. You don't need to support elision.

You just need to support, oh, I'm parsing this, I'm parsing the C bar stream and here's this tag,

which basically means I now have come across this compressed thing. Here's the header.

And I'm going to use the deflate algorithm to re-inflate the contents. Oh, there's my,

there's my text string. Yeah. I can agree that every feature that you add to envelopes or

like this, like compression has to be supported by every output descriptor decoder.

I would say that's trivially true for any standard that purports to encode output descriptors,

whether it's the text string itself or whether it's anything around it that reports to do metadata,

like your standard or your proposal or mine. I think that's trivially true. And I'm not sure

what the point in debating it is. The point is that, that I don't have

compression in this module. But you've discussed it already,

which basically means you might want to support it. So then you have to discuss how you would

support it. I took it, I took it from your proposal. You have compressed envelope, which is a feature,

but from the point of view of specification and a decode, a person writing a decoder,

it's actually not a bug, but it's a maintenance burden that you have to add this new thing.

Right. Only if we specify that it's supported. That's the thing is, okay. Well, I think what

you're labor under the misconception that if you support part of envelope, you have to support it

all. And that is absolutely not true. Yeah. When you, when you write, yes, please.

Yeah. I think you're totally right. Like we can restrict the subset of seaboard

and envelope that is in this specification. So, you know, you can easily, like if you want to

support encryption or compression, whether it's PSPT or seaboard, you're going to have to write

code for that. If we don't want to support compression, then we don't have to include

that in the specification and nobody has to write decoders for it.

Right. As a matter of fact, I've already published specifications in our research repo,

for example, attachments, which I've discussed in our last meeting, which if you read that,

and I'll put the link in the chat here, if you read that, you'll see that it says what may and

may not actually be in an envelope in this case. And it basically doesn't allow anything to be

compressed. It only allows certain assertions, which have to be in certain order because of the

nature of envelopes. It recommends certain things for certain strings or whatever. But, you know,

that's because those things are kind of open to possible further standardization or whatever.

But the point is, if you look at what an attachment envelope may have in it, it's not anything. And

you can't compress stuff and you can't encrypt stuff in an attachment and so on. It has to be

what it is. Now, inside an attachment is the vendor defining seaboard. And that can be anything,

but that's basically up to the vendor. They can put another envelope inside there. They can put

anything they want. That's not what the attachment is a way of making discoverable attachments on

other envelopes. And that's its purpose. So to be discoverable, it has to be something that can't be,

it has to be understandable to third party writers who haven't encountered it before.

And the purpose is to give attribution and some idea of discovering and recognizing envelopes.

But as you see, if you read the spec, it's a very constrained specification itself. And there's no

reason why every single, I mean, in fact, that's what I'm doing is every single spec you see written

based on envelope is there's certain envelope extensions like cryptography, which basically

expand what an envelope can contain. But there's many specifications which are only purely

restricted. Restrictive DC board itself is a restrictive specification on top of seaboard.

Seaboard allows you to encode many, many things that DC board does not allow. So actually,

a DC board codec by definition can be smaller, more compact, faster, tighter than a seaboard.

I love DC board. DC board is a great idea of you specify minimal encoding. So that's much closer to

And the same design principles apply to envelope as well.

Yeah, well, let's just say, if you can present a specification that is bibble. So it's a complete

description based on seaboard, of course, or DC board or whatever you want to say, then I'll be

more than happy. So you can from that specification write a decoder from sketch. It doesn't have to be

300 line, I'm not saying it has to be very, very small. It just has to be complete in the sense that

that it's practical to implement from scratch. Right. And there's things you can do to other

restrictions. Like if, for example, in the map, right, you have to say how many entries are in

the map. If you don't want to write all of the code for every possible integer encoding,

you could say, okay, well, in this specification, the map can have less than whatever, right?

You can have one, two, three entries. If one entry has to be the is a if it's two entries,

or three entries, it, you know, no name could be added. Yeah, and the spec can contain those

things. Yeah. Or you could be you still could be combinations, right? Like, but you just know that

you're not going to have like 400, you know, entries in the map, you're restricted to whatever

you can encode with, you know, a simpler encoding, like eight, what is it? 818283845.

Yeah, exactly. And I think that one of the things that he has expressed concern about is, for example,

if you look at my current Gordian envelope, Bitcoin out descriptor, it basically assumes,

you know, the existence of envelope and the existence of DC board, you know, it kind of

incorporates them by reference, you know, because it doesn't talk about the binary encoding of is

output descriptor, it, it basically knows that, you know, that that's what this is. And when you

talk about a, you know, an output descriptor and its assertions, all your the actual binary

encoding of this kind of falls out of that. And of course, we are tooling, lets you take any

envelope and output its annotated binary description. And, but there's not much more

to say about it than this as terms of a high level description. If you want to create, you know, but

for example, like JSON, you don't need to describe what JSON is to define a JSON document. And, and

the same is true here. So the question is, does this have to be something that is so divorced

from seabor and envelope that they can't even mention it? Or and what would be the purpose of

that? Because there's

Of course, you can mention it. Of course, you can mention it. My worry is the decode side,

it's it's almost only the decode side, I will be able to figure out or anyone can figure out

how to encode something because they know what they need to encode, they need to name,

and that's it. It's the decode side where to be I can't be sure, just because for example,

your example on GitHub, I can't be sure that just because I successfully passed that,

and a few variations, I can't be sure that say possible foundations don't present something

that uses that has more fields as things is if they comply with my specification, my

this specification on the screen right now, they can't. Okay, it may include it has new name

assertion, it may include no assertion, all right, it must include is output description,

there's nothing else allowed. Okay, but how is it extensible? How is it then? We extend the

specification, we write another document that is run to the community, which basically says,

this version of the specification adds another assertion. Or we say, for example, we support

attachments, so vendors, and so once you know what attachment is, you also know how to skip past it.

This doesn't mention attachments, because, you know, again, I was trying to keep it simple,

but we could also make it so that it's worth attachments, in which case it's extendable by

vendors. But also, if you write your code such that it recognizes is a has name and note,

but nothing else, and skips the nothing, but you know, the other things,

even if it is extended, your, your parser should still work. Exactly. And because

yeah, because seaboard is self describing, everything has length values in it. So even

if you don't know what it is, you know how to skip it. Full seaboard parser will parse everything

validated and then hand you back a symbolic representation of the seaboard document.

But if you just want a streaming seaboard decoder, very simple, that just parses each byte and, you

know, uses a state machine to, you know, say what's expected, what comes next, and so on.

Then yeah, a very simple specific purpose parser can be very small. And it doesn't matter that

seaboard, it doesn't matter that it's DC board, it doesn't matter it's envelope, it can be very small.

So and and I can give you more worked examples if you need further proof of that. But you know,

my point is, and I hope that I'm a little worried that this is a misunderstanding examples is like,

it's like saying this number is even or something, you have to, it's sort of decode the decoding is

your sort of a mathematical proof in the sense that what I mean is by example, I also mean we

could write some reference code that actually, you know, you know, that right, you know, in say,

rust or whatever that is totally standalone, doesn't use our, the rest of our stack and

essentially encodes and decodes, you know, and ignores people that doesn't understand.

That's an afternoon's worth of work for me, you know, I was just gonna say, like, you could have

that by the end of today. Probably, yeah, probably. Yeah. And I actually believe it'd be less than 300

lines of code. Again, like, say, Russ, Russ is a bit more verbose. So the boilerplate support,

will it support the same as my proposal? So names, birth block and compressed x plus.

So again, it also depends on. So I would need to study yours, if I want to match yours feature by

feature, I would have to, I would have to, what I can say is that it could definitely support is

a has name note. You know, if you want to date, then we have to decide what date format we're

going to use. The C-board has a date. Not a date. Just a block number.

Yeah. So I mean, it depends. But the answer is yes, it should be pretty easy to add any of this

metadata that you want. If I just came up with, if I spent the afternoon and did something that is

the equivalent of this, it's probably less than an hour worth of work to add every single minute,

you know, to add a new metadata field that it understands.

Okay. And that could be written as a specification in a future bit.

Yeah. Well, I mean, if you can write code, then you can write specification from the code.

You know, I think in code anyway. So I'd rather have the specification, but, but the code is also

what we, well, I would, I would do both. The only thing with a block number is

it's a wide range, right? So you'd have to have the different integer encoding supported

being able to decode the different integer encodings.

Right. Well, again, if you're using C-board variants, then you just basically, you can,

you know, go up to eight bytes worth of space, right? So, you know.

No, I'm just saying like, like if you were really trying to divorce this from C-board,

you would have to define that in this specification as well. Like that you, for values under, you know,

24, whatever it is, it's this. You know, you just like define all what the integer encoding is in

the document versus reference. Yeah, exactly. And, and honestly, again, if you just want an E,

you're just talking about parser, right? It doesn't need to necessarily write these things.

You're more concerned about reading them. Is that correct?

Also, also writing, but I know it's a simple problem.

Yeah. Yeah. I mean, obviously, you know, with envelopes, if you're writing metadata,

then you need to do that little dance with the, the hashing and sorting. But again,

that's not very, that's not a big deal, even in a constrained environment.

You know, I, I do feel like, yeah, this is, you know, I understand that this is not as familiar as,

say, you know, PSBT is because we've all worked with PSBT. Our stack, you know, for example,

when we parse the text format, when we parse PSBTs, where I think we're using,

well, one of the open source libraries, I can't remember which one off the top of my head that

we're using. But yeah, I mean, we're, we're using other libraries to do that for us, to parse PSBTs

to parse output descriptors. Actually, we know we are on output descriptor parser, but,

and that's a problem for us if we ever have to, you know, for Swift at least. But my point being that,

that, you know, it's having, I understand this is less familiar. And our goal is to support the

Bitcoin community in both understanding why we think this is important, as well as, you know,

kind of lowering barriers to adoption. And that's what this conversation is about. Obviously, if,

if you still have deep reservations about this, then, you know, we'd like to allay this, because,

you know, you're, you're, you're one of our customers, essentially, you're one of our community.

And we want to be a value community. Yeah, let's, let's, let's talk about moving forward. So,

so I don't, I'm not against C for, and I can see the, the, the idea of having a specification that

can both be self contained, but also happens to match the C for encoding. And of course,

mention that so you can use the library if you want. And you can write it more or less from

scratch if you want. So if, if, if blockchain commons is willing to propose something that

will end up as a bit, then I'm more than happy. And I don't know about Ken Craig. And yeah, so

yeah, I'm not married to my proposal. I'm just, I made it so I don't, so I wouldn't seem

only criticizing envelopes. I also to be have a constructive proof of what could be done.

And what I think should be included, such as the compressed xperbs that made it their name and so

on. But if it ends up being something, a specification not too long. And it's just

happens to be formatted in a way that's compatible with envelopes that I'm perfectly happy more than

happy. So is block number the only missing thing? Like if we were to have a version of the code

that could, you know, skip additional fields that could be added in the future is block number,

the only thing missing from the ropes example, well, compressed xperbs as well names,

the actual name compressed xperbs in this in a similar format as the PSPT doesn't have to be

the same, same, but where you don't encode it as base 50, 80, 54, sorry, 58.

Do you have a test factor that you can send me for that?

You know, something that shows the actual kind of, okay, here's how this is represented

in say, either your format or in other places where compressed xperbs are used.

Is okay, is that it? You just put it to chat.

Okay, so this is, this is the Bitcoin repo. Yeah, so this, this is the Bitcoin wallet. This is what

I used as my example for extracting xperbs, the keys out of the one of descriptive, but it doesn't

specify a civilization. As far as civilization, my format it's this is my example code here.

Right. Yeah. And as the, this is the, yeah, you can run it here and you get, you get, you get

something binary out. It's a bum, bum, bum, bum, bum, bum. So it, it actually encodes.

The edit codes, I go to the descriptor in what I say, see is in wallet policies format.

That's the, that's the top. And then, so yeah, on that line, that's the script with, with references

to keys. And then there's the array of keys underneath and each key consists of the fingerprint,

the path and the key itself decoded from base for 58. That's the representation I chose.

I'm curious, assuming that we can use this format for, oops, for, you know, the textual form of

output descriptors. Is there any reason to even as part of our proposal to support uncompressed

descriptors as well? Or should we say that this should always be put into the form where, you know,

you know, these, these references here that I think this is, that's fine. Yeah. That's exactly what

I propose. I propose to disallow more than one. Yes, exactly. I disallow XPUPs in the descriptor

in my proposal because I think there should be only one way to, to represent keys. Yeah. Yeah.

I, I concur with that. And there's no reason why. See, I would say, here's, here's the thing. If

we're going as far as to support textual output descriptors and then a format that has some

structure after, in addition to it, which includes, which is the keys, obviously that's not going to

be compatible backwards compatible with, with BCR 2020, 10, 15. There's no reason why at that point

we even have to use, the reason why we chose envelope is because we're just going with the,

you know, the, the textual output descriptor. We want to wrap it and add some metadata.

There's no reason why we cannot define another low level CBOR struct with a tag nobody has ever

seen before. Nobody's going to hassle us about that we can actually put inside the CBOR output

because again, we, we have the tags for squatting on. Okay. So, and you know, and they basically

identify you are output descriptor and you are a crypto account or you're crypto. Yeah. You know,

anyway, the point is we could define another CBOR structure that is not based on envelope

that you could still put inside an envelope if you want additional metadata. But if all you want is,

you know, a name, a descriptor in text, which has reference, which is this format and has references

to an array of keys after it obviously it might not be deterministic because unless you have,

say what order your keys come in, it's not deterministic anymore. There could be any order,

or actually I guess they have to be in the order of the references. That's not true. So as they're

defined here in order, well, again, I guess if you could say 002 and skip one, then, you know,

okay. So, but in any case, the order would still be deterministic. It wouldn't matter how you

reference them here. All right. So yeah, I'm just thinking this row here in real time here.

But my point being that we could define just a CBOR structure and CBOR. Yeah. You still have

to parse variance because, you know, obviously you need length, but it would have a, and is this what

you mean by compressed keys? Because this isn't really what I think of as compression. It's just,

it's basically just transferring some to binary, you know, to code into binary. Yeah. Yeah. That's

what I mean. That's not, it's a combined compact. I prefer to call it a compact. It's just not using

base 58. Yeah. I hate base 58 for most purposes, especially when we're trying to, you know,

do data on the wire or at rest. So yeah, I agree with that. So my point is, you know, taking what

you have here as thing, rather than based on PSBT binary, you could base it on a DC

board without even basing on envelope. That could still be put into an envelope, you know,

others, again, because CBOR supports envelope is CBOR and supports CBOR. Sure. And we could kind of

have the best of both worlds. I think that, and we avoid the sharp 256 field ordering, which is,

it's not a big deal, but it is a deal. Well, yeah, you would avoid that. And so I think that if we,

you know, and honestly, you know, this is even easier than doing it with envelope in some ways,

because envelope is designed to be very extensible to have all the other features capable. And yet,

yeah, it can be minimally, but CBOR, I think we all agree is can be even more minimal. It's just not

going to support those other things envelope describes, you know, and with CBOR, there are

ways of skipping things you don't know. But, you know, obviously, if you're not prepared for them,

then then you're going to throw an error. But, you know, if you're prepared for stuff you don't

know, then you can skip past it. And so even when you have like a CBOR, which can, for example,

this is an array, and it has or even a map where each this is like an integer for name,

and then a CBOR string, an integer for descriptor, and these can be our own, you know,

this is totally local to this object as is with our other CBOR data. And then, you know,

an integer for this. And so this is a this is a map, a CBOR map. And these can technically come in

any order. So you have to be prepared for them because and there are could also be unknown,

there could also be unknown fields. You also there could be duplicate fields, there could be omitted

fields that you have to check for. And that all makes a validating parser more complex. But,

you know, it also also depends on what your how much you trust with the input you're being given.

Envelope tends to validate these things automatically, but then you still need to validate

which which assertions are present and stuff like that. So, you know, the any any

serialization format is going to have all these same issues, but CBOR by itself, and, you know,

and there are very tiny CBOR implementations. And yeah, you could still implement a bespoke

parser for this if you really, really wanted to and didn't want to use a micro CBOR, CBOR implementation.

I mean, a micro CBOR implementation wouldn't support floating point values wouldn't support

any of our other things that CBOR supports. And, you know, but yeah, I mean, we can define a

CBOR structure that that, in our case, just to be very practical, we write in Go. And I'm not

familiar with Go implementation that maps to tiny tiny CBOR or whatever it's linked to.

And of course, you can interface with Go, but then you have to compile it to build tools,

build things. So I would actually in practice, probably implement this from scratch, whatever

you come up with. Right. Yeah. And by the way, DC Bora basically says that if you use that, that,

map keys have to be in order. And it defines the order. So I mean, again, whether or not you're

validating, you may not be. Certainly, when you're writing, it's very easy to know what order the

keys should come in and write them in that order. Exactly. The more restrictions, the better. Not

duplicate keys, this particular order by integer or whatever. Right. The more restrictions, the

better it is. Yes, absolutely. Absolutely. Okay. Well, I think that's, that is certainly moving

the conversation forward. Any other comments from other people? Yeah, I think we've got some great

notes from that. So I want to be respectful of everyone's time and I know it is getting toward

the two hour. So I am thinking that we might want to just skip through the presentation we were going

to do. Do you have any problems with that? Well, yeah, no, there's not, I mean, basically the

announcement is that our Rust stack has gotten to the point where we now have a command line tool

that I will, in a moment here, I will post the link to that. And if you have Rust installed,

then it's just cargo install BC-envelope-cli. And that will install our whole stack. And if you look

in the repo, yeah, it's, oh, is it BC-envelope? Okay, I'll look for it. Anyway, maybe Shannon,

you can find the URL for that and post that to the blog to talk. But yeah, so I'm not going to

demo it. We've done previous demos of the Swift CLI tool and even though the syntax is slightly

different, the semantics are all the same. And the repo has documents in it that show both

our walkthroughs of how to use the tool. And it doesn't necessarily teach you envelope from

scratch, but it does point you towards everything you need to know. And it pretty much walks you

through building up very complex structures on the command line. And then, yeah, that's it. So I

think we can forego the demo. And if there's a demand for a demo that I can do the demo next time,

of course, next time we also expect to have our distributed share server up and running,

at least in minimal form, which will also be based on a Rust stack. It will be a web server based on

the Rust warp web server framework, which in our backend will be MariaDB. And then we have some

code we wrote in Swift that is basically, there you see tinyurl.com slash example store that is

kind of shows how we're using trust of first use. So you don't need to create a prior account.

Obviously, there's security concerns about denial of service and stuff like that, that at some point

we'll have to address. But essentially, this is the idea is you can store anonymously stored data

that you've encrypted any way you want. And yes, it has to be an envelope. But again,

that's not a big deal if you understand our Rust stack and our kind of ethics regarding this.

But the idea being that what's inside the envelope doesn't have to be known.

It's just a blob, essentially. But the idea is our tools stack will support using SSKR to

shard data like seeds or keys or whatever, and then find a number of these servers that are out

there running and store shares among them in a way that is retrievable. And then also fallback

methods so that you can have another way of retrieving your shares if you lose your public

key, which you use to access these repositories. And we're calling them depositories, not

re-depositories. And the reason is repositories tend to be about active version control versus

depositories or something you just put something for safekeeping, which is the goal here.

So I'm happy to answer any quick questions regarding that. But there'll be a lot more to

show next month. Yeah, so this is really a fulfillment of the CSR work that we've been

doing all year building on SSKR and Envelope.

Okay, so and just we wrote a little bit about what the goals are of CSR. We want to create an

interoperable ecosystem of share servers. And we really want to give users the choice. We saw

LedgerRecover come out this year, and it didn't give users the choice. It locks them into the

equivalent of share servers that require your customer work. And so it violates our principles

of privacy and self-sufficiency. And so we're trying to create something, have been trying to

create something that is very different and goes with our guardian principles, which do include

privacy. So the CSR depository is going to be our first example of that. And hopefully we'll also be

supporting things like TorGAP and things like that as well. Yeah. And Bitmark, who isn't here today,

has already done kind of their version of a CSR server, which they used on a previous version of

autonomy. So we're hoping to create an ecosystem here where we can start exchanging shares. I hold

yours, you hold mine, and thus everyone has better backups and more resilience. So that's our goal

there. The only other thing I had on the listing was that Christopher has been doing work all year

on what he calls musings from a trust architect, which are kind of stepping back and saying,

what are some of our more architectural designs that we're doing that are leading us to create

a lot of these individual specifications? And he most recently wrote one on self-sovereign computing,

which was looked kind of at how can you be in control of your own digital destiny on the

seas of the internet, as it were. He looked at some design patterns for how we can minimize

data that we're storing. And he also wrote a nice introduction to Snor, which is really coming into

increased interest, not just because of Taproot over at Bitcoin, but also because

the Zcash Foundation just released a version called ZF Frost, which we think we may be using

in the future for things like VSS, Verifiable Secret Sharing, which will allow us to check

that people have shares. So those are always all on our Blockchain Commons website under our posts.

But we also recently moved his Life with a LACRITY blog over to Minimal Mistakes to make

it cleaner and more up-to-date, and it now has all of his musings there. So that's a really easy

place to find them all. So that's much of what we've been doing. And that is Chris, who will be

back next time. Yeah, thank you all for joining us. And thank you for your comments, your input. I

feel like this has been a very productive conversation. I hope you feel the same. Please

send me your other thoughts, or Shannon or Christopher. And I expect we'll have a lot

to talk about next month. Yeah, signal is great. Just to wrap up, are you thinking to make a

proposal around what you were just describing? Yeah, well, unless somebody wants to offer reasons

why that shouldn't happen. I mean, I'm not sure I'm going to prioritize that yet with my work on

the server and CSR server. But depending on the perceived urgency about this, from people like

Craig and E and things like that, I might take a diversion and take a couple days and get some

code get a spec up based on that. And so we can peruse it before next month. Obviously, we're

looking to the community to help set our priorities as well, particularly our sponsors. So become a

sponsor. And yeah, but that's definitely on my mind now. And sometimes when something's on my

mind, I have a hard time not doing it. Yeah, I think we-

Wolf. Yeah, go ahead. Sorry, I was just going to say, I think that the situation that we find

ourselves in now is we have a deprecated standard again, and air quotes, you know, and no clear

what is the next thing, right. And I think that, as you say, this meeting has moved us forward,

but I think we do need, you know, what we don't want to be in is in a situation where we have

users coming to us and saying, why are you still producing a deprecated standard on something that

my funds depend on? You know, I don't think that's a situation we want to be in for long.

Which is why we're trying to make it very clear that our BCRs are not standards, you know,

and even though we put running code with them, and these are for community review, and that's

what we are the community who is reviewing it. And I don't know how to emphasize that more.

We are going to, you know, basically have the BCP repository. Some of our things like

a, like a, you are like envelope and so on are kind of ready to be raised to that level.

Others like output scripture, I'm not sure are quite ready to be raised to that level yet,

because we don't have, you know, obviously we want backwards compatibility, but we also want,

you know, something more forward looking. And, you know, maybe Gordian envelope with that is it.

But if somebody implemented that today and then got mad at me for deprecating it later,

I would, I would kind of say, you know, why did you do that? And, and,

it sounded from like what we discussed earlier, that updating crypto output with a version two,

which might be the thing that we're talking about here might be the way to both push it forward,

and make users feel like we are not stepping away from it. And it's just a question of, hey,

are you using version one, version two? So that, you know, part of this is just a making users feel

okay. And that might be a good way to do that. Does that seem accurate, Craig?

Yeah, I wasn't trying to, you know, make a point around, you know, going back to where the things

are standard, standards are not I was more just talking to the prioritizers, they say, say,

station or, you know, we are where we are. And let's, let's try and move to a better place. That's,

that's all that I was saying. Absolutely. Yeah, I mean, that's, that's,

and we just need those talks internal about what the prioritization is, but we're certainly hearing

that we need to have the talks with Chris about what the prioritization is. But we're certainly

hearing from the community. This is a priority. And if you have any, you know, deeper concerns

are unspoken. If anybody watches this video later, and, and has strong feelings about it,

please reach out to us, please reach out to myself, Shannon or Christopher. And we're all

easily contactable. And, you know, please let us know what your thoughts are on this is, you know,

this is those are present are only a small slice of the community we're trying to serve,

which also includes our sponsors and, and many other people who aren't here. So please participate.

Yeah, thank you for all the great feedback. One, one, one small thing, would it make sense for to

mark those BCRs a little bit clearer? Because so far, it seems like Craig and myself, and probably

also other people have misunderstood. So not only mark the BCPs, but somehow, I don't know.

Yeah, I think probably should put a disclaimer at the beginning of our BCR is that their research

document that they're for review only, I think we have said that in a lot of places, we certainly

say it in our code repose and our reference repose. I think the question here may be if

deprecated is the right word for it. Not just that also the new, for example, the envelope

proposal that was made about descriptors. And I understand he would be he would be sorry if people

start using that as a standard. But I, to me, that was not clear. We were about to say, okay,

what's the next standard and looked at envelopes as an implementer c10. And we don't want to be

in that situation. We know that now. One of the nice things about defining a seabore structure,

assuming especially if it's conformant to DC bore, which is easy, because it's a subset of seabore,

is that it's automatically compatible with anything you do with envelopes in the future.

So, you know, it's, it's, you know, it's not an envelope, but it can be a leaf of an envelope.

And so it's immediately compatible with the with the elbow ecosystem. You do have to parse it

as seabore rather than as an envelope with assertions and all that. But it's, it's, it's

baked in. So, yeah. But we feel like the people who use the research specs, they're, they're our

partners. They're our research partners who are testing things out. Early adopters would, would

be, I think, a fair description of it. We aren't to the standard level. We need to test things out

and work with you, the community. So among other things you can tell us this doesn't work because.

And, you know, when we get up to the level that two people are using it, then we want to put it

to the level where it's slightly less changeable. And then we want to get is a real spec, but it's

definitely a spectrum. We want you to work with us on it. But we also want you to work with us as

early adopters and understand that there may be changes. But on the other hand, that shouldn't

invalidate what you've already done. Yeah. I like the term research partners better than even early

adopters because adopters implies, you know, releasing something into the wild. And while you

are totally at liberty to do that, it's not necessarily advisable until we all have a kind

of agreed that yes, this is the way we're moving. And, you know, honestly, there are certain things

we've done at this point, like the UR specification, which is based on byte word specification.

You know, the DC board, the core specification for recording envelope, which is now an internet

draft, DC board is to, you know, those things are really solid at this point. And at least

it's solid. We can make them without then taking into a standards body and then getting to like a

bit for an RFC. And and so but that is that is what we plan to do. And it's just that, you know,

until we get to that point and and that's what we want to do with BCP is advance something as

okay, we think this is going to go to the next level kind of thing or could. Yeah. And if you

look at the BCP page, we actually have a BCR. BCRs can conflict with each other. They could even

express conflicting opinions. We might want to, you know, you know, call that out even more

explicitly in our in our headers for our for our BCRs. Yeah. But if you look at our research at the

BCP page, we actually define a couple of states for things. And one of those states is mature,

a BCP draft that's been fully matured in that we feels ready for the next step. So as opposed to

a work item. So even within this, we're we're working to say, hey, what are the things that

we feel like are solid? And so I think what we'll just define the byte words, you are is envelope,

we put those into the mature category where we think they're solid. But, you know, there's

always what happens when we put them to a standards organization. Right. Well, as we learned,

definitely only submitted DC board and Gordon envelope to the CBR working group, we, you know,

and and they came out much stronger for that, but they were breaking changes. Yeah. So one of our

tasks going forward is to figure out which BCRs need to move to BCPs and to figure out which ones

are still work items that we might, you know, be working with the community to change in which

things we feel like are mature and unmoving. So that that's definitely an action item on our part.

We've just defined these different levels and we need to move things over to them.

I would disclose on for my end anyway, I think, well, if you if you can take a day or so,

and it doesn't conflict with the other stuff you're doing, I think it would be really worthwhile to

do the pseudo code example and explore that alternative C for. And that feedback is super

important to us because obviously, you know, I think you are a sponsor, right? We are. Yeah.

Yeah. And, you know, that matters coming from anybody, but it matters even more coming from

a sponsor. So that's, you know, that's the kind of feedback we need and want. And yeah, if there's

other eyes here or a general consensus that I should get that done, then that makes it a very

high priority for me. And I know Christopher would agree. Well, we really appreciate all the

feedback. I feel like this is one of the meetings that we've got the best feedback. And so it's

been a terrific meeting and I'd love to see more like this. Absolutely. Tell your friends. Let's

make this let's make this a real community effort. And whether it's online during these meetings or

or in other venues. But yeah, let's keep building this. I'm excited because, you know, the blockchain

commons has a vision of not having to have everybody reinvent the wheel, you know, and

and be able to have a lot of improper interoperability that, you know, respects people's

privacy and sovereignty. Those are all great values. I think we all share them and and we

need to come together to do certain things in that area while each having our own secret sauce in our

businesses. And that's that's awesome. Let's let's work together on those parts that we really ought

to work together for the benefit of everybody. Yeah. Thank you so much for all the work on this.

Well, appreciate it. Thanks a lot. Thanks for bringing us up as well and getting the

concept move forward. Perfect. Thank you, everybody. All right. See you next time.

Thank you. Thanks everyone.

Joe.

You
