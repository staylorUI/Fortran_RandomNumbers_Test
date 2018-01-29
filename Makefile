# FC = the compiler to use
FC=gfortran

# Compiler options
FFLAGS=-g -ffree-line-length-none -cpp  -O2
#-fcheck=all -Wall -DWRITE_PARM(for writing parameters out!)

# List libraries used by the program here
LIBS= #-L/usr/lib/x86_64-linux-gnu -L/usr/lib -lpthread -lz -lm -ldl

# for sub-dir
VPATH=

# Suffix-rules:  Begin by throwing away all old suffix-
# rules, and then create new ones for compiling
# *.f90-files.
.SUFFIXES:
.SUFFIXES: .f90 .o


.f90.o:
	$(FC) -c $(FFLAGS) $<

	# Script to generate the dependencies
MAKEDEPEND=fort_depend.py

# $(DEP_FILE) is a .depend file generated by fort_depend.py
DEP_FILE = .depend
OBJECTS = Random.f90 \
tmain.f90 

#############
# Make sure everything depends on the .dep file
#all: $(actual_executable) $(DEP_FILE)
FOBJ= Random.o \
tmain.o 

Generate20RanNums: $(FOBJ)
	@echo "$(FOBJ)"
	$(FC) $(FFLAGS) $(LDFLAGS) $(FOBJ) $(LIBS) -o $@

# Make dependencies
.PHONY: depend
depend: $(DEP_FILE)

# The .dep file depends on the source files, so it automatically gets updated
# when you change your source
$(DEP_FILE): $(OBJECTS)
	@echo "Making dependencies!"
	python $(MAKEDEPEND) -w -o $(DEP_FILE) -f $(OBJECTS)

include $(DEP_FILE)


# Include the dependency-list
#include .depend


# target 'clean' for deleting object- *.mod- and other
# unwanted files
clean:
	rm -f *.o *.mod Generate20RanNums


# Does not work in windows, using a python script instead (above)
# Create a dependency list using makedepf90.  All files
# that needs to be compiled to build the program,
# i.e all source files except include files, should
# be given on the command line to makedepf90.
#
# The argument to the '-o' option will be the name of the
# resulting program when running 'make', in this case
# 'foobar'
#depend .depend:
#	makedepf90 -Wmissing -W -o Generate20RanNums *.f90 > .depend
