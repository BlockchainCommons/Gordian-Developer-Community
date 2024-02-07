Okay, I'm Wolf McNally, Lead Researcher for Blockchain Commons, and I'm going to give a quick demo of doing a request and response for a key derivation from a seed.

So I have two screens visible right now.

One of them is the iPhone simulator, and the other is my actual iPhone that's hooked up to my Mac.

And so they both have the same seed in them, but that's not required for the actual use of what I'm going to show you, but it's the easiest way to demo this.

So I'm going to start seed tool here, and you see it's got four example seeds, including this top one we call Cackey, which is just an example seed.

There's no value associated with any of these seeds that you're seeing here.

These are all example seeds.

And we are going to assume that we're using a different tool that doesn't have the seed for now, but we're going to go into the seed here, and we're going to ask for the -- we're going to look at the cosign or public key of the seed.

This is a BIP32 derivation along this path that yields a master key with this fingerprint, and this is the actual HD key, the public HD key.

So we're going to -- I have a feature turned on called show developer functions that's turned on right now.

So anything you see with this bug by it, it doesn't appear if you don't have these turned on.

So when I show the cosign or public key, you'll see that there's three buttons with bugs on them here, and so one of them is show request for this derivation.

So when I do that, it's actually assuming that this is some kind of device that wants a derivation of this sort.

It doesn't say what key it is, it doesn't say what fingerprint it is, but it wants a derivation of the cosign or public key from some seed.

And it says, you know, we have -- our UI paradigm is of the form of a chat.

So in this case, it's a -- I'll ask you a question.

I would like a Bitcoin public key of this derivation, please.

And it's showing an anime QR code.

We've talked about this in other of our meetings and videos -- this is our multipart URL format that can use streaming fountain codes of any length.

So you're not limited to the size of QR code or the resolution of your camera or screen.

And so I'm actually going to now pull up seed tool on my actual phone.

So I don't know if it's left or right from your perspective.

>> On our left.

>> It's on your left.

Okay.

So as you can see, I've got other seeds on here on my phone.

These are all example seeds.

So I'm going to tap the QR code button in the lower left-hand corner, which we'll put in the camera mode.

And you can see my console now.

And I'm going to focus on the actual QR code that's in me right now.

And you'll see -- it'll probably read it very quickly.

But okay.

So what you see now on the left there is it's received a request.

And so the remote device has asked for a public key for main net, master key for the same derivation path.

And now we have to respond.

And that's why there's three dots in the answer bubble here.

And it basically says, another device is requesting a public key from this device with this derivation.

The sender of this request attached a note.

Now this is something -- again, because this is a dummy derivation request, it's basically attached a random note just to show you that we can attach metadata of any kind to this.

So it's just a -- but basically says you must decide whether to trust what it says.

Seed tool cannot verify its accuracy.

So this is intended to be human readable.

That is conveyed from the requester to the responder.

And then it's asking you -- go ahead.

You were -- yeah, explain the bottom.

Yeah.

So it's basically asking you -- it's basically saying here's the derivation key.

And it also identifies as a native segwit multi-sig co-signer.

So it knows this kind of key that it's asking.

So because this isn't tied to any particular seed, you're asked to select a seed.

So -- oh, I can't do that.

I can't do that with my mouse.

I have to do it with my finger.

Okay, there we go.

And so I can use any of these seeds to provide the co-signer for this.

And so I'm going to use the one called dark purple aqua love here.

And when I select that, then here's the question.

And then here's basically the derivation that's been done from that key.

And then it basically says setting this public key will allow the other device to verify but not sign transactions with it.

This key is derivable.

Additional keys can be derived from it.

It tells you the derivation path again.

And then it tells you the seed that's going to do.

And then it asks you if you want to prove this.

So when you say approve, then you get another animated QR code, which is basically the answer to this, which is the actual key that's been derived.

Now, I'm not going to read this again because actually seed tool doesn't read keys.

It only reads seeds.

So, but any other wallet or anything like that that wanted this key at this point, and you can share this in various other ways.

You can write it to an NFC tag.

So if I say shares, you are your envelope, then you can copy to the clipboard or save it to your file systems or send it directly to somebody.

You can, if you say write to NFC tag, then it'll ask you to put an NFC tag here close to it so it can write to it.

So there's lots of different ways that this response can go back and forth.

And of course, as you see on the simulator as well, you could have done the same thing with that.

There's a shares, your envelope, write NFC tag.

So this is purely relevant to the saddle chip.

Like you were just talking about putting and supporting an NREF.

You could put this QR code that's on the right as a UR.

So show the UR form of it.

Well, yeah.

Well, okay.

So if I say shares envelope and copy to clipboard, the easiest way to do this is probably, let's see what's the easiest way to do this.

But in the chat, it's a public key.

Yeah, well, it is.

Well, actually, do you want the request?

You are either way.

But I mean, actually, here, let me do it this way.

I'm going to open a terminal window.

I'm going to share that window.

Let's just share that window now.

All right.

So you should be seeing my terminal now.

So the, when I copy that, you are to the clipboard.

If I just say envelope, this is our envelope command line tool.

And then I just paste it.

You notice that this is the actual data.

It's a UR, which is uniform resource, which is an encapsulated binary data object of type envelope, which is Gordian envelope.

And then these are the byte words of it, which includes a CRC32 checksum at the end.

The last eight letters of this are the checksum.

You can always look at the last eight letters and see what they are.

And if I just have it parse this, then you see that it actually shows the contents of this in envelope notation.

This is a request with an identifier.

This is actually a 32-bit long identifier.

This is the first eight digits.

It has a body, which is a function, getKey.

It has some parameters to it.

It wants the derivation path, which is a key path, which is a keyboard map.

We always, everything is based on keyboard you see here at a lower level.

So this is a keyboard tag, key path.

This is the keyboard map that contains the derivation path.

It says it doesn't want a private key.

It wants a public key.

And then here's the actual note.

So everything is actually very easily parseable.

You don't even technically need an envelope stack to do this.

You can parse the keyboard directly if you know what you're going to get.

So even on size-limited devices, you can actually parse the keyboard directly using a very tiny keyboard decoder and still understand this.

So, yeah, that's the actual request.

Now if I copy the actual response, so I'm going to go back to my phone, and I'm going to copy the clipboard response, and I'm going to do the same thing here now in the terminal.

Here's the actual response.

And as you can see, it's got different last-date letters.

That's all you need to see.

If any of the last-date letters are different, it's a different envelope.

I'm going to parse this, and you can see the response.

And it's the same response to the request.

So here's the request.

Here's the response.

It's a result.

The actual result is here.

This is the actual key, the 33-byte public key.

And then there's other attributes here, which say it is a bit32 key.

It's a public key.

Here's the asset it's set for.

Here's the chain code.

Here's the name that was derived.

Here's the parent key path, and here's the parent fingerprint.

So everything you'd expect in a bit32 derivation is here.

And so that would be that that's the actual response.

So that's an example of using envelopes and URs to actually perform a remote function call, essentially.

This is the actual function call identifier.

And then the actual response to that same request.

So to go back, show this the iPhones again, and show the other requests.

And then let's just talk a little bit more about other kinds of requests.

Sure.

Let's see.

OK.

So you should be accessing the iPhones here.

Yeah.

So yeah.

If you ask, for example, it says show example request for the seed.

So in this case, you're actually requesting the seed itself with this fingerprint.

And then again, this can also respond to that request.

That's a request that that envelope can respond to.

And notice that in Gordian Seed Tool, everything that's not sensitive, that's public keys and so on are colored green.

And anything that is sensitive is coded yellow and actually needs additional biometric authentication or two-factor authentication to do it.

So right now, the simulator doesn't require that.

But on my phone, it would.

But for example, if I say I can say show example response for the seed.

So here's the actual example request.

If I actually want to generate an example response to a request, I could do that.

And again, it looks the same, except it's coded yellow.

And then if I go to-- let's see.

Where's the other?

Oh, and also, you can see the envelope that we generated for this actual seed.

So this is, again, with the developer tools turned on.

If you export the seed as an envelope, this is the same envelope notation you saw before, but for the seed itself.

And then let's see, I'm trying to figure out where else I have the developer.

Let's see, drive key.

Oh, you have it under-- yeah.

Yeah, so this is actual-- right.

So this is actually for the cosigner private key.

So again, these are all yellow, but the requests for these are green.

And so if I, again, show request for the key.

So in this case, it's asking a request for the actual derivation of this specific key along this path as opposed to just any general key.

So same basic idea there.

Show request for this derivation.

Notice it's not specifying a master fingerprint in this case.

It's just specifying the actual derivation path.

So there are at least four transactions that seed tool knows how to respond to.

Request for a seed, request for a derivation, request of a key.

Request to sign a PSBT.

And my mind's slipping with the fourth one at the moment.

But yeah, so it'll actually generate requests that other things can respond to, but seed tool isn't designed to respond to those things itself.

So again, the purpose of seed tool, which by the way is free today and tomorrow, is not really as an end user tool.

