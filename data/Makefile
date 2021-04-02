SOURCES = ./lib/src
EXPORT_FILE=./lib/data.dart
array := $(shell find $(SOURCES) -name '*.dart' | sed -e 's/.\/lib\///g')

build:
	rm -f $(EXPORT_FILE)
	touch $(EXPORT_FILE)
	echo "library domain;" >> $(EXPORT_FILE)
	@for f in $(array); \
	do \
		echo "export '$${f}';" >> $(EXPORT_FILE); \
	done \
