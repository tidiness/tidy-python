
deps: pre-commit
	@echo "=== Install dependencies ==="
	poetry install

pre-commit:
	@echo "=== Setting up pre-commit ==="
	poetry run pre-commit install