I mean, we've tried to do as much as possible best practices and such.

But more of a demonstration of UX, of code, et cetera.

So you'll notice that all of those things had a little option for NFC.

So like what I do is I have some cheap NREF only cards, non-smart cards.

And I have all of these requests on it.

So I can just tap seed tool with these requests and make sure that it gives all the different choices that are there.

We'd like it to do more.

So right now, seed tool does not support requests for sharding and requests for recovery.

Although we do allow you to put secret shares into NREFs.

So I'm going to show them that real quick, Wolf.

Yeah, so here's a seed.

And if I want to back this seed up, I authenticate.

And then I say backup.

And we can back up as a single Gordian envelope, which you saw the actual below at the bottom here is the actual envelope contents.

Or you can say backup as SSKR multiple share.

And then the next thing I'm going to do is I'm going to show you the whole stack.

And then I'm going to show you the whole stack.

So if I say backup as SSKR multi share, it asks me if I want to back it up in the Gordia envelope format, which is suggested because you get metadata, like name notes and so on.

Whereas, or you can just back up as a legacy you are, which is just the seed itself.

But then I have to decide what kind of sharding I want to do.

And a very common one is three of five.

And you can actually have groups.

So I can, for example, two or three shares of two or three groups.

So you can actually create nine shares distributed among three groups.

And then you have to get a minimum of four shares from any of the two groups to actually reconstruct it.

So it's up to you to decide based on your risk surface and so on, how to do your social key recovery.

But let's just use three to five for now.

So I tap next.

And at this point, the actual shares have been generated.

In fact, that's why it says generated February 7th here.

It says for security, SSKR generation uses random numbers because of this.

If you leave the screen and then return, the shares shown will be different from and not compatible with the shares available below.

Shares created at different times cannot be used together.

Be sure to copy the shares the safe place.

So you can print them all, which is what we're going to do in a moment, or you can export them individually.

And I'll show you that too.

But so if I say print all shares, then you basically get a couple options.

If you want a summary page at the top, you can.

And you can also include the seed notes.

So if there are seed notes, notice that it says actually has them here.

If I turn it off, then they go away.

But notice also there's these four.

And I'll show you the print out closer in a moment here.

But this is the summary page.

And if I go to the other pages here, you see they all look pretty similar.

They have a QR code and they have an envelope, but you cannot derive the seed from this envelope directly.

You have to have at least three of the five to actually generate them.

So I'm going to go ahead and say print here.

And this is the actual print dialogue here.

Let me actually make sure the print simulator is running here.

There we go.

So I'm going to say save original simulator.

And then I'll say print.

Now I'm going to share my actual window that comes up here in a moment.

So what you're seeing now is the actual PDF that was printed through the print simulator.

And this is the cover page.

And again, it says the following verification words may be used to establish that printed shares are part of this SSKR share collection.

Check them against the last four byte words of each share.

Only shares that were created at the same time can be used together.

So we're kind of repeating that warning.

And it says three or five shares in this group must be met.

So the owner of the shares could keep this without actually keeping any of the shares.

They could give away all the shares and just keep this.

And so this is the actual last four byte words.

I'll show you how that works in a moment.

This is the note that was with it.

And then here's one of the shares.

This is the actual URL envelope that's in that.

This is the actual QR code for that.

And notice it says hang lava pool iris.

OK, so how do you know this matches that byte words?

There's 256 byte words are all four letter English words.

And it's basically been designed so that they're all very distinct from each other, including the first two letters being distinct, the last two letters being distinct, and the first and last letters being distinct.

So Iris can be abbreviated I.S.

And notice that the last two letters of this are I.S.

The second word before that is pool, P.L.

And you see before that P.L.

And similar L.A. for lava and H.G. for hang.

So hang lava pool iris.

And so you can see this is the actual same envelope as mentioned here.

So and similarly the rest of everything here is the actual share.

So if I go back to my phone here.

So if I say export shares individually.

Then you see here's the first share hang lava pool iris.

And right now you can you can export a number of ways.

This envelope as you were seeing as byte words as a QR code to an NFC tag.

And notice it changes to NFC tag or print share individually, which you just saw a page that's printed from that.

So you can decide how to deal with each share individually.

For example if I say envelope and if I show that you actually see the actual text of the envelope and there's the last two letters I.S.

So you can already see that that's the same envelope.

Bite words.

This is a lot of bite words.

You would want to enter these manually for very short seeds you might.

But not generally this this way.

The QR code.

This is the again the animating QR code that contains the envelope.

Because again once you have the admin QR codes you don't care about whether it's a big piece of data or a small piece of data it's very quick to read.

Again write to an NFC tag or print it.

So I'm going to go back to envelope here.

I'm actually going to I'm actually many of the things that that see tool displays are just you can actually tap and hold on them to copy them.

So I'm going to tap and hold on this copy.

It says what do you want to do.

I'm going to copy this clipboard and then I'm going to go back and share my terminal again.

My terminal.

OK.

And then I'm going to go envelope and paste this and notice again the last two letters PLI or four letters.

PLIS so you can say this is the same envelope and then I'm going to parse this.

And this is very simple.

It's an encrypted object of some kind and then it's got one assertion on it.

This is an SSKR share and then this is the actual SSKR shared data.

So this is the actual payload that's been symmetrically encrypted by an ephemeral key and it's the actual ephemeral key that's been sharded and this is and the shard is contained in this.

And that's all that's all you get if you're basically a recipient of one of these shards you get an opaque encrypted payload and the share attached to it.

And so that's different for each of these shares you saw that I could export the five shares of this three or five split.

So I want to quickly connect a couple of dots here.

So let's say this was placed onto an nref of a card or sent via an API, you know, via API through the Java card API.

The two basic functions you need to do to be able to, you know, the first thing would be you would have to get, you know, at least three of these onto your card.

There is a Java card library for SSKR, which would allow you then to decrypt this into the, the to get the ephemeral symmetric key for this package.

And then there is also a cha cha poly.

What's the full name Wolf?

We're using the cha cha poly.

Yeah, sorry, my mind's, my ITF cha cha poly and then the, the file find it.

And we've also shown that there are libraries for cha cha poly for Java card that can decrypt this.

It's not super fast, but it's but given that it's not something you do very often.

It's like a, you know, one second, one and a half second operation with a Java card library.

So that basically means that, you know, a device of Java card family could both receive shards in order to create a key for the, for the device or alternatively be able to back up the seed that it has on the card, split it into a three of five and then be able to share those shares out to other parties.

So it's cha cha poly, cha cha 20, poly 1305.

That's the name of the ITF standard.

You want to show him real, I don't know if he's show him the recovery with your other phone.

Yeah, I was going to do that.

Actually, that's why I actually pulled up this share now.

So, so I'm going to say, I'm going to pop out of this.

And I'm actually going to delete this key, this seed from my phone.

So I'm actually going to delete it.

And it's gone.

Now I'm going to actually go into the camera mode here again.

And as you can see, I'm showing the same part of my screen here that we're just looking at here.

This is the cover page.

So as I scroll down it, I'm going to focus on that QR code.

Notice the recover from SSKR.

It's got one group and there's three shares required.

So it knows that just by scanning that.

So, so now I'm going to say, I'm going to say skip the next one.

So I'm going to skip past the next one.

So I can't read that.

And then we'll go back to the next one here.

And it's got it.

And then I'm going to skip past the next one here.

And then read the third.

And there it is.

It's got everything that had before, including the notes and an attached output script.

I'm going to save that.

And there it's back in my library.

So that's an example of SSKR key reconstruction.

So again, in this case, the, you know, we also can do this with PSBTs.

So, you know, if a device, you know, say Sparrow or some other coordinator wants a something signed, it can use these same request capabilities.

I don't know.

Do you have something prepared for that, Wolf?

Oh, for signing PSBTs?

Yeah.

I can show how a signature request looks, essentially.

I can show the actual interface for that.

So let me take a moment to pull that up.

So some of the things that we don't have, because we need to work more closely with, actually, let me back up a step.

What is the motivation for all of this?

So Shannon and I wrote in 2018 and published in, you know, a new version in 2019, something called the Smart Custody book.

And it was all about best practices for storing your Bitcoin.

And it really focused on single-sig backup best practices.

And it was well received by a lot of security experts, but it still, you know, it takes you 45 minutes or so to do the process.

And what we found with those people didn't do the process.

And it was focused on single-sig, which, of course, has its weaknesses.

So we published in 2021 -- I don't remember exactly when -- a scenario that leveraged using Sparrow as the coordinator without any keys, and then used Foundation Devices as one of the keys, an offline key in the form of one of those backups that you just saw, and Seed Tool as the tool that created those backups, and I think also a little memory card that Foundation Devices supports, which again is very secure, but it was in many ways too complicated still.

As much as we tried to make it high security, the steps you go through were kind of long.

And, you know, people who even had lots and lots of money on Bitcoin were going, oh, no, this has to be easier, or I'm not going to back up my Bitcoin, which I think is silly, but that's the reality of things.

