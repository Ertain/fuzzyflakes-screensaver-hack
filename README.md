* Hacked screensaver with an Azumanga Daioh look to it

-----------------

First of all, thank you for looking at this screensaver.  It has been a
pet project of mine for a few months (or at least what feels like a few
months).  In this tarball you'll find the files that I have edited.  This
includes two scripts to get the song playing when the screensaver starts,
the Makefile from the "hacks" directory of the xscreensaver distribution
I used, and the "fuzzyflakes.c" file I hacked.

Before I get into the gruesome details of how to get this monster to work
I must say that I am an amateur programmer.  I have not gone through
classes on programming, and have not coded up many programs.  For those
proficient in C they'll find some of this code to be sloppy and thrown
together.  They will be correct, as I threw this together in my spare
time.  Through what feels like countless experiments I think I have
found the right way to display what I wanted.  And what I wanted was
something resembling the ending credits to Azumanga Daioh.  I think I've
done a nice job of simulating that.

Also, I would like to thank some of the people who helped me, including
Joshua Ryan from Stack Overflow who helped to point me in the right
direction.  So without further ado, here is the information on how this
can be achieved.

-----------------
* For building this screensaver

- Note: I built this screensaver on a pretty good computer (Intel i7-2600
quadcore CPU with an nVidia GeForce GT 570 GPU and 8 Gigs of RAM) and I
used Linux Mint 14 64-bit edition.

1. Get a copy of the Xscreensaver sources.  I used version 5.21.  Install
Xscreensaver if you haven't already done so. Don't forget to download and
install the necessary dependencies for the Xscreensavers.  Since my hacked
version uses Cairo it is best to download and install the sources for that,
too.

2. Either do a diff on the supplied fuzzyflakes.c file and apply the
resulting patch to the fuzzyflakes.c file in the official
Xscreensaver sources, or just back-up the official fuzzyflakes.c file
and drop in this one.

3. Look in the supplied Makefile and scroll down to line 800.  There
you'll find a line similar to this:

fuzzyflakes:	fuzzyflakes.o	$(HACK_OBJS) 
	$(CC_HACK) -g -o $@ $@.o $(HACK_OBJS) $(HACK_LIBS)

First generate the official Makefile for the Xscreensaver.  Then open
up the resulting Makefile and change those lines to this:

fuzzyflakes:	fuzzyflakes.o	$(HACK_OBJS) 
	$(CC_HACK) `pkg-config --cflags cairo` -g -o $@ $@.o	$(HACK_OBJS) $(HACK_LIBS) -lcairo

4. Open up a command line to the Xscreensaver directory, type "make", and
cross your fingers.  If I have written these directions correctly the
screensavers will build without any errors.  Otherwise I'm going to have
to answer a lot of questions.

5. Copy the resulting Fuzzyflakes file to the /usr/lib/xscreensaver/
directory (or wherever the xscreensavers are stored on your distribution).
It may be wise to also back-up the original Fuzzyflakes executable.

6. Back-up the configuration file for Fuzzyflakes in
/usr/share/xscreensaver/config (or, again, wherever the configuration files
for xscreensaver are located) and copy the provided fuzzyflakes.xml
file to the Xscreensaver config directory.

7. Go into the Xscreensaver configuration dialog and choose "Fuzzyflakes".
Then go into the "Settings..." for Fuzzyflakes and choose "Green" from the
dropdown menu.

8. Copy either of the "run_song" Perl scripts from the provided tarball to
your Autostart directory. On some distributions the first one will not work.
If that is the case, use the second provided script.  Be sure to open them
up and point the "System(Play...)" command to the directory where you have
a copy of the song.  Where you get a copy of the song, "Raspberry Heaven",
is up to you.

9. Make it so that one of the files starts up when you login to your
desktop environment.  How this is achieved is not in the scope of these
directions; that is best left up to the results of a search from your
favorite search engine.  Alternatively, you can run this script from the
command line.

If all goes according to plan, when your screensaver starts, you will be
greeted with fuzzy flakes, some clouds, and the ending theme to one of the
funniest anime ever.

-----------------
* Credits

Original Writer of Fuzzyflakes: Barry Dmytro <badcherry@mailc.net>
Guy who hacked this together:	Jason Anderson <jasona.594 (at) gmail.com>
One contributor:		Joshua Ryan <luser.droog (at) gmail.com>

All rights reserved.  Code copyright 2004-2013, released under the terms of
the GNU General Public License.
