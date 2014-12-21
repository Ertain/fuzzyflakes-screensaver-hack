#!/usr/bin/perl
# Copyright Jason Anderson 2012-2013
# Permission is granted to redistribute this script under the terms of the
# GNU General Public License.  But please note there is absolutely no warrenty
# at all; not even an implied one.  So if you wish to use this script hack away
# at your own risk.

# Uncomment the line that applies to your desktop set-up.

#Gnome#
my $cmd = "dbus-monitor --session \"type='signal',interface='org.gnome.SessionManager.Presence',member='StatusChanged'\"" or die "Could not set variable.\n";
#KDE#
# my $cmd = "dbus-monitor --session \"type='signal',interface='org.freedesktop.ScreenSaver',member='ActiveChanged'\"";
#MATE#
# my $cmd = "dbus-monitor --session \"type='signal',interface='org.mate.SessionManager.Presence',member='StatusChanged'\"";

open (IN, "$cmd |");

while (<IN>)
{
#KDE#
# if (m/^\s+boolean true/)
#Gnome/MATE#
   if (m/^\s+uint32 3/)
   {
#  when session idles these commands will run
      print("Playing song.\n");
   # Change this line to point to where the file is located on your computer.
      system("play \"/home/user/Music/Raspberry Heaven.mp3\" &");
   }
#KDE
# elsif (m/^\s+boolean false/)
#Gnome/MATE #
   elsif (m/^\s+uint32 0/)
   {
# when session is active again these commands will run
     print("Stopping song.\n");
     system("play \"/home/user/Music/Raspberry Heaven.mp3\" &");
   }
}
