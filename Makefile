
default:
	@echo "See README.md"

sylvan-clone-patch-make-install:
	git clone git@github.com:utwente-fmt/sylvan.git
	patch sylvan/CMakeLists.txt sylvan-CMakeLists.txt.patch
	cd sylvan && cmake .
	cd sylvan && make
	cd sylvan && sudo make install
	rm -rf sylvan
