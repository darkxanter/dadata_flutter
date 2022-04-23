
.PHONY: build_runner
build_runner:
	dart pub run build_runner build --delete-conflicting-outputs

.PHONY: test
test:
	dart test

.PHONY: publish
publish:
	dart pub publish