So we basically did some -- tried to understand the user experience and, you know, what causes all of this type of stuff.

And that's where we basically came up with this sort of request/response paradigm, which is represented by the Gordian transport protocol, which is what we've been using for these types of things.

And it allows for a lot of these kinds of interactions to be automated.

What we don't have is what I would call a partial descriptor request.

We have PSBTs, obviously, which is what Wolf's going to show you in a minute.

But there's a similar problem of, okay, I've got a partial descriptor.

I want to verify that the first public key that's in here is somebody's real public key, but the other two are empty.

So I need to fill one of those two.

And this can be done by hand with the key thing that you just saw, but we'd like to have something that was maybe a little bit higher level that just basically did all of this and did it right.

And then, you know, we have a couple of other things that we've been using for a long time.

And, you know, obviously, there's some tofu requests that would be useful for the seed recovery servers, social key recovery, and NFC cards that we haven't fully articulated what the flow would look like.

So, you know, if you have a request or your card could respond to a request that would be useful.

So we'll go to PSBTs now.

Yeah, so I have here, this is a folder in our in our archive here called testing, it's got some PSBT signing requests in it that can be signed by our sample seeds here.

The sample seeds are called Alice and Bob.

And the sample seeds are called Alice and Bob.

And the sample seeds are called Alice and Bob.

There's no additional metadata that the PSP don't support in it.

Whereas the other one here, the PSP sign request is actually the full sign request and see tool can use either of those.

So we're going to use the signing request itself.

So I'm going to go back to see tool here.

And I'm going to see I got Alice and Bob here, Alice and Bob.

And I'm going to go into the camera mode here.

And I'm going to go ahead and click on the sign request.

And I'm going to click on the sign request.

And again, here's the same kind of interface you saw before where in this case, the remote device or the remote QR code essentially.

Sorry, what?

Can you zoom that a little bit?

Zoom it.

I can try to figure out how to make it bigger for you.

Is that better?

That's better.

Yeah.

Yeah.

Okay.

So we're going to go ahead and click on the sign request and we're deciding what to do about it.

And so it says another device is requesting signing on the inputs of the transaction below.

If you approve this device will sign one input on the transaction using keys derived from two seeds on the device.

One sign, this transaction will be fully signed and ready to send to the network.

So if it couldn't sign all the outputs and has to leave some unsigned, it would tell you that at this point.

And so it gives you a summary of the transaction, in, sent fee and change.

You can display addresses for main net or test net if you prefer.

The input that's being signed, it's telling you which seeds it's going to sign it with and which derivation path it's going to pass.

It's going to use.

And then it's and then the outputs.

And then again, it's asking you if you want to approve.

And if you approve, this is a signing response that you can actually share as a raw PSBT, a binary, which you could write to a card.

You could write to an NFC tag or you can display as a QR code.

In this case, it's a you are envelope.

And again, this is again, this presumes another device is going to read this and then either send it on to other signers or consolidate it with other with other signed PSB teas.

Yeah.

And right now, Sparrow will read the the QR of the I think both now, right?

Doesn't he support actually, I know I don't know if he's supporting the very latest, but I know obviously he supports the raw PSB teas, but I don't know if he supports all over or not.

Yeah.

Anyhow, you get the the the what we're trying to do here.

Again, we're not a wallet provider.

We are doing all of this to support you.

This is all open source.

Everything you saw, including the examples are on GitHub.

You know, you could use our app to test and do more things with saddle chip.

You could do PRS to help us do specific things with your with your technology.

And, you know, you could use our code in your own apps if you have an iPhone app or we're working on also a rust stack for all of this.

So you could also do a desktop.

A good chunk of what you're seeing right now is available in rust as well as rust native code.

By the way, Christopher, I don't know if you want to take this opportunity, but I can also show a little bit about creating seeds driving keys while we're while ready.

So that's practices we're trying to to demonstrate to to support wallet developers on good UX.

Yeah.

So so creating seeds obviously is so on the right.

Can you get we don't need the we don't need.

Oh, yes.

Yes.

Yes.

Let me let me try.

Yeah, exactly.

So let me just go back to my iPhone here.

Oops, I turned off the wrong one.

Yep.

Actually, I'm going to go back to the simulator because that's actually better for our purposes.

OK, so I can actually click on the screen.

You can see my cursor.

All right.

So let's assume we want to create a new seed.

To do that, you have plus button and you have quite a variety of options to add a seed and you can either create a new seed or you can create a seed.

Or you can import seeds from various kinds of formats, including bit thirty nine S.S.K.R. shares, rob.

Itewards just hexabytes or an envelope or you are a seed.

So so if I just want to do a quick a quick create and this is basically using, you know, entry provided by the cryptographic strength random number generator in the in the OS.

I can do that, in which case I'm done.

I can click save.

I can if I want to.

I can still edit the various things like the name and output and so on.

But you see, that's the actual envelope that would be created by this.

It's sixteen bytes and three assertions on it, including its what it is, the date it was created and its name.

And then but the actual subject of the envelope is the 16 bite seed itself.

So let's say I don't want to do that.

Let's say I want to create my own seed from scratch using my own entropy.

And you can do that using coin flips, die rolls or playing cards.

And so, for example, if I want to use playing cards, this assumes that for full entropy, it assumes you're shuffling every time and drawing a card.

And so, for example, if I draw like ace of diamonds, you can see that's five point seven bits of entropy very weak.

So you want to get up to at least 120 bits of entropy.

So I can nine of clubs.

I have space that is nine hearts or ten of hearts or you can have it roll random cards if you want.

So you can do that or you can roll up to as much as you need to actually get the entry you need if you just want to demo it.

So at this point, I have a very strong entropy of one hundred thirty one point one bits of entropy.

You can also copy or paste these things.

You can share a copy or paste the actual.

So if you want to generate these somehow like a text editor, there's a text format for these.

And you confirm it with some other tool that it generates the same.

Exactly.

Yeah, because the exact same entry should always generate the exact same seed, which will generate the exact same keys and things like that.

So you can use diaroles and you can use coin flips.

So it's up to you to decide what you want to actually do to actually get the entropy for your key and symmetry will always change the same key.

You can also basically paste in, for example, byte words or SSKR.

So let me demonstrate this by saying actually a bit three nights.

I want to demonstrate because it's very nice for well known.

Let's take one of my keys here.

I'm going to authenticate and I'm going to share the key as 39 words.

I'm going to copy this to the clipboard.

And I'm actually going to go ahead and I'm going to paste that into my terminal.

You won't be able to see that, but it's got 12 words here and then I'm going to go to the go back.

I'm going to say add.

I'm going to say add bit 39 mnemonic.

And now I've got the words here on my screen.

You don't need to see them, but I'm going to start having the first word a d m i.

Notice at this point it's saying that this is enough to determine that it's got a word here, even though I have a d m i, it says admit is the word, but that I need at least 12 words.

So I'm going to press space and type g l and notice that it says there's 35 possible words that have these letters in them.

So it's basically, you know, it's ambiguous still.

So I'm going to type next two letters.

I am.

I said, oh, that's the word glimpse.

And then I'm going to try it say S the next word is spatial.

So I'm going to type this s p t l and notice that it still says that's ambiguous.

So I'm going to say s p a t l notice that's actually figured out that this is the only possible word given this letter sequences.

So you could type the first four letters.

The first four letters of a bit 39 word are unambiguous, but if for some reason words are eligible or whatever.

But you can, you know, it'll tell you basically if any of these.

So I'm just type.

Let's see.

That's combat.

So it's the next words combined, combined dignity purchase such switch.

Notice they got that for the four letters.

I'm going to type the last letters of this one.

Let it know.

So there's two possible ones there.

P l and planet.

Bargain.

Lab.

And there you see it's got the it's got the the the key.

I know it's got the CD down.

You notice that there's no metadata like that.

That's not part of it.

39.

It's just 12 words.

But they're easy to back up.

So if I say done, then it's actually going to import that.

Let me just show you the other way of doing this, which is bite words, which I think is actually even easier.

So if I go to again, that same one and I authenticate share as bite words, copy clipboard.

So I'm going to paste that into my terminal now.

And I'm going to say add a new seed from bite words.

Same basic idea of the interface here.

So I can type the actual bite word APX.

Remember the four letter English words says you need at least 20 bite words.

Currently you've got one.

But the nice thing is I can type like the first and last letters of this.

P s is plus I.

Oh, is into F.

W.

C.

M.

W.

F.

B.

Y.

H.

G.

H.

H.

K.

O.

C.

K.

Notice if I type a sequence, it's not valid.

It basically says that one isn't it cannot be a valid bite word.

C K B Y.

N B O G O.

Some other cool things about bite words are not only are they unique and first last character and various aspects of that.

They've been very they've been very carefully chosen to be easily memorizable to have a low a large hamming size, I guess, so that they're very difficult.

You know, very difficult to type the wrong word.

