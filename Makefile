.PHONY: deps pre-commit test reset-version


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
	sed -i -E 's/^(version = ")([0-9]+\.[0-9]+\.[0-9]+)(")/\1 0.0.1\3/' pyproject.toml
	# Update version numbers in .py files
	find . -type f -name '*.py' -exec sed -i -E 's/[0-9]+\.[0-9]+\.[0-9]+/0.0.1/g' {} +
	@echo "--- Version numbers reset to 0.0.1 ---"
