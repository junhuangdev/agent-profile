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

- The selected style profile or fallback contract was applied.
- The original `superpowers` workflow content is still present.
- The additive summary layer appears before long detail.
- The required visual type is present when needed.
- The main recommendation appears before implementation detail.
- Risks and decisions are explicit rather than implied.
- Findings, blockers, and "needs attention" items include concrete impact, or explicitly state that there is no material impact.
- Sentences are short, wording is plain, and jargon is avoided or explained.