It's also very difficult, even if you were with an accent to mispronounce one of these words.

They all have very different pronunciations in the dictionary and they all have a certain distance, a certain number of letter distance between them in terms of number of positions that need to be changed.

And like I say, they're all unique in their first three letters, the last two letters and the first and last letter are all unique.

And we've also avoided there's a list of words that are the most commonly mispronounced by foreigners that we've also eliminated.

So it's a really interesting list.

As you can see, we use it in a lot of our different things.

But, you know, why didn't we just do a bit thirty nine words?

Well, part of the challenge was that we had multiple needs and the the we needed something that could be compressed tightly by QRs.

Right.

And a lot of the other alternatives that are out there, you know, will add a have a single character in them.

So like base 64, you know, will be basically doubled in size in a QR code because of one character in base 64 that is not part of the QR code set.

Right.

So basically for right.

So basically for is a great way of compressing or of armoring binary in text.

But it's actually less efficient in a QR code because it requires the QR codes use what's called their binary encoding mode, where every character you type is actually uses eight bits of data in the QR code.

So there's another encoding mode in QR codes called the Alton American coding, which essentially is just the upper case letters and a few symbols, including colon and slash and hyphen.

And so you are only ever use those symbols.

And so if you create a you are which includes these bite words and and can only include letters from that Alton America subset and then you you transfer them to capital capital letters and put them in a QR code.

You actually get a less dense QR code than the same data by base 64 encoded in the QR code.

So it's it's designed to both be handleable by humans as a as a URI so you can copy and paste you ours.

It's designed to be very efficient in QR codes and it's designed to be fairly short sequences, memorizable or or verbally transmissible and very easily, for example, engraveable into metal or things like that with just a few words.

So it's it's a balancing a number of different needs of the wall and and digital privacy community at the same time.

And I think we've done a pretty good job of it.

And, you know, of course, it's not going to be perfect for every need, but it does.

You know, it solves, I think, a lot of the needs that were in existence when we created it.

And I think it's it's I'm very proud of the work we've done.

We've done on it.

Quick question.

Would it make sense to make it compatible with it?

Thirty nine.

I know the two are not probably, but you could do like thirty nine first and then get like a two hundred fifty six hundred twenty eight.

Well, we support like now.

So, you know, we support you can either export it in any of the legacy formats, the BIP 39 mnemonic, etc.

But you can also export in a variety of of formats, including just plain old hex, the raw without you without a CRC.

And then I see my Gordian envelope, for example, as you get all the metadata, whereas with byte words or BIP 39 words or hex, all you get is the pure seed.

So so there's different reasons to use these different things.

Bite words is is part of the U.R. specification, which Gordian envelope uses.

So, you know, everything we do is in a stack, but we also support very important legacy protocols like BIP 39, which you just saw me kind of back up and restore a seed using that.

But that still doesn't give you all the metadata of the of the of the seed that in our tool stores, which would include its name, its creation date, its note, its output descriptor.

And you can see those are all represented here in the actual envelope.

And some of what we have also for like for seed generation.

Am I correct in understanding that you would need to first generate it with BIP 39, because that's like a one way process where you do a hash of the words and then you can encode that in whatever other like better standards that you prefer.

Well, you know, well, internally, basically, there because we want to be compatible with all the other BIP 39 based tools out there, when we generate when you generate entropy, there's other like, for example, websites that let you generate.

Entropy internet BIP 39, we use their same method, which basically actually internally does transfer through BIP 39, but you don't see that when it does this, but we were compatible with those methods.

So, so for example, if I use dia rolls here, it will give me the same and use the same six dia rolls, it'll give me the same seed here as it will on a website to actually generate a seed using dia rolls.

Also, BIP 39 is a little weird in the sense that the very last word is only has like a couple of bits of the randomness in it, the rest of it is sort of like a checksum.

There are wallets out there that especially ones where you can do it, do all the operations completely by hand for creating the seed that you but creating that last value once you've got like 11 words.

They all you just press one button and it'll make the the the 12th word for you because that is kind of a hash checksum.

It's a check word, yeah.

That being said, the problem with that particular technique, maybe we'll add it to seed tool if there's a request.

But part of reason why we don't do it is that in fact there are multiple valid values.

And there are a couple of bit different so you know you can basically, you know, by hand with just a piece of paper, create the 12 words and be able to verify that the 12 words are I mean 11 words are accurate.

It's just the construction of the last word that really needs a computer.

And, but you know you could you could create the first 11 words confirm it with seed tool and other different types of tools out there.

But you could technically create.

I think 256 I don't remember how many bits.

There are some random bits encoded in it.

But it's not you know it's not a there's no deterministic way.

If you have the 11 to determine what the 12th word is.

But you don't ever need to.

If you've got you.

If you've got 12 words or 24 words or whatever.

You don't need to hash the the the the You don't need to hash the BIP 39 words, because there is an inbuilt check some in there.

So the.

The point I was trying to bring across is that so many people are so sort of tied to this like it's such an industry standard if you like that even if you find a better way and there is a better way with all the metadata and stuff.

It would be it would be very nice if it was compatible in a way where they can take their existing 12 word seed and then encode it in this.

Yeah, other.

Well, that's exactly what that's exactly what we support.

They can take the right.

You can take the 39 seed from anywhere.

Put it in here and get the exact same seed out.

So just paste in it.

Right.

So the only other thing I haven't major aspect of the app I haven't shown off is the key derivation.

Would you like me to show that now, Christopher?

Sure.

All right.

So whenever you have first of all, I want to point out that that C tools supports three major cryptocurrencies directly.

And that's Bitcoin, Ethereum and now Tezos in the latest version one point six, which is now in the app store for free for a few days.

It will also sink your your your your seeds to iCloud if you wish, or you can keep it entirely off the Internet and have basically have a have a cold device if you want and just use air gapped to go back and forth.

And but I'm going to leave that for Bitcoin right now.

I'm going to go to one of the keys here and say authenticate.

And then say drive key.

Actually, I'm going to turn off the show developer functions because they just add noise if you're not going to use them.

So that's how we normally look without the developer stuff on.

I'm gonna say drive key.

And then you've seen the code of private key, which is a specific path that we use frequently.

But there's other key derivations.

And so this pulls up this workflow here where you see the seed flowing into parameters flowing into the private HD key flowing into a secondary diva derivation public HD key and finally the address.

So these are things are all derivable from this seed directly and there's basically three major paths Bitcoin, Ethereum and Tezos.

So if I switch just to Ethereum, it's still asking me from what mainnet or testnet.

But for example, Tezos doesn't support mainnet and testnet.

It's just all the same keys.

So that goes away here.

It shows you the Tezos Derivation path.

Let's just stick with Bitcoin for right now.

So you can either go with the master key or you can go with the cosigner.

Notice how this changes because it's the cosigner key or you can go with SegWit or you can enter any custom derivation path you wish down here and it will use that derivation path.

So let's just go with the master key for now.

So here's the master key.

If you choose master key, you can have a secondary derivation, which is the public key and the address associated with that.

Or you can ask for output descriptor, in which case you can decide on an account number and then you can decide which derivation path you want for your output descriptor.

So if I choose, say just name SegWit single key, then here's the output descriptor.

Drive from that.

Again, I can just click and hold on this and copy it to the clipboard or I can share it in various ways, including writing it to an NFC tag or sharing it to your output descriptor or an envelope or to sharing it as plain text, which of course is even easier to click and hold on it here to share it as plain text.

This is the latest output descriptor, so it includes the little checksum value after the parentheses.

Yep.

And so if I, for example, now if I say and what you saw in the settings is the default asset.

So for example, I go back here, I change this.

Maybe I only work in Ethereum.

So I'm going to go to Ethereum here.

That basically means that when you just say derive other keys that it's automatically be selected here.

But you can always reselect any of the cryptocurrencies here, but if there will now be selected by default.

So you see here I can either master key or the Ethereum.

Here's the actual private key, which is and the address, which is basically this is the standard way of representing visual hashes for Ethereum.

It's called blockies.

And so we support that as well.

So you can immediately tell if you paste this private key or use a public key address from this in another wallet, you'll see the exact same blockies there as well.

So it's compatible across wallets with that.

For Tezos.

Again, there's a derivation path for Tezos and then the private key and the address, which is a TZ1 address derived using the E225519 curve.

And that's compatible with Tezos as well.

So if you actually paste this into a Tezos wallet, then you'll actually have that wallet.

And if you paste the address, then you'll have the address.

So you know of any other derivation like there is a technique to generate a key for PGD from a seed.

That's just a derivation.

And you can do any arbitrary derivation with this tool that you like.

Right.

Yeah.

Using BIP32 derivations at this time.

Yeah.

So all of these, we have the developer functions that show you how to request these things so you can request something weird like you need such and such.

And then we'll, as you saw from the previous dialogue, we'll tell you, well, we don't know what this is that somebody's requesting.

You know, it's like it's out on our list.

You can do it.

You can say yes, but it's not a Bitcoin one.

