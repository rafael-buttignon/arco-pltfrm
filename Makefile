UV ?= uv

.DEFAULT_GOAL := help

.PHONY: help install install-dev lock lint format typecheck test test-cov check pre-commit-install pre-commit-run clean

help: ## Lista os comandos disponiveis
	@awk 'BEGIN {FS = ":.*##"; printf "Comandos disponiveis:\n"} /^[a-zA-Z_-]+:.*##/ {printf "  %-22s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

install: ## Sincroniza dependencias principais
	$(UV) sync

install-dev: ## Sincroniza dependencias de desenvolvimento
	$(UV) sync --group dev

lock: ## Atualiza o lockfile do uv
	$(UV) lock

lint: ## Executa lint com Ruff
	$(UV) run ruff check .

format: ## Formata o projeto com Ruff
	$(UV) run ruff format .

typecheck: ## Executa checagem estatica de tipos
	@targets="$$(find src tests -type f -name '*.py' 2>/dev/null)"; \
	if [ -n "$$targets" ]; then \
		$(UV) run mypy $$targets; \
	else \
		echo "Nenhum arquivo Python encontrado para typecheck."; \
	fi

test: ## Executa testes
	@if [ -d tests ]; then \
		$(UV) run pytest; \
	else \
		echo "Diretorio tests/ ainda nao existe."; \
	fi

test-cov: ## Executa testes com cobertura
	@if [ -d tests ]; then \
		$(UV) run pytest --cov=src --cov-report=term-missing; \
	else \
		echo "Diretorio tests/ ainda nao existe."; \
	fi

check: lint typecheck test ## Executa lint, typecheck e testes

pre-commit-install: ## Instala hooks de pre-commit
	$(UV) run pre-commit install

pre-commit-run: ## Executa hooks em todos os arquivos
	$(UV) run pre-commit run --all-files

clean: ## Remove caches locais
	rm -rf .mypy_cache .pytest_cache .ruff_cache htmlcov .coverage coverage.xml dist build *.egg-info
