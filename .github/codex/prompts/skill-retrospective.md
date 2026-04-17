# Skill And Instruction Retrospective

Use this prompt after Codex repeats a mistake or a workflow becomes reusable.

Review the recent task, `AGENTS.md`, and `.agents/skills/`.

Output:
- Repeated friction observed.
- Whether the fix belongs in `AGENTS.md`, an existing skill, a new skill, or a reusable prompt.
- The exact minimal edit recommended.
- Any risk of overfitting the instruction to one task.

Do not add broad rules. Prefer small instructions based on real recurring friction.
