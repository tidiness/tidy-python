.PHONY: deps pre-commit test customize_template


deps:
	@echo "=== Install dependencies ==="
	poetry install

pre-commit: deps
	@echo "=== Setting up pre-commit ==="
	poetry run pre-commit install

customize_template:
	@read -p "Enter the new package name: " new_package_name; \
	./customize_template_repo.py $$new_package_name

test: deps pre-commit
	@echo "=== Running pytest ==="
	poetry run pytest --cov=src --cov-report xml:.coverage.xml --cov-branch --cov-fail-under=100 tests/
	@echo "--- Listing files ---"
	ls -lart
