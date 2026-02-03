.PHONY: setup
setup:
	/bin/bash ./scripts/set-link.sh
.PHONY: clean
clean:
	/bin/bash ./scripts/clean-link.sh
.PHONY: setup-ubuntu
setup-ubuntu: setup
	/bin/bash ./scripts/for-ubuntu.sh
.PHONY: sh-lint
sh-lint:
	shellcheck ./scripts/*.sh -x ./scripts/common.sh
.PHONY: sh-fmt-diff
sh-fmt-diff:
	find ./scripts -name "*.sh" -exec shfmt -d {} ";"
.PHONY: sh-fmt-fix
sh-fmt-fix:
	find ./scripts -name "*.sh" -exec shfmt -w {} ";"