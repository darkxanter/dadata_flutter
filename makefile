
.PHONY: build_runner
build_runner:
	flutter pub run build_runner build --delete-conflicting-outputs

.PHONY: test
test:
	flutter test

.PHONY: publish
publish:
	dart pub publish