It's not a, you know, anything we identify.

And then within say Bitcoin, you know, it's not a SegWit or a Taproot or any of the standard things.

It's something weird.

And you, it'll warn you.

And so we do a lot of things to try to be careful there.

Again, to try to represent some best practices that we hope more wallet developers will use.

One other point I want to make is when you have used Bitcoin and initially requesting if you're driving to the master key, you can get the public key or you can get an output descriptor as I pointed out, or you can get an account descriptor, which is a bundle of account of output descriptors that Sparrow Wallet can read directly and things like that.

So they can decide which output descriptor they want to use on the wallet side because you're exporting a whole bundle of output descriptors.

So anyhow, that's the current version of seed tool.

And, you know, sort of, I think you see why we have the tool available to help developers test all of this stuff.

I mean, it is useful in and of itself.

Do you have Wolf?

Can you show like the single seed printout?

Oh, yeah, sure.

So, yep, one sec.

So, you know, one of the things that, you know, we're saying that really nobody is doing well right now is, you know, if you've got any kind of multi-sig, you know, you have to have you have to back up the descriptor.

Well, there's not a descriptor.

Yeah, hang on.

I'll get one here that does.

I think this one here is.

This one has long notes and descriptor.

And yeah, which Bitcoin.

I think you're still on it.

You're right.

All right, so I'm going to authenticate backup.

I'm going to go ahead and back up the gordian envelope and print.

Now I'm actually going to print this and then share my actual printout here.

Okay.

Christopher, I'm actually being called away on a family thing for a minute.

Would you want to?

Sure.

I'll walk him through this.

Okay.

I'll be right back.

So, obviously the QR at the top is what will allow you to restore it.

And it has the name, the fingerprint, the master key fingerprint.

It has the raw hex.

It has the creation date, which is really useful for a lot of Lightning apps.

They don't need to check any transactions before that date.

Actually, a couple of different protocols.

That's important.

The byte words version of it, the BIP39 words, the actual envelope in text formats.

This is exactly what's in the QR.

The output descriptor, which is especially useful if you just want to create a watch only wallet for this set of rather than using the key on the top right, you can use the output.

The output descriptor to very quickly create a watch only wallet for it.

And then there are the notes, which you can put arbitrary information in.

This also is a really good demo of another feature of envelope.

Because of the constrained amount of space on this page, we basically can't fit that all onto a printout because we can't do animations on a printout.

So what is the right thing to do?

So what happens in this particular case is that you'll see this warning thing.

Some metadata was elided to fit into the QR code.

What it does is it's actually going to hash the notes.

And it creates an elided field in this shorter QR that basically says, oh, these notes are now missing.

And this is really useful for a variety of cases.

You may want to deliberately align something.

Maybe you don't want to put all of your transaction data and other different types of things into the envelope.

Maybe you do.

So it's also a good developer reference that, hey, you should be prepared when you're restoring that there may be data elided in the restoration.

And you can identify, oh, there are notes.

I just can't.

I don't have them.

This is also particularly good with SSKR in constrained situations.

So for instance, I could put, say, a three of five, I could put one of the three of five not elided at all on iCloud.

OK.

And I can do that safely, easily.

And those can be fairly large objects.

It can have everything.

But then I also want to put one of the shares, the fifth share of a three of five.

I want to put that on a piece of paper like this.

Well, I can't put all that metadata there, but the hashes of the metadata will be there such that when I restore all the different shards, even though this is a small shard, it will be able to verify that the large shard that I recovered from iCloud is valid and give me all of my data back once I have a quorum of shares.

So that's really a powerful capability.

Each shard has the ability to share more properly.

That shard is the verb, share is the noun.

Each share can have slightly different information in it, which can then can all come together and be verified when a restore happens.

And I think this is also important in the NFC side of things because there are real limits on what you can put on NFC cards and things of that nature.

So this is a useful demo of the elision capability.

Well, can you quickly grab this elided envelope and show it in the terminal?

Yeah.

So let me.

Let's see, easiest way to do that.

So I'm going to also share.

Excuse me.

I'm going to share my phone as well.

And I'm going to actually.

Okay, so I'm going to go to the QR reader app.

You're pretty apt to use this.

I'm going to grab the QR code you just saw there and there you see the you are capitalized so you can use the efficient QR code and encoding method.

I'm going to copy that to my clipboard.

And then now I'm going to share my terminal again.

And that's the previous scene you saw.

Clear my screen here and type envelope and then paste that that you are in and you see that again, here's the actual seed is the subject of the envelope.

It is a seed.

The date has name, but the nose, the note says it lighted.

And what that basically means is that the Shaw 256 hash is still left as a marker here.

And so only the notes that are actually in that original thing can replace this without changing the whole hash tree of the envelope itself.

An envelope essentially kind of like a Merkle tree like hash, Merkle tree like hash tree so that there's a top level hash which is associated with the entire envelope and changing any contents in the envelope except certain kinds of transformations.

So all the elision encryption and compression will actually leave markers of the actual original data in there.

And so in this case, it's been lighted which means the data itself is gone entirely it's not encrypted it's not compressed it's just gone, but the hash is still left so the hash tree still matches.

And so one of the superpowers of envelopes is you can actually transform envelopes to, for example, remove or encrypt certain data without invalidating signatures or other things like that that might be on the envelope.

All make sense.

So both what do you see now the utility of envelope and why we're trying to do more with NFCs and, and, you know, create API for all of this.

Yeah, that's interesting.

I was wondering the the envelope are encrypted.

It was not clear to me.

So encrypted that they are by default, but you can encrypt parts of envelope so an envelope is essentially a tree of envelopes so envelope contain envelopes contain envelopes essentially and so almost every element you just saw.

In fact, let me kind of summarize here and be combined or yeah exactly so so envelopes can be nested with another envelopes in fact what you just saw when go back to my terminal here for a second.

So, this is an envelope, right, the actual subject of the envelope is an envelope.

Each assertion, which is a predicate object is an envelope.

Each predicate is an envelope and each object is an envelope.

And so these things can be nested arbitrarily deep, and we have many examples of that.

Now, and then envelopes themselves can be alighted or compressed or encrypted using cha cha Polly 20 20.

I, I TF 1305.

And, and eventually other encryption methods to if we decide to support them, because I will be designed to be extensible.

In fact, the base specification of envelope only specifies alighted, and then its extensions that that of that base specification that specify all the encryption and signatures and sharding and compression and things like that so those are all kind of add ons to our envelope so minimum envelope does support a lesion.

And that's very important for privacy or for, in this case we're using it to make something to a QR code that wouldn't otherwise be a pretty presence.

So, you can essentially take an envelope, you can close it another envelope, and then sign that, and then the entire contents of the other envelope is signed by the outer envelope.

And so you can't, you could still a light something on the inner envelope, but with because the hash you would remain same and the signature would still verify, but if you actually change anything inside the envelope, then the signature would no longer verify.

There's a lot of privacy oriented things in here so you know let's say instead of doing seeds were basically, you know, putting, you know, that you've graduated from you know the Bitcoin command line course in there, you know, signed by blockchain commons.

Well, you know that potentially is privacy revealing, but since we provided in an envelope.

You can basically say yeah I can prove that I hold this key, and I can prove that I graduated from the, you know, the learning to coin from the fan line course.

But I don't have to give you my name.

I don't have to give you any of the other information that might be in there, but even better, we blockchain commons could publish every single student in a single hash tree and basically give you a proof of inclusion in that hash tree that maybe is put on a Bitcoin just a hash, and you basically could prove that you were, you know, a graduate of the learning Bitcoin course admits everybody else who possibly did so, and yet be private.

Yeah, if you go to blockchain commons.com introduction envelope intro or just just Google for Gordon envelope, you'll find this page which basically talks about our motivations for envelopes, the kinds of things that envelopes can do.

And, you know, how they support all these different features and then the actual specification is an IETF draft called the, the very developed structured data format that we hope will become an RFC at some point, but it's been, and you know we do have an unsigned seaboard tag for for this and then this basically covers the entire, you know, core specification, and then out.

And then we have our research papers here.

And this is, if you go to our actual research repo.

You'll see that we have the, the link to the, to the, the Gordon envelope internet draft, but we also have for example for example, how would you do.

How would you do cryptography with envelopes well this is these are our standards for cryptography that our reference.

How would you do expressions and expressions is how we do requests and responses, because expressions are basically function calls.

You know, and then these all dovetail with our your specifications for example how would you, how do you generate how do you represent output descriptors using us that you and because everything is seabor and and everything in a certain envelope is seabor.

And that's how we get, for example, the output descriptors in our, in our, in our seeds is we use our, our seabor specification for this.

You know how do you represent seeds themselves in in Gordian envelopes.

And so, you know, all these things are extensions, you know, in extension known values.

And extension symmetric encryption extension compression.

So, and then our reference implementations in both swift and rust implement all these so and in fact in rust if you don't need certain things you can actually use compile time switches to actually turn off, for example, symmetric encryption compression if you know if you're compiling for a more limited platform and you don't need those things or want those things you can compile them right out.

