######
#
# For testing xatsctp
#
######
ECHO=echo
######
XATSCTP=\
"./../../../bin/xatsctp"
######
all:: test
######
test:: ; $(XATSCTP)
######
test:: \
fact01
fact01: ; \
$(XATSCTP) -d ./fact01.dats
test:: \
fact02
fact02: ; \
$(XATSCTP) -d ./fact02.dats
######
test:: \
fibo01
fibo01: ; \
$(XATSCTP) -d ./fibo01.dats
test:: \
fibo02
fibo02: ; \
$(XATSCTP) -d ./fibo02.dats
######

######
#
# HX: for cleaning up
#
######
clean:: ; rm -f *~
######
cleanall:: clean
cleanall:: ; rm -f output
######
# export XATSHOME=$(XANADU)
# XANADU=$(shell pwd)/../../xanadu
######
###### end of [Makefile_output] ######
