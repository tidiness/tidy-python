.PHONY: deps pre-commit test reset-version

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
	SED_INPLACE := sed -i ''
else
	SED_INPLACE := sed -i
endif

deps:
	@echo "=== Install dependencies ==="
	poetry install

pre-commit: deps
	@echo "=== Setting up pre-commit ==="
	poetry run pre-commit install

test: deps pre-commit
	@echo "=== Running pytest ==="
	poetry run pytest --cov=src --cov-report xml:.coverage.xml --cov-branch --cov-fail-under=100 tests/
	@echo "--- Listing files ---"
	ls -lart

reset-version:
	@echo "=== Resetting version numbers to 0.0.1 ==="
	# Only update the version field in pyproject.toml
	$(SED_INPLACE) -E 's/^(version = ")([0-9]+\.[0-9]+\.[0-9]+)(")/\10.0.1\3/' pyproject.toml
	# Update version numbers in .py files
	find . -type f -name '*.py' -exec $(SED_INPLACE) -E 's/[0-9]+\.[0-9]+\.[0-9]+/0.0.1/g' {} +
	@echo "--- Version numbers reset to 0.0.1 ---"
