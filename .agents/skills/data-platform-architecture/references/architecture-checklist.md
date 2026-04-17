# Data Platform Architecture Checklist

Use this reference when designing, reviewing, or documenting a data platform architecture.

## Discovery

- Business outcome: what decisions, products, models, or operations the platform supports.
- Consumers: BI users, analysts, engineers, data scientists, applications, partners, regulators.
- Source systems: ownership, schema stability, extraction method, expected growth, source SLAs.
- Data characteristics: volume, velocity, variety, sensitivity, retention, correctness expectations.
- Freshness: acceptable latency by domain and consumer, not a single platform-wide target.
- Operations: team size, on-call model, incident process, current platform pain points.
- Constraints: cloud/provider, existing contracts, procurement, compliance, residency, budget.

## Architecture Review Rubric

- Ingestion is idempotent, replayable, observable, and tolerant of schema evolution.
- Raw data is preserved when legally and economically appropriate.
- Curated data has clear ownership, tests, definitions, and lineage.
- Transformations are incremental where useful and full-refresh where simpler and affordable.
- Orchestration expresses dependencies, retries, backfills, and SLAs without hiding failures.
- Data quality checks exist at source, transformation, and serving boundaries.
- Access control follows least privilege and handles PII/PHI/financially sensitive data explicitly.
- Catalog and lineage support discovery, impact analysis, and audit needs.
- Serving layers match consumer needs: marts, semantic layer, APIs, feature store, reverse ETL, or search.
- Cost controls isolate workloads, cap runaway jobs, and expose usage by domain/team.
- Disaster recovery and recovery objectives are defined for critical datasets.
- The design has a migration path from current state and a rollback story for high-risk changes.

## Common Tradeoffs

- Batch vs streaming: choose streaming for event-time decisions, operational triggers, or strict freshness; choose batch when latency tolerance and simplicity allow it.
- Lakehouse vs warehouse: use lakehouse strengths for open formats, large-scale raw/semi-structured data, ML adjacency, and flexible storage; use warehouse strengths for governed BI, concurrency, mature optimization, and SQL-first operations.
- Centralized vs domain-owned data: centralize when governance and consistency dominate; decentralize ownership when domain expertise, scale, and delivery speed justify stronger contracts.
- ETL vs ELT: prefer ELT when warehouse/lakehouse compute is strong and raw preservation matters; prefer ETL when reducing downstream exposure, cost, or sensitive data movement is critical.
- One platform vs specialized serving systems: keep one platform when needs are analytical and latency-tolerant; add serving systems only for clear latency, search, ML, or operational integration requirements.

## ADR Outline

Use this structure for architecture decision records:

```markdown
# ADR: <decision title>

## Status
Proposed | Accepted | Superseded

## Context
What problem, constraints, and requirements drove the decision.

## Decision
The chosen architecture or pattern and the scope it applies to.

## Alternatives Considered
Options rejected or deferred, with concrete reasons.

## Consequences
Operational impact, risks, costs, migration needs, and follow-up decisions.

## Validation
Tests, metrics, pilots, or checkpoints that will prove the decision works.
```

## Delivery Plan Shape

1. Baseline: inventory sources, consumers, data contracts, current pain, and platform metrics.
2. Foundation: storage zones, ingestion standard, orchestration, access model, catalog, CI/CD.
3. First domain: implement one valuable data product end to end with tests and observability.
4. Scale: repeat patterns across domains, add self-service templates, formalize ownership.
5. Optimize: tune cost/performance, retire legacy paths, strengthen SLOs and incident process.
