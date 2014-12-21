# hacks/Makefile.in --- xscreensaver, Copyright (c) 1997-2011 Jamie Zawinski.
# the `../configure' script generates `hacks/Makefile' from this file.


.SUFFIXES:
.SUFFIXES: .c .o

srcdir		= .

top_srcdir	= ..
top_builddir	= ..

install_prefix	=
prefix		= /usr
exec_prefix	= ${prefix}
bindir		= ${exec_prefix}/bin
datarootdir	= ${prefix}/share
datadir		= ${datarootdir}
mandir		= ${datarootdir}/man
libexecdir	= ${exec_prefix}/libexec
mansuffix	= 6
manNdir		= $(mandir)/man$(mansuffix)

HACKDIR		= ${libexecdir}/xscreensaver
HACK_CONF_DIR	= ${datadir}/xscreensaver/config

CC		= gcc -pedantic -Wall -Wstrict-prototypes -Wnested-externs -Wmissing-prototypes -Wno-overlength-strings -Wdeclaration-after-statement -std=c89 -U__STRICT_ANSI__
CFLAGS		= -g -O2
LDFLAGS		=  -L${exec_prefix}/lib
DEFS		= -DSTANDALONE -DHAVE_CONFIG_H
LIBS		= 
PERL		= /usr/bin/perl

DEPEND		= makedepend
DEPEND_FLAGS	= 
DEPEND_DEFINES	= 

SHELL		= /bin/sh
INSTALL		= /usr/bin/install -c
INSTALL_PROGRAM = ${INSTALL}
INSTALL_SCRIPT  = ${INSTALL}
INSTALL_DATA	= ${INSTALL} -m 644
INSTALL_DIRS	= ${INSTALL} -d

X_CFLAGS	= 
X_LIBS		= 
X_PRE_LIBS	=  -lSM -lICE
X_EXTRA_LIBS	= 
XMU_LIBS	= -lXmu

# A little extra
CAIRO_CFLAGS 	= -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng12
CAIRO_LIBS	= -lcairo

# Note: see comment in ../driver/Makefile.in for explanation of X_LIBS, etc.
#
HACK_PRE	= $(LIBS) $(X_LIBS)
HACK_POST     = $(X_PRE_LIBS) -lXt -lX11 $(XMU_LIBS) -lXext $(X_EXTRA_LIBS) -lm
HACK_LIBS	= $(HACK_PRE)             $(HACK_POST)
XPM_LIBS	= $(HACK_PRE) -lXpm -pthread -lgdk_pixbuf_xlib-2.0 -lgmodule-2.0 -lrt -lgdk_pixbuf-2.0 -lgobject-2.0 -lglib-2.0    $(HACK_POST)
JPEG_LIBS	= 
XLOCK_LIBS	= $(HACK_LIBS)
TEXT_LIBS	= -lutil
MINIXPM		= $(UTILS_BIN)/minixpm.o

UTILS_SRC	= $(srcdir)/../utils
UTILS_BIN	= ../utils

INCLUDES_1	= -I. -I$(srcdir) -I/usr/include/X11/ -I$(UTILS_SRC) -I..
INCLUDES	= $(INCLUDES_1)  -pthread -I/usr/include/gtk-2.0 -I/usr/lib/x86_64-linux-gnu/gtk-2.0/include -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/pango-1.0 -I/usr/include/gio-unix-2.0/ -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng12 -I/usr/include/libxml2 -I/usr/include/libglade-2.0   -pthread -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libpng12 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include  

UTIL_SRCS	= $(UTILS_SRC)/alpha.c $(UTILS_SRC)/colors.c \
		  $(UTILS_SRC)/grabclient.c \
		  $(UTILS_SRC)/hsv.c $(UTILS_SRC)/resources.c \
		  $(UTILS_SRC)/spline.c $(UTILS_SRC)/usleep.c \
		  $(UTILS_SRC)/visual.c $(UTILS_SRC)/logo.c \
		  $(UTILS_SRC)/minixpm.c \
		  $(UTILS_SRC)/yarandom.c $(UTILS_SRC)/erase.c \
		  $(UTILS_SRC)/xshm.c $(UTILS_SRC)/xdbe.c \
		  $(UTILS_SRC)/textclient.c
UTIL_OBJS	= $(UTILS_BIN)/alpha.o $(UTILS_BIN)/colors.o \
		  $(UTILS_BIN)/grabclient.o \
		  $(UTILS_BIN)/hsv.o $(UTILS_BIN)/resources.o \
		  $(UTILS_BIN)/spline.o $(UTILS_BIN)/usleep.o \
		  $(UTILS_BIN)/visual.o $(UTILS_BIN)/logo.o \
		  $(UTILS_SRC)/minixpm.c \
		  $(UTILS_BIN)/yarandom.o $(UTILS_BIN)/erase.o \
		  $(UTILS_BIN)/xshm.o $(UTILS_BIN)/xdbe.o \
		  $(UTILS_BIN)/colorbars.o \
		  $(UTILS_SRC)/textclient.o

SRCS		= attraction.c blitspin.c bouboule.c braid.c bubbles.c \
		  bubbles-default.c decayscreen.c deco.c drift.c flag.c \
		  flame.c forest.c vines.c galaxy.c grav.c greynetic.c \
		  halo.c helix.c hopalong.c hypercube.c ifs.c imsmap.c \
		  julia.c kaleidescope.c laser.c lightning.c lisa.c lmorph.c \
		  maze.c moire.c noseguy.c pedal.c penrose.c pyro.c qix.c \
		  rocks.c rorschach.c screenhack.c sierpinski.c slidescreen.c \
		  slip.c sphere.c spiral.c strange.c swirl.c xlockmore.c \
		  fps.c goop.c starfish.c munch.c fadeplot.c \
		  rd-bomb.c coral.c mountain.c triangle.c lissie.c worm.c \
		  rotor.c ant.c xjack.c xlyap.c xscreensaver-sgigl.c \
		  cynosure.c moire2.c flow.c epicycle.c interference.c \
		  truchet.c bsod.c crystal.c discrete.c distort.c kumppa.c \
		  demon.c loop.c t3d.c penetrate.c deluxe.c compass.c \
		  squiral.c xflame.c wander.c spotlight.c critical.c \
		  phosphor.c xmatrix.c petri.c shadebobs.c xsublim.c ccurve.c \
		  blaster.c bumps.c ripples.c xspirograph.c \
		  nerverot.c xrayswarm.c hyperball.c zoom.c whirlwindwarp.c \
		  rotzoomer.c whirlygig.c speedmine.c vermiculate.c \
		  xpm-pixmap.c webcollage-helper.c twang.c apollonian.c \
		  euler2d.c juggle.c polyominoes.c thornbird.c fluidballs.c \
		  anemone.c halftone.c metaballs.c eruption.c popsquares.c \
		  barcode.c piecewise.c cloudlife.c fontglide.c apple2.c \
		  apple2-main.c analogtv.c xanalogtv.c pong.c wormhole.c \
		  pacman.c pacman_ai.c pacman_level.c \
		  fuzzyflakes.c anemotaxis.c memscroller.c substrate.c \
		  intermomentary.c fireworkx.c fiberlamp.c \
		  boxfit.c interaggregate.c celtic.c cwaves.c m6502.c \
		  asm6502.c abstractile.c lcdscrub.c \
		  webcollage-cocoa.m webcollage-helper-cocoa.m
SCRIPTS		= vidwhacker webcollage ljlatest

# Programs that are mentioned in XScreenSaver.ad, and that have XML files,
# but that are not shipped with xscreensaver itself.
#
EXTERNALS	= cosmos electricsheep fireflies goban \
		  sphereeversion ssystem xaos xdaliclock xearth xfishtank \
		  xmountains xplanet xsnow

OBJS		= attraction.o blitspin.o bouboule.o braid.o bubbles.o \
		  bubbles-default.o decayscreen.o deco.o drift.o flag.o \
		  flame.o forest.o vines.o galaxy.o grav.o greynetic.o \
		  halo.o helix.o hopalong.o hypercube.o ifs.o imsmap.o \
		  julia.o kaleidescope.o laser.o lightning.o lisa.o lmorph.o \
		  maze.o moire.o noseguy.o pedal.o penrose.o pyro.o qix.o \
		  rocks.o rorschach.o screenhack.o sierpinski.o slidescreen.o \
		  slip.o sphere.o spiral.o strange.o swirl.o xlockmore.o \
		  fps.o goop.o starfish.o munch.o fadeplot.o \
		  rd-bomb.o coral.o mountain.o triangle.o lissie.o worm.o \
		  rotor.o ant.o xjack.o xlyap.o xscreensaver-sgigl.o \
		  cynosure.o moire2.o flow.o epicycle.o interference.o \
		  truchet.o bsod.o crystal.o discrete.o distort.o kumppa.o \
		  demon.o loop.o t3d.o penetrate.o deluxe.o compass.o \
		  squiral.o xflame.o wander.o spotlight.o critical.o \
		  phosphor.o xmatrix.o petri.o shadebobs.o xsublim.o ccurve.o \
		  blaster.o bumps.o ripples.o xspirograph.o \
		  nerverot.o xrayswarm.o hyperball.o zoom.o whirlwindwarp.o \
		  rotzoomer.o whirlygig.o speedmine.o vermiculate.o \
		  xpm-pixmap.o webcollage-helper.o twang.o apollonian.o \
		  euler2d.o juggle.o polyominoes.o thornbird.o fluidballs.o \
		  anemone.o halftone.o metaballs.o eruption.o popsquares.o \
		  barcode.o piecewise.o cloudlife.o fontglide.o apple2.o \
		  apple2-main.o analogtv.o xanalogtv.o pong.o wormhole.o \
		  pacman.o pacman_ai.o pacman_level.o \
		  fuzzyflakes.o anemotaxis.o memscroller.o substrate.o \
		  intermomentary.o fireworkx.o fiberlamp.o boxfit.o \
		  interaggregate.o celtic.o cwaves.o webcollage-cocoa.o \
		  webcollage-helper-cocoa.o m6502.o asm6502.o abstractile.o \
		  lcdscrub.o

EXES		= attraction blitspin bouboule braid decayscreen deco \
		  drift flame galaxy grav greynetic halo \
		  helix hopalong ifs imsmap julia kaleidescope \
		  maze moire noseguy pedal \
		  penrose pyro qix rocks rorschach sierpinski slidescreen \
		  slip strange swirl goop starfish munch \
		  fadeplot rd-bomb coral mountain triangle \
		  xjack xlyap cynosure moire2 flow epicycle \
		  interference truchet bsod crystal discrete distort kumppa \
		  demon loop penetrate deluxe compass squiral xflame \
		  wander spotlight phosphor xmatrix petri shadebobs \
		  ccurve blaster bumps ripples xspirograph \
		  nerverot xrayswarm zoom whirlwindwarp rotzoomer \
		  speedmine vermiculate twang apollonian euler2d \
		  polyominoes thornbird  fluidballs anemone halftone \
		  metaballs eruption popsquares barcode piecewise cloudlife \
		  fontglide apple2 xanalogtv pong  wormhole \
		  pacman fuzzyflakes anemotaxis memscroller substrate \
		  intermomentary fireworkx fiberlamp boxfit interaggregate \
		  celtic cwaves m6502 abstractile lcdscrub \
		  
JPEG_EXES	= webcollage-helper

RETIRED_EXES	= ant bubbles critical flag forest hyperball hypercube laser \
		  lightning lisa lissie lmorph rotor sphere spiral t3d vines \
		  whirlygig worm xsublim juggle

HACK_OBJS_1	= fps.o $(UTILS_BIN)/resources.o $(UTILS_BIN)/visual.o \
		  $(UTILS_BIN)/usleep.o $(UTILS_BIN)/yarandom.o 
HACK_OBJS	= screenhack.o $(HACK_OBJS_1)
XLOCK_OBJS	= screenhack.o xlockmore.o $(COLOR_OBJS) $(HACK_OBJS_1)
COLOR_OBJS	= $(UTILS_BIN)/hsv.o $(UTILS_BIN)/colors.o
GRAB_OBJS	= $(UTILS_BIN)/grabclient.o
XSHM_OBJS	= $(UTILS_BIN)/xshm.o
XDBE_OBJS	= $(UTILS_BIN)/xdbe.o

HDRS		= screenhack.h screenhackI.h fps.h fpsI.h xlockmore.h \
		  xlockmoreI.h automata.h bubbles.h xpm-pixmap.h \
		  apple2.h analogtv.h pacman.h pacman_ai.h pacman_level.h \
		  asm6502.h
MEN		= anemone.man apollonian.man attraction.man \
	          blaster.man blitspin.man bouboule.man braid.man bsod.man \
	          bumps.man ccurve.man compass.man coral.man \
	          crystal.man cynosure.man decayscreen.man \
	          deco.man deluxe.man demon.man discrete.man distort.man \
	          drift.man epicycle.man euler2d.man fadeplot.man \
	          flame.man flow.man fluidballs.man galaxy.man \
	          goop.man grav.man greynetic.man halo.man helix.man \
	          hopalong.man ifs.man imsmap.man \
	          interference.man julia.man \
	          kaleidescope.man kumppa.man \
	          loop.man maze.man moire.man \
	          moire2.man mountain.man munch.man nerverot.man noseguy.man \
	          pedal.man penetrate.man penrose.man petri.man phosphor.man \
	          polyominoes.man pyro.man qix.man rd-bomb.man ripples.man \
	          rocks.man rorschach.man rotzoomer.man \
	          shadebobs.man sierpinski.man slidescreen.man slip.man \
	          speedmine.man \
	          spotlight.man squiral.man starfish.man strange.man \
	          swirl.man thornbird.man triangle.man truchet.man \
	          twang.man vermiculate.man vidwhacker.man \
	          wander.man webcollage.man whirlwindwarp.man \
	          xflame.man xjack.man xlyap.man xmatrix.man \
	          xrayswarm.man xspirograph.man \
	          zoom.man halftone.man eruption.man metaballs.man \
		  barcode.man piecewise.man cloudlife.man ljlatest.man \
		  fontglide.man apple2.man xanalogtv.man pong.man \
		  wormhole.man pacman.man fuzzyflakes.man \
		  anemotaxis.man memscroller.man substrate.man \
		  intermomentary.man fireworkx.man fiberlamp.man boxfit.man \
		  interaggregate.man celtic.man cwaves.man abstractile.man \
		  lcdscrub.man

RETIRED_MEN	= ant.man bubbles.man critical.man flag.man forest.man \
		  laser.man lightning.man lisa.man lissie.man lmorph.man \
		  rotor.man sphere.man spiral.man t3d.man vines.man \
		  whirlygig.man worm.man xsublim.man juggle.man \
		  hypercube.man hyperball.man

STAR		= *
EXTRAS		= README Makefile.in xml2man.pl m6502.sh .gdbinit \
		  euler2d.tex check-configs.pl munge-ad.pl \
		  config/README \
		  config/$(STAR).xml \
		  config/$(STAR).dtd \
		  config/$(STAR).xsd \
		  images/$(STAR).xbm \
		  images/$(STAR).xpm \
		  images/bubbles/$(STAR).pov \
		  images/bubbles/$(STAR).xpm \
		  images/noseguy/$(STAR).xbm \
		  images/noseguy/$(STAR).xpm \
		  images/m6502/$(STAR).asm \
		  images/molecules/$(STAR).pdb \
		  images/pacman/$(STAR).xpm

VMSFILES	= compile_axp.com compile_decc.com link_axp.com link_decc.com \
		  vms_axp.opt vms_axp_12.opt vms_decc.opt vms_decc_12.opt

TARFILES	= $(SRCS) $(HDRS) $(SCRIPTS) $(MEN) $(RETIRED_MEN) \
		  $(EXTRAS) $(VMSFILES)


default: all
all: $(EXES) $(RETIRED_EXES)

install:   install-program   install-scripts install-xml install-man
uninstall: uninstall-program uninstall-xml uninstall-man

install-strip:
	$(MAKE) INSTALL_PROGRAM='$(INSTALL_PROGRAM) -s' \
		install

# the hacks, in $HACKDIR
install-program:: $(EXES)
	@if [ ! -d $(install_prefix)$(HACKDIR) ]; then			\
	  $(INSTALL_DIRS) $(install_prefix)$(HACKDIR) ;			\
	 fi ;								\
	for program in $(EXES); do					\
	  echo $(INSTALL_PROGRAM) $$program				\
	    $(install_prefix)$(HACKDIR)/$$program ;			\
	  $(INSTALL_PROGRAM) $$program					\
	    $(install_prefix)$(HACKDIR)/$$program ;			\
	done

install-scripts: $(SCRIPTS) munge-scripts
	@for program in $(SCRIPTS); do					\
	  if [ -r $$program ] ; then					\
	    p=$$program ;						\
	  else								\
	    p=$(srcdir)/$$program ;					\
	  fi ;								\
	  echo $(INSTALL_SCRIPT) $$p					\
	    $(install_prefix)$(HACKDIR)/$$program ;			\
	  $(INSTALL_SCRIPT) $$p						\
	    $(install_prefix)$(HACKDIR)/$$program ;			\
	done

munge-scripts: $(SCRIPTS)
	@tmp=/tmp/mf.$$$$ ;						\
	perl="${PERL}" ;						\
	rm -f $$tmp ;							\
	for program in $(SCRIPTS); do					\
	  sed "s@^\(#!\)\(/[^ ]*/perl[^ ]*\)\(.*\)\$$@\1$$perl\3@"	\
	      < $(srcdir)/$$program > $$tmp ;				\
	  if ! cmp -s $(srcdir)/$$program $$tmp ; then			\
	    echo "$$program: setting interpreter to $$perl" >&2 ;	\
	    cat $$tmp > ./$$program ;					\
	  fi ;								\
	done ;								\
	rm -f $$tmp

# When installing man pages, we install "foo.man" as "foo.N" and update
# the .TH line in the installed file with one like
#
#     .TH XScreenSaver N "V.VV (DD-MMM-YYYY)" "X Version 11"
#
# where N is the manual section suffix.
#
install-man: $(MEN)
	@men="$(MEN)" ;							\
	U=$(UTILS_SRC)/version.h ;					\
	V=`sed -n 's/.*xscreensaver \([0-9]\.[^)]*)\).*/\1/p' < $$U` ;	\
	T=/tmp/xs$$$$.$(mansuffix) ;					\
	TH=".TH XScreenSaver $(mansuffix) \"$$V\" \"X Version 11\"" ;	\
	echo "installing man pages: $$TH" ;				\
									\
	if [ ! -d $(install_prefix)$(manNdir) ]; then			\
	  $(INSTALL_DIRS) $(install_prefix)$(manNdir) ;			\
	 fi ;								\
									\
	for man in $$men; do						\
	  instname=`echo $$man | sed 's/\.man$$/\.$(mansuffix)/'` ;	\
	  manbase=`echo $$man | sed 's/\.man$$//'` ;    \
	  TH=".TH $$manbase $(mansuffix) \"$$V\" \"X Version 11\" \"XScreenSaver manual\"" ;    \
	  sed -e "s/^\.TH.*/$$TH/"					\
	      -e 's@(MANSUFFIX)@($(mansuffix))@g'			\
	    < $(srcdir)/$$man > $$T ;					\
	  echo $(INSTALL_DATA) $(srcdir)/$$man				\
	   $(install_prefix)$(manNdir)/$$instname ;			\
	  $(INSTALL_DATA) $$T						\
	    $(install_prefix)$(manNdir)/$$instname ;			\
	done ;								\
	rm -f $$T

