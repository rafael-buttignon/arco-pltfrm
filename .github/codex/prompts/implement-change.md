# Implement Change

Use this prompt with Codex CLI, Codex app, or Codex GitHub Action.

Goal:
- Implement the requested change in this repository with minimal, focused edits.

Repository rules:
- Read `AGENTS.md` first.
- Use `make install-dev` only when dependencies are missing.
- Prefer `make lint`, `make typecheck`, `make test`, and `make check` for validation.
- Keep data-platform concepts aligned with contracts, quality, observability, governance,
  ownership, and FinOps.

Execution:
- Inspect relevant files before editing.
- Preserve existing user changes.
- Add or update tests when behavior changes.
- Update documentation when setup, commands, public behavior, or architecture changes.

Done when:
- The code matches the request.
- Relevant checks have passed or blockers are explicit.
- The final response summarizes changed files and verification.
