# Global AGENTS.md

This file applies to `/Users/jun` and all descendant directories as the globally mandatory ruleset.

## Global Governance Model

- `/Users/jun/AGENTS.md` provides globally mandatory rules.
- Project-local `AGENTS.md` files are additive only: they may supply project facts, commands, architecture, boundaries, and repository-specific constraints.
- Project-local `AGENTS.md` files must not weaken, bypass, or override the global rules for:
  - output quality
  - readability of plans and proposals
  - workflow baselines
- When local and global guidance both apply:
  - follow `/Users/jun/AGENTS.md` for process and response quality
  - follow the nearest project `AGENTS.md` for project-specific implementation context

## Canonical Workflow

When a `superpowers` skill applies, treat `superpowers` as the canonical workflow.

- Do not modify, weaken, skip, reorder, or replace `superpowers` workflow steps.
- Do not replace `superpowers` document structures with a new local workflow.
- Local rules in this file are **additive presentation overlay only**.
- The overlay may add summary, visuals, readability, and recommendation sections.
- The overlay must preserve the original `superpowers` engineering content, required gates, and task structure.

`/Users/jun/.codex/AGENTS.md` may add Codex-specific runtime notes, but it must stay within this global mandatory and additive-overlay model.

## Complexity Gate

Treat a task as complex when any of the following is true:

- The user asks for a plan, roadmap, proposal, approach, strategy, options, or next steps.
- The work spans multiple files, systems, or teams.
- The task involves system design, architecture, migrations, or tradeoff analysis.
- The task is likely to take more than 30 minutes of implementation or verification effort.
- The task has meaningful regression, rollout, or operational risk.

Simple requests should stay concise and may omit visuals if a diagram would not improve understanding.

## Response Style Governance

Response-style profiles live in personal skills under `~/.agents/skills/`.

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

- For complex outputs, add a short reader-friendly summary layer before long detail.
- Put the main recommendation and key risks early.
- For progress, testing, readiness, or checkpoint answers, prefer a dashboard-first order:
  - `Conclusion`
  - `Summary Metrics`
  - `Visual Status View`
  - `Next Action`
- Prefer Mermaid for visuals that materially improve clarity.
- Use one diagram per concern and keep diagrams high level unless deeper detail is explicitly requested.
- Optimize for 30-second comprehension: short sections, short paragraphs, and visible structure over dense prose.

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
- Prefer short sections over long prose.
- Use visuals and summary paragraphs to surface the main idea before technical detail.
- Keep detailed implementation notes in the original workflow body.
- Avoid letting file lists or low-level implementation notes dominate the top of the answer.

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

When useful, reuse the template library under `/Users/jun/.codex/rules/`:

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
