# Codex Runtime Supplement

This file is a Codex-specific runtime supplement.

The global `AGENTS.md` file defines the canonical overlay model:

- `superpowers` remains the canonical workflow when triggered.
- Overlay rules add presentation help only.
- Overlay rules do not replace `superpowers` process or document structure.

## Runtime Role

- Follow the global `AGENTS.md` file for workflow, style routing, and fallback rules.
- Use the template library under `$CODEX_HOME/rules/` to stabilize summary blocks, visuals, and benchmark quality.
- Treat `$CODEX_HOME/rules/default.rules` as a permissions file, not a prompt template.

## Codex Style Routing

- When the user does not explicitly request a style, use `default-style`.
- When the user explicitly requests a named style profile or a clear natural-language equivalent, use that style instead for the current turn.
- If style skills are unavailable, apply the fallback contract from the global `AGENTS.md` file.
- Keep style routing additive. Never replace explicit user instructions or `superpowers` process requirements.

## Automation Reporting

- For automations under `$CODEX_HOME/automations/`, default to the shared template in `$CODEX_HOME/rules/automation-run-report-template.md` unless the user explicitly asks for a different format.
- Automation summary layers should be written in Chinese by default.
- Keep the `原始输出` section in the script or command's original language so the user can audit and debug the exact output.

## Response Quality Gate

Before finalizing a complex answer or document, verify:

- A one-sentence human-readable version appears before any table or long detail when the answer includes a decision, recommendation, or status judgment.
- The summary layer keeps only decision-useful information; non-critical detail is moved down or omitted.
- The selected style profile or fallback contract was applied.
- The original `superpowers` workflow content is still present.
- The additive summary layer appears before long detail.
- The required visual type is present when needed.
- The main recommendation appears before implementation detail.
- Risks and decisions are explicit rather than implied.
- Findings, blockers, and "needs attention" items include concrete impact, or explicitly state that there is no material impact.
- Sentences are short, wording is plain, and jargon is avoided or explained.
- The answer is not over-structured for its size.
- The conclusion is stated once, early, and without redundant wrappers.
- A table is used when status, findings, options, or comparisons would otherwise become long prose.
- A visual is used for flows, architecture, dependencies, hierarchies, or other relationship-heavy information when it reduces reading effort.
- Tables stay compact enough to avoid horizontal scrolling when possible.
- Table cells use keywords or short phrases rather than sentence-style text.
- Cell text may wrap when that keeps the table readable without adding extra columns.
- Long paths, commands, or caveats are moved below the table when they would make the table too wide.
- Sentence-level explanation is moved below the table instead of staying inside cells.
- If wrapping would make cells too tall, detail is moved below the table instead.
- A Mermaid diagram is used when flow or sequence is faster to scan visually than in text.
- No visual is included if it adds more explanation cost than it saves.
- The first screen shows the conclusion and recommendation before detail.
