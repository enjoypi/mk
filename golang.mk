# https://www.gnu.org/software/make/manual/html_node/Standard-Targets.html
# https://www.gnu.org/software/make/manual/html_node/Goals.html

# Set the default goal
.DEFAULT_GOAL=all

# A phony target is one that is not really the name of a file; rather it is just a name for a recipe to be executed when you make an explicit request. There are two reasons to use a phony target: to avoid a conflict with a file of the same name, and to improve performance.
.PHONY: TAGS all check clean dist distclean info install maintainer-clean mostlyclean print tar test uninstall

# Variables
BINARY=bin/$(notdir $(PWD))
GO_FILES=$(shell find . -name "*.go" -type f -print)


# Update a tags table for this program.
TAGS:
	@echo $@

# Compile the entire program. This should be the default target. This target need not rebuild any documentation files; Info files should normally be included in the distribution, and DVI (and other documentation format) files should be made only when explicitly asked for.
# By default, the Make rules should compile and link with ‘-g’, so that executable programs have debugging symbols. Otherwise, you are essentially helpless in the face of a crash, and it is often far from easy to reproduce with a fresh build.
all: $(BINARY) fmt
	@ls $(BINARY)

# Perform self-tests (if any). The user must build the program before running the tests, but need not install the program; you should write the self-tests so that they work when the program is built but not installed.
check: ;
	@echo $@

# Delete all files in the current directory that are normally created by building the program. Also delete files in other directories if they are created by this makefile. However, don’t delete the files that record the configuration. Also preserve files that could be made by building, but normally aren’t because the distribution comes with them. There is no need to delete parent directories that were created with ‘mkdir -p’, since they could have existed anyway.
clean:
	@echo $@

# Create a distribution tar file for this program. The tar file should be set up so that the file names in the tar file start with a subdirectory name which is the name of the package it is a distribution for. This name can include the version number.
dist:
	@echo $@

# Delete all files in the current directory (or created by this makefile) that are created by configuring or building the program. If you have unpacked the source and built the program without creating any other files, ‘make distclean’ should leave only the files that were in the distribution. However, there is no need to delete parent directories that were created with ‘mkdir -p’, since they could have existed anyway.
distclean:
	@echo $@

# Generate documentation files in the given format. These targets should always exist, but any or all can be a no-op if the given output format cannot be generated. These targets should not be dependencies of the all target; the user must manually invoke them.
dvi:
html:
pdf:
ps:

# Format all sources
fmt:
	@goimports -w $(GO_FILES)

# Generate any Info files needed.
info:
	@echo $@

# Compile the program and copy the executables, libraries, and so on to the file names where they should reside for actual use. If there is a simple test to verify that a program is properly installed, this target should run that test.
install:
	@echo $@

# Delete almost everything that can be reconstructed with this Makefile. This typically includes everything deleted by distclean, plus more: C source files produced by Bison, tags tables, Info files, and so on.
maintainer-clean:
	@echo $@

# Like ‘clean’, but may refrain from deleting a few files that people normally don’t want to recompile. For example, the ‘mostlyclean’ target for GCC does not delete libgcc.a, because recompiling it is rarely necessary and takes a lot of time.
mostlyclean:
	@echo $@

# Print listings of the source files that have changed.
print:
	@echo $(GO_FILES)

# Create a tar file of the source files.
tar:
	@echo $@

# Perform self tests on the program this makefile builds.
test:
	@go test ./...

# Delete all the installed files—the copies that the ‘install’ and ‘install-*’ targets create.
uninstall:
	@echo $@

# Build binary
$(BINARY): $(GO_FILES)
	@go build -o $(BINARY)