Right.

We do have a type script for the underlying DC bore.

And we're hoping to have, you know, we have a variety, some of our different tools have multiple implementations and different languages Python, etc.

At this point we do not have a Java card implementation of envelope.

So, that's like one of the, the, the projects we're trying to get funding for is, you know, and again you don't necessarily have to do all of envelope or DC bore to do all these different types of functions.

There are shortcuts that you can do in, in, you know, encoding to be able to read and write these without necessarily having to understand all of the different possibilities of it.

If you know you need to read or write specific envelopes you don't need a whole envelope stack.

If you need to know you need to read or write certain things in seaboard you don't need a whole DC bore stack which does a lot of verification that everything is deterministic.

But just realize that you know if you write you have to write out a specific way so other DC board decoders that decode it when they do when the check to make sure it's deterministic they'll pass but you can do that without using any, any seaboard stack at all actually if you're in a very limited environment.

So, you know, we've, while we're defining things in a very rigorous way that can be usable by a lot of different kinds of applications and various kinds of with various kinds of security models.

We're also being very careful to make sure that people who do embedded systems or limited systems can still ingest and and and write out these kinds of structures without having to have a huge amount of additional code.

So what we need from you is, you know, you mentioned, oh, we would like to maybe put some public data into an NREC so that you know when we have somebody first sees a saddle card.

You know, they know what to do.

Well, we'd like to work with you on what that data would be we'd like to see it encoded in some fashion in a as an envelope.

With the requests or other types of details that allow for a variety of different scenarios so that when you tap it on any of the wallets that are used in the Gordian wallet community.

The, the, the, the UX will know what the right thing is to do for this card.

Maybe maybe this card has a display.

So maybe this card doesn't have a display.

Maybe this card points to a URL that is a Tor server that allows it to do more than you think it does.

I don't know.

There's lots of interesting things we can do with quick connect for NFCs that can be used for other things.

And then obviously, we'd love to see the ability to back up a private key or restore a private key onto an NFC card.

We have a library for that, but obviously the full implementation.

You know, you know, needs to be done.

And then obviously we'd love to see, you know, the ability to very quickly go.

You know, hey, I need to create a descriptor, you know, with a cosigner for my weird, you know, taproot descriptor thing here, but I want this fifth taproot leaf to be held by this NFC card.

You know, there's a whole process there that's, you know, a pain in the butt to do manually.

But if, if I basically have the ability to just put the special request onto the card and then the card goes, oh, I know what you want.

You need a pub key from me of this particular derivation.

Sure, I'll give you that pub key.

And then all those 25 steps that are in the scenario that Shannon and I wrote a couple of years ago are gone.

You just tap, it just does the right thing.

No, no NASCAR searching through five menus and sub menus and all that kind of stuff to get to the specific derivation that you know that you know some that Sparrow or some other wallet is requesting.

They can just ask.

Yes, that's interesting I, I still have to, to read about the whole process it's, it's very, very complete.

The, you have a think about every edge case I think.

Well, and certainly, you know, but our community has been a huge help, obviously, because we're doing this for the community so when you have questions, whatever feel free to reach out to myself or Christopher directly and you know, we will, we'll work with you to make sure that you feel comfortable, and any, you know, we do things at times and, and you'll see that you know for example we have, we've gone through three iterations of how to represent output descriptors and see for, and the version three, we're pretty much settled because we've gotten a lot of community feedback and advice on, and we're very, you know, but these things take some time to get solid sometimes something for very solid on now, and that we expect will become eventually hopefully of RFCs, so it'll be, you know, they'll be that solid or bips.

But, but that's part of what we need from the community is feedback so you know, and support.

And I was wondering for the NFC tag.

So when you use it with the the gorgian seed tool application on iOS so you type the card.

It's, it's just NFC storage, or is it just using the standard core NFC API and it's kind of simpler simplest mode.

And it's also allows that the when when we've registered you are so when you are is hit it holds up a guardian seed tool.

But, you know, but that's yeah so there's there's different ways that that, you know, we're trying to use the most standard kind of simplest way of doing games we're not doing things very, very sophisticated we haven't worked with smart cards yet.

But again, that's part of what direction we want we want to move.

Yeah, I mean we basically do now we can put any you are onto a smart card if it'll fit.

It will give errors.

If not, it doesn't.

I do not believe it currently supports the lighting to fit on a card we don't it doesn't.

It's either the whole thing or nothing right now.

Right.

That is the next thing so that if you put a large you are onto a small card.

The, the, the, the next major release one of our intended features is it will basically come back and say, hey, I can't you know this failed because there wasn't room.

Now I know how big your card is.

I know yeah I know how big it is, you know, I can exclude the notes.

I can exclude the birthday I can exclude everything but the seed if you really want me to, and still be able to back up.

And then obviously we're already using it and testing where a lot of these, these requests allow you we have a bunch of test cards that you know do that do the requests for various things we'd like to add.

I don't think that so the current version is one six, and again it's in the app store today free and today and tomorrow.

The, you know, but we aren't you know at this point until we know more and have some things from at least two organizations that want to do NFC API direct API is rather than enter n ref tags.

We'll be adding that that'll probably be post one seven.

I think our, you know, one of our, you know, big things for one seven just make the n ref stuff work better.

And maybe support some more, some more things like right now seed tool is very focused towards seeds and doesn't really have the way to back up to shard only the keys without the seeds, which is useful in some scenarios for instance, I'd like to back up my developer keys.

You know those are not.

Yeah, my I want to back up my SSH keys I want to back up my tour keys, all of those you are not created from seeds.

So how do I back those up I'd also like to be able to, you know, back up shares from other people.

So I want to, you know, in the same way right now.

What two months ago wolf demo the the Gordian seal transport capability to do social key backup on a server.

I'd like Gordian seed tool to be, and you know another place you could back up a share to, you know, those are all future things for Gordian seed tool but it's not, it's not possible to.

Sorry.

Go ahead.

It's not yet possible to store a share, share on the on the Gordian seed tool that's what you say.

So you can store a share, but you can't encrypt it in a transactional way tofu, so that the you limit the parties who can read that share can be returned to.

That's what the the full share protocol does.

Okay, right now you can hand shares to people you can hand them digitally you can hand them a printout.

And, you know, they can't recover your seed but a quorum of shares can.

And so, but what Christopher is talking about is the idea that you should be able to generate a seed and then say, you know, select five servers out there in the community that are all public depositories of shares and and put three of them out there and then put one in iCloud and hand me the hand me the fifth, and I'll keep that and then I'll raise my seat I don't even have it anymore.

And then eventually we want to support things like frost where it will gather a quorum for you and then create a signature without ever actually having a scene one place, but for now, or the key in one place.

But for now, we released last year, a tool called Gordian depository which is a proof of concept server written in rust that that basically and use it is backed by a by a Maria DB database that essentially you talk to it using envelopes as what's called Gordian sealed transport protocol.

And what this means is it doesn't have to go over HTTPS or anything like that could go over air gaps, it could go over anything because the encryption is actually handled in the envelope and signatures as well.

And it's also trust on first use.

So here's a public server, I made this available as public good.

It's a depo server, a depository for people shares, and so they send envelopes that say, please store the share.

And here's, you know, it's, here's my public key and in this assignment is my public key and the depth of services.

Oh, okay, I haven't seen you before but now you have an account.

So I was and I started to keep up sort of share.

And so, then you have you do this with several ones and they all trust you on first use.

And then you and you get back a receipt and then all you need is the receipt to get back those things or so or you can use a way of rotating your key and things like that.

So that you basically are distributing trust among a bunch of unrelated parties essentially who are already in these servers and so they're not, you know, they're not colluding.

So, and then that can be part of your thing you can also you know, friends, family, colleagues, whatever safe deposit boxes to to socially back up your seed but this could be handled entirely visually but there's the Gordian seal transfer protocol doesn't reveal anything about what it's being asked to do in the envelope.

All you see is this encrypted envelope.

Once it's unencrypted because encrypted to the server once the server looks at it says, Oh, this is a request for to store a share.

This is a request to retrieve a share this is, you know, you can't tell a third party can't tell going back and forth what's actually being said at all, and it doesn't rely on HTTPS.

And a lot of this is a response to you know the ledgers and other because there's some other parties that are talking about doing social key recovery, but you know what problem is is you don't have a choice, and you can't mix your recovery so I, I would I'd be glad to use some and even pay for some social key recovery services.

But I would never give a quorum of my keys, I probably do something like a four of nine and put three of those on a social on these social key recovery services, you know one offline and maybe two with family members or whatever.

Um, but I, the point is, I should be able to choose that.

And this allows us to do things of that nature and again because envelopes can be wrapped in envelopes.

You know there's also some fairly interesting things I could set it up such that if you really covered three of these, you know you might get some information like my watch only descriptor.

And when you when you get five of these you now can, you know, sign a transaction, but you don't get my, you don't get all of my transaction notes and history and and such.

