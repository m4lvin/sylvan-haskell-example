
SYLVAN_VERSION = "v1.0.0"

default:
	@echo "See README.md"

sylvan-clone-patch-make-install:
	git clone --branch $SYLVAN_VERSION git@github.com:utwente-fmt/sylvan.git
	patch sylvan/CMakeLists.txt sylvan-CMakeLists.txt.patch
	patch sylvan/src/sha2.c sylvan-src-sha2.c.patch
	cd sylvan && cmake .
	cd sylvan && make
	cd sylvan && sudo make install
	rm -rf sylvan
