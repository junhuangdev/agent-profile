# Codex Runtime Supplement

This file is a Codex-specific runtime supplement.

`/Users/jun/AGENTS.md` defines the canonical local overlay model:

- `superpowers` remains the canonical workflow when triggered.
- Local rules add presentation help only.
- Local rules do not replace `superpowers` process or document structure.

## Runtime Role

- Follow `/Users/jun/AGENTS.md` for workflow, style routing, and fallback rules.
- Use the template library under `/Users/jun/.codex/rules/` to stabilize summary blocks, visuals, and benchmark quality.
- Treat `.codex/rules/default.rules` as a permissions file, not a prompt template.

## Codex Style Routing

- When the user does not explicitly request a style, use `default-style`.
- When the user explicitly requests a named style profile or a clear natural-language equivalent, use that style instead for the current turn.
- If style skills are unavailable, apply the fallback contract from `/Users/jun/AGENTS.md`.
- Keep style routing additive. Never replace explicit user instructions or `superpowers` process requirements.

## Automation Reporting

- For automations under `/Users/jun/.codex/automations/`, default to the shared template in `/Users/jun/.codex/rules/automation-run-report-template.md` unless the user explicitly asks for a different format.
- Automation summary layers should be written in Chinese by default.
- Keep the `原始输出` section in the script or command's original language so the user can audit and debug the exact output.

## Response Quality Gate

Before finalizing a complex answer or document, verify:

- The selected style profile or fallback contract was applied.
- The original `superpowers` workflow content is still present.
- The additive summary layer appears before long detail.
- The required visual type is present when needed.
- The main recommendation appears before implementation detail.
- Risks and decisions are explicit rather than implied.
- Findings, blockers, and "needs attention" items include concrete impact, or explicitly state that there is no material impact.
- Sentences are short, wording is plain, and jargon is avoided or explained.
