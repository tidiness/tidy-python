
deps: pre-commit
	@echo "=== Install dependencies ==="
	poetry install

pre-commit:
	@echo "=== Setting up pre-commit ==="
	poetry run pre-commit install

test:
	@echo "=== Running pytest ==="
	poetry run pytest --cov=src --cov-branch --cov-fail-under=100 tests/
