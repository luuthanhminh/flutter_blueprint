
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
	cd $(data_module) && flutter pub run build_runner build --delete-conflicting-outputs
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