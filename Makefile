# Aerospike Inc.
# Makefile

all: libcitrusleaf
	$(MAKE) -C example
	$(MAKE) -C tests/key_c 
	$(MAKE) -C tests/loop_c

	@echo "done."

INCLUDE_PATH?=include
LIBRARY_PATH?=lib
PREFIX?=/usr/local
DIR_INCLUDE= include
INSTALL?= cp -a
INSTALL_INCLUDE_PATH= $(PREFIX)/$(INCLUDE_PATH)
INSTALL_LIBRARY_PATH= $(PREFIX)/$(LIBRARY_PATH)

install: libcitrusleaf
	mkdir -p $(INSTALL_INCLUDE_PATH) $(INSTALL_LIBRARY_PATH)
	$(INSTALL) ${DIR_INCLUDE}/* $(INSTALL_INCLUDE_PATH)
	$(INSTALL) ${LIBRARY_PATH}/* $(INSTALL_LIBRARY_PATH)
	@echo "installation done."

clean:
	rm -f obj/i86/*
	rm -f obj/x64/*
	rm -f obj/native/*
	rm -f lib/*
	rm -f lib32/*
	rm -f lib64/*
	rm -f example/cl_example
	rm -f example/obj/*
	rm -f tests/key_c/obj/*
	rm -f tests/key_c/bin/*
	rm -f tests/loop_c/obj/*
	rm -f tests/loop_c/bin/*

%:
#	$(MAKE) -f Makefile.32 -C src $@   # some are having trouble with the xcompile
#	$(MAKE) -f Makefile.64 -C src $@
	$(MAKE) -f Makefile.native -C src $@

