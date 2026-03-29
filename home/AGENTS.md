# Global AGENTS.md

This file applies to the user's home directory and descendant directories when installed as `~/AGENTS.md`.

## Global Governance Model

- The global `AGENTS.md` file provides globally mandatory rules.
- Project-local `AGENTS.md` files are additive only: they may supply project facts, commands, architecture, boundaries, and repository-specific constraints.
- Project-local `AGENTS.md` files must not weaken, bypass, or override the global rules for:
  - output quality
  - readability of plans and proposals
  - workflow baselines
- When local and global guidance both apply:
  - follow the global `AGENTS.md` for process and response quality
  - follow the nearest project `AGENTS.md` for project-specific implementation context

## Canonical Workflow

When a `superpowers` skill applies, treat `superpowers` as the canonical workflow.

- Do not modify, weaken, skip, reorder, or replace `superpowers` workflow steps.
- Do not replace `superpowers` document structures with a new local workflow.
- Overlay rules in this file are additive presentation guidance only.
- The overlay may add summary, visuals, readability, and recommendation sections.
- The overlay must preserve the original `superpowers` engineering content, required gates, and task structure.

`$CODEX_HOME/AGENTS.md` may add Codex-specific runtime notes, but it must stay within this global mandatory and additive-overlay model.

## Complexity Gate

Treat a task as complex when any of the following is true:

- The user asks for a plan, roadmap, proposal, approach, strategy, options, or next steps.
- The work spans multiple files, systems, or teams.
- The task involves system design, architecture, migrations, or tradeoff analysis.
- The task is likely to take more than 30 minutes of implementation or verification effort.
- The task has meaningful regression, rollout, or operational risk.

Simple requests should stay concise and may omit visuals if a diagram would not improve understanding.

## Response Style Governance

Response-style profiles live in the active agent skills directory.

- Use `default-style` when the user does not explicitly request another response style.
- Explicit style requests override `default-style` for the current turn unless the user says the change should persist.
- Route natural-language requests to the closest profile:
  - executive, stakeholder, board-level, leadership, decision memo: `executive-summary-style`
  - blunt, skeptical, critical, reviewer-style: `critical-peer-style`
  - teach, tutor, step-by-step, walk me through: `teaching-style`
- User instructions about language, format, depth, and tone override every style profile.
- Style profiles are additive overlays only. They must not weaken required workflows, verification gates, review discipline, or task structure.

## Default Fallback Contract

If style skills are unavailable, apply this compact fallback:

- Lead with the shortest useful conclusion.
- Put the main recommendation and key risks early.
- Prefer one compact visual summary over multiple prose sections.
- For progress, testing, readiness, or checkpoint answers, default to:
  - `Conclusion`
  - compact status table
  - `Next Action`
- Prefer visible structure when it reduces reading time.
- Prefer a table for status, findings, options, and comparisons.
- Prefer Mermaid for flow, rollout, or decision paths with multiple steps or branches.
- Expand only after the core answer is clear.

## Persistent Document Overlay

When `superpowers` creates persistent documents, keep the original body and add readable front matter:

- `brainstorming` specs:
  - prepend `Readable Summary`
  - include `Summary`, `Recommended Approach`, `Visual Overview`, and `Key Risks`
- `writing-plans` documents:
  - preserve the required `superpowers` header exactly
  - insert a reader layer after the header and before the first task or chunk
  - include `Reader Summary`, `What This Changes`, `Execution Flow`, `Architecture Snapshot` when relevant, `Main Risks`, and `Execution Recommendation`

## Readability Contract

- State the main conclusion and recommended path in the first 20% of any complex response or document.
- Prefer the shortest answer that still makes the decision or status clear.
- Default to one short paragraph or a few short bullets unless more structure clearly helps.
- Prefer short sections over long prose.
- Use visuals and summary paragraphs to surface the main idea before technical detail.
- Keep detailed implementation notes in the original workflow body.
- Avoid letting file lists or low-level implementation notes dominate the top of the answer.

## Fast-Scan Contract

- Optimize for one-glance comprehension before completeness.
- Start with a one-line conclusion whenever possible.
- Do not use long prose where a table or flow diagram is faster.
- Do not use headings, dashboards, or named sections for short answers unless they improve scanability.
- Do not repeat the same conclusion in multiple wrappers.
- Use structure lightly: only enough to separate distinct points.
- Prefer one compact table for:
  - status
  - findings
  - options
  - before/after comparisons
- Prefer one Mermaid diagram for:
  - process
  - rollout
  - branching logic
- Keep tables compact: short labels, short cells, 3 to 5 columns by default.
- Keep visuals high signal: one concern per table or diagram.
- Reveal extra detail only after the core answer is already clear.

## Visual-First Scan Contract

- For status or checkpoint answers, prefer:
  - one-line conclusion
  - one compact table
  - one next action
- For review answers, prefer:
  - one-line verdict
  - one findings table
  - one short recommendation block
- For option comparisons, prefer an A-vs-B table over prose paragraphs.
- For flows or sequences with 3 or more steps, prefer a Mermaid diagram over paragraph explanation.
- Long prose is fallback, not default.

## Plain Language Contract

- Use short sentences. Keep one idea per sentence.
- Use short paragraphs. Put the key point first.
- Use simple, common words. Prefer direct verbs.
- Avoid internet slang, business jargon, and industry jargon when plain words will do.
- If a technical term or acronym is necessary for accuracy, use it only when needed and explain it in plain language on first use.
- Cut filler words. If one word works, do not use three.

## Findings And Impact Contract

- When a response mentions a finding, risk, blocker, caveat, or "still needs attention" item, explain the concrete impact: what it blocks, what it affects, or what follow-up it creates.
- If the item has no material impact on current behavior, delivery, or decision-making, say that explicitly instead of leaving the impact ambiguous.
- Prefer user-visible consequences over abstract caution, for example: blocked rollout, config-doc drift, extra debugging cost, or no current runtime impact.

## Referential Clarity Contract

- Prefer explicit object names over ambiguous pronouns when referring to systems, repositories, environments, APIs, user pools, Lambda functions, or documents.
- Avoid shorthand such as `this pool`, `that config`, `it`, or `this flow` when the referent might be unclear.
- When precision matters, repeat the concrete identifier, for example:
  - `Customer Identity User Pool - Dev`
  - `us-west-2_examplePool123`
  - `send-verification-code-lambda`
  - `backend-api-service`
- If a sentence could reasonably point to more than one target, rewrite it to name the target directly.

## Template Library

When useful, reuse the template library under `$CODEX_HOME/rules/`:

- `superpowers-overlay-contract.md`
- `chat-reader-summary-template.md`
- `brainstorming-readable-summary-template.md`
- `writing-plans-readable-summary-template.md`
- `visual-flow-template.md`
- `visual-architecture-template.md`
- `visual-before-after-template.md`
- `visual-options-template.md`
- `quality-benchmark.md`

These files support the additive overlay and must not be used to replace `superpowers` core workflow content.
