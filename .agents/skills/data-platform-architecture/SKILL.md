---
name: data-platform-architecture
description: Design, review, and document modern data platform architectures. Use when Codex is asked to plan or critique data ingestion, lakehouse/warehouse/lake design, batch or streaming pipelines, orchestration, transformation layers, semantic layers, data quality, lineage, governance, privacy, security, cost controls, observability, SLA/SLO design, migration roadmaps, or architecture decision records for analytics, BI, ML, or operational data platforms.
---

# Data Platform Architecture

## Overview

Use this skill to turn vague data platform requests into concrete architecture decisions, tradeoffs, and implementation plans. Optimize for practical system design: make assumptions explicit, tie recommendations to constraints, and identify risks before prescribing tools.

## Workflow

1. Establish context before designing.
   - Identify business goals, data consumers, source systems, data volume, latency needs, data freshness, retention, compliance constraints, existing stack, team skills, budget, and operational maturity.
   - Ask only for missing information that materially changes the architecture. When moving forward with assumptions, state them clearly.

2. Classify the workload.
   - Analytics/BI: prioritize governed models, dimensional design, semantic consistency, warehouse performance, and self-service access.
   - ML/AI: prioritize feature availability, reproducibility, lineage, training/serving parity, vector or unstructured data needs, and model feedback loops.
   - Operational data: prioritize low-latency integration, idempotency, contracts, event schemas, retries, and backfills.
   - Platform modernization: prioritize migration sequence, coexistence strategy, cost controls, cutover risk, and team enablement.

3. Design by layers.
   - Sources and contracts: ownership, schema evolution, CDC/events/files/APIs, producer SLAs.
   - Ingestion: batch, micro-batch, streaming, replay, deduplication, idempotency, quarantine paths.
   - Storage: raw/bronze, cleaned/silver, curated/gold, lakehouse/warehouse boundaries, partitioning, retention.
   - Transformation: ELT/ETL patterns, orchestration, dependency management, testing, incremental processing.
   - Serving: marts, semantic layer, APIs, reverse ETL, feature store, search/vector indexes when needed.
   - Governance: catalog, lineage, PII handling, access control, data contracts, stewardship.
   - Reliability: quality checks, observability, alerting, backfills, incident response, SLOs.
   - Cost and performance: compute isolation, autoscaling, caching, clustering, storage lifecycle, workload governance.

4. Compare options with explicit tradeoffs.
   - Prefer a small set of viable architectures instead of a long catalog of tools.
   - State why each option fits or does not fit the constraints.
   - Separate vendor/tool choices from architectural decisions whenever possible.
   - Avoid recommending streaming, real-time serving, or multi-cloud designs unless the requirements justify the operational cost.

5. Produce an actionable artifact.
   - For a design request, return target architecture, component responsibilities, data flow, operational model, risks, and phased rollout.
   - For a review request, lead with findings, severity, evidence, and concrete remediation.
   - For a migration request, include current-state constraints, interim architecture, migration waves, validation, rollback, and cutover plan.
   - For an ADR, include context, decision, alternatives, consequences, and follow-up work.

## Reference

Read `references/architecture-checklist.md` when the task needs a detailed checklist, review rubric, or ADR outline.

## Output Standards

- Be explicit about assumptions, non-goals, and unresolved decisions.
- Tie every recommendation to a requirement, constraint, or risk.
- Include data contracts, observability, security, governance, and cost in the design, not as afterthoughts.
- Prefer phased delivery plans that create working increments over big-bang platform rewrites.
- Use diagrams only when they clarify flow or ownership. Mermaid is acceptable when the user asks for a diagram or the architecture is complex.
- When naming tools, note whether the recommendation depends on the user's cloud/provider stack or whether equivalent alternatives exist.
