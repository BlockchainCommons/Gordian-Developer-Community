Okay, so we ran into last month a UR-encoded object in the wild that kind of surprised

me.

So I wanted to invite them to come here and share a little bit about their particular

solution and they also had some suggestions or questions around fountain coating and such.

Do you have a presentation or do you want to share your screen?

I could share my screen. I think people can go into seathammer.com and just get,

but I'll quickly just run down what it is. So, seathammer is basically a print to steal,

backup your beacon wallet and seeds to steel and we want to position ourselves as the printer,

steel printer if you want for anything for any backup needs you have.

At the advantages of course there are many many steel solutions already.

There are the manual ones basically, there are washers, there are metal plates that you can

hammer on, there are engraving toolkits and so on. So the difference between all those and ours

is that we sell a machine. So it's an automatic backup generator or printer.

And by having a machine and of course the blank plate, you can print much more on the plates.

So it's practical but difficult to do your seed words manually. But with our machine,

you can do not only the seed words, you can do a seed phrase, for example, a VIP 39 seed phrase.

You can also do the corresponding QR code, which is cool if you have a stateless

signer signing device. And even more importantly, you can actually back up the complete,

all of the information that is required to restore your wallets, in particular multi-signature

wallets. And the way we do that, I can link to a very short video that demonstrates what's

possible. For example, if you have a two out of three set up, you will get or have engraved with

the seat hammer machine three plates. And each plate will have a seat race and the CQR that matches

that seat race. And on the backside, it'll have a fountain encoders. I think you call them parts.

So it's a QR code containing the complete output descriptor,

but it's split up into parts. So for example, if you have a two out of three setup, you will need

two plates, two shares, and we use fountain encoding of the QR data encoding to make sure

that we only have to, we only store, what you say, the required amount of data. So instead of

encoding a complete descriptor on each plate, which is quite a lot of data, we can engrave only

half of the descriptor on each plate or the amount of data corresponding to half of the descriptor.

And because of fountain encoding, any two plates will recover the wallet.

So just to in the example of a two or three, if you are familiar with the fountain encoding,

it's more or less you split up your data, in this case an output descriptor in parts,

and we have two parts. And you can then encode either a part or you can encode an arbitrary export

combination of parts. So for a 2 out of 3, the first plate will contain the first part of the 2,

the second plate will contain the second part of the 2, and the third plate will contain the x-ore

between the two parts. And if you work it out in the head or something, you can convince yourself

that either two of those three UR codes will recover the complete wall. Of course, the two

first place is trivial, that's just the two parts. And any plate with the third plate will

also recover because you can use the plate with just one part to sort of factor out or XOR out

that part from the third plate. And we do something similar for three out of five,

where it seems to be necessary to use three parts, sorry, six parts. So you will end up with two QR

codes on the backside of each share. And the XOR scheme is more complicated, but the result is the

same. Any three plates of a 3 of 5 setup, when you scan all the six QR codes on the backside,

you get a full recovery of the description. And that's sort of the unique thing about C-Tearnler.

You can do many other things with it. You can do gift cards, so you only need a single signature.

You can print just the words.

You can print one of one with the descriptor on the backside

if you want to make it easy to scan,

for-- to check the balance, or just to see the addresses,

or whatever.

So of course, there are many, many secondary advantages

with C-TAML.

But right now, it's the multi-signature,

complete backup thing that is the unique thing for us.

So what's fascinating to me when I look carefully

at some photos that were shared by them was,

of course, it had the UR at the beginning

of an engraving that was also in the QR code.

So you could compare the engraved text with the QR code

that was on the same metal frame.

And I looked at it and went,

"Oh, that's kind of intriguing."

because if we go back to the ledger problem,

ledger forced you to use two parties

that limits you to a very particular type of scenario.

And we've long, I know with one of our multi-sig scenarios

that Shannon designed for, I think it's Sparrow,

seed tool and foundation devices.

We are putting a seed into storage offline.

And then the other two are basically

cloud accessible services

that we wanna be able to do offline.

But I think this idea of being able to leverage

some of the offline capabilities of QR's

is very interesting.

And especially when we start talking about CSR

and some of the new features of Rust.

So one of the latest features of Rust is that,

excuse me, the Rust library is that we ended up adding

a new major category to the envelope specification,

which is also compressed envelopes.

So we actually have the ability to compress envelopes,

which will help make things fit onto multiple,

metal backups if people wanna do that.

But I also think that there are some other,

understanding more about the limitations

of how much you can fit onto one of your metal backups.

There may be some other very interesting things we can do.

I mean, I've been saying for a while,

I've been very uncomfortable with the fact

that descriptors are a very,

descriptors are actually not that large.

We just, we end up by entangling encoding

and then encoding it again

