.PHONY: deps pre-commit test


deps: pre-commit
	@echo "=== Install dependencies ==="
	poetry install

pre-commit:
	@echo "=== Setting up pre-commit ==="
	poetry run pre-commit install

test: deps
	@echo "=== Running pytest ==="
	poetry run pytest --cov=src --cov-report xml:.coverage.xml --cov-branch --cov-fail-under=100 tests/
