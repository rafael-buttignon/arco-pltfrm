UV ?= uv

.DEFAULT_GOAL := help

.PHONY: help check-uv install install-dev lock lint format typecheck test test-cov check pre-commit-install pre-commit-run clean

help: ## Lista os comandos disponiveis
	@awk 'BEGIN {FS = ":.*##"; printf "Comandos disponiveis:\n"} /^[a-zA-Z_-]+:.*##/ {printf "  %-22s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

check-uv: ## Verifica se o uv esta disponivel
	@command -v $(UV) >/dev/null 2>&1 || { \
		echo "uv nao encontrado. Instale com: curl -LsSf https://astral.sh/uv/install.sh | sh"; \
		exit 127; \
	}

install: check-uv ## Sincroniza dependencias principais
	$(UV) sync

install-dev: check-uv ## Sincroniza dependencias de desenvolvimento
	$(UV) sync --group dev

lock: check-uv ## Atualiza o lockfile do uv
	$(UV) lock

lint: check-uv ## Executa lint com Ruff
	$(UV) run ruff check .

format: check-uv ## Formata o projeto com Ruff
	$(UV) run ruff format .

typecheck: check-uv ## Executa checagem estatica de tipos
	@targets="$$(find src test -type f -name '*.py' 2>/dev/null)"; \
	if [ -n "$$targets" ]; then \
		$(UV) run mypy $$targets; \
	else \
		echo "Nenhum arquivo Python encontrado para typecheck."; \
	fi

test: check-uv ## Executa testes
	@if [ -d test ]; then \
		$(UV) run pytest; \
	else \
		echo "Diretorio test/ ainda nao existe."; \
	fi

test-cov: check-uv ## Executa testes com cobertura
	@if [ -d test ]; then \
		$(UV) run pytest --cov=src --cov-report=term-missing; \
	else \
		echo "Diretorio test/ ainda nao existe."; \
	fi

check: lint typecheck test ## Executa lint, typecheck e testes

pre-commit-install: check-uv ## Instala hooks de pre-commit
	$(UV) run pre-commit install

pre-commit-run: check-uv ## Executa hooks em todos os arquivos
	$(UV) run pre-commit run --all-files

clean: ## Remove caches locais
	rm -rf .mypy_cache .pytest_cache .ruff_cache htmlcov .coverage coverage.xml dist build *.egg-info