and then putting headers on it and whatever,

we're making these very complex structures

that have lots of layers to be able to decode it,

to be able to use in our multi-sig usages.

But in fact, if you have a binary format for that,

that actually is fairly compact.

So that's another opportunity is for us to basically go,

hey, here is, you know, BIP 900 or whatever,

I don't know where the BIP numbers are up to now,

but here is a binary version of a descriptor

that is, you know, very compact

and recommend to the Gordian community use this

because it's a lot smaller

and will allow for unusual scenarios,

including a complete offline scenario.

But I think there are other opportunities as well.

So I wanted to make sure that the Gordian community

was aware of your tool and, you know, as an option

and work with you on, you know,

extending it and standardizing it.

- Yeah, one thing I didn't mention that may not be apparent

is that by using the UR types and the fountain of code

that already exists for other purposes,

which is transferring an animated descriptor

through animated QR codes in an air get way from a controller

and want it to say a signer or a hardware bullet.

We use the same standard.

So our place, that is from the second video I linked to.

So our place can actually be scanned by Sparrow

and very recently can be scanned by Nunchuk.

Anything that supports the UR standard,

in particular the binary version,

PCR is it zero 10 or something, the output,

crypto output I think the name of it is.

And not many wallets do that or some do

and I'm sure they will eventually end up doing that.

But the cool thing is that this is just abusing

sort of speaking a standard which was meant

for animated QR code, but we can actually brute force

the founding and coding to give us the part

that the XOR, the part combination that we want.

So I think that's one of the very, very interesting

and cool things about SeedHamer.

Of course, I'm from SeedHamer, so I have to say that.

But I think it's cool that you're not required

to use, you're required to use our software

to do the engraving, but you can and should use

some other software to both verify when you first set it up,

but also when you're 10 years down the line,

want to recover and don't have anything,

or your heirs, your daughters, your sons,

your family wants to recover this.

It's a standard, hopefully also in 10 years,

and there's nothing seat hammer specific

about anything being great on the case.

And I thank you for the standard because, as you said,

you may be able to do it even more in code

and output is pretty more compactly,

but I think it's already pretty compact,

the BCR 0010, the crypto output.

So it could be made a little bit smaller,

but not that much is my thing.

- Or it can be about half, I mean, well six, whatever.

But that's beside the point.

I think the point is you have a little bit more room,

there may be some other useful things that we can do

to either increase the reliability

or offer some other capabilities.

So for instance, you could have a,

I'm not sure if I'd precisely recommend this,

but just showing that it is possible.

You could have a BIP39 seed that is encoded

that requires a two of three to restore.

But if you happen to have a three of five

you know, one more than what you had before,

that you could also restore a BIP38 secret

or some other secret.

So there's some interesting, you know, options,

again, for offline keys that, you know,

might be possible with some of these scenarios.

And then obviously, you know,

we're not just working with the cryptocurrency community,

we're also working with the digital identity community

and they have some unusual needs of things that,

you know, they would like to be able to do.

And some of that is social,

more dealing with the social key recovery side of things.

And then when you say, go ahead.

- When you say you can compress an output descriptor

to about half do you mean by using the private keys

set up the public keys?

- No, we're still using the pub.

So right now descriptors are, I mean,

Wolf actually has more details on it.

- Well, I mean, descriptors as they're defined are text

and a binary version of that

that basically is wasting bits in each character

can be by virtue of that a lot smaller,

depending on, you know, so that, you know,

that might save you like 23% right there

in terms of just having a binary format for descriptors

as opposed to a texted format.

- But isn't your format already binary?

Not for descriptors?

- Let's see.

Well, actually I'm trying to remember at the moment.

It's like, it's been a while since I've looked at that code.

But yeah, I think we do have a binary version.

The other way of compressing is that

Gordy envelope itself, the standard now defines a way

of creating an encrypted version of a compressed version

of an envelope in our reference implementations

using the deflate algorithm.

So depending on how you tune that algorithm

and how the size of your input data,

you might get another 20, 30, 40% savings

depending on the size of the data you're putting into it.

Obviously the less data you put into it,

the more likely it will be that it won't be made

of redundancies that the deflate algorithm can remove.

- But for XPUPs, you can't really compress it

because they're less random, right?

- Well, yeah, I mean, random data is the hardest to compress

and, but, you know, it's, you could probably, you know,

save some space.

I haven't done experiments directly.

- That'll be critical and somewhat accidental.

In fact, if it compresses too much,

that's usually a sign of something bad in here.

- It's lossless.

So you can't actually take it away.

The thing is, worst case, you know,

your message is small enough and random enough

that the overhead of the data it needs to add to it

actually creates a larger compressed message

by some number of bytes than the original message.

