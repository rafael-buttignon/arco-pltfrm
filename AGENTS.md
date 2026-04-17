# AGENTS.md

## Mission

Build this repository as a pragmatic Python data platform foundation. Keep changes small,
reviewable, tested, and aligned with explicit data contracts, quality, observability,
governance, ownership, and FinOps.

## Repository Map

- `src/core/ingestao/`: ingestion workflows, connectors, execution contexts, decorators, and metrics.
- `src/core/transformacao/`: transformation workflow, context, and decorators.
- `src/core/ml/`: machine learning workflow, context, and decorators.
- `src/utils/common/`: shared helpers, enums, exceptions, paths, logging, and feature flags.
- `src/utils/integracoes/`: external adapters such as Airflow, Datadog, dbt, Git, Google, and Slack.
- `src/utils/servicos/`: cross-cutting services for ACL, factories, FinOps, metadata, monitoring, and quality.
- `src/config/`: base project configuration.
- `test/`: unit, integration, DB support, and shared test helpers.
- `.agents/skills/`: team-shared Codex skills for this repository.
- `.github/codex/prompts/`: reusable prompts for Codex CLI, Codex GitHub Action, and manual workflows.

## Development Commands

Use the Makefile as the command contract:

```bash
make install-dev
make lint
make format
make typecheck
make test
make test-cov
make check
make pre-commit-run
```

Prefer `uv run ...` for direct tool execution. Do not assume dependencies are installed globally.

## Engineering Rules

- Inspect the relevant files before editing. Prefer `rg` and `rg --files` for discovery.
- Preserve Portuguese project terminology already used by the repository: `ingestao`,
  `transformacao`, `qualidade`, `metadados`, `contratos`, and `observabilidade`.
- Keep public functions typed and small. Use explicit domain errors instead of generic exceptions.
- Isolate external systems behind adapters in `src/utils/integracoes/`.
- Keep business/platform services in `src/utils/servicos/` and workflow orchestration in `src/core/`.
- Do not introduce a new framework, service, or abstraction unless it removes clear complexity.
- Do not commit credentials, tokens, secrets, real student/customer data, or unmasked production data.

## Testing And Verification

- Add or update focused tests when behavior changes.
- Prefer unit tests for pure rules, validators, contracts, and transformations.
- Use integration tests for adapters, storage, APIs, and external dependency boundaries.
- Run the narrowest useful check first, then `make check` before finalizing larger changes.
- If a check cannot run because dependencies or services are missing, report the blocker and what was run.

## Codex Workflow

- Use `/plan` for ambiguous, multi-step, architectural, migration, or risky tasks.
- Use `/diff` before accepting or committing Codex changes.
- Use `/review` for uncommitted changes or PR-style review.
- Use `/compact` after long sessions to keep context useful.
- Use one Codex thread per coherent task. Fork only when exploring a materially different approach.

## Skills

- Use `$data-platform-architecture` for architecture, migration, ADR, governance, observability,
  quality, SLA/SLO, and platform roadmap work.
- Use `$document-project-structure` when updating README structure, repository trees, or module
  responsibility documentation.
- Use `$skill-creator` to create or improve reusable skills after a workflow repeats.
- Use `$openai-docs` for Codex, OpenAI API, model, Responses API, Agents SDK, Apps SDK, or
  GPT upgrade questions; prefer official docs over memory.

## Done Means

- The implementation matches the requested behavior and repository conventions.
- Relevant tests, lint, formatting, and type checks have been run or explicitly reported as blocked.
- Documentation is updated when commands, architecture, setup, or public behavior changes.
- The final response lists changed files, verification performed, and any remaining risk.
