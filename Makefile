##################################
# <jwright> Well, I may be doing stupid things with make
# <jwright> OK, it was Makefile stupid'ness
# <jwright> I don't really understand what the hell I am doing with Make, I'm
#           just copying other files and seeing what works.
# <dragorn> heh
# <dragorn> i think thats all anyone does
# <dragorn> make is a twisted beast
##################################
CFLAGS		= -g3 -Og -Wall
CPPFLAGS	=
LDLIBS		= -lpcap

PROG		= asleap genkeys
COMMON_OBJS	= common.o des.o des-tables.o md4.o sha1.o utils.o

all: $(PROG)

asleap: asleap.o $(COMMON_OBJS)
	$(CC) $(CFLAGS) -o $@ $^ $(LDLIBS)

genkeys: genkeys.o $(COMMON_OBJS)
	$(CC) $(CFLAGS) -o $@ $^ $(LDLIBS)

asleap.o: asleap.c asleap.h utils.h common.h version.h sha1.h radiotap.h \
 byteswap.h ieee80211.h ieee8021x.h ietfproto.h
common.o: common.c common.h utils.h md4.h
des.o: des.c des.h
des-tables.o: des-tables.c des.h
genkeys.o: genkeys.c common.h version.h utils.h
sha1.o: sha1.c common.h sha1.h
md4.o: md4.c md4.h
utils.o: utils.c utils.h

clean:
	-rm -f $(PROG) asleap.o genkeys.o $(COMMON_OBJS)

strip:
	@ls -l $(PROG)
	@strip $(PROG)
	@ls -l $(PROG)