- So it's not so much the keys that it compress,

it's all the other data.

When we start talking about time locks,

we start talking about all the different things

that can be expressed in a descriptor.

Almost all of those are text values.

- Absolutely.

- And I think there's a better way of doing it

if there's a will, if there's a need.

So, but I think that's the one of the main points is,

you know, we need to discover where the pain points are

for say proxy.

So proxy is one of the, you know, he was gonna,

he's the one who implemented the SSKR for Java card.

Well, they just got acquired by out the Aura ring.

If you're familiar with this,

this is a ring sensor that,

ring sensor, biometric, when you put it on, it recognizes, well, the iora doesn't, but

the next version will, will recognize your fingerprint when you put it on. And then you

basically it has a liveness thing that basically says you have not taken it off. So it's a

lot more like an Apple watch than it is the current hour ring.

And the-- but there's some particular problems

in the sense that the hour ring doesn't have a trusted display.

And it doesn't really have trusted input.

I mean, you can tap the ring against a hard surface to--

and then have the accelerometers in the ring basically

know, oh, yeah, my own my owner, you know, has the has the ring

and, you know, maybe three taps is a consent, you know, to say,

yes, go ahead and sign this. But it's not, you know, it's just

not a reliable way of doing a lot of different types of

operations. So they have a very particular problem where there

are like three parties involved. There's the transaction

coordinator, the equivalent of Sparrow, but then there is a

trusted device, which is, you know, right now an iPhone app that has a trusted relationship with

the hour ring. But you don't want that you to have to use that trusted iOS device. So we've been

working with them on how, you know, a third party could could write an app that would take over

with the permission of the user to the official, say,

our app for iPhone and be able to have it give permission

for a new app, which was designed by another party

to basically give you access to the details on the hour phone.

So there's a lot of different weird things in their wallet

that they have to do.

And yet we still need to be able to archive

you know, keys, multi-sig type of data, et cetera, that they would like, love to be able

to have the option for an offline, one of those to maybe be offline.

And you give them that potential.

So, but again, just different wallets, different scenarios.

We can, of course, it's another cool thing about the way we do it,

because of upper descriptors and so on.

You can actually do one plate at a time, one share at a time,

if you have the whole descriptor.

Should I say we are two or three people that want to do a shared multisig?

You can have either a seat hammer each,

or you can have a seat hammer that you sort of take turns with.

And as long as you somehow, and I think you have strategies or protocols

working on a multi-sick output descriptor.

Once you have your part of the multi-sick set up

and the full multi-sick descriptor,

you can use those two things to engrave just one plate,

just one share, and you'll still have,

and you don't need to have everyone

in the same room and so on.

So, yeah, yeah.

- There are some other things going on.

So obviously we wanna move ultimately

off of the limitations of Shamir and move to true threshold signatures,

whether or not it's the, you know, fairly well-reviewed frost function or MUSIG2

or some of the newer ECDH threshold signatures that don't require snore that are emerging.

All of those, I think have some interesting scenarios

where an emergency member of a quorum can be offline.

But those functions are complicated in the sense that

it's not just as simple as having this static data.

For instance, might need to know what the public key is

to communicate with one of the other quorum members,

like a signal address or a tour address

or something of that nature.

So that's yet another, when you start moving

into these multi-processor versions of these technologies,

being able to have a very strong, secure backup

for those is interesting.

There are other interesting scenarios.

So one of the things, let's say you have a two of three

of two of threes, you know, my favorite little four

of nine variant where you have different levels of control.

You can do that in a multi-sig scenario as well.

But then let's say that, you know, over time, you know,

three of those partners and different things

have become corrupted, lost.

you can no longer do a verifiable secret operation

to determine that they're out there.

And basically if you lose one more, you lose your quorum.

So you wanna be able before that happens

to create a brand new quorum.

And once again, that's another place where being able

to have an emergency share to help reform a new quorum

may require some additional data

that is along the lines of a descriptor.

It's not precisely the key material, but it's sensitive

and you need to store it as well.

Maybe store it in a sensitive fashion.

I don't know.

I liked your tool.

You also were, I don't,

we did an experiment a couple of years ago called Lethal Kit,

which was basically a very cheap ARM processor

that has no local memory.

So that as soon as you turn it off,

it loses all the keys that are in it.

And you are doing some similar types of things.

You're trying to make the,

not store things.

And some of the work that's being done

on the Silicon salon,

some of the work that we did for Lead to Kit or whatever,

or in that same vein.

I mean, I was trying to talk a couple

of the Silicon companies say,

heck with your high end Silicon processor.

I just want one that can do sec P and has no memory.

No networking, just the minimal.

But be able to do those operations in a secure fashion

without side channels and all of that.

So any questions for the Seed Hammer folks?

