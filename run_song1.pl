#!/usr/bin/perl -w
# Copyright Jason Anderson 2012-2013
# Permission is granted to redistribute this script under the terms of the
# GNU General Public License.  But please note there is absolutely no warrenty
# at all; not even an implied one.  So if you wish to use this script hack away
# at your own risk.

# Uncomment the line that applies to your desktop set-up.

#gnome
# my $cmd = "dbus-monitor --session \"type='signal',interface='org.gnome.ScreenSaver',member='SessionIdleChanged'\"";
my $cmd = "xscreensaver-command -watch";

#kde
# my $cmd = "dbus-monitor --session \"type='signal',interface='org.freedesktop.ScreenSaver',member='ActiveChanged'\"";
open (IN, "$cmd |") or die "Couldn't run xscreensaver-command.\n";

# Log it
# open (LOG, "/tmp/play_sound.txt");

print("xscreensaver-command for watch started.\n");

while (<IN>) {
if (m/^(BLANK|LOCK)/) {
    #when screensaver activates, run the following commands
    print("Playing song. \n");
    # Change this line to point to the copy of "Raspberry Heaven" that's on
    # your drive.
    system("play \"/home/user/Music/Raspberry Heaven.mp3\" &");
    }
elsif (m/^UNBLANK/) {
  system("killall play");
	}
}