install-xml:
	@dest=$(install_prefix)$(HACK_CONF_DIR) ;			\
	 if [ ! -d $$dest ]; then					\
	   $(INSTALL_DIRS) $$dest ;					\
	 fi ;								\
	 src=$(srcdir)/config ;						\
	 for file in $(EXES) $(SCRIPTS) $(EXTERNALS) ; do		\
	   if [ -f $$src/$$file.xml ]; then				\
	     echo $(INSTALL_DATA) $$src/$$file.xml $$dest/$$file.xml ;	\
	          $(INSTALL_DATA) $$src/$$file.xml $$dest/$$file.xml ;	\
	   fi ;								\
	done

uninstall-program:
	@for program in $(EXES) $(RETIRED_EXES) $(SCRIPTS); do		\
	  echo rm -f $(install_prefix)$(HACKDIR)/$$program ;		\
	  rm -f $(install_prefix)$(HACKDIR)/$$program ;			\
	done

uninstall-man:
	@men="$(MEN) $(RETIRED_MEN)" ;					\
	for man in $$men; do						\
	  instname=`echo $$man | sed 's/\.man$$/\.$(mansuffix)/'` ;	\
	  echo rm -f $(install_prefix)$(manNdir)/$$instname* ;		\
	  rm -f $(install_prefix)$(manNdir)/$$instname* ;		\
	done

uninstall-xml:
	@dest=$(install_prefix)$(HACK_CONF_DIR) ;			\
	 for file in $(EXES) $(RETIRED_EXES) $(SCRIPTS) $(EXTERNALS) ; do \
	     echo rm -f $$dest/$$file.xml ;				\
	          rm -f $$dest/$$file.xml ;				\
	done

clean:
	-rm -f *.o a.out core $(EXES) $(RETIRED_EXES) m6502.h

distclean: clean
	-rm -f Makefile TAGS *~ "#"*

# Adds all current dependencies to Makefile
depend:
	$(DEPEND) -s '# DO NOT DELETE: updated by make depend'		    \
	$(DEPEND_FLAGS) --						    \
	$(INCLUDES) $(DEFS) $(DEPEND_DEFINES) $(CFLAGS) $(X_CFLAGS) --	    \
	$(SRCS)

# Adds some dependencies to Makefile.in -- not totally accurate, but pretty
# close.  This excludes dependencies on files in /usr/include, etc.  It tries
# to include only dependencies on files which are themselves a part of this
# package.
distdepend:: m6502.h
	@echo updating dependencies in `pwd`/Makefile.in... ;		    \
	$(DEPEND) -w 0 -f - 						    \
	-s '# DO NOT DELETE: updated by make distdepend' $(DEPEND_FLAGS) -- \
	$(INCLUDES_1) $(DEFS) $(DEPEND_DEFINES) $(CFLAGS) $(X_CFLAGS) --    \
	$(SRCS) 2>/dev/null |						    \
	sort -d |							    \
	(								    \
	  awk '/^# .*Makefile.in ---/,/^# DO .*distdepend/' < Makefile.in ; \
	  sed -e '/^#.*/d'						    \
	      -e 's@ \./@ @g;s@ /[^ ]*@@g;/^.*:$$/d'			    \
	      -e 's@\.\./utils@$$(UTILS_SRC)@g'				    \
	      -e 's@ \([^$$]\)@ $$(srcdir)/\1@g'			    \
	      -e 's@ $$(srcdir)/\(.*config.h\)@ \1@g'			    \
	      -e 's@ $$(srcdir)/\(m6502.h\)@ \1@g' ;			    \
	  echo ''							    \
	) > /tmp/distdepend.$$$$ &&					    \
	mv Makefile.in Makefile.in.bak &&				    \
	mv /tmp/distdepend.$$$$ Makefile.in

TAGS: tags
tags:
	find $(srcdir) -name '*.[chly]' -print | xargs etags -a

echo_tarfiles:
	@echo $(TARFILES)

check_men:
	@badmen="" ;							\
	 for exe in $(EXES) $(SCRIPTS); do				\
	   if ! [ -f $(srcdir)/$$exe.man				\
		  -o "$$exe" = webcollage-helper ]; then		\
	     badmen="$$badmen $$exe" ;					\
	   fi ;								\
	 done ;								\
	 if [ -n "$$badmen" ]; then					\
	   echo "" ;							\
	   echo "Warning: The following programs have no manuals:" ;	\
	   echo "" ;							\
	   for m in $$badmen ; do					\
	     echo "    $$m" ;						\
	   done ;							\
	 fi

validate_xml:
	@echo "Validating XML..." ; \
	cd $(srcdir) ; ./check-configs.pl $(EXES)

munge_ad_file:
	@echo "Updating hack list in XScreenSaver.ad.in..." ; \
	cd $(srcdir) ; ./munge-ad.pl ../driver/XScreenSaver.ad.in


# Rules for generating the VMS makefiles on Unix, so that it doesn't have to
# be done by hand...
#
VMS_AXP_COMPILE_1=$$ CC/DECC/PREFIX=ALL/DEFINE=(VMS,HAVE_CONFIG_H,STANDALONE
VMS_AXP_COMPILE_2=)/INCL=([],[-],[-.UTILS])

compile_axp.com: Makefile.in
	@echo generating $@ from $<...  ;				    \
	( for c in $(SRCS) ; do						    \
	   c=`echo $$c | tr a-z A-Z` ;					    \
	   echo "$(VMS_AXP_COMPILE_1)$(VMS_AXP_COMPILE_2) $$c" ;	    \
         done ;								    \
	) | sort -d > $@

compile_decc.com: compile_axp.com
	@echo generating $@ from $<...  ;				    \
	sed 's/axp/decc/g' < $< > $@

#### TODO: generating link_axp.com is kinda tricky...

link_decc.com: link_axp.com
	@echo generating $@ from $<...  ;				    \
	sed 's/axp/decc/g' < $< > $@

$(srcdir)/../setup.com: Makefile.in
	@echo generating $@ from $<...  ;				    \
	( echo '$$! Xscreensaver - definition of various DCL symbols' ;     \
	  echo '$$ set NOON' ;						    \
	  echo '$$ set def [.HACKS]' ;					    \
	  echo '$$ mydisk = f$$trnlmn("SYS$$DISK")' ;			    \
	  echo '$$ mydir  = mydisk+f$$directory()' ;			    \
	  ( for c in $(EXES) ; do					    \
	     c2="$${c}		" ;					    \
	     c2=`echo "$${c2}" | sed 's/^\(........*\)	$$/\1/'` ;	    \
	     echo '$$' "$${c2}:== $$'mydir'$${c}" ;			    \
             done ;							    \
	  ) | sort -d ;							    \
          echo '$$ set def [-.DRIVER]' ;				    \
          echo '$$ mydir  = mydisk+f$$directory()' ;			    \
          echo "$$ xscreensaver :== $$'mydir'xscreensaver" ;		    \
	  echo "$$ xscreen*command :== $$'mydir'xscreensaver-command" ;     \
	  echo '$$ set def [-]' ;					    \
	  echo '$$ exit' ; 						    \
          ) > $@

distdepend:: compile_axp.com compile_decc.com
distdepend:: link_axp.com link_decc.com
distdepend:: $(srcdir)/../setup.com
distdepend:: check_men validate_xml munge_ad_file


# Rules for noticing when the objects from the utils directory are out of
# date with respect to their sources, and going and building them according
# to the rules in their own Makefile...
#
$(UTILS_BIN)/alpha.o:		$(UTILS_SRC)/alpha.c
$(UTILS_BIN)/colors.o:		$(UTILS_SRC)/colors.c
$(UTILS_BIN)/grabclient.o:	$(UTILS_SRC)/grabclient.c
$(UTILS_BIN)/hsv.o:		$(UTILS_SRC)/hsv.c
$(UTILS_BIN)/resources.o:	$(UTILS_SRC)/resources.c
$(UTILS_BIN)/spline.o:		$(UTILS_SRC)/spline.c
$(UTILS_BIN)/usleep.o:		$(UTILS_SRC)/usleep.c
$(UTILS_BIN)/visual.o:		$(UTILS_SRC)/visual.c
$(UTILS_BIN)/xmu.o:		$(UTILS_SRC)/xmu.c
$(UTILS_BIN)/logo.o:		$(UTILS_SRC)/logo.c
$(UTILS_BIN)/minixpm.o:		$(UTILS_SRC)/minixpm.c
$(UTILS_BIN)/yarandom.o:	$(UTILS_SRC)/yarandom.c
$(UTILS_BIN)/erase.o:		$(UTILS_SRC)/erase.c
$(UTILS_BIN)/xshm.o:		$(UTILS_SRC)/xshm.c
$(UTILS_BIN)/xdbe.o:		$(UTILS_SRC)/xdbe.c
$(UTILS_BIN)/textclient.o:	$(UTILS_SRC)/textclient.c

$(UTIL_OBJS):
	$(MAKE) -C $(UTILS_BIN) $(@F) CC="$(CC)" CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)"

# How we build object files in this directory.
.c.o:
	$(CC) -c $(INCLUDES) $(DEFS) $(CFLAGS) $(X_CFLAGS) $<


# Make sure these are regenerated when the version number ticks.
screenhack.o: $(UTILS_SRC)/version.h

# Some abbreviations to keep the lines short...
XPM		= xpm-pixmap.o
ALP		= $(UTILS_BIN)/alpha.o
HSV		= $(UTILS_BIN)/hsv.o
SPL		= $(UTILS_BIN)/spline.o
LOGO		= $(UTILS_BIN)/logo.o $(UTILS_BIN)/minixpm.o
GRAB		= $(GRAB_OBJS)
ERASE		= $(UTILS_BIN)/erase.o
COL		= $(COLOR_OBJS)
SHM		= $(XSHM_OBJS)
DBE		= $(XDBE_OBJS)
BARS		= $(UTILS_BIN)/colorbars.o $(LOGO)
ATV             = analogtv.o $(SHM)
APPLE2          = apple2.o $(ATV)
TEXT            = $(UTILS_BIN)/textclient.o

CC_HACK		= $(CC) $(LDFLAGS)

xscreensaver-sgigl: xscreensaver-sgigl.c
	$(CC) $(LDFLAGS) -o $@ $< -I$(UTILS_SRC) $(HACK_PRE) \
		$(XMU_LIBS) -lX11 -lXext $(X_EXTRA_LIBS) -lm


# The rules for those hacks which follow the `screenhack.c' API.
# If make wasn't such an utter abomination, these could all be combined
# into one rule, but we don't live in such a perfect world.  The $< rule
# is pretty much useless in the face of more than one dependency, as far
# as I can tell.
#
attraction:	attraction.o	$(HACK_OBJS) $(COL) $(SPL)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(SPL) $(HACK_LIBS)

blitspin:	blitspin.o	$(HACK_OBJS) $(GRAB) $(XPM)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(GRAB) $(XPM) $(XPM_LIBS)

bubbles:	bubbles.o	$(HACK_OBJS) bubbles-default.o $(XPM)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) bubbles-default.o $(XPM) $(XPM_LIBS)

decayscreen:	decayscreen.o	$(HACK_OBJS) $(GRAB)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(GRAB) $(HACK_LIBS)

deco:		deco.o		$(HACK_OBJS) $(COL)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(HACK_LIBS)

flame:		flame.o		$(HACK_OBJS) $(COL)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(HACK_LIBS)

