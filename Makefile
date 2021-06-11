
current_dir = $(shell pwd)
data_module = $(current_dir)/data
domain_module = $(current_dir)/domain

.PHONY: setup
setup:
	flutter clean
	cd $(data_module) && flutter pub get
	cd $(domain_module) && flutter pub get
	cd $(current_dir) && flutter pub get

.PHONY: build-runner
build-runner:
	cd $(current_dir) && flutter pub run build_runner build --delete-conflicting-outputs

.PHONY: run
run:
	flutter run

.PHONY: build-apk
build-apk:
	flutter build apk --release

.PHONY: test
test:
	cd $(current_dir) && flutter test

# SOURCES = ./lib/src
# EXPORT_FILE=./lib/domain.dart
# array := $(shell find $(SOURCES) -name '*.dart' | sed -e 's/.\/lib\///g')

# build:
# 	rm -f $(EXPORT_FILE)
# 	touch $(EXPORT_FILE)
# 	echo "library domain;" >> $(EXPORT_FILE)
# 	@for f in $(array); \
# 	do \
# 		echo "export '$${f}';" >> $(EXPORT_FILE); \
# 	done \