And then you know if I have, you know, seven of nine, you get every single thing back you can totally restore every single thing that I've ever done.

So, go ahead.

I mean, having talked to some users, it's not just about the key.

It's also about like policy.

So, so there's like a use case where it's like, like, nobody wants to have custody of other people's funds because then you're at risk and you're a target.

But, but if you, if you for example give like if you set up a two or three thing where you give, where you give me or me being like your cloud computer.

You give me a key you keep one key that you like, keep in your safe and you never use it so like for your daily usage.

It's never used.

And then you have a third key and it's on an NFC card, which will sign the transaction.

So now, the, the policy is either either me like a trusted party or your own sort of computer that that's running out there somewhere like I saw this set up on AWS.

So now, it will only sign things in accordance to, to, to a policy that you trust and then you have your NFC card to, to, to co sign with, but you still have self custody, because you have all the keys or you can like use your, like, your emergency key to spend everything.

Not according to policy I saw this, this is my idea it was it was presented on Twitter by a guy like rock 13 maxi rindall.

And I can't explain how he's using nunchuck with I think a a tap signer to to to achieve this, this kind of policy based.

So yeah, definitely this is you know in the design and you can see some hints about it so if you go to smart custody calm.

You can see the book the 2019 book, but also you can sort of see here, the most advanced of our scenarios pre some of these you are standards.

So this is a very detailed scenario of a multi creating a multi SIG, it has 14 steps.

Where some of the keys are stored in different places there's and it's specifically carefully designed such that there is no single point of failure no single point of compromise, which are slightly different.

And it basically work this particular one is oriented toward Gordian seed tool for one of them.

And the other is, where's the.

This is Sparrow is the transaction coordinator I think in this example, and then we're using foundation devices for one of the other things.

But the problem is is when you actually go through this, this is very reliable very solid and addresses, you know, all kinds of alternative setups and whatever, is that it's still too complex.

And so that's what part of the whole point of the Gordian protocols and such is that you know you can now embed the descriptors you can put policy information, like one of the main things I went before when about first came up.

I was talking with him briefly about I'd really like to have an NFC card that says I will only be the last signer.

So in other words, you if you just give it a bear PSB PS BT that, you know, has the, the, the, the, the root pub ex pub fingerprint that the card knows about.

Well no, I'm not going to sign that you know my policy is I must be the last signer I you know, or at least have to have one other signature on there or whatever the rules might be.

So we really want to define these more firmly in my own research on this, you know, it's a lot about where there can be trusted interfaces.

One of the problems with NFC cards is most don't have a display of what we would call a trusted output.

And most do not have a trusted input either.

So that means the trusted output and input needs to be another device and and so we have to be careful that that device isn't compromised.

So we want to be able to do things where that that an NFC card that has no trusted input or output can do.

And one of the simplest is, oh, I'm you know, don't give me a bear PSB T it has to be signed by, you know, because the thing partially signed Bitcoin transaction which is what PSB T stands for means I could have one, two or all of the signatures already in there.

So I would basically my policy would be, oh, there is a three of five.

I recognize this descriptor because it was given to me when I when you initiated this NFC card, and my policy is I will only be the third signature of this three of five are the other ones available.

And this is one of the nice things about the the Guardian envelope format is it's open.

So as you saw from the examples I showed earlier, it's basically a subject and a set of assertions about that subject and that subject could be a seed.

It could be a key.

It could be all kinds of things.

And and and how we encode and interpret policies is a matter for future work.

And we need the community itself to do that work to understand what the policies are that people need to agree upon the best ways to encode those and and the best ways for people to, you know, kind of execute those policies on devices.

And so this is something that I think we're at the point of maturity.

Now we're ready to have those conversations where we have working examples of of adding metadata of various kinds of making sure it's cryptographically secure and privacy respecting.

And and now, you know, working with the community to implement, you know, kind of a higher level policy structure that is, you know, kind of open and understood and transparent, but very secure is something that, you know, is worker ready to undertake and we need interested parties, such as, you know, such as you who are raising these concerns to work with us to, you know, help us come up with something that that is has the broadest applicability.

So there's a whole bunch of other resources when we were researching all of this.

So this is the old SSKR, which only stores seeds, but we basically, you know, discuss a variety of the consequences of like how does a four of nine work.

So in particular, I am particularly enamored of the two of three of two of three.

It is somewhat by numbers, a kind of four of nine, but the difference is that you want to have different social connections between these different groups.

So, you know, in this particular example, you know, friends that are say maybe my colleagues, my professional friends or whatever.

And the second social group is maybe family members.

Why do you want to do that?

Well, family members may collude against you.

You know, they may like your wife more than you or whatever.

And you're concerned about that.

By creating these social groups completely separate.

Now you require at least one friend or and one family member to participate to do it and you need a quorum of one or the other.

And I also have the ability to have a self sovereign choice in this.

So there's a lot of different examples of how to think these and combine the scenarios.

So, you know, this was a lot of useful, powerful work in how to do these.

And we very much have an adversarial analysis technique.

I'm not going to show that, but let's see.

So here's the the the you know, how do you do an analysis of a scenario?

So we have this concept called the smart custody adversaries and we have two or three pages of detail on all of these.

So, you know, these are the things that any particular scenario you need to look through, you know, various kinds of key fragility, various kinds of, you know, convenience causes problems.

I mean, that's actually a lot of why we're doing some of the Gordian stuff we do is that, yeah, I can show you how to secure your key self sovereign in in very secure, very proven ways.

But it's inconvenient.

You know, oh, it's going to take you 45 minutes of time to back up your million dollars of Bitcoin.

I don't know why people make that choice, but that's the reality.

So the adversary of convenience is, you know, described here and, you know, we basically talk about the risks.

We talk about the, you know, how do you address those risks and we try to, you know, that's what a lot of the Gordian stuff is all about.

So there's a lot of things here where we're trying to help the community, not just the wallet developers, but also people like you to be able to do better for, you know, to meet the security needs and be open and, you know, do so in a fashion that helps everybody.

So that's what we do.

Bringing it a little bit back to NFC, I was thinking, like, there are some that do this already today, such as like the coin, the cold card.

It does some like, they have like a page up where they describe some like NFC, NFC five thing.

But the question is, like, how does a wallet communicate with a signing device over NFC and what would that standard look like?

I also saw that Seedsigner had some Java card support, or like somebody was looking at adding USB Java card support to it.

And then I was going to point out that there's like, there's probably a limitation to what the hardware can do.

So what what Java cards can do versus what like a computer or microcontroller can do to sign stuff over NFC.

So how do you make it so that you can both make a Java card, which is sort of hard.

I think there's like not a lot of people or like in comparison to like people that would be able to develop stuff on a PC or on like a Raspberry Pi.

But I think there's probably a lot more that have that skill set than people that can make like Java card program.

So how do you get a better environment?

Actually, actually, Java card is very easy to to program.

It's a subset of Java.

It's not very difficult to let's say the tool chain, compiling and so on.

It's not very difficult either.

Well, but you can stream with both RAM as well as code storage and that you are constrained.

It is a very, for example, it doesn't even have a string type.

So, you know, so it's a very limited subset of Java and it doesn't have floating point values, which aren't necessary for a lot of things.

But some things do take advantage of them, things like that.

And I think it has like a single integer type and a boolean type.

And and that's almost it.

You know, so.

So, yeah, you have to build everything up out of those things and that takes more code.

So, you know, that's the that's why I think I mean, at least I don't know what you can speak for myself, but that's what I mean when I think programming Java card is harder than, say, a Raspberry Pi where you basically have Linux, all Linux available to you know.

So let me also I kind of want to bring this I'm going to be blunt.

I'm very disappointed in coin kind.

I would have loved to have them be involved in this.

They are not interested in open source, much less open development.

We don't we don't we believe in blockchain commons that open source is not enough.

And, you know, there is more to it.

And there's a whole article here about the limitations of open source and you know what is required to to do better than just open source and coin kite and ledger have both basically said, no, you know, we are keeping parts of our systems proprietary.

And I'm going to tell you, in fact, we won't even let you know and have any choice into what share services.

Our new ledger technique uses and how that all works is not open source and you'll find the same thing with coin kite that their protocols are not open, it will only work with their cards.

Their cards, not all of their most a lot of their source code is not is inspectable, but not open but a lot of their source code is literally not available and they'll basically say, oh, well, it's because it's, you know, under NDA by the hardship manufacturer and that is true.

A lot of Java cards do that, but there are also a lot of Java cards that are open and that's what so bottom in here works for saddle chip, which is, you know, a leader in doing interesting things in an open fashion on on, you know, sort of an open card and I know I believe that this the the seed keeper maybe.

Yeah, there's several people that are using their code to make their NFC devices work.

I know foundation devices is also, you know, obviously has a trusted element on their, you know, sort of phone size device, but they want to do multi six so they they're also supporting the concept of some more open standards and open development around how do we do integrate these types of things and then we also hosted something called the silicon salon.