greynetic:	greynetic.o	$(HACK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(HACK_LIBS)

halo:		halo.o		$(HACK_OBJS) $(COL)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(HACK_LIBS)

helix:		helix.o		$(HACK_OBJS) $(HSV) $(ERASE)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(HSV) $(ERASE) $(HACK_LIBS)

hypercube:	hypercube.o	$(HACK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(HACK_LIBS)

imsmap:		imsmap.o	$(HACK_OBJS) $(COL)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(HACK_LIBS)

kaleidescope:	kaleidescope.o	$(HACK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(HACK_LIBS)

lmorph:		lmorph.o	$(HACK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(HACK_LIBS)

maze:		maze.o		$(HACK_OBJS) $(ERASE) $(LOGO)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(ERASE) $(LOGO) $(HACK_LIBS)

moire:		moire.o		$(HACK_OBJS) $(COL) $(SHM)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(SHM) $(HACK_LIBS)

moire2:		moire2.o	$(HACK_OBJS) $(COL) $(DBE)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(DBE) $(HACK_LIBS)

noseguy:	noseguy.o	$(HACK_OBJS) $(XPM) $(TEXT)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(XPM) $(TEXT) $(XPM_LIBS) $(TEXT_LIBS)

pedal:		pedal.o		$(HACK_OBJS) $(HSV) $(ERASE)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(HSV) $(ERASE) $(HACK_LIBS)

pyro:		pyro.o		$(HACK_OBJS) $(HSV)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(HSV) $(HACK_LIBS)

qix:		qix.o		$(HACK_OBJS) $(HSV) $(ALP)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(HSV) $(ALP) $(HACK_LIBS)

rocks:		rocks.o		$(HACK_OBJS) $(COL)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(HACK_LIBS)

rorschach:	rorschach.o	$(HACK_OBJS) $(HSV) $(ERASE)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(HSV) $(ERASE) $(HACK_LIBS)

slidescreen:	slidescreen.o	$(HACK_OBJS) $(GRAB)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(GRAB) $(HACK_LIBS)

goop:		goop.o		$(HACK_OBJS) $(HSV) $(ALP) $(SPL)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(HSV) $(ALP) $(SPL) $(HACK_LIBS)

starfish:	starfish.o	$(HACK_OBJS) $(COL) $(SPL)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(SPL) $(HACK_LIBS)

munch:		munch.o		$(HACK_OBJS) $(COL) $(SPL)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(SPL) $(HACK_LIBS)

rd-bomb:	rd-bomb.o	$(HACK_OBJS) $(COL) $(SHM)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(SHM) $(HACK_LIBS)

coral:	 	coral.o		$(HACK_OBJS) $(COL) $(ERASE)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(ERASE) $(HACK_LIBS)

xjack:	 	xjack.o		$(HACK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(HACK_LIBS)

xlyap:	 	xlyap.o		$(HACK_OBJS) $(COL)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(HACK_LIBS)

cynosure:  	cynosure.o	$(HACK_OBJS) $(COL)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(HACK_LIBS)

epicycle:  	epicycle.o	$(HACK_OBJS) $(COL) $(ERASE)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(ERASE) $(HACK_LIBS)

interference:  interference.o	$(HACK_OBJS) $(COL) $(SHM) $(DBE)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(SHM) $(DBE) $(HACK_LIBS)

truchet:	 truchet.o	$(HACK_OBJS) $(COL)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(HACK_LIBS)

bsod:	 	bsod.o		$(HACK_OBJS) $(GRAB) $(APPLE2) $(XPM)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(GRAB) $(APPLE2) $(XPM) $(XPM_LIBS)

apple2:	 	apple2.o apple2-main.o	$(HACK_OBJS) $(ATV) $(GRAB) $(TEXT)
	$(CC_HACK) -o $@ $@.o	apple2-main.o $(HACK_OBJS) $(ATV) $(GRAB) $(TEXT) $(XPM_LIBS) $(TEXT_LIBS)

xanalogtv: 	xanalogtv.o	$(HACK_OBJS) $(ATV) $(GRAB) $(XPM)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(ATV) $(GRAB) $(XPM) $(XPM_LIBS) $(HACK_LIBS)

distort:	distort.o	$(HACK_OBJS) $(GRAB) $(SHM)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(GRAB) $(SHM) $(HACK_LIBS)

kumppa:		kumppa.o	$(HACK_OBJS) $(DBE)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(DBE) $(HACK_LIBS)

t3d:		t3d.o		$(HACK_OBJS) $(COL)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(HACK_LIBS)

penetrate:	penetrate.o	$(HACK_OBJS) $(COL)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(HACK_LIBS)

deluxe:		deluxe.o	$(HACK_OBJS) $(ALP) $(COL) $(DBE)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(ALP) $(COL) $(DBE) $(HACK_LIBS)

compass:	compass.o	$(HACK_OBJS) $(DBE)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(DBE) $(HACK_LIBS)

squiral:	squiral.o	$(HACK_OBJS) $(COL)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(HACK_LIBS)

xflame:		xflame.o	$(HACK_OBJS) $(SHM) $(XPM)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(SHM) $(XPM) $(XPM_LIBS)

wander:		wander.o	$(HACK_OBJS) $(COL) $(ERASE)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(ERASE) $(HACK_LIBS)

spotlight:	spotlight.o	$(HACK_OBJS) $(GRAB)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(GRAB) $(HACK_LIBS)

critical:	critical.o	$(HACK_OBJS) $(COL) $(ERASE)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(ERASE) $(HACK_LIBS)

phosphor:	phosphor.o	$(HACK_OBJS) $(TEXT) $(COL)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(TEXT) $(COL) $(HACK_LIBS) $(TEXT_LIBS)

xmatrix:	xmatrix.o	$(HACK_OBJS) $(TEXT) $(XPM)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(TEXT) $(XPM) $(XPM_LIBS) $(TEXT_LIBS)

petri:		petri.o		$(HACK_OBJS) $(COL) $(SPL)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(SPL) $(HACK_LIBS)

shadebobs:	shadebobs.o	$(HACK_OBJS) $(COL) $(SPL)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(SPL) $(HACK_LIBS)

ccurve:		ccurve.o	$(HACK_OBJS) $(COL) $(SPL)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(ERASE) $(HACK_LIBS)

blaster:	blaster.o	$(HACK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(HACK_LIBS)

bumps:		bumps.o		$(HACK_OBJS) $(GRAB) $(SHM)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(GRAB) $(SHM) $(HACK_LIBS)

ripples:	ripples.o	$(HACK_OBJS) $(SHM) $(COL) $(GRAB)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(SHM) $(COL) $(GRAB) $(HACK_LIBS)

xspirograph:	xspirograph.o	$(HACK_OBJS) $(COL) $(ERASE)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(ERASE) $(HACK_LIBS)

nerverot:	nerverot.o	$(HACK_OBJS) $(COL)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(HACK_LIBS)

xrayswarm:	xrayswarm.o	$(HACK_OBJS) 
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(HACK_LIBS)

hyperball:	hyperball.o	$(HACK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(HACK_LIBS)

zoom:	zoom.o			$(HACK_OBJS) $(GRAB)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(GRAB) $(HACK_LIBS)

whirlwindwarp:	whirlwindwarp.o	$(HACK_OBJS) $(COL)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(HACK_LIBS)

rotzoomer:	rotzoomer.o	$(HACK_OBJS) $(GRAB) $(SHM)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(GRAB) $(SHM) $(HACK_LIBS)

whirlygig:	whirlygig.o	$(HACK_OBJS) $(DBE) $(COL)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(DBE) $(COL) $(HACK_LIBS)

speedmine:	speedmine.o	$(HACK_OBJS) $(COL)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(HACK_LIBS)

vermiculate:	vermiculate.o	$(HACK_OBJS) $(COL)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(HACK_LIBS)

twang:		twang.o		$(HACK_OBJS) $(GRAB) $(SHM)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(GRAB) $(SHM) $(HACK_LIBS)

fluidballs:	fluidballs.o	$(HACK_OBJS) $(DBE)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(DBE) $(HACK_LIBS)

anemone:	anemone.o	$(HACK_OBJS) $(COL) $(DBE)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(DBE) $(HACK_LIBS)

halftone:	halftone.o	$(HACK_OBJS) $(COL)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(HACK_LIBS)

metaballs:	metaballs.o	$(HACK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(HACK_LIBS)

eruption:	eruption.o	$(HACK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(HACK_LIBS)

popsquares:	popsquares.o	$(HACK_OBJS) $(DBE) $(COL)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(DBE) $(COL) $(HACK_LIBS)

barcode:	barcode.o	$(HACK_OBJS) $(HSV)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(HSV) $(HACK_LIBS)

piecewise:	piecewise.o	$(HACK_OBJS) $(COL) $(DBE)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(DBE) $(HACK_LIBS)

cloudlife:	cloudlife.o	$(HACK_OBJS) $(COL) $(DBE)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(DBE) $(HACK_LIBS)

fontglide:	fontglide.o	$(HACK_OBJS) $(DBE) $(TEXT)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(DBE) $(TEXT) $(HACK_LIBS) $(TEXT_LIBS)

pong: 	pong.o	$(HACK_OBJS) $(ATV) $(GRAB) $(XPM)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(ATV) $(GRAB) $(XPM) $(XPM_LIBS) $(HACK_LIBS)

wormhole: 	wormhole.o	$(HACK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(HACK_LIBS)

fuzzyflakes:	fuzzyflakes.o	$(HACK_OBJS) 
	$(CC_HACK) `pkg-config --cflags cairo` -g -o $@ $@.o	$(HACK_OBJS) $(HACK_LIBS) -lcairo -lm

anemotaxis:	anemotaxis.o	$(HACK_OBJS) $(COL) $(DBE)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(DBE) $(HACK_LIBS)

memscroller:	memscroller.o	$(HACK_OBJS) $(SHM) $(COL)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(SHM) $(COL) $(HACK_LIBS)

substrate:	substrate.o	$(HACK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(HACK_LIBS)

intermomentary:	intermomentary.o $(HACK_OBJS) $(COL)
	$(CC_HACK) -o $@ $@.o	 $(HACK_OBJS) $(COL) $(HACK_LIBS)

interaggregate:	interaggregate.o $(HACK_OBJS) $(COL)
	$(CC_HACK) -o $@ $@.o	 $(HACK_OBJS) $(COL) $(HACK_LIBS)

fireworkx:	fireworkx.o	$(HACK_OBJS) $(COL)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(HACK_LIBS)

boxfit:		boxfit.o	$(HACK_OBJS) $(COL) $(GRAB)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(GRAB) $(HACK_LIBS)

ifs:		ifs.o		$(HACK_OBJS) $(COL)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(HACK_LIBS)

celtic:		celtic.o	$(HACK_OBJS) $(COL) $(ERASE)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(ERASE) $(HACK_LIBS)

cwaves:		cwaves.o	$(HACK_OBJS) $(COL)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(HACK_LIBS)

m6502.h:
	@echo "building m6502.h from $(srcdir)/images/m6502/*.asm"; \
	UTILS_SRC="$(UTILS_SRC)" \
	$(srcdir)/m6502.sh m6502.h $(srcdir)/images/m6502/*.asm

m6502.o:	m6502.h
m6502:		m6502.o		asm6502.o $(HACK_OBJS) $(ATV)
	$(CC_HACK) -o $@ $@.o	asm6502.o $(HACK_OBJS) $(ATV) $(HACK_LIBS)

abstractile:	abstractile.o	$(HACK_OBJS) $(COL)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(HACK_LIBS)

lcdscrub:	lcdscrub.o	$(HACK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(HACK_LIBS)

# The rules for those hacks which follow the `xlockmore' API.
#

bouboule:	bouboule.o	$(XLOCK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(HACK_LIBS)

braid:		braid.o		$(XLOCK_OBJS) $(ERASE)
	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(ERASE) $(HACK_LIBS)

drift:		drift.o		$(XLOCK_OBJS) $(ERASE)
	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(ERASE) $(HACK_LIBS)

flag:		flag.o		$(XLOCK_OBJS) $(XPM)
	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(XPM) $(XPM_LIBS)

forest:		forest.o	$(XLOCK_OBJS) $(ERASE)
	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(ERASE) $(HACK_LIBS)

vines:		vines.o		$(XLOCK_OBJS) $(ERASE)
	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(ERASE) $(HACK_LIBS)

galaxy:		galaxy.o	$(XLOCK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(HACK_LIBS)

grav:		grav.o		$(XLOCK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(HACK_LIBS)

hopalong:	hopalong.o	$(XLOCK_OBJS) $(ERASE)
	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(ERASE) $(HACK_LIBS)

julia:		julia.o		$(XLOCK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(HACK_LIBS)

laser:		laser.o		$(XLOCK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(HACK_LIBS)

lightning:	lightning.o	$(XLOCK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(HACK_LIBS)

lisa:		lisa.o		$(XLOCK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(HACK_LIBS)

lissie:		lissie.o	$(XLOCK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(HACK_LIBS)

penrose:	penrose.o	$(XLOCK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(HACK_LIBS)

sierpinski:	sierpinski.o	$(XLOCK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(HACK_LIBS)

slip:		slip.o		$(XLOCK_OBJS) $(GRAB)
	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(GRAB) $(HACK_LIBS)

sphere:		sphere.o	$(XLOCK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(HACK_LIBS)

spiral:		spiral.o	$(XLOCK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(HACK_LIBS)

strange:	strange.o	$(XLOCK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(HACK_LIBS)

swirl:		swirl.o		$(XLOCK_OBJS) $(SHM)
	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(SHM) $(HACK_LIBS)

fadeplot:	fadeplot.o	$(XLOCK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(HACK_LIBS)

mountain:	mountain.o	$(XLOCK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(HACK_LIBS)

triangle:	triangle.o	$(XLOCK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(HACK_LIBS)

worm:		worm.o		$(XLOCK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(HACK_LIBS)

rotor:		rotor.o		$(XLOCK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(HACK_LIBS)

ant:		ant.o		$(XLOCK_OBJS) $(ERASE)
	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(ERASE) $(HACK_LIBS)

demon:		demon.o		$(XLOCK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(HACK_LIBS)

loop:		loop.o		$(XLOCK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(HACK_LIBS)

flow:		flow.o		$(XLOCK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(HACK_LIBS)

discrete:	discrete.o	$(XLOCK_OBJS) $(ERASE)
	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(ERASE) $(HACK_LIBS)

crystal:	crystal.o	$(XLOCK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(HACK_LIBS)

apollonian:	apollonian.o	$(XLOCK_OBJS) $(ERASE)
	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(ERASE) $(HACK_LIBS)

euler2d:	euler2d.o	$(XLOCK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(HACK_LIBS)

juggle:		juggle.o	$(XLOCK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(HACK_LIBS)

polyominoes:	polyominoes.o	$(XLOCK_OBJS) $(ERASE)
	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(ERASE) $(HACK_LIBS)

thornbird:	thornbird.o	$(XLOCK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(HACK_LIBS)

PACOBJS=pacman_ai.o pacman_level.o
pacman:		pacman.o 	$(PACOBJS) $(XLOCK_OBJS) $(XPM)
	$(CC_HACK) -o $@ $@.o	$(PACOBJS) $(XLOCK_OBJS) $(XPM) $(XPM_LIBS)

fiberlamp:	fiberlamp.o	$(XLOCK_OBJS)
	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(HACK_LIBS)

# These are not like the others.
#
xsublim:	xsublim.o	$(HACK_OBJS_1)
	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS_1) $(HACK_LIBS)

webcollage-helper: webcollage-helper.o
	$(CC_HACK) -o $@ $@.o	$(XPM_LIBS) $(JPEG_LIBS)


##############################################################################
#
# DO NOT DELETE: updated by make distdepend

abstractile.o: ../config.h
abstractile.o: $(srcdir)/fps.h
abstractile.o: $(srcdir)/screenhackI.h
abstractile.o: $(srcdir)/screenhack.h
abstractile.o: $(UTILS_SRC)/colors.h
abstractile.o: $(UTILS_SRC)/grabscreen.h
abstractile.o: $(UTILS_SRC)/hsv.h
abstractile.o: $(UTILS_SRC)/resources.h
abstractile.o: $(UTILS_SRC)/usleep.h
abstractile.o: $(UTILS_SRC)/visual.h
abstractile.o: $(UTILS_SRC)/yarandom.h
analogtv.o: $(srcdir)/analogtv.h
analogtv.o: ../config.h
analogtv.o: $(srcdir)/images/6x10font.xbm
analogtv.o: $(UTILS_SRC)/grabscreen.h
analogtv.o: $(UTILS_SRC)/resources.h
analogtv.o: $(UTILS_SRC)/utils.h
analogtv.o: $(UTILS_SRC)/xshm.h
analogtv.o: $(UTILS_SRC)/yarandom.h
anemone.o: ../config.h
anemone.o: $(srcdir)/fps.h
anemone.o: $(srcdir)/screenhackI.h
anemone.o: $(srcdir)/screenhack.h
anemone.o: $(UTILS_SRC)/colors.h
anemone.o: $(UTILS_SRC)/grabscreen.h
anemone.o: $(UTILS_SRC)/hsv.h
anemone.o: $(UTILS_SRC)/resources.h
anemone.o: $(UTILS_SRC)/usleep.h
anemone.o: $(UTILS_SRC)/visual.h
anemone.o: $(UTILS_SRC)/xdbe.h
anemone.o: $(UTILS_SRC)/yarandom.h
anemotaxis.o: ../config.h
anemotaxis.o: $(srcdir)/fps.h
anemotaxis.o: $(srcdir)/screenhackI.h
anemotaxis.o: $(srcdir)/screenhack.h
anemotaxis.o: $(UTILS_SRC)/colors.h
anemotaxis.o: $(UTILS_SRC)/grabscreen.h
anemotaxis.o: $(UTILS_SRC)/hsv.h
anemotaxis.o: $(UTILS_SRC)/resources.h
anemotaxis.o: $(UTILS_SRC)/usleep.h
anemotaxis.o: $(UTILS_SRC)/visual.h
anemotaxis.o: $(UTILS_SRC)/xdbe.h
anemotaxis.o: $(UTILS_SRC)/yarandom.h
ant.o: $(srcdir)/automata.h
ant.o: ../config.h
ant.o: $(srcdir)/fps.h
ant.o: $(srcdir)/screenhackI.h
ant.o: $(UTILS_SRC)/colors.h
ant.o: $(UTILS_SRC)/erase.h
ant.o: $(UTILS_SRC)/grabscreen.h
ant.o: $(UTILS_SRC)/hsv.h
ant.o: $(UTILS_SRC)/resources.h
ant.o: $(UTILS_SRC)/usleep.h
ant.o: $(UTILS_SRC)/visual.h
ant.o: $(UTILS_SRC)/xshm.h
ant.o: $(UTILS_SRC)/yarandom.h
ant.o: $(srcdir)/xlockmoreI.h
ant.o: $(srcdir)/xlockmore.h
apollonian.o: ../config.h
apollonian.o: $(srcdir)/fps.h
apollonian.o: $(srcdir)/screenhackI.h
apollonian.o: $(UTILS_SRC)/colors.h
apollonian.o: $(UTILS_SRC)/erase.h
apollonian.o: $(UTILS_SRC)/grabscreen.h
apollonian.o: $(UTILS_SRC)/hsv.h
apollonian.o: $(UTILS_SRC)/resources.h
apollonian.o: $(UTILS_SRC)/usleep.h
apollonian.o: $(UTILS_SRC)/visual.h
apollonian.o: $(UTILS_SRC)/xshm.h
apollonian.o: $(UTILS_SRC)/yarandom.h
apollonian.o: $(srcdir)/xlockmoreI.h
apollonian.o: $(srcdir)/xlockmore.h
apple2-main.o: $(srcdir)/analogtv.h
apple2-main.o: $(srcdir)/apple2.h
apple2-main.o: ../config.h
apple2-main.o: $(srcdir)/fps.h
apple2-main.o: $(srcdir)/screenhackI.h
apple2-main.o: $(srcdir)/screenhack.h
apple2-main.o: $(UTILS_SRC)/colors.h
apple2-main.o: $(UTILS_SRC)/grabscreen.h
apple2-main.o: $(UTILS_SRC)/hsv.h
apple2-main.o: $(UTILS_SRC)/resources.h
apple2-main.o: $(UTILS_SRC)/textclient.h
apple2-main.o: $(UTILS_SRC)/usleep.h
apple2-main.o: $(UTILS_SRC)/visual.h
apple2-main.o: $(UTILS_SRC)/xshm.h
apple2-main.o: $(UTILS_SRC)/yarandom.h
apple2.o: $(srcdir)/analogtv.h
apple2.o: $(srcdir)/apple2.h
apple2.o: ../config.h
apple2.o: $(srcdir)/fps.h
apple2.o: $(srcdir)/images/apple2font.xbm
apple2.o: $(srcdir)/screenhackI.h
apple2.o: $(UTILS_SRC)/colors.h
apple2.o: $(UTILS_SRC)/grabscreen.h
apple2.o: $(UTILS_SRC)/hsv.h
apple2.o: $(UTILS_SRC)/resources.h
apple2.o: $(UTILS_SRC)/usleep.h
apple2.o: $(UTILS_SRC)/visual.h
apple2.o: $(UTILS_SRC)/xshm.h
apple2.o: $(UTILS_SRC)/yarandom.h
asm6502.o: $(srcdir)/asm6502.h
asm6502.o: $(UTILS_SRC)/yarandom.h
attraction.o: ../config.h
attraction.o: $(srcdir)/fps.h
attraction.o: $(srcdir)/screenhackI.h
attraction.o: $(srcdir)/screenhack.h
attraction.o: $(UTILS_SRC)/colors.h
attraction.o: $(UTILS_SRC)/grabscreen.h
attraction.o: $(UTILS_SRC)/hsv.h
attraction.o: $(UTILS_SRC)/resources.h
attraction.o: $(UTILS_SRC)/spline.h
attraction.o: $(UTILS_SRC)/usleep.h
attraction.o: $(UTILS_SRC)/visual.h
attraction.o: $(UTILS_SRC)/yarandom.h
barcode.o: ../config.h
barcode.o: $(srcdir)/fps.h
barcode.o: $(srcdir)/screenhackI.h
barcode.o: $(srcdir)/screenhack.h
barcode.o: $(UTILS_SRC)/colors.h
barcode.o: $(UTILS_SRC)/grabscreen.h
barcode.o: $(UTILS_SRC)/hsv.h
barcode.o: $(UTILS_SRC)/resources.h
barcode.o: $(UTILS_SRC)/usleep.h
barcode.o: $(UTILS_SRC)/visual.h
barcode.o: $(UTILS_SRC)/yarandom.h
blaster.o: ../config.h
blaster.o: $(srcdir)/fps.h
blaster.o: $(srcdir)/screenhackI.h
blaster.o: $(srcdir)/screenhack.h
blaster.o: $(UTILS_SRC)/colors.h
blaster.o: $(UTILS_SRC)/grabscreen.h
blaster.o: $(UTILS_SRC)/hsv.h
blaster.o: $(UTILS_SRC)/resources.h
blaster.o: $(UTILS_SRC)/usleep.h
blaster.o: $(UTILS_SRC)/visual.h
blaster.o: $(UTILS_SRC)/yarandom.h
blitspin.o: ../config.h
blitspin.o: $(srcdir)/fps.h
blitspin.o: $(srcdir)/images/som.xbm
blitspin.o: $(srcdir)/screenhackI.h
blitspin.o: $(srcdir)/screenhack.h
blitspin.o: $(UTILS_SRC)/colors.h
blitspin.o: $(UTILS_SRC)/grabscreen.h
blitspin.o: $(UTILS_SRC)/hsv.h
blitspin.o: $(UTILS_SRC)/resources.h
blitspin.o: $(UTILS_SRC)/usleep.h
blitspin.o: $(UTILS_SRC)/visual.h
blitspin.o: $(UTILS_SRC)/yarandom.h
blitspin.o: $(srcdir)/xpm-pixmap.h
bouboule.o: ../config.h
bouboule.o: $(srcdir)/fps.h
bouboule.o: $(srcdir)/screenhackI.h
bouboule.o: $(UTILS_SRC)/colors.h
bouboule.o: $(UTILS_SRC)/grabscreen.h
bouboule.o: $(UTILS_SRC)/hsv.h
bouboule.o: $(UTILS_SRC)/resources.h
bouboule.o: $(UTILS_SRC)/usleep.h
bouboule.o: $(UTILS_SRC)/visual.h
bouboule.o: $(UTILS_SRC)/xshm.h
bouboule.o: $(UTILS_SRC)/yarandom.h
bouboule.o: $(srcdir)/xlockmoreI.h
bouboule.o: $(srcdir)/xlockmore.h
boxfit.o: ../config.h
boxfit.o: $(srcdir)/fps.h
boxfit.o: $(srcdir)/screenhackI.h
boxfit.o: $(srcdir)/screenhack.h
boxfit.o: $(UTILS_SRC)/colors.h
boxfit.o: $(UTILS_SRC)/grabscreen.h
boxfit.o: $(UTILS_SRC)/hsv.h
boxfit.o: $(UTILS_SRC)/resources.h
boxfit.o: $(UTILS_SRC)/usleep.h
boxfit.o: $(UTILS_SRC)/visual.h
boxfit.o: $(UTILS_SRC)/yarandom.h
boxfit.o: $(srcdir)/xpm-pixmap.h
braid.o: ../config.h
braid.o: $(srcdir)/fps.h
braid.o: $(srcdir)/screenhackI.h
braid.o: $(UTILS_SRC)/colors.h
braid.o: $(UTILS_SRC)/erase.h
braid.o: $(UTILS_SRC)/grabscreen.h
braid.o: $(UTILS_SRC)/hsv.h
braid.o: $(UTILS_SRC)/resources.h
braid.o: $(UTILS_SRC)/usleep.h
braid.o: $(UTILS_SRC)/visual.h
braid.o: $(UTILS_SRC)/xshm.h
braid.o: $(UTILS_SRC)/yarandom.h
braid.o: $(srcdir)/xlockmoreI.h
braid.o: $(srcdir)/xlockmore.h
bsod.o: $(srcdir)/analogtv.h
bsod.o: $(srcdir)/apple2.h
bsod.o: ../config.h
bsod.o: $(srcdir)/fps.h
bsod.o: $(srcdir)/images/amiga.xpm
bsod.o: $(srcdir)/images/atari.xbm
bsod.o: $(srcdir)/images/atm.xbm
bsod.o: $(srcdir)/images/hmac.xpm
bsod.o: $(srcdir)/images/macbomb.xbm
bsod.o: $(srcdir)/images/mac.xbm
bsod.o: $(srcdir)/images/osx_10_2.xpm
bsod.o: $(srcdir)/images/osx_10_3.xpm
bsod.o: $(srcdir)/screenhackI.h
bsod.o: $(srcdir)/screenhack.h
bsod.o: $(UTILS_SRC)/colors.h
bsod.o: $(UTILS_SRC)/grabscreen.h
bsod.o: $(UTILS_SRC)/hsv.h
bsod.o: $(UTILS_SRC)/resources.h
bsod.o: $(UTILS_SRC)/usleep.h
bsod.o: $(UTILS_SRC)/visual.h
bsod.o: $(UTILS_SRC)/xshm.h
bsod.o: $(UTILS_SRC)/yarandom.h
bsod.o: $(srcdir)/xpm-pixmap.h
bubbles-default.o: $(srcdir)/bubbles.h
bubbles-default.o: ../config.h
bubbles-default.o: $(srcdir)/images/bubbles/blood10.xpm
bubbles-default.o: $(srcdir)/images/bubbles/blood11.xpm
bubbles-default.o: $(srcdir)/images/bubbles/blood1.xpm
bubbles-default.o: $(srcdir)/images/bubbles/blood2.xpm
bubbles-default.o: $(srcdir)/images/bubbles/blood3.xpm
bubbles-default.o: $(srcdir)/images/bubbles/blood4.xpm
bubbles-default.o: $(srcdir)/images/bubbles/blood5.xpm
bubbles-default.o: $(srcdir)/images/bubbles/blood6.xpm
bubbles-default.o: $(srcdir)/images/bubbles/blood7.xpm
bubbles-default.o: $(srcdir)/images/bubbles/blood8.xpm
bubbles-default.o: $(srcdir)/images/bubbles/blood9.xpm
bubbles-default.o: $(srcdir)/images/bubbles/blue10.xpm
bubbles-default.o: $(srcdir)/images/bubbles/blue11.xpm
bubbles-default.o: $(srcdir)/images/bubbles/blue1.xpm
bubbles-default.o: $(srcdir)/images/bubbles/blue2.xpm
bubbles-default.o: $(srcdir)/images/bubbles/blue3.xpm
bubbles-default.o: $(srcdir)/images/bubbles/blue4.xpm
bubbles-default.o: $(srcdir)/images/bubbles/blue5.xpm
bubbles-default.o: $(srcdir)/images/bubbles/blue6.xpm
bubbles-default.o: $(srcdir)/images/bubbles/blue7.xpm
bubbles-default.o: $(srcdir)/images/bubbles/blue8.xpm
bubbles-default.o: $(srcdir)/images/bubbles/blue9.xpm
bubbles-default.o: $(srcdir)/images/bubbles/glass10.xpm
bubbles-default.o: $(srcdir)/images/bubbles/glass11.xpm
bubbles-default.o: $(srcdir)/images/bubbles/glass1.xpm
bubbles-default.o: $(srcdir)/images/bubbles/glass2.xpm
bubbles-default.o: $(srcdir)/images/bubbles/glass3.xpm
bubbles-default.o: $(srcdir)/images/bubbles/glass4.xpm
bubbles-default.o: $(srcdir)/images/bubbles/glass5.xpm
bubbles-default.o: $(srcdir)/images/bubbles/glass6.xpm
bubbles-default.o: $(srcdir)/images/bubbles/glass7.xpm
bubbles-default.o: $(srcdir)/images/bubbles/glass8.xpm
bubbles-default.o: $(srcdir)/images/bubbles/glass9.xpm
bubbles-default.o: $(srcdir)/images/bubbles/jade10.xpm
bubbles-default.o: $(srcdir)/images/bubbles/jade11.xpm
bubbles-default.o: $(srcdir)/images/bubbles/jade1.xpm
bubbles-default.o: $(srcdir)/images/bubbles/jade2.xpm
bubbles-default.o: $(srcdir)/images/bubbles/jade3.xpm
bubbles-default.o: $(srcdir)/images/bubbles/jade4.xpm
bubbles-default.o: $(srcdir)/images/bubbles/jade5.xpm
bubbles-default.o: $(srcdir)/images/bubbles/jade6.xpm
bubbles-default.o: $(srcdir)/images/bubbles/jade7.xpm
bubbles-default.o: $(srcdir)/images/bubbles/jade8.xpm
bubbles-default.o: $(srcdir)/images/bubbles/jade9.xpm
bubbles-default.o: $(UTILS_SRC)/yarandom.h
bubbles.o: $(srcdir)/bubbles.h
bubbles.o: ../config.h
bubbles.o: $(srcdir)/fps.h
bubbles.o: $(srcdir)/screenhackI.h
bubbles.o: $(srcdir)/screenhack.h
bubbles.o: $(UTILS_SRC)/colors.h
bubbles.o: $(UTILS_SRC)/grabscreen.h
bubbles.o: $(UTILS_SRC)/hsv.h
bubbles.o: $(UTILS_SRC)/resources.h
bubbles.o: $(UTILS_SRC)/usleep.h
bubbles.o: $(UTILS_SRC)/visual.h
bubbles.o: $(UTILS_SRC)/yarandom.h
bubbles.o: $(srcdir)/xpm-pixmap.h
bumps.o: ../config.h
bumps.o: $(srcdir)/fps.h
bumps.o: $(srcdir)/screenhackI.h
bumps.o: $(srcdir)/screenhack.h
bumps.o: $(UTILS_SRC)/colors.h
bumps.o: $(UTILS_SRC)/grabscreen.h
bumps.o: $(UTILS_SRC)/hsv.h
bumps.o: $(UTILS_SRC)/resources.h
bumps.o: $(UTILS_SRC)/usleep.h
bumps.o: $(UTILS_SRC)/visual.h
bumps.o: $(UTILS_SRC)/yarandom.h
ccurve.o: ../config.h
ccurve.o: $(srcdir)/fps.h
ccurve.o: $(srcdir)/screenhackI.h
ccurve.o: $(srcdir)/screenhack.h
ccurve.o: $(UTILS_SRC)/colors.h
ccurve.o: $(UTILS_SRC)/erase.h
ccurve.o: $(UTILS_SRC)/grabscreen.h
ccurve.o: $(UTILS_SRC)/hsv.h
ccurve.o: $(UTILS_SRC)/resources.h
ccurve.o: $(UTILS_SRC)/usleep.h
ccurve.o: $(UTILS_SRC)/visual.h
ccurve.o: $(UTILS_SRC)/yarandom.h
celtic.o: ../config.h
celtic.o: $(srcdir)/fps.h
celtic.o: $(srcdir)/screenhackI.h
celtic.o: $(srcdir)/screenhack.h
celtic.o: $(UTILS_SRC)/colors.h
celtic.o: $(UTILS_SRC)/erase.h
celtic.o: $(UTILS_SRC)/grabscreen.h
celtic.o: $(UTILS_SRC)/hsv.h
celtic.o: $(UTILS_SRC)/resources.h
celtic.o: $(UTILS_SRC)/usleep.h
celtic.o: $(UTILS_SRC)/visual.h
celtic.o: $(UTILS_SRC)/yarandom.h
cloudlife.o: ../config.h
cloudlife.o: $(srcdir)/fps.h
cloudlife.o: $(srcdir)/screenhackI.h
cloudlife.o: $(srcdir)/screenhack.h
cloudlife.o: $(UTILS_SRC)/colors.h
cloudlife.o: $(UTILS_SRC)/grabscreen.h
cloudlife.o: $(UTILS_SRC)/hsv.h
cloudlife.o: $(UTILS_SRC)/resources.h
cloudlife.o: $(UTILS_SRC)/usleep.h
cloudlife.o: $(UTILS_SRC)/visual.h
cloudlife.o: $(UTILS_SRC)/yarandom.h
compass.o: ../config.h
compass.o: $(srcdir)/fps.h
compass.o: $(srcdir)/screenhackI.h
compass.o: $(srcdir)/screenhack.h
compass.o: $(UTILS_SRC)/colors.h
compass.o: $(UTILS_SRC)/grabscreen.h
compass.o: $(UTILS_SRC)/hsv.h
compass.o: $(UTILS_SRC)/resources.h
compass.o: $(UTILS_SRC)/usleep.h
compass.o: $(UTILS_SRC)/visual.h
compass.o: $(UTILS_SRC)/xdbe.h
compass.o: $(UTILS_SRC)/yarandom.h
coral.o: ../config.h
coral.o: $(srcdir)/fps.h
coral.o: $(srcdir)/screenhackI.h
coral.o: $(srcdir)/screenhack.h
coral.o: $(UTILS_SRC)/colors.h
coral.o: $(UTILS_SRC)/erase.h
coral.o: $(UTILS_SRC)/grabscreen.h
coral.o: $(UTILS_SRC)/hsv.h
coral.o: $(UTILS_SRC)/resources.h
coral.o: $(UTILS_SRC)/usleep.h
coral.o: $(UTILS_SRC)/visual.h
coral.o: $(UTILS_SRC)/yarandom.h
critical.o: ../config.h
critical.o: $(srcdir)/fps.h
critical.o: $(srcdir)/screenhackI.h
critical.o: $(srcdir)/screenhack.h
critical.o: $(UTILS_SRC)/colors.h
critical.o: $(UTILS_SRC)/erase.h
critical.o: $(UTILS_SRC)/grabscreen.h
critical.o: $(UTILS_SRC)/hsv.h
critical.o: $(UTILS_SRC)/resources.h
critical.o: $(UTILS_SRC)/usleep.h
critical.o: $(UTILS_SRC)/visual.h
critical.o: $(UTILS_SRC)/yarandom.h
crystal.o: ../config.h
crystal.o: $(srcdir)/fps.h
crystal.o: $(srcdir)/screenhackI.h
crystal.o: $(UTILS_SRC)/colors.h
crystal.o: $(UTILS_SRC)/grabscreen.h
crystal.o: $(UTILS_SRC)/hsv.h
crystal.o: $(UTILS_SRC)/resources.h
crystal.o: $(UTILS_SRC)/usleep.h
crystal.o: $(UTILS_SRC)/visual.h
crystal.o: $(UTILS_SRC)/xshm.h
crystal.o: $(UTILS_SRC)/yarandom.h
crystal.o: $(srcdir)/xlockmoreI.h
crystal.o: $(srcdir)/xlockmore.h
cwaves.o: ../config.h
cwaves.o: $(srcdir)/fps.h
cwaves.o: $(srcdir)/screenhackI.h
cwaves.o: $(srcdir)/screenhack.h
cwaves.o: $(UTILS_SRC)/colors.h
cwaves.o: $(UTILS_SRC)/grabscreen.h
cwaves.o: $(UTILS_SRC)/hsv.h
cwaves.o: $(UTILS_SRC)/resources.h
cwaves.o: $(UTILS_SRC)/usleep.h
cwaves.o: $(UTILS_SRC)/visual.h
cwaves.o: $(UTILS_SRC)/yarandom.h
cwaves.o: $(srcdir)/xpm-pixmap.h
cynosure.o: ../config.h
cynosure.o: $(srcdir)/fps.h
cynosure.o: $(srcdir)/screenhackI.h
cynosure.o: $(srcdir)/screenhack.h
cynosure.o: $(UTILS_SRC)/colors.h
cynosure.o: $(UTILS_SRC)/grabscreen.h
cynosure.o: $(UTILS_SRC)/hsv.h
cynosure.o: $(UTILS_SRC)/resources.h
cynosure.o: $(UTILS_SRC)/usleep.h
cynosure.o: $(UTILS_SRC)/visual.h
cynosure.o: $(UTILS_SRC)/yarandom.h
decayscreen.o: ../config.h
decayscreen.o: $(srcdir)/fps.h
decayscreen.o: $(srcdir)/screenhackI.h
decayscreen.o: $(srcdir)/screenhack.h
decayscreen.o: $(UTILS_SRC)/colors.h
decayscreen.o: $(UTILS_SRC)/grabscreen.h
decayscreen.o: $(UTILS_SRC)/hsv.h
decayscreen.o: $(UTILS_SRC)/resources.h
decayscreen.o: $(UTILS_SRC)/usleep.h
decayscreen.o: $(UTILS_SRC)/visual.h
decayscreen.o: $(UTILS_SRC)/yarandom.h
deco.o: ../config.h
deco.o: $(srcdir)/fps.h
deco.o: $(srcdir)/screenhackI.h
deco.o: $(srcdir)/screenhack.h
deco.o: $(UTILS_SRC)/colors.h
deco.o: $(UTILS_SRC)/grabscreen.h
deco.o: $(UTILS_SRC)/hsv.h
deco.o: $(UTILS_SRC)/resources.h
deco.o: $(UTILS_SRC)/usleep.h
deco.o: $(UTILS_SRC)/visual.h
deco.o: $(UTILS_SRC)/yarandom.h
deluxe.o: ../config.h
deluxe.o: $(srcdir)/fps.h
deluxe.o: $(srcdir)/screenhackI.h
deluxe.o: $(srcdir)/screenhack.h
deluxe.o: $(UTILS_SRC)/alpha.h
deluxe.o: $(UTILS_SRC)/colors.h
deluxe.o: $(UTILS_SRC)/grabscreen.h
deluxe.o: $(UTILS_SRC)/hsv.h
deluxe.o: $(UTILS_SRC)/resources.h
deluxe.o: $(UTILS_SRC)/usleep.h
deluxe.o: $(UTILS_SRC)/visual.h
deluxe.o: $(UTILS_SRC)/xdbe.h
deluxe.o: $(UTILS_SRC)/yarandom.h
demon.o: $(srcdir)/automata.h
demon.o: ../config.h
demon.o: $(srcdir)/fps.h
demon.o: $(srcdir)/screenhackI.h
demon.o: $(UTILS_SRC)/colors.h
demon.o: $(UTILS_SRC)/grabscreen.h
demon.o: $(UTILS_SRC)/hsv.h
demon.o: $(UTILS_SRC)/resources.h
demon.o: $(UTILS_SRC)/usleep.h
demon.o: $(UTILS_SRC)/visual.h
demon.o: $(UTILS_SRC)/xshm.h
demon.o: $(UTILS_SRC)/yarandom.h
demon.o: $(srcdir)/xlockmoreI.h
demon.o: $(srcdir)/xlockmore.h
discrete.o: ../config.h
discrete.o: $(srcdir)/fps.h
discrete.o: $(srcdir)/screenhackI.h
discrete.o: $(UTILS_SRC)/colors.h
discrete.o: $(UTILS_SRC)/erase.h
discrete.o: $(UTILS_SRC)/grabscreen.h
discrete.o: $(UTILS_SRC)/hsv.h
discrete.o: $(UTILS_SRC)/resources.h
discrete.o: $(UTILS_SRC)/usleep.h
discrete.o: $(UTILS_SRC)/visual.h
discrete.o: $(UTILS_SRC)/xshm.h
discrete.o: $(UTILS_SRC)/yarandom.h
discrete.o: $(srcdir)/xlockmoreI.h
discrete.o: $(srcdir)/xlockmore.h
distort.o: ../config.h
distort.o: $(srcdir)/fps.h
distort.o: $(srcdir)/screenhackI.h
distort.o: $(srcdir)/screenhack.h
distort.o: $(UTILS_SRC)/colors.h
distort.o: $(UTILS_SRC)/grabscreen.h
distort.o: $(UTILS_SRC)/hsv.h
distort.o: $(UTILS_SRC)/resources.h
distort.o: $(UTILS_SRC)/usleep.h
distort.o: $(UTILS_SRC)/visual.h
distort.o: $(UTILS_SRC)/yarandom.h
drift.o: ../config.h
drift.o: $(srcdir)/fps.h
drift.o: $(srcdir)/screenhackI.h
drift.o: $(UTILS_SRC)/colors.h
drift.o: $(UTILS_SRC)/erase.h
drift.o: $(UTILS_SRC)/grabscreen.h
drift.o: $(UTILS_SRC)/hsv.h
drift.o: $(UTILS_SRC)/resources.h
drift.o: $(UTILS_SRC)/usleep.h
drift.o: $(UTILS_SRC)/visual.h
drift.o: $(UTILS_SRC)/xshm.h
drift.o: $(UTILS_SRC)/yarandom.h
drift.o: $(srcdir)/xlockmoreI.h
drift.o: $(srcdir)/xlockmore.h
epicycle.o: ../config.h
epicycle.o: $(srcdir)/fps.h
epicycle.o: $(srcdir)/screenhackI.h
epicycle.o: $(srcdir)/screenhack.h
epicycle.o: $(UTILS_SRC)/colors.h
epicycle.o: $(UTILS_SRC)/erase.h
epicycle.o: $(UTILS_SRC)/grabscreen.h
epicycle.o: $(UTILS_SRC)/hsv.h
epicycle.o: $(UTILS_SRC)/resources.h
epicycle.o: $(UTILS_SRC)/usleep.h
epicycle.o: $(UTILS_SRC)/visual.h
epicycle.o: $(UTILS_SRC)/yarandom.h
eruption.o: ../config.h
eruption.o: $(srcdir)/fps.h
eruption.o: $(srcdir)/screenhackI.h
eruption.o: $(srcdir)/screenhack.h
eruption.o: $(UTILS_SRC)/colors.h
eruption.o: $(UTILS_SRC)/grabscreen.h
eruption.o: $(UTILS_SRC)/hsv.h
eruption.o: $(UTILS_SRC)/resources.h
eruption.o: $(UTILS_SRC)/usleep.h
eruption.o: $(UTILS_SRC)/visual.h
eruption.o: $(UTILS_SRC)/yarandom.h
euler2d.o: ../config.h
euler2d.o: $(srcdir)/fps.h
euler2d.o: $(srcdir)/screenhackI.h
euler2d.o: $(UTILS_SRC)/colors.h
euler2d.o: $(UTILS_SRC)/grabscreen.h
euler2d.o: $(UTILS_SRC)/hsv.h
euler2d.o: $(UTILS_SRC)/resources.h
euler2d.o: $(UTILS_SRC)/usleep.h
euler2d.o: $(UTILS_SRC)/visual.h
euler2d.o: $(UTILS_SRC)/xshm.h
euler2d.o: $(UTILS_SRC)/yarandom.h
euler2d.o: $(srcdir)/xlockmoreI.h
euler2d.o: $(srcdir)/xlockmore.h
fadeplot.o: ../config.h
fadeplot.o: $(srcdir)/fps.h
fadeplot.o: $(srcdir)/screenhackI.h
fadeplot.o: $(UTILS_SRC)/colors.h
fadeplot.o: $(UTILS_SRC)/grabscreen.h
fadeplot.o: $(UTILS_SRC)/hsv.h
fadeplot.o: $(UTILS_SRC)/resources.h
fadeplot.o: $(UTILS_SRC)/usleep.h
fadeplot.o: $(UTILS_SRC)/visual.h
fadeplot.o: $(UTILS_SRC)/xshm.h
fadeplot.o: $(UTILS_SRC)/yarandom.h
fadeplot.o: $(srcdir)/xlockmoreI.h
fadeplot.o: $(srcdir)/xlockmore.h
fiberlamp.o: ../config.h
fiberlamp.o: $(srcdir)/fps.h
fiberlamp.o: $(srcdir)/screenhackI.h
fiberlamp.o: $(UTILS_SRC)/colors.h
fiberlamp.o: $(UTILS_SRC)/grabscreen.h
fiberlamp.o: $(UTILS_SRC)/hsv.h
fiberlamp.o: $(UTILS_SRC)/resources.h
fiberlamp.o: $(UTILS_SRC)/usleep.h
fiberlamp.o: $(UTILS_SRC)/visual.h
fiberlamp.o: $(UTILS_SRC)/xshm.h
fiberlamp.o: $(UTILS_SRC)/yarandom.h
fiberlamp.o: $(srcdir)/xlockmoreI.h
fiberlamp.o: $(srcdir)/xlockmore.h
fireworkx.o: ../config.h
fireworkx.o: $(srcdir)/fps.h
fireworkx.o: $(srcdir)/screenhackI.h
fireworkx.o: $(srcdir)/screenhack.h
fireworkx.o: $(UTILS_SRC)/colors.h
fireworkx.o: $(UTILS_SRC)/grabscreen.h
fireworkx.o: $(UTILS_SRC)/hsv.h
fireworkx.o: $(UTILS_SRC)/resources.h
fireworkx.o: $(UTILS_SRC)/usleep.h
fireworkx.o: $(UTILS_SRC)/visual.h
fireworkx.o: $(UTILS_SRC)/yarandom.h
flag.o: ../config.h
flag.o: $(srcdir)/fps.h
flag.o: $(srcdir)/images/bob.xbm
flag.o: $(srcdir)/screenhackI.h
flag.o: $(UTILS_SRC)/colors.h
flag.o: $(UTILS_SRC)/grabscreen.h
flag.o: $(UTILS_SRC)/hsv.h
flag.o: $(UTILS_SRC)/resources.h
flag.o: $(UTILS_SRC)/usleep.h
flag.o: $(UTILS_SRC)/visual.h
flag.o: $(UTILS_SRC)/xshm.h
flag.o: $(UTILS_SRC)/yarandom.h
flag.o: $(srcdir)/xlockmoreI.h
flag.o: $(srcdir)/xlockmore.h
flag.o: $(srcdir)/xpm-pixmap.h
flame.o: ../config.h
flame.o: $(srcdir)/fps.h
flame.o: $(srcdir)/screenhackI.h
flame.o: $(srcdir)/screenhack.h
flame.o: $(UTILS_SRC)/colors.h
flame.o: $(UTILS_SRC)/grabscreen.h
flame.o: $(UTILS_SRC)/hsv.h
flame.o: $(UTILS_SRC)/resources.h
flame.o: $(UTILS_SRC)/usleep.h
flame.o: $(UTILS_SRC)/visual.h
flame.o: $(UTILS_SRC)/yarandom.h
flow.o: ../config.h
flow.o: $(srcdir)/fps.h
flow.o: $(srcdir)/screenhackI.h
flow.o: $(UTILS_SRC)/colors.h
flow.o: $(UTILS_SRC)/grabscreen.h
flow.o: $(UTILS_SRC)/hsv.h
flow.o: $(UTILS_SRC)/resources.h
flow.o: $(UTILS_SRC)/usleep.h
flow.o: $(UTILS_SRC)/visual.h
flow.o: $(UTILS_SRC)/xshm.h
flow.o: $(UTILS_SRC)/yarandom.h
flow.o: $(srcdir)/xlockmoreI.h
flow.o: $(srcdir)/xlockmore.h
fluidballs.o: ../config.h
fluidballs.o: $(srcdir)/fps.h
fluidballs.o: $(srcdir)/screenhackI.h
fluidballs.o: $(srcdir)/screenhack.h
fluidballs.o: $(UTILS_SRC)/colors.h
fluidballs.o: $(UTILS_SRC)/grabscreen.h
fluidballs.o: $(UTILS_SRC)/hsv.h
fluidballs.o: $(UTILS_SRC)/resources.h
fluidballs.o: $(UTILS_SRC)/usleep.h
fluidballs.o: $(UTILS_SRC)/visual.h
fluidballs.o: $(UTILS_SRC)/xdbe.h
fluidballs.o: $(UTILS_SRC)/yarandom.h
fontglide.o: ../config.h
fontglide.o: $(srcdir)/fps.h
fontglide.o: $(srcdir)/screenhackI.h
fontglide.o: $(srcdir)/screenhack.h
fontglide.o: $(UTILS_SRC)/colors.h
fontglide.o: $(UTILS_SRC)/grabscreen.h
fontglide.o: $(UTILS_SRC)/hsv.h
fontglide.o: $(UTILS_SRC)/resources.h
fontglide.o: $(UTILS_SRC)/textclient.h
fontglide.o: $(UTILS_SRC)/usleep.h
fontglide.o: $(UTILS_SRC)/visual.h
fontglide.o: $(UTILS_SRC)/xdbe.h
fontglide.o: $(UTILS_SRC)/yarandom.h
forest.o: ../config.h
forest.o: $(srcdir)/fps.h
forest.o: $(srcdir)/screenhackI.h
forest.o: $(UTILS_SRC)/colors.h
forest.o: $(UTILS_SRC)/grabscreen.h
forest.o: $(UTILS_SRC)/hsv.h
forest.o: $(UTILS_SRC)/resources.h
forest.o: $(UTILS_SRC)/usleep.h
forest.o: $(UTILS_SRC)/visual.h
forest.o: $(UTILS_SRC)/xshm.h
forest.o: $(UTILS_SRC)/yarandom.h
forest.o: $(srcdir)/xlockmoreI.h
forest.o: $(srcdir)/xlockmore.h
fps.o: ../config.h
fps.o: $(srcdir)/fpsI.h
fps.o: $(srcdir)/fps.h
fps.o: $(srcdir)/screenhackI.h
fps.o: $(UTILS_SRC)/colors.h
fps.o: $(UTILS_SRC)/grabscreen.h
fps.o: $(UTILS_SRC)/hsv.h
fps.o: $(UTILS_SRC)/resources.h
fps.o: $(UTILS_SRC)/usleep.h
fps.o: $(UTILS_SRC)/visual.h
fps.o: $(UTILS_SRC)/yarandom.h
fuzzyflakes.o: ../config.h
fuzzyflakes.o: $(srcdir)/fps.h
fuzzyflakes.o: $(srcdir)/screenhackI.h
fuzzyflakes.o: $(srcdir)/screenhack.h
fuzzyflakes.o: $(UTILS_SRC)/colors.h
fuzzyflakes.o: $(UTILS_SRC)/grabscreen.h
fuzzyflakes.o: $(UTILS_SRC)/hsv.h
fuzzyflakes.o: $(UTILS_SRC)/resources.h
fuzzyflakes.o: $(UTILS_SRC)/usleep.h
fuzzyflakes.o: $(UTILS_SRC)/visual.h
fuzzyflakes.o: $(UTILS_SRC)/yarandom.h
galaxy.o: ../config.h
galaxy.o: $(srcdir)/fps.h
galaxy.o: $(srcdir)/screenhackI.h
galaxy.o: $(UTILS_SRC)/colors.h
galaxy.o: $(UTILS_SRC)/grabscreen.h
galaxy.o: $(UTILS_SRC)/hsv.h
galaxy.o: $(UTILS_SRC)/resources.h
galaxy.o: $(UTILS_SRC)/usleep.h
galaxy.o: $(UTILS_SRC)/visual.h
galaxy.o: $(UTILS_SRC)/xshm.h
galaxy.o: $(UTILS_SRC)/yarandom.h
galaxy.o: $(srcdir)/xlockmoreI.h
galaxy.o: $(srcdir)/xlockmore.h
goop.o: ../config.h
goop.o: $(srcdir)/fps.h
goop.o: $(srcdir)/screenhackI.h
goop.o: $(srcdir)/screenhack.h
goop.o: $(UTILS_SRC)/alpha.h
goop.o: $(UTILS_SRC)/colors.h
goop.o: $(UTILS_SRC)/grabscreen.h
goop.o: $(UTILS_SRC)/hsv.h
goop.o: $(UTILS_SRC)/resources.h
goop.o: $(UTILS_SRC)/spline.h
goop.o: $(UTILS_SRC)/usleep.h
goop.o: $(UTILS_SRC)/visual.h
goop.o: $(UTILS_SRC)/yarandom.h
grav.o: ../config.h
grav.o: $(srcdir)/fps.h
grav.o: $(srcdir)/screenhackI.h
grav.o: $(UTILS_SRC)/colors.h
grav.o: $(UTILS_SRC)/grabscreen.h
grav.o: $(UTILS_SRC)/hsv.h
grav.o: $(UTILS_SRC)/resources.h
grav.o: $(UTILS_SRC)/usleep.h
grav.o: $(UTILS_SRC)/visual.h
grav.o: $(UTILS_SRC)/xshm.h
grav.o: $(UTILS_SRC)/yarandom.h
grav.o: $(srcdir)/xlockmoreI.h
grav.o: $(srcdir)/xlockmore.h
greynetic.o: ../config.h
greynetic.o: $(srcdir)/fps.h
greynetic.o: $(srcdir)/screenhackI.h
greynetic.o: $(srcdir)/screenhack.h
greynetic.o: $(UTILS_SRC)/colors.h
greynetic.o: $(UTILS_SRC)/grabscreen.h
greynetic.o: $(UTILS_SRC)/hsv.h
greynetic.o: $(UTILS_SRC)/resources.h
greynetic.o: $(UTILS_SRC)/usleep.h
greynetic.o: $(UTILS_SRC)/visual.h
greynetic.o: $(UTILS_SRC)/yarandom.h
halftone.o: ../config.h
halftone.o: $(srcdir)/fps.h
halftone.o: $(srcdir)/screenhackI.h
halftone.o: $(srcdir)/screenhack.h
halftone.o: $(UTILS_SRC)/colors.h
halftone.o: $(UTILS_SRC)/grabscreen.h
halftone.o: $(UTILS_SRC)/hsv.h
halftone.o: $(UTILS_SRC)/resources.h
halftone.o: $(UTILS_SRC)/usleep.h
halftone.o: $(UTILS_SRC)/visual.h
halftone.o: $(UTILS_SRC)/yarandom.h
halo.o: ../config.h
halo.o: $(srcdir)/fps.h
halo.o: $(srcdir)/screenhackI.h
halo.o: $(srcdir)/screenhack.h
halo.o: $(UTILS_SRC)/colors.h
halo.o: $(UTILS_SRC)/grabscreen.h
halo.o: $(UTILS_SRC)/hsv.h
halo.o: $(UTILS_SRC)/resources.h
halo.o: $(UTILS_SRC)/usleep.h
halo.o: $(UTILS_SRC)/visual.h
halo.o: $(UTILS_SRC)/yarandom.h
helix.o: ../config.h
helix.o: $(srcdir)/fps.h
helix.o: $(srcdir)/screenhackI.h
helix.o: $(srcdir)/screenhack.h
helix.o: $(UTILS_SRC)/colors.h
helix.o: $(UTILS_SRC)/erase.h
helix.o: $(UTILS_SRC)/grabscreen.h
helix.o: $(UTILS_SRC)/hsv.h
helix.o: $(UTILS_SRC)/resources.h
helix.o: $(UTILS_SRC)/usleep.h
helix.o: $(UTILS_SRC)/visual.h
helix.o: $(UTILS_SRC)/yarandom.h
hopalong.o: ../config.h
hopalong.o: $(srcdir)/fps.h
hopalong.o: $(srcdir)/screenhackI.h
hopalong.o: $(UTILS_SRC)/colors.h
hopalong.o: $(UTILS_SRC)/erase.h
hopalong.o: $(UTILS_SRC)/grabscreen.h
hopalong.o: $(UTILS_SRC)/hsv.h
hopalong.o: $(UTILS_SRC)/resources.h
hopalong.o: $(UTILS_SRC)/usleep.h
hopalong.o: $(UTILS_SRC)/visual.h
hopalong.o: $(UTILS_SRC)/xshm.h
hopalong.o: $(UTILS_SRC)/yarandom.h
hopalong.o: $(srcdir)/xlockmoreI.h
hopalong.o: $(srcdir)/xlockmore.h
hyperball.o: ../config.h
hyperball.o: $(srcdir)/fps.h
hyperball.o: $(srcdir)/screenhackI.h
hyperball.o: $(srcdir)/screenhack.h
hyperball.o: $(UTILS_SRC)/colors.h
hyperball.o: $(UTILS_SRC)/grabscreen.h
hyperball.o: $(UTILS_SRC)/hsv.h
hyperball.o: $(UTILS_SRC)/resources.h
hyperball.o: $(UTILS_SRC)/usleep.h
hyperball.o: $(UTILS_SRC)/visual.h
hyperball.o: $(UTILS_SRC)/yarandom.h
hypercube.o: ../config.h
hypercube.o: $(srcdir)/fps.h
hypercube.o: $(srcdir)/screenhackI.h
hypercube.o: $(srcdir)/screenhack.h
hypercube.o: $(UTILS_SRC)/colors.h
hypercube.o: $(UTILS_SRC)/grabscreen.h
hypercube.o: $(UTILS_SRC)/hsv.h
hypercube.o: $(UTILS_SRC)/resources.h
hypercube.o: $(UTILS_SRC)/usleep.h
hypercube.o: $(UTILS_SRC)/visual.h
hypercube.o: $(UTILS_SRC)/yarandom.h
ifs.o: ../config.h
ifs.o: $(srcdir)/fps.h
ifs.o: $(srcdir)/screenhackI.h
ifs.o: $(srcdir)/screenhack.h
ifs.o: $(UTILS_SRC)/colors.h
ifs.o: $(UTILS_SRC)/grabscreen.h
ifs.o: $(UTILS_SRC)/hsv.h
ifs.o: $(UTILS_SRC)/resources.h
ifs.o: $(UTILS_SRC)/usleep.h
ifs.o: $(UTILS_SRC)/visual.h
ifs.o: $(UTILS_SRC)/yarandom.h
imsmap.o: ../config.h
imsmap.o: $(srcdir)/fps.h
imsmap.o: $(srcdir)/screenhackI.h
imsmap.o: $(srcdir)/screenhack.h
imsmap.o: $(UTILS_SRC)/colors.h
imsmap.o: $(UTILS_SRC)/grabscreen.h
imsmap.o: $(UTILS_SRC)/hsv.h
imsmap.o: $(UTILS_SRC)/resources.h
imsmap.o: $(UTILS_SRC)/usleep.h
imsmap.o: $(UTILS_SRC)/visual.h
imsmap.o: $(UTILS_SRC)/yarandom.h
interaggregate.o: ../config.h
interaggregate.o: $(srcdir)/fps.h
interaggregate.o: $(srcdir)/screenhackI.h
interaggregate.o: $(srcdir)/screenhack.h
interaggregate.o: $(UTILS_SRC)/colors.h
interaggregate.o: $(UTILS_SRC)/grabscreen.h
interaggregate.o: $(UTILS_SRC)/hsv.h
interaggregate.o: $(UTILS_SRC)/resources.h
interaggregate.o: $(UTILS_SRC)/usleep.h
interaggregate.o: $(UTILS_SRC)/visual.h
interaggregate.o: $(UTILS_SRC)/yarandom.h
interference.o: ../config.h
interference.o: $(srcdir)/fps.h
interference.o: $(srcdir)/screenhackI.h
interference.o: $(srcdir)/screenhack.h
interference.o: $(UTILS_SRC)/colors.h
interference.o: $(UTILS_SRC)/grabscreen.h
interference.o: $(UTILS_SRC)/hsv.h
interference.o: $(UTILS_SRC)/resources.h
interference.o: $(UTILS_SRC)/usleep.h
interference.o: $(UTILS_SRC)/visual.h
interference.o: $(UTILS_SRC)/xdbe.h
interference.o: $(UTILS_SRC)/yarandom.h
intermomentary.o: ../config.h
intermomentary.o: $(srcdir)/fps.h
intermomentary.o: $(srcdir)/screenhackI.h
intermomentary.o: $(srcdir)/screenhack.h
intermomentary.o: $(UTILS_SRC)/colors.h
intermomentary.o: $(UTILS_SRC)/grabscreen.h
intermomentary.o: $(UTILS_SRC)/hsv.h
intermomentary.o: $(UTILS_SRC)/resources.h
intermomentary.o: $(UTILS_SRC)/usleep.h
intermomentary.o: $(UTILS_SRC)/visual.h
intermomentary.o: $(UTILS_SRC)/yarandom.h
juggle.o: ../config.h
juggle.o: $(srcdir)/fps.h
juggle.o: $(srcdir)/screenhackI.h
juggle.o: $(UTILS_SRC)/colors.h
juggle.o: $(UTILS_SRC)/grabscreen.h
juggle.o: $(UTILS_SRC)/hsv.h
juggle.o: $(UTILS_SRC)/resources.h
juggle.o: $(UTILS_SRC)/usleep.h
juggle.o: $(UTILS_SRC)/visual.h
juggle.o: $(UTILS_SRC)/xshm.h
juggle.o: $(UTILS_SRC)/yarandom.h
juggle.o: $(srcdir)/xlockmoreI.h
juggle.o: $(srcdir)/xlockmore.h
julia.o: ../config.h
julia.o: $(srcdir)/fps.h
julia.o: $(srcdir)/screenhackI.h
julia.o: $(UTILS_SRC)/colors.h
julia.o: $(UTILS_SRC)/grabscreen.h
julia.o: $(UTILS_SRC)/hsv.h
julia.o: $(UTILS_SRC)/resources.h
julia.o: $(UTILS_SRC)/usleep.h
julia.o: $(UTILS_SRC)/visual.h
julia.o: $(UTILS_SRC)/xshm.h
julia.o: $(UTILS_SRC)/yarandom.h
julia.o: $(srcdir)/xlockmoreI.h
julia.o: $(srcdir)/xlockmore.h
kaleidescope.o: ../config.h
kaleidescope.o: $(srcdir)/fps.h
kaleidescope.o: $(srcdir)/screenhackI.h
kaleidescope.o: $(srcdir)/screenhack.h
kaleidescope.o: $(UTILS_SRC)/colors.h
kaleidescope.o: $(UTILS_SRC)/grabscreen.h
kaleidescope.o: $(UTILS_SRC)/hsv.h
kaleidescope.o: $(UTILS_SRC)/resources.h
kaleidescope.o: $(UTILS_SRC)/spline.h
kaleidescope.o: $(UTILS_SRC)/usleep.h
kaleidescope.o: $(UTILS_SRC)/visual.h
kaleidescope.o: $(UTILS_SRC)/yarandom.h
kumppa.o: ../config.h
kumppa.o: $(srcdir)/fps.h
kumppa.o: $(srcdir)/screenhackI.h
kumppa.o: $(srcdir)/screenhack.h
kumppa.o: $(UTILS_SRC)/colors.h
kumppa.o: $(UTILS_SRC)/grabscreen.h
kumppa.o: $(UTILS_SRC)/hsv.h
kumppa.o: $(UTILS_SRC)/resources.h
kumppa.o: $(UTILS_SRC)/usleep.h
kumppa.o: $(UTILS_SRC)/visual.h
kumppa.o: $(UTILS_SRC)/xdbe.h
kumppa.o: $(UTILS_SRC)/yarandom.h
laser.o: ../config.h
laser.o: $(srcdir)/fps.h
laser.o: $(srcdir)/screenhackI.h
laser.o: $(UTILS_SRC)/colors.h
laser.o: $(UTILS_SRC)/grabscreen.h
laser.o: $(UTILS_SRC)/hsv.h
laser.o: $(UTILS_SRC)/resources.h
laser.o: $(UTILS_SRC)/usleep.h
laser.o: $(UTILS_SRC)/visual.h
laser.o: $(UTILS_SRC)/xshm.h
laser.o: $(UTILS_SRC)/yarandom.h
laser.o: $(srcdir)/xlockmoreI.h
laser.o: $(srcdir)/xlockmore.h
lcdscrub.o: ../config.h
lcdscrub.o: $(srcdir)/fps.h
lcdscrub.o: $(srcdir)/screenhackI.h
lcdscrub.o: $(srcdir)/screenhack.h
lcdscrub.o: $(UTILS_SRC)/colors.h
lcdscrub.o: $(UTILS_SRC)/grabscreen.h
lcdscrub.o: $(UTILS_SRC)/hsv.h
lcdscrub.o: $(UTILS_SRC)/resources.h
lcdscrub.o: $(UTILS_SRC)/usleep.h
lcdscrub.o: $(UTILS_SRC)/visual.h
lcdscrub.o: $(UTILS_SRC)/yarandom.h
lightning.o: ../config.h
lightning.o: $(srcdir)/fps.h
lightning.o: $(srcdir)/screenhackI.h
lightning.o: $(UTILS_SRC)/colors.h
lightning.o: $(UTILS_SRC)/grabscreen.h
lightning.o: $(UTILS_SRC)/hsv.h
lightning.o: $(UTILS_SRC)/resources.h
lightning.o: $(UTILS_SRC)/usleep.h
lightning.o: $(UTILS_SRC)/visual.h
lightning.o: $(UTILS_SRC)/xshm.h
lightning.o: $(UTILS_SRC)/yarandom.h
lightning.o: $(srcdir)/xlockmoreI.h
lightning.o: $(srcdir)/xlockmore.h
lisa.o: ../config.h
lisa.o: $(srcdir)/fps.h
lisa.o: $(srcdir)/screenhackI.h
lisa.o: $(UTILS_SRC)/colors.h
lisa.o: $(UTILS_SRC)/grabscreen.h
lisa.o: $(UTILS_SRC)/hsv.h
lisa.o: $(UTILS_SRC)/resources.h
lisa.o: $(UTILS_SRC)/usleep.h
lisa.o: $(UTILS_SRC)/visual.h
lisa.o: $(UTILS_SRC)/xshm.h
lisa.o: $(UTILS_SRC)/yarandom.h
lisa.o: $(srcdir)/xlockmoreI.h
lisa.o: $(srcdir)/xlockmore.h
lissie.o: ../config.h
lissie.o: $(srcdir)/fps.h
lissie.o: $(srcdir)/screenhackI.h
lissie.o: $(UTILS_SRC)/colors.h
lissie.o: $(UTILS_SRC)/grabscreen.h
lissie.o: $(UTILS_SRC)/hsv.h
lissie.o: $(UTILS_SRC)/resources.h
lissie.o: $(UTILS_SRC)/usleep.h
lissie.o: $(UTILS_SRC)/visual.h
lissie.o: $(UTILS_SRC)/xshm.h
lissie.o: $(UTILS_SRC)/yarandom.h
lissie.o: $(srcdir)/xlockmoreI.h
lissie.o: $(srcdir)/xlockmore.h
lmorph.o: ../config.h
lmorph.o: $(srcdir)/fps.h
lmorph.o: $(srcdir)/screenhackI.h
lmorph.o: $(srcdir)/screenhack.h
lmorph.o: $(UTILS_SRC)/colors.h
lmorph.o: $(UTILS_SRC)/grabscreen.h
lmorph.o: $(UTILS_SRC)/hsv.h
lmorph.o: $(UTILS_SRC)/resources.h
lmorph.o: $(UTILS_SRC)/usleep.h
lmorph.o: $(UTILS_SRC)/visual.h
lmorph.o: $(UTILS_SRC)/yarandom.h
loop.o: $(srcdir)/automata.h
loop.o: ../config.h
loop.o: $(srcdir)/fps.h
loop.o: $(srcdir)/screenhackI.h
loop.o: $(UTILS_SRC)/colors.h
loop.o: $(UTILS_SRC)/grabscreen.h
loop.o: $(UTILS_SRC)/hsv.h
loop.o: $(UTILS_SRC)/resources.h
loop.o: $(UTILS_SRC)/usleep.h
loop.o: $(UTILS_SRC)/visual.h
loop.o: $(UTILS_SRC)/xshm.h
loop.o: $(UTILS_SRC)/yarandom.h
loop.o: $(srcdir)/xlockmoreI.h
loop.o: $(srcdir)/xlockmore.h
m6502.o: $(srcdir)/analogtv.h
m6502.o: $(srcdir)/asm6502.h
m6502.o: ../config.h
m6502.o: $(srcdir)/fps.h
m6502.o: m6502.h
m6502.o: $(srcdir)/screenhackI.h
m6502.o: $(srcdir)/screenhack.h
m6502.o: $(UTILS_SRC)/colors.h
m6502.o: $(UTILS_SRC)/grabscreen.h
m6502.o: $(UTILS_SRC)/hsv.h
m6502.o: $(UTILS_SRC)/resources.h
m6502.o: $(UTILS_SRC)/usleep.h
m6502.o: $(UTILS_SRC)/visual.h
m6502.o: $(UTILS_SRC)/xshm.h
m6502.o: $(UTILS_SRC)/yarandom.h
maze.o: ../config.h
maze.o: $(srcdir)/fps.h
maze.o: $(srcdir)/screenhackI.h
maze.o: $(srcdir)/screenhack.h
maze.o: $(UTILS_SRC)/colors.h
maze.o: $(UTILS_SRC)/erase.h
maze.o: $(UTILS_SRC)/grabscreen.h
maze.o: $(UTILS_SRC)/hsv.h
maze.o: $(UTILS_SRC)/resources.h
maze.o: $(UTILS_SRC)/usleep.h
maze.o: $(UTILS_SRC)/visual.h
maze.o: $(UTILS_SRC)/yarandom.h
memscroller.o: ../config.h
memscroller.o: $(srcdir)/fps.h
memscroller.o: $(srcdir)/screenhackI.h
memscroller.o: $(srcdir)/screenhack.h
memscroller.o: $(UTILS_SRC)/colors.h
memscroller.o: $(UTILS_SRC)/grabscreen.h
memscroller.o: $(UTILS_SRC)/hsv.h
memscroller.o: $(UTILS_SRC)/resources.h
memscroller.o: $(UTILS_SRC)/usleep.h
memscroller.o: $(UTILS_SRC)/visual.h
memscroller.o: $(UTILS_SRC)/yarandom.h
metaballs.o: ../config.h
metaballs.o: $(srcdir)/fps.h
metaballs.o: $(srcdir)/screenhackI.h
metaballs.o: $(srcdir)/screenhack.h
metaballs.o: $(UTILS_SRC)/colors.h
metaballs.o: $(UTILS_SRC)/grabscreen.h
metaballs.o: $(UTILS_SRC)/hsv.h
metaballs.o: $(UTILS_SRC)/resources.h
metaballs.o: $(UTILS_SRC)/usleep.h
metaballs.o: $(UTILS_SRC)/visual.h
metaballs.o: $(UTILS_SRC)/yarandom.h
moire2.o: ../config.h
moire2.o: $(srcdir)/fps.h
moire2.o: $(srcdir)/screenhackI.h
moire2.o: $(srcdir)/screenhack.h
moire2.o: $(UTILS_SRC)/colors.h
moire2.o: $(UTILS_SRC)/grabscreen.h
moire2.o: $(UTILS_SRC)/hsv.h
moire2.o: $(UTILS_SRC)/resources.h
moire2.o: $(UTILS_SRC)/usleep.h
moire2.o: $(UTILS_SRC)/visual.h
moire2.o: $(UTILS_SRC)/xdbe.h
moire2.o: $(UTILS_SRC)/yarandom.h
moire.o: ../config.h
moire.o: $(srcdir)/fps.h
moire.o: $(srcdir)/screenhackI.h
moire.o: $(srcdir)/screenhack.h
moire.o: $(UTILS_SRC)/colors.h
moire.o: $(UTILS_SRC)/grabscreen.h
moire.o: $(UTILS_SRC)/hsv.h
moire.o: $(UTILS_SRC)/resources.h
moire.o: $(UTILS_SRC)/usleep.h
moire.o: $(UTILS_SRC)/visual.h
moire.o: $(UTILS_SRC)/yarandom.h
mountain.o: ../config.h
mountain.o: $(srcdir)/fps.h
mountain.o: $(srcdir)/screenhackI.h
mountain.o: $(UTILS_SRC)/colors.h
mountain.o: $(UTILS_SRC)/grabscreen.h
mountain.o: $(UTILS_SRC)/hsv.h
mountain.o: $(UTILS_SRC)/resources.h
mountain.o: $(UTILS_SRC)/usleep.h
mountain.o: $(UTILS_SRC)/visual.h
mountain.o: $(UTILS_SRC)/xshm.h
mountain.o: $(UTILS_SRC)/yarandom.h
mountain.o: $(srcdir)/xlockmoreI.h
mountain.o: $(srcdir)/xlockmore.h
munch.o: ../config.h
munch.o: $(srcdir)/fps.h
munch.o: $(srcdir)/screenhackI.h
munch.o: $(srcdir)/screenhack.h
munch.o: $(UTILS_SRC)/colors.h
munch.o: $(UTILS_SRC)/grabscreen.h
munch.o: $(UTILS_SRC)/hsv.h
munch.o: $(UTILS_SRC)/resources.h
munch.o: $(UTILS_SRC)/usleep.h
munch.o: $(UTILS_SRC)/visual.h
munch.o: $(UTILS_SRC)/yarandom.h
nerverot.o: ../config.h
nerverot.o: $(srcdir)/fps.h
nerverot.o: $(srcdir)/screenhackI.h
nerverot.o: $(srcdir)/screenhack.h
nerverot.o: $(UTILS_SRC)/colors.h
nerverot.o: $(UTILS_SRC)/grabscreen.h
nerverot.o: $(UTILS_SRC)/hsv.h
nerverot.o: $(UTILS_SRC)/resources.h
nerverot.o: $(UTILS_SRC)/usleep.h
nerverot.o: $(UTILS_SRC)/visual.h
nerverot.o: $(UTILS_SRC)/yarandom.h
noseguy.o: ../config.h
noseguy.o: $(srcdir)/fps.h
noseguy.o: $(srcdir)/images/noseguy/nose-f1.xpm
noseguy.o: $(srcdir)/images/noseguy/nose-f2.xpm
noseguy.o: $(srcdir)/images/noseguy/nose-f3.xpm
noseguy.o: $(srcdir)/images/noseguy/nose-f4.xpm
noseguy.o: $(srcdir)/images/noseguy/nose-l1.xpm
noseguy.o: $(srcdir)/images/noseguy/nose-l2.xpm
noseguy.o: $(srcdir)/images/noseguy/nose-r1.xpm
noseguy.o: $(srcdir)/images/noseguy/nose-r2.xpm
noseguy.o: $(srcdir)/screenhackI.h
noseguy.o: $(srcdir)/screenhack.h
noseguy.o: $(UTILS_SRC)/colors.h
noseguy.o: $(UTILS_SRC)/grabscreen.h
noseguy.o: $(UTILS_SRC)/hsv.h
noseguy.o: $(UTILS_SRC)/resources.h
noseguy.o: $(UTILS_SRC)/textclient.h
noseguy.o: $(UTILS_SRC)/usleep.h
noseguy.o: $(UTILS_SRC)/visual.h
noseguy.o: $(UTILS_SRC)/yarandom.h
noseguy.o: $(srcdir)/xpm-pixmap.h
pacman_ai.o: ../config.h
pacman_ai.o: $(srcdir)/fps.h
pacman_ai.o: $(srcdir)/pacman_ai.h
pacman_ai.o: $(srcdir)/pacman.h
pacman_ai.o: $(srcdir)/pacman_level.h
pacman_ai.o: $(srcdir)/screenhackI.h
pacman_ai.o: $(UTILS_SRC)/colors.h
pacman_ai.o: $(UTILS_SRC)/grabscreen.h
pacman_ai.o: $(UTILS_SRC)/hsv.h
pacman_ai.o: $(UTILS_SRC)/resources.h
pacman_ai.o: $(UTILS_SRC)/usleep.h
pacman_ai.o: $(UTILS_SRC)/visual.h
pacman_ai.o: $(UTILS_SRC)/xshm.h
pacman_ai.o: $(UTILS_SRC)/yarandom.h
pacman_ai.o: $(srcdir)/xlockmoreI.h
pacman_ai.o: $(srcdir)/xpm-pixmap.h
pacman_level.o: ../config.h
pacman_level.o: $(srcdir)/fps.h
pacman_level.o: $(srcdir)/pacman.h
pacman_level.o: $(srcdir)/pacman_level.h
pacman_level.o: $(srcdir)/screenhackI.h
pacman_level.o: $(UTILS_SRC)/colors.h
pacman_level.o: $(UTILS_SRC)/grabscreen.h
pacman_level.o: $(UTILS_SRC)/hsv.h
pacman_level.o: $(UTILS_SRC)/resources.h
pacman_level.o: $(UTILS_SRC)/usleep.h
pacman_level.o: $(UTILS_SRC)/visual.h
pacman_level.o: $(UTILS_SRC)/xshm.h
pacman_level.o: $(UTILS_SRC)/yarandom.h
pacman_level.o: $(srcdir)/xlockmoreI.h
pacman_level.o: $(srcdir)/xpm-pixmap.h
pacman.o: ../config.h
pacman.o: $(srcdir)/fps.h
pacman.o: $(srcdir)/images/pacman/eyes-d.xpm
pacman.o: $(srcdir)/images/pacman/eyes-l.xpm
pacman.o: $(srcdir)/images/pacman/eyes-r.xpm
pacman.o: $(srcdir)/images/pacman/eyes-u.xpm
pacman.o: $(srcdir)/images/pacman/ghost-d1.xpm
pacman.o: $(srcdir)/images/pacman/ghost-d2.xpm
pacman.o: $(srcdir)/images/pacman/ghost-l1.xpm
pacman.o: $(srcdir)/images/pacman/ghost-l2.xpm
pacman.o: $(srcdir)/images/pacman/ghost-mask.xpm
pacman.o: $(srcdir)/images/pacman/ghost-r1.xpm
pacman.o: $(srcdir)/images/pacman/ghost-r2.xpm
pacman.o: $(srcdir)/images/pacman/ghost-s1.xpm
pacman.o: $(srcdir)/images/pacman/ghost-s2.xpm
pacman.o: $(srcdir)/images/pacman/ghost-sf1.xpm
pacman.o: $(srcdir)/images/pacman/ghost-sf2.xpm
pacman.o: $(srcdir)/images/pacman/ghost-u1.xpm
pacman.o: $(srcdir)/images/pacman/ghost-u2.xpm
pacman.o: $(srcdir)/images/pacman/pacman-0.xpm
pacman.o: $(srcdir)/images/pacman/pacman-d1.xpm
pacman.o: $(srcdir)/images/pacman/pacman-d2.xpm
pacman.o: $(srcdir)/images/pacman/pacman-ds1.xpm
pacman.o: $(srcdir)/images/pacman/pacman-ds2.xpm
pacman.o: $(srcdir)/images/pacman/pacman-ds3.xpm
pacman.o: $(srcdir)/images/pacman/pacman-ds4.xpm
pacman.o: $(srcdir)/images/pacman/pacman-ds5.xpm
pacman.o: $(srcdir)/images/pacman/pacman-ds6.xpm
pacman.o: $(srcdir)/images/pacman/pacman-ds7.xpm
pacman.o: $(srcdir)/images/pacman/pacman-ds8.xpm
pacman.o: $(srcdir)/images/pacman/pacman-l1.xpm
pacman.o: $(srcdir)/images/pacman/pacman-l2.xpm
pacman.o: $(srcdir)/images/pacman/pacman-r1.xpm
pacman.o: $(srcdir)/images/pacman/pacman-r2.xpm
pacman.o: $(srcdir)/images/pacman/pacman-u1.xpm
pacman.o: $(srcdir)/images/pacman/pacman-u2.xpm
pacman.o: $(srcdir)/pacman_ai.h
pacman.o: $(srcdir)/pacman.h
pacman.o: $(srcdir)/pacman_level.h
pacman.o: $(srcdir)/screenhackI.h
pacman.o: $(UTILS_SRC)/colors.h
pacman.o: $(UTILS_SRC)/grabscreen.h
pacman.o: $(UTILS_SRC)/hsv.h
pacman.o: $(UTILS_SRC)/resources.h
pacman.o: $(UTILS_SRC)/usleep.h
pacman.o: $(UTILS_SRC)/visual.h
pacman.o: $(UTILS_SRC)/xshm.h
pacman.o: $(UTILS_SRC)/yarandom.h
pacman.o: $(srcdir)/xlockmoreI.h
pacman.o: $(srcdir)/xlockmore.h
pacman.o: $(srcdir)/xpm-pixmap.h
pedal.o: ../config.h
pedal.o: $(srcdir)/fps.h
pedal.o: $(srcdir)/screenhackI.h
pedal.o: $(srcdir)/screenhack.h
pedal.o: $(UTILS_SRC)/colors.h
pedal.o: $(UTILS_SRC)/erase.h
pedal.o: $(UTILS_SRC)/grabscreen.h
pedal.o: $(UTILS_SRC)/hsv.h
pedal.o: $(UTILS_SRC)/resources.h
pedal.o: $(UTILS_SRC)/usleep.h
pedal.o: $(UTILS_SRC)/visual.h
pedal.o: $(UTILS_SRC)/yarandom.h
penetrate.o: ../config.h
penetrate.o: $(srcdir)/fps.h
penetrate.o: $(srcdir)/screenhackI.h
penetrate.o: $(srcdir)/screenhack.h
penetrate.o: $(UTILS_SRC)/colors.h
penetrate.o: $(UTILS_SRC)/grabscreen.h
penetrate.o: $(UTILS_SRC)/hsv.h
penetrate.o: $(UTILS_SRC)/resources.h
penetrate.o: $(UTILS_SRC)/usleep.h
penetrate.o: $(UTILS_SRC)/visual.h
penetrate.o: $(UTILS_SRC)/yarandom.h
penrose.o: ../config.h
penrose.o: $(srcdir)/fps.h
penrose.o: $(srcdir)/screenhackI.h
penrose.o: $(UTILS_SRC)/colors.h
penrose.o: $(UTILS_SRC)/grabscreen.h
penrose.o: $(UTILS_SRC)/hsv.h
penrose.o: $(UTILS_SRC)/resources.h
penrose.o: $(UTILS_SRC)/usleep.h
penrose.o: $(UTILS_SRC)/visual.h
penrose.o: $(UTILS_SRC)/xshm.h
penrose.o: $(UTILS_SRC)/yarandom.h
penrose.o: $(srcdir)/xlockmoreI.h
penrose.o: $(srcdir)/xlockmore.h
petri.o: ../config.h
petri.o: $(srcdir)/fps.h
petri.o: $(srcdir)/screenhackI.h
petri.o: $(srcdir)/screenhack.h
petri.o: $(UTILS_SRC)/colors.h
petri.o: $(UTILS_SRC)/grabscreen.h
petri.o: $(UTILS_SRC)/hsv.h
petri.o: $(UTILS_SRC)/resources.h
petri.o: $(UTILS_SRC)/spline.h
petri.o: $(UTILS_SRC)/usleep.h
petri.o: $(UTILS_SRC)/visual.h
petri.o: $(UTILS_SRC)/yarandom.h
phosphor.o: ../config.h
phosphor.o: $(srcdir)/fps.h
phosphor.o: $(srcdir)/images/6x10font.xbm
phosphor.o: $(srcdir)/screenhackI.h
phosphor.o: $(srcdir)/screenhack.h
phosphor.o: $(UTILS_SRC)/colors.h
phosphor.o: $(UTILS_SRC)/grabscreen.h
phosphor.o: $(UTILS_SRC)/hsv.h
phosphor.o: $(UTILS_SRC)/resources.h
phosphor.o: $(UTILS_SRC)/textclient.h
phosphor.o: $(UTILS_SRC)/usleep.h
phosphor.o: $(UTILS_SRC)/visual.h
phosphor.o: $(UTILS_SRC)/yarandom.h
piecewise.o: ../config.h
piecewise.o: $(srcdir)/fps.h
piecewise.o: $(srcdir)/screenhackI.h
piecewise.o: $(srcdir)/screenhack.h
piecewise.o: $(UTILS_SRC)/colors.h
piecewise.o: $(UTILS_SRC)/grabscreen.h
piecewise.o: $(UTILS_SRC)/hsv.h
piecewise.o: $(UTILS_SRC)/resources.h
piecewise.o: $(UTILS_SRC)/usleep.h
piecewise.o: $(UTILS_SRC)/visual.h
piecewise.o: $(UTILS_SRC)/xdbe.h
piecewise.o: $(UTILS_SRC)/yarandom.h
polyominoes.o: ../config.h
polyominoes.o: $(srcdir)/fps.h
polyominoes.o: $(srcdir)/screenhackI.h
polyominoes.o: $(UTILS_SRC)/colors.h
polyominoes.o: $(UTILS_SRC)/erase.h
polyominoes.o: $(UTILS_SRC)/grabscreen.h
polyominoes.o: $(UTILS_SRC)/hsv.h
polyominoes.o: $(UTILS_SRC)/resources.h
polyominoes.o: $(UTILS_SRC)/usleep.h
polyominoes.o: $(UTILS_SRC)/visual.h
polyominoes.o: $(UTILS_SRC)/xshm.h
polyominoes.o: $(UTILS_SRC)/yarandom.h
polyominoes.o: $(srcdir)/xlockmoreI.h
polyominoes.o: $(srcdir)/xlockmore.h
pong.o: $(srcdir)/analogtv.h
pong.o: ../config.h
pong.o: $(srcdir)/fps.h
pong.o: $(srcdir)/screenhackI.h
pong.o: $(srcdir)/screenhack.h
pong.o: $(UTILS_SRC)/colors.h
pong.o: $(UTILS_SRC)/grabscreen.h
pong.o: $(UTILS_SRC)/hsv.h
pong.o: $(UTILS_SRC)/resources.h
pong.o: $(UTILS_SRC)/usleep.h
pong.o: $(UTILS_SRC)/visual.h
pong.o: $(UTILS_SRC)/xshm.h
pong.o: $(UTILS_SRC)/yarandom.h
popsquares.o: ../config.h
popsquares.o: $(srcdir)/fps.h
popsquares.o: $(srcdir)/screenhackI.h
popsquares.o: $(srcdir)/screenhack.h
popsquares.o: $(UTILS_SRC)/colors.h
popsquares.o: $(UTILS_SRC)/grabscreen.h
popsquares.o: $(UTILS_SRC)/hsv.h
popsquares.o: $(UTILS_SRC)/resources.h
popsquares.o: $(UTILS_SRC)/usleep.h
popsquares.o: $(UTILS_SRC)/visual.h
popsquares.o: $(UTILS_SRC)/xdbe.h
popsquares.o: $(UTILS_SRC)/yarandom.h
pyro.o: ../config.h
pyro.o: $(srcdir)/fps.h
pyro.o: $(srcdir)/screenhackI.h
pyro.o: $(srcdir)/screenhack.h
pyro.o: $(UTILS_SRC)/colors.h
pyro.o: $(UTILS_SRC)/grabscreen.h
pyro.o: $(UTILS_SRC)/hsv.h
pyro.o: $(UTILS_SRC)/resources.h
pyro.o: $(UTILS_SRC)/usleep.h
pyro.o: $(UTILS_SRC)/visual.h
pyro.o: $(UTILS_SRC)/yarandom.h
qix.o: ../config.h
qix.o: $(srcdir)/fps.h
qix.o: $(srcdir)/screenhackI.h
qix.o: $(srcdir)/screenhack.h
qix.o: $(UTILS_SRC)/alpha.h
qix.o: $(UTILS_SRC)/colors.h
qix.o: $(UTILS_SRC)/grabscreen.h
qix.o: $(UTILS_SRC)/hsv.h
qix.o: $(UTILS_SRC)/resources.h
qix.o: $(UTILS_SRC)/usleep.h
qix.o: $(UTILS_SRC)/visual.h
qix.o: $(UTILS_SRC)/yarandom.h
rd-bomb.o: ../config.h
rd-bomb.o: $(srcdir)/fps.h
rd-bomb.o: $(srcdir)/screenhackI.h
rd-bomb.o: $(srcdir)/screenhack.h
rd-bomb.o: $(UTILS_SRC)/colors.h
rd-bomb.o: $(UTILS_SRC)/grabscreen.h
rd-bomb.o: $(UTILS_SRC)/hsv.h
rd-bomb.o: $(UTILS_SRC)/resources.h
rd-bomb.o: $(UTILS_SRC)/usleep.h
rd-bomb.o: $(UTILS_SRC)/visual.h
rd-bomb.o: $(UTILS_SRC)/yarandom.h
ripples.o: ../config.h
ripples.o: $(srcdir)/fps.h
ripples.o: $(srcdir)/screenhackI.h
ripples.o: $(srcdir)/screenhack.h
ripples.o: $(UTILS_SRC)/colors.h
ripples.o: $(UTILS_SRC)/grabscreen.h
ripples.o: $(UTILS_SRC)/hsv.h
ripples.o: $(UTILS_SRC)/resources.h
ripples.o: $(UTILS_SRC)/usleep.h
ripples.o: $(UTILS_SRC)/visual.h
ripples.o: $(UTILS_SRC)/yarandom.h
rocks.o: ../config.h
rocks.o: $(srcdir)/fps.h
rocks.o: $(srcdir)/screenhackI.h
rocks.o: $(srcdir)/screenhack.h
rocks.o: $(UTILS_SRC)/colors.h
rocks.o: $(UTILS_SRC)/grabscreen.h
rocks.o: $(UTILS_SRC)/hsv.h
rocks.o: $(UTILS_SRC)/resources.h
rocks.o: $(UTILS_SRC)/usleep.h
rocks.o: $(UTILS_SRC)/visual.h
rocks.o: $(UTILS_SRC)/yarandom.h
rorschach.o: ../config.h
rorschach.o: $(srcdir)/fps.h
rorschach.o: $(srcdir)/screenhackI.h
rorschach.o: $(srcdir)/screenhack.h
rorschach.o: $(UTILS_SRC)/colors.h
rorschach.o: $(UTILS_SRC)/erase.h
rorschach.o: $(UTILS_SRC)/grabscreen.h
rorschach.o: $(UTILS_SRC)/hsv.h
rorschach.o: $(UTILS_SRC)/resources.h
rorschach.o: $(UTILS_SRC)/usleep.h
rorschach.o: $(UTILS_SRC)/visual.h
rorschach.o: $(UTILS_SRC)/yarandom.h
rotor.o: ../config.h
rotor.o: $(srcdir)/fps.h
rotor.o: $(srcdir)/screenhackI.h
rotor.o: $(UTILS_SRC)/colors.h
rotor.o: $(UTILS_SRC)/grabscreen.h
rotor.o: $(UTILS_SRC)/hsv.h
rotor.o: $(UTILS_SRC)/resources.h
rotor.o: $(UTILS_SRC)/usleep.h
rotor.o: $(UTILS_SRC)/visual.h
rotor.o: $(UTILS_SRC)/xshm.h
rotor.o: $(UTILS_SRC)/yarandom.h
rotor.o: $(srcdir)/xlockmoreI.h
rotor.o: $(srcdir)/xlockmore.h
rotzoomer.o: ../config.h
rotzoomer.o: $(srcdir)/fps.h
rotzoomer.o: $(srcdir)/screenhackI.h
rotzoomer.o: $(srcdir)/screenhack.h
rotzoomer.o: $(UTILS_SRC)/colors.h
rotzoomer.o: $(UTILS_SRC)/grabscreen.h
rotzoomer.o: $(UTILS_SRC)/hsv.h
rotzoomer.o: $(UTILS_SRC)/resources.h
rotzoomer.o: $(UTILS_SRC)/usleep.h
rotzoomer.o: $(UTILS_SRC)/visual.h
rotzoomer.o: $(UTILS_SRC)/yarandom.h
screenhack.o: ../config.h
screenhack.o: $(srcdir)/fps.h
screenhack.o: $(srcdir)/screenhackI.h
screenhack.o: $(UTILS_SRC)/colors.h
screenhack.o: $(UTILS_SRC)/grabscreen.h
screenhack.o: $(UTILS_SRC)/hsv.h
screenhack.o: $(UTILS_SRC)/resources.h
screenhack.o: $(UTILS_SRC)/usleep.h
screenhack.o: $(UTILS_SRC)/version.h
screenhack.o: $(UTILS_SRC)/visual.h
screenhack.o: $(UTILS_SRC)/vroot.h
screenhack.o: $(UTILS_SRC)/xmu.h
screenhack.o: $(UTILS_SRC)/yarandom.h
shadebobs.o: ../config.h
shadebobs.o: $(srcdir)/fps.h
shadebobs.o: $(srcdir)/screenhackI.h
shadebobs.o: $(srcdir)/screenhack.h
shadebobs.o: $(UTILS_SRC)/colors.h
shadebobs.o: $(UTILS_SRC)/grabscreen.h
shadebobs.o: $(UTILS_SRC)/hsv.h
shadebobs.o: $(UTILS_SRC)/resources.h
shadebobs.o: $(UTILS_SRC)/usleep.h
shadebobs.o: $(UTILS_SRC)/visual.h
shadebobs.o: $(UTILS_SRC)/yarandom.h
sierpinski.o: ../config.h
sierpinski.o: $(srcdir)/fps.h
sierpinski.o: $(srcdir)/screenhackI.h
sierpinski.o: $(UTILS_SRC)/colors.h
sierpinski.o: $(UTILS_SRC)/grabscreen.h
sierpinski.o: $(UTILS_SRC)/hsv.h
sierpinski.o: $(UTILS_SRC)/resources.h
sierpinski.o: $(UTILS_SRC)/usleep.h
sierpinski.o: $(UTILS_SRC)/visual.h
sierpinski.o: $(UTILS_SRC)/xshm.h
sierpinski.o: $(UTILS_SRC)/yarandom.h
sierpinski.o: $(srcdir)/xlockmoreI.h
sierpinski.o: $(srcdir)/xlockmore.h
slidescreen.o: ../config.h
slidescreen.o: $(srcdir)/fps.h
slidescreen.o: $(srcdir)/screenhackI.h
slidescreen.o: $(srcdir)/screenhack.h
slidescreen.o: $(UTILS_SRC)/colors.h
slidescreen.o: $(UTILS_SRC)/grabscreen.h
slidescreen.o: $(UTILS_SRC)/hsv.h
slidescreen.o: $(UTILS_SRC)/resources.h
slidescreen.o: $(UTILS_SRC)/usleep.h
slidescreen.o: $(UTILS_SRC)/visual.h
slidescreen.o: $(UTILS_SRC)/yarandom.h
slip.o: ../config.h
slip.o: $(srcdir)/fps.h
slip.o: $(srcdir)/screenhackI.h
slip.o: $(UTILS_SRC)/colors.h
slip.o: $(UTILS_SRC)/grabscreen.h
slip.o: $(UTILS_SRC)/hsv.h
slip.o: $(UTILS_SRC)/resources.h
slip.o: $(UTILS_SRC)/usleep.h
slip.o: $(UTILS_SRC)/visual.h
slip.o: $(UTILS_SRC)/xshm.h
slip.o: $(UTILS_SRC)/yarandom.h
slip.o: $(srcdir)/xlockmoreI.h
slip.o: $(srcdir)/xlockmore.h
speedmine.o: ../config.h
speedmine.o: $(srcdir)/fps.h
speedmine.o: $(srcdir)/screenhackI.h
speedmine.o: $(srcdir)/screenhack.h
speedmine.o: $(UTILS_SRC)/colors.h
speedmine.o: $(UTILS_SRC)/erase.h
speedmine.o: $(UTILS_SRC)/grabscreen.h
speedmine.o: $(UTILS_SRC)/hsv.h
speedmine.o: $(UTILS_SRC)/resources.h
speedmine.o: $(UTILS_SRC)/usleep.h
speedmine.o: $(UTILS_SRC)/visual.h
speedmine.o: $(UTILS_SRC)/yarandom.h
sphere.o: ../config.h
sphere.o: $(srcdir)/fps.h
sphere.o: $(srcdir)/screenhackI.h
sphere.o: $(UTILS_SRC)/colors.h
sphere.o: $(UTILS_SRC)/grabscreen.h
sphere.o: $(UTILS_SRC)/hsv.h
sphere.o: $(UTILS_SRC)/resources.h
sphere.o: $(UTILS_SRC)/usleep.h
sphere.o: $(UTILS_SRC)/visual.h
sphere.o: $(UTILS_SRC)/xshm.h
sphere.o: $(UTILS_SRC)/yarandom.h
sphere.o: $(srcdir)/xlockmoreI.h
sphere.o: $(srcdir)/xlockmore.h
spiral.o: ../config.h
spiral.o: $(srcdir)/fps.h
spiral.o: $(srcdir)/screenhackI.h
spiral.o: $(UTILS_SRC)/colors.h
spiral.o: $(UTILS_SRC)/grabscreen.h
spiral.o: $(UTILS_SRC)/hsv.h
spiral.o: $(UTILS_SRC)/resources.h
spiral.o: $(UTILS_SRC)/usleep.h
spiral.o: $(UTILS_SRC)/visual.h
spiral.o: $(UTILS_SRC)/xshm.h
spiral.o: $(UTILS_SRC)/yarandom.h
spiral.o: $(srcdir)/xlockmoreI.h
spiral.o: $(srcdir)/xlockmore.h
spotlight.o: ../config.h
spotlight.o: $(srcdir)/fps.h
spotlight.o: $(srcdir)/screenhackI.h
spotlight.o: $(srcdir)/screenhack.h
spotlight.o: $(UTILS_SRC)/colors.h
spotlight.o: $(UTILS_SRC)/grabscreen.h
spotlight.o: $(UTILS_SRC)/hsv.h
spotlight.o: $(UTILS_SRC)/resources.h
spotlight.o: $(UTILS_SRC)/usleep.h
spotlight.o: $(UTILS_SRC)/visual.h
spotlight.o: $(UTILS_SRC)/yarandom.h
squiral.o: ../config.h
squiral.o: $(srcdir)/fps.h
squiral.o: $(srcdir)/screenhackI.h
squiral.o: $(srcdir)/screenhack.h
squiral.o: $(UTILS_SRC)/colors.h
squiral.o: $(UTILS_SRC)/erase.h
squiral.o: $(UTILS_SRC)/grabscreen.h
squiral.o: $(UTILS_SRC)/hsv.h
squiral.o: $(UTILS_SRC)/resources.h
squiral.o: $(UTILS_SRC)/usleep.h
squiral.o: $(UTILS_SRC)/visual.h
squiral.o: $(UTILS_SRC)/yarandom.h
starfish.o: ../config.h
starfish.o: $(srcdir)/fps.h
starfish.o: $(srcdir)/screenhackI.h
starfish.o: $(srcdir)/screenhack.h
starfish.o: $(UTILS_SRC)/colors.h
starfish.o: $(UTILS_SRC)/grabscreen.h
starfish.o: $(UTILS_SRC)/hsv.h
starfish.o: $(UTILS_SRC)/resources.h
starfish.o: $(UTILS_SRC)/spline.h
starfish.o: $(UTILS_SRC)/usleep.h
starfish.o: $(UTILS_SRC)/visual.h
starfish.o: $(UTILS_SRC)/yarandom.h
strange.o: ../config.h
strange.o: $(srcdir)/fps.h
strange.o: $(srcdir)/screenhackI.h
strange.o: $(UTILS_SRC)/colors.h
strange.o: $(UTILS_SRC)/grabscreen.h
strange.o: $(UTILS_SRC)/hsv.h
strange.o: $(UTILS_SRC)/resources.h
strange.o: $(UTILS_SRC)/usleep.h
strange.o: $(UTILS_SRC)/visual.h
strange.o: $(UTILS_SRC)/xshm.h
strange.o: $(UTILS_SRC)/yarandom.h
strange.o: $(srcdir)/xlockmoreI.h
strange.o: $(srcdir)/xlockmore.h
substrate.o: ../config.h
substrate.o: $(srcdir)/fps.h
substrate.o: $(srcdir)/screenhackI.h
substrate.o: $(srcdir)/screenhack.h
substrate.o: $(UTILS_SRC)/colors.h
substrate.o: $(UTILS_SRC)/grabscreen.h
substrate.o: $(UTILS_SRC)/hsv.h
substrate.o: $(UTILS_SRC)/resources.h
substrate.o: $(UTILS_SRC)/usleep.h
substrate.o: $(UTILS_SRC)/visual.h
substrate.o: $(UTILS_SRC)/yarandom.h
swirl.o: ../config.h
swirl.o: $(srcdir)/fps.h
swirl.o: $(srcdir)/screenhackI.h
swirl.o: $(UTILS_SRC)/colors.h
swirl.o: $(UTILS_SRC)/grabscreen.h
swirl.o: $(UTILS_SRC)/hsv.h
swirl.o: $(UTILS_SRC)/resources.h
swirl.o: $(UTILS_SRC)/usleep.h
swirl.o: $(UTILS_SRC)/visual.h
swirl.o: $(UTILS_SRC)/xshm.h
swirl.o: $(UTILS_SRC)/yarandom.h
swirl.o: $(srcdir)/xlockmoreI.h
swirl.o: $(srcdir)/xlockmore.h
t3d.o: ../config.h
t3d.o: $(srcdir)/fps.h
t3d.o: $(srcdir)/screenhackI.h
t3d.o: $(srcdir)/screenhack.h
t3d.o: $(UTILS_SRC)/colors.h
t3d.o: $(UTILS_SRC)/grabscreen.h
t3d.o: $(UTILS_SRC)/hsv.h
t3d.o: $(UTILS_SRC)/resources.h
t3d.o: $(UTILS_SRC)/usleep.h
t3d.o: $(UTILS_SRC)/visual.h
t3d.o: $(UTILS_SRC)/yarandom.h
thornbird.o: ../config.h
thornbird.o: $(srcdir)/fps.h
thornbird.o: $(srcdir)/screenhackI.h
thornbird.o: $(UTILS_SRC)/colors.h
thornbird.o: $(UTILS_SRC)/grabscreen.h
thornbird.o: $(UTILS_SRC)/hsv.h
thornbird.o: $(UTILS_SRC)/resources.h
thornbird.o: $(UTILS_SRC)/usleep.h
thornbird.o: $(UTILS_SRC)/visual.h
thornbird.o: $(UTILS_SRC)/xshm.h
thornbird.o: $(UTILS_SRC)/yarandom.h
thornbird.o: $(srcdir)/xlockmoreI.h
thornbird.o: $(srcdir)/xlockmore.h
triangle.o: ../config.h
triangle.o: $(srcdir)/fps.h
triangle.o: $(srcdir)/screenhackI.h
triangle.o: $(UTILS_SRC)/colors.h
triangle.o: $(UTILS_SRC)/grabscreen.h
triangle.o: $(UTILS_SRC)/hsv.h
triangle.o: $(UTILS_SRC)/resources.h
triangle.o: $(UTILS_SRC)/usleep.h
triangle.o: $(UTILS_SRC)/visual.h
triangle.o: $(UTILS_SRC)/xshm.h
triangle.o: $(UTILS_SRC)/yarandom.h
triangle.o: $(srcdir)/xlockmoreI.h
triangle.o: $(srcdir)/xlockmore.h
truchet.o: ../config.h
truchet.o: $(srcdir)/fps.h
truchet.o: $(srcdir)/screenhackI.h
truchet.o: $(srcdir)/screenhack.h
truchet.o: $(UTILS_SRC)/colors.h
truchet.o: $(UTILS_SRC)/grabscreen.h
truchet.o: $(UTILS_SRC)/hsv.h
truchet.o: $(UTILS_SRC)/resources.h
truchet.o: $(UTILS_SRC)/usleep.h
truchet.o: $(UTILS_SRC)/visual.h
truchet.o: $(UTILS_SRC)/yarandom.h
twang.o: ../config.h
twang.o: $(srcdir)/fps.h
twang.o: $(srcdir)/screenhackI.h
twang.o: $(srcdir)/screenhack.h
twang.o: $(UTILS_SRC)/colors.h
twang.o: $(UTILS_SRC)/grabscreen.h
twang.o: $(UTILS_SRC)/hsv.h
twang.o: $(UTILS_SRC)/resources.h
twang.o: $(UTILS_SRC)/usleep.h
twang.o: $(UTILS_SRC)/visual.h
twang.o: $(UTILS_SRC)/yarandom.h
vermiculate.o: ../config.h
vermiculate.o: $(srcdir)/fps.h
vermiculate.o: $(srcdir)/screenhackI.h
vermiculate.o: $(srcdir)/screenhack.h
vermiculate.o: $(UTILS_SRC)/colors.h
vermiculate.o: $(UTILS_SRC)/grabscreen.h
vermiculate.o: $(UTILS_SRC)/hsv.h
vermiculate.o: $(UTILS_SRC)/resources.h
vermiculate.o: $(UTILS_SRC)/usleep.h
vermiculate.o: $(UTILS_SRC)/visual.h
vermiculate.o: $(UTILS_SRC)/yarandom.h
vines.o: ../config.h
vines.o: $(srcdir)/fps.h
vines.o: $(srcdir)/screenhackI.h
vines.o: $(UTILS_SRC)/colors.h
vines.o: $(UTILS_SRC)/erase.h
vines.o: $(UTILS_SRC)/grabscreen.h
vines.o: $(UTILS_SRC)/hsv.h
vines.o: $(UTILS_SRC)/resources.h
vines.o: $(UTILS_SRC)/usleep.h
vines.o: $(UTILS_SRC)/visual.h
vines.o: $(UTILS_SRC)/xshm.h
vines.o: $(UTILS_SRC)/yarandom.h
vines.o: $(srcdir)/xlockmoreI.h
vines.o: $(srcdir)/xlockmore.h
wander.o: ../config.h
wander.o: $(srcdir)/fps.h
wander.o: $(srcdir)/screenhackI.h
wander.o: $(srcdir)/screenhack.h
wander.o: $(UTILS_SRC)/colors.h
wander.o: $(UTILS_SRC)/erase.h
wander.o: $(UTILS_SRC)/grabscreen.h
wander.o: $(UTILS_SRC)/hsv.h
wander.o: $(UTILS_SRC)/resources.h
wander.o: $(UTILS_SRC)/usleep.h
wander.o: $(UTILS_SRC)/visual.h
wander.o: $(UTILS_SRC)/yarandom.h
webcollage-cocoa.o: ../config.h
webcollage-cocoa.o: $(srcdir)/fps.h
webcollage-cocoa.o: $(srcdir)/screenhackI.h
webcollage-cocoa.o: $(srcdir)/screenhack.h
webcollage-cocoa.o: $(UTILS_SRC)/colors.h
webcollage-cocoa.o: $(UTILS_SRC)/grabscreen.h
webcollage-cocoa.o: $(UTILS_SRC)/hsv.h
webcollage-cocoa.o: $(UTILS_SRC)/resources.h
webcollage-cocoa.o: $(UTILS_SRC)/usleep.h
webcollage-cocoa.o: $(UTILS_SRC)/visual.h
webcollage-cocoa.o: $(UTILS_SRC)/yarandom.h
webcollage-helper.o: ../config.h
whirlwindwarp.o: ../config.h
whirlwindwarp.o: $(srcdir)/fps.h
whirlwindwarp.o: $(srcdir)/screenhackI.h
whirlwindwarp.o: $(srcdir)/screenhack.h
whirlwindwarp.o: $(UTILS_SRC)/colors.h
whirlwindwarp.o: $(UTILS_SRC)/erase.h
whirlwindwarp.o: $(UTILS_SRC)/grabscreen.h
whirlwindwarp.o: $(UTILS_SRC)/hsv.h
whirlwindwarp.o: $(UTILS_SRC)/resources.h
whirlwindwarp.o: $(UTILS_SRC)/usleep.h
whirlwindwarp.o: $(UTILS_SRC)/visual.h
whirlwindwarp.o: $(UTILS_SRC)/yarandom.h
whirlygig.o: ../config.h
whirlygig.o: $(srcdir)/fps.h
whirlygig.o: $(srcdir)/screenhackI.h
whirlygig.o: $(srcdir)/screenhack.h
whirlygig.o: $(UTILS_SRC)/colors.h
whirlygig.o: $(UTILS_SRC)/grabscreen.h
whirlygig.o: $(UTILS_SRC)/hsv.h
whirlygig.o: $(UTILS_SRC)/resources.h
whirlygig.o: $(UTILS_SRC)/usleep.h
whirlygig.o: $(UTILS_SRC)/visual.h
whirlygig.o: $(UTILS_SRC)/xdbe.h
whirlygig.o: $(UTILS_SRC)/yarandom.h
wormhole.o: ../config.h
wormhole.o: $(srcdir)/fps.h
wormhole.o: $(srcdir)/screenhackI.h
wormhole.o: $(srcdir)/screenhack.h
wormhole.o: $(UTILS_SRC)/colors.h
wormhole.o: $(UTILS_SRC)/grabscreen.h
wormhole.o: $(UTILS_SRC)/hsv.h
wormhole.o: $(UTILS_SRC)/resources.h
wormhole.o: $(UTILS_SRC)/usleep.h
wormhole.o: $(UTILS_SRC)/visual.h
wormhole.o: $(UTILS_SRC)/yarandom.h
worm.o: ../config.h
worm.o: $(srcdir)/fps.h
worm.o: $(srcdir)/screenhackI.h
worm.o: $(UTILS_SRC)/colors.h
worm.o: $(UTILS_SRC)/grabscreen.h
worm.o: $(UTILS_SRC)/hsv.h
worm.o: $(UTILS_SRC)/resources.h
worm.o: $(UTILS_SRC)/usleep.h
worm.o: $(UTILS_SRC)/visual.h
worm.o: $(UTILS_SRC)/xshm.h
worm.o: $(UTILS_SRC)/yarandom.h
worm.o: $(srcdir)/xlockmoreI.h
worm.o: $(srcdir)/xlockmore.h
xanalogtv.o: $(srcdir)/analogtv.h
xanalogtv.o: ../config.h
xanalogtv.o: $(srcdir)/fps.h
xanalogtv.o: $(srcdir)/screenhackI.h
xanalogtv.o: $(srcdir)/screenhack.h
xanalogtv.o: $(UTILS_SRC)/colors.h
xanalogtv.o: $(UTILS_SRC)/grabscreen.h
xanalogtv.o: $(UTILS_SRC)/hsv.h
xanalogtv.o: $(UTILS_SRC)/images/logo-50.xpm
xanalogtv.o: $(UTILS_SRC)/resources.h
xanalogtv.o: $(UTILS_SRC)/usleep.h
xanalogtv.o: $(UTILS_SRC)/visual.h
xanalogtv.o: $(UTILS_SRC)/xshm.h
xanalogtv.o: $(UTILS_SRC)/yarandom.h
xanalogtv.o: $(srcdir)/xpm-pixmap.h
xflame.o: ../config.h
xflame.o: $(srcdir)/fps.h
xflame.o: $(srcdir)/images/bob.xbm
xflame.o: $(srcdir)/screenhackI.h
xflame.o: $(srcdir)/screenhack.h
xflame.o: $(UTILS_SRC)/colors.h
xflame.o: $(UTILS_SRC)/grabscreen.h
xflame.o: $(UTILS_SRC)/hsv.h
xflame.o: $(UTILS_SRC)/resources.h
xflame.o: $(UTILS_SRC)/usleep.h
xflame.o: $(UTILS_SRC)/visual.h
xflame.o: $(UTILS_SRC)/yarandom.h
xflame.o: $(srcdir)/xpm-pixmap.h
xjack.o: ../config.h
xjack.o: $(srcdir)/fps.h
xjack.o: $(srcdir)/screenhackI.h
xjack.o: $(srcdir)/screenhack.h
xjack.o: $(UTILS_SRC)/colors.h
xjack.o: $(UTILS_SRC)/grabscreen.h
xjack.o: $(UTILS_SRC)/hsv.h
xjack.o: $(UTILS_SRC)/resources.h
xjack.o: $(UTILS_SRC)/usleep.h
xjack.o: $(UTILS_SRC)/visual.h
xjack.o: $(UTILS_SRC)/yarandom.h
xlockmore.o: ../config.h
xlockmore.o: $(srcdir)/fps.h
xlockmore.o: $(srcdir)/screenhackI.h
xlockmore.o: $(srcdir)/screenhack.h
xlockmore.o: $(UTILS_SRC)/colors.h
xlockmore.o: $(UTILS_SRC)/grabscreen.h
xlockmore.o: $(UTILS_SRC)/hsv.h
xlockmore.o: $(UTILS_SRC)/resources.h
xlockmore.o: $(UTILS_SRC)/usleep.h
xlockmore.o: $(UTILS_SRC)/visual.h
xlockmore.o: $(UTILS_SRC)/xshm.h
xlockmore.o: $(UTILS_SRC)/yarandom.h
xlockmore.o: $(srcdir)/xlockmoreI.h
xlyap.o: ../config.h
xlyap.o: $(srcdir)/fps.h
xlyap.o: $(srcdir)/screenhackI.h
xlyap.o: $(srcdir)/screenhack.h
xlyap.o: $(UTILS_SRC)/colors.h
xlyap.o: $(UTILS_SRC)/grabscreen.h
xlyap.o: $(UTILS_SRC)/hsv.h
xlyap.o: $(UTILS_SRC)/resources.h
xlyap.o: $(UTILS_SRC)/usleep.h
xlyap.o: $(UTILS_SRC)/visual.h
xlyap.o: $(UTILS_SRC)/yarandom.h
xmatrix.o: ../config.h
xmatrix.o: $(srcdir)/fps.h
xmatrix.o: $(srcdir)/images/matrix1b.xbm
xmatrix.o: $(srcdir)/images/matrix1b.xpm
xmatrix.o: $(srcdir)/images/matrix1.xbm
xmatrix.o: $(srcdir)/images/matrix1.xpm
xmatrix.o: $(srcdir)/images/matrix2b.xbm
xmatrix.o: $(srcdir)/images/matrix2b.xpm
xmatrix.o: $(srcdir)/images/matrix2.xbm
xmatrix.o: $(srcdir)/images/matrix2.xpm
xmatrix.o: $(srcdir)/screenhackI.h
xmatrix.o: $(srcdir)/screenhack.h
xmatrix.o: $(UTILS_SRC)/colors.h
xmatrix.o: $(UTILS_SRC)/grabscreen.h
xmatrix.o: $(UTILS_SRC)/hsv.h
xmatrix.o: $(UTILS_SRC)/resources.h
xmatrix.o: $(UTILS_SRC)/textclient.h
xmatrix.o: $(UTILS_SRC)/usleep.h
xmatrix.o: $(UTILS_SRC)/visual.h
xmatrix.o: $(UTILS_SRC)/yarandom.h
xmatrix.o: $(srcdir)/xpm-pixmap.h
xpm-pixmap.o: ../config.h
xpm-pixmap.o: $(UTILS_SRC)/visual.h
xpm-pixmap.o: $(srcdir)/xpm-pixmap.h
xrayswarm.o: ../config.h
xrayswarm.o: $(srcdir)/fps.h
xrayswarm.o: $(srcdir)/screenhackI.h
xrayswarm.o: $(srcdir)/screenhack.h
xrayswarm.o: $(UTILS_SRC)/colors.h
xrayswarm.o: $(UTILS_SRC)/grabscreen.h
xrayswarm.o: $(UTILS_SRC)/hsv.h
xrayswarm.o: $(UTILS_SRC)/resources.h
xrayswarm.o: $(UTILS_SRC)/usleep.h
xrayswarm.o: $(UTILS_SRC)/visual.h
xrayswarm.o: $(UTILS_SRC)/yarandom.h
xscreensaver-sgigl.o: $(UTILS_SRC)/vroot.h
xspirograph.o: ../config.h
xspirograph.o: $(srcdir)/fps.h
xspirograph.o: $(srcdir)/screenhackI.h
xspirograph.o: $(srcdir)/screenhack.h
xspirograph.o: $(UTILS_SRC)/colors.h
xspirograph.o: $(UTILS_SRC)/erase.h
xspirograph.o: $(UTILS_SRC)/grabscreen.h
xspirograph.o: $(UTILS_SRC)/hsv.h
xspirograph.o: $(UTILS_SRC)/resources.h
xspirograph.o: $(UTILS_SRC)/usleep.h
xspirograph.o: $(UTILS_SRC)/visual.h
xspirograph.o: $(UTILS_SRC)/yarandom.h
xsublim.o: $(UTILS_SRC)/resources.h
xsublim.o: $(UTILS_SRC)/usleep.h
xsublim.o: $(UTILS_SRC)/vroot.h
xsublim.o: $(UTILS_SRC)/yarandom.h
zoom.o: ../config.h
zoom.o: $(srcdir)/fps.h
zoom.o: $(srcdir)/screenhackI.h
zoom.o: $(srcdir)/screenhack.h
zoom.o: $(UTILS_SRC)/colors.h
zoom.o: $(UTILS_SRC)/grabscreen.h
zoom.o: $(UTILS_SRC)/hsv.h
zoom.o: $(UTILS_SRC)/resources.h
zoom.o: $(UTILS_SRC)/usleep.h
zoom.o: $(UTILS_SRC)/visual.h
zoom.o: $(UTILS_SRC)/yarandom.h