Come on.

Am I locked up.

No, there we go.

We also hosted the silicon salon, where we basically have discussions with various silicon vendors because one of the problems of the Java cards at this particular point is they can't do the math for Bitcoin as safely as they can for other curves.

And that means that there are various tricks where somebody can get physical possession of a Java card that, you know, using freezing and and other, you know, hacker tricks might be able to get your key out.

Well, this whole series of events is all about, you know, software company, excuse me, silicon designers, they're looking on how to do this better.

So there are going to be new cards and chips, etc. coming out in the next couple years that will have more capability.

And that sort of also leads me to another aspect of, you know, future, you know, is the dependence on a single card for a key.

There's this whole emerging capable thing of doing multi party computation, rather than having things be done on a single key you do something called distributed key generation.

And the advantage of that is that unlike SSKR, which is the state of the art that we currently support, you still have to recover everything onto a single machine, which then recreates the keys and does all the operations for you.

So as these technologies mature, multi party computation, the now the quorum of keys that of shares that you distributed can do things on your behalf if they need to without having to any one party restore it all.

So we've been doing some stuff there.

There is a Bitcoin group at Square.

I always get confused in which ones which spiral, etc.

That whole Square, you know, consortium along with Blockstream that are working on So they also have like a hardware wallet that does NFC, but they've been very closed about, or not necessarily closed, but they haven't talked a lot about how the NFC thing works.

So that would be like another interesting thing in terms of like, yeah.

So we need pressure from people like you to go to these guys and say, hey, you know, there is open development happening on this, you know, there is open source code, open architecture.

I mean, all these aspects of things.

I mean, we consider zero is, you know, open source, but it needs to be inspectable.

It needs to be observable, reproducible.

We're working on all these.

It has to be testable.

We have to share our roadmaps.

We have to, you know, work on our specs together.

You know, we have a bunch of standards where, you know, we basically say it's not a doesn't get a star until at least two companies have actually implemented and committed to it.

You know, we are committed to no vendor lock in and no single points of failure.

And then, you know, we're trying to deal with other kinds of lock in patents, IP regimes, etc.

By also cooperating with international standards organizations.

So, you know, DCBOR has already been submitted to ITF and looks like it's on RFC track and envelope looks like it has an opportunity to be so as well.

And then all of this kind of fits in with open so on.

But we really do need people like you to go back to block and to coin kite and things of that nature and say, hey, reconsider your non open source or non open development practices.

And there is a community that is trying to work on these things together and be smart and do it right.

Yeah, I also think that they won't they won't gain the necessary traction of like wallet adoption without without and I also think they have like a competitive advantage, as you said, because you have like this sleek looking device or you have like a nice printed card.

And it has like the newest latest like tamper protection in it and whatnot.

But if you at the same time also have like a $5 card that that's just like a blank card that you can get on Alibaba and it'll work in the same way though it might not be you know as secure and you might not be supporting and you might not like get the artwork and stuff.

And then you get like broader, broader adoption and and you could really make this work.

It'd be it'd be awesome if like wallets could communicate over over over NFC instead of instead of using QR codes and they could like opt into that if you were doing like multi-sig or like what the future holds in terms of like you were talking about like frost and stuff.

Yep, we definitely want to, you know, this is some so Foundation Devices is one of the sponsors of blockchain commons, and they're committed to to working in this different direction we have other sponsors.

We're a not for profit.

So, you know, we depend on people like these to be able to do what we do here.

But we need more.

I mean, it's especially this year has been, you know, kind of a crypto winner for, you know, funding of these types of things.

So, you know, we really need the the blocks, the, the, you know, the bigger companies to basically say yeah, you know, we want to support open standards on these types of things in the same way, foundation.

Devices has and they've made a very, very firm commitment if you go to their blog posts and things about nature.

You know, it's, you know, their secret master plan or whatever, you know, they're very committed to freedom technology as we are.

So, you know, so we, we need everybody's help on this at a variety of different levels.

So, let me actually jump ahead to.

So that's my information.

I'm at Christopher a on most services, although x and y is probably the one I respond fastest to still haven't quite gotten quorum on on blue.

One of the new new services obviously blockchain commons.com is our main website.

We do these meetings monthly and I are next month meeting, we're going to be diving deeper into frost and taproot.

So if those are things of interest to you.

There's going to be a particular focus there.

And then I'm hoping that, you know, maybe within the next couple of months, the various NFC developers that have gathered together in our kind of subgroup on NFC stuff have some proposals for some initial improvements and to our, our API's and such.

So, you know, keep an eye on it there.

Bob, do you want you have any last questions or comments.

I would be also interested to attend the next meetup about frost and, and the fruit.

We are also working on the fruit support on the Sato chip.

So it's in beta.

No, it works.

The code is open and we would like to work with like a university to, to have a kind of security audit and evaluate the security of the implementation.

We know improve some aspects about it, for example, side channel attacks.

But so, so it's, it's also very interesting.

And yes, we have a tool called an application, an NFC card called seed keeper which is also, yes it is the third one, which is used to store and backup seeds on a smart card.

So it's a bit like Gordon tool, but on a smart card.

It's much more simpler.

There's not as much functionality as the Gordon seed tool because, as you say, the smart cars are very constrained.

So, and, and then again you don't have a screen so, so you, you have to somehow interact with another device to import export seed or generate seed and so on.

But we'd love for you to, you know, start accepting these Gordian sealed requests and so that, you know, anybody can create a front end for your seed keeper to retrieve the seed.

The seeds and approve things, etc.

Yeah, great thing.

And then you could put, you know, one of the challenges with even with seed keeper is how to seed keeper back up that key.

You know, you could basically have a seed keeper itself be able to back up to other NFC cards.

That's actually that's that's currently already supported so you can have a seed on a seed keeper and then back back it up on on multiple seed keeper.

For example, we don't have the SS carrier functionality yet.

So that's something we are also looking so to have the possibility to, for example, store a seed on the seed keeper and export share on whatever you want other seed keeper or on a wallet, for example, and recombine them also on a seed keeper.

So also, you know, again, we are a not for profit.

Most of our money comes in through this GitHub channel.

So, you know, I would encourage if, you know, become a personal benefactor if you like what we're doing and that these meetings we're doing and the successes we've had with over a dozen wallet companies doing the the air gap QR codes now and such, you know, have become a personal benefactor at $20 a month or have your company become $100 a month developer men, you know, or, you know, we have these higher levels of support where, you know, you're a sustaining sponsor like, foundation devices is, or, you know, we can actually help, you know, you want your smart custody things to be reviewed for, you know, your particular scenarios, you know, at these sustaining research sponsor levels and sustaining partner levels, you know, we can personally help you with your projects.

I mean, you know, just to give you an example.

Actually think it's under smart.

Shannon, where's the thing we did for foundation devices.

The, the review of their hope you're muted.

Yeah, we got the house next door again go to the smart custody main page.

I think if you scroll down a little bit, everything's linked in their case studies there you go.

Yeah.

So we did a, you know, a deep analysis of passport version 1.08 look through all their different things the different levels of support they had for stuff.

This was not a code review.

But it was, you know, again looking at, you know, sort of the adversarial analysis and openness and other requirements, you know, for such.

And because of that they made some improvements on their on their work.

And then, you know, we obviously as Bob was pointing out, there are real issues of getting security reviews on this type of stuff it's, they're expensive.

So one of the things that we did was, you know, commit had our community commission security review for one of our critical libraries.

It's not JC SS kr.

It's not a, it's not a, it's not a, it's not a, it's not a, it's not a, it's not a, it's not a, it's not a, it's not a, it's not a, it's not a, it's not a, it's not a, it's not a, it's not a, it's not a, it's not a, it's not a, it's not a, it's not a, it's not a, it's not a, it's not a, it's not a, it's not a, it's not a, it's not a, it's not a, it's not a, it's not a, it's not a, it's not a, it's not a, it's not a, it's not a, it's not a, it's not a, it's not a, it's not a, it's not a, it's not a, it's not a, it's not a You know, these reviews can be anywhere from you know 20 to $200,000 or even a half a million dollars for a big detail project.

That's a lot of money for a small organization but if we're all sharing important code.

We can split the costs and get these important security reviews done of the of the of the mission critical code together.

So that's another, you know, benefit of being part of this commons that that's going on here.

So anyhow, I'm back to here.

I'm Chris fray at blockchain commons Christopher life with a lack ready, etc.

You can direct message me on a variety of places.

It.

And of course, the blockchain commons website has lots and lots of detail blog posts, you know, architecture discussions, etc.

So I hope these will all be useful to you.

Sure.

Okay, well, we'll call this a close for now.

See you in a month.

Well, we'll be talking more about frost and everybody have a good month.

Thank you.

Thank you for the call and the discussion very interesting.

And hopefully see you in a in a month.

Yeah.

Thanks for hosting.

Thank you for coming.

Okay.

Goodbye.

Goodbye.

Goodbye.
