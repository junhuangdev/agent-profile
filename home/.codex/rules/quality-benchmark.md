# Quality Benchmark

Use this benchmark to evaluate whether the additive overlay is improving readability without weakening `superpowers`.

## Benchmark Tasks

1. Feature implementation plan
   - Ask for a multi-file feature plan with tradeoffs and rollout risk.
2. System change proposal
   - Ask for a service or architecture change with component boundaries.
3. Architecture review recommendation
   - Ask for a critique plus a recommended redesign path.
4. Multi-option route comparison
   - Ask for two viable approaches with a final recommendation.

## Scoring Dimensions

Score each dimension from 1 to 5:

- Visual clarity
- Visual/text consistency
- Main-point visibility
- Recommendation clarity
- Risk visibility
- Overall scanability
- Superpowers detail preservation

## Pass Criteria

- The first line can stand alone as the human-readable conclusion.
- The summary layer contains only decision-useful information.
- Complex tasks include a visual when relationships or dynamic structure are easier to scan visually than in prose.
- Workflow tasks include a flow diagram.
- System design tasks include an architecture diagram.
- Tables use keywords or short phrases in cells rather than sentence-style text.
- The recommendation is clear in the first screen.
- The reader can summarize the main path and main risk within 30 seconds.
- The original `superpowers` workflow content remains present and unchanged in substance.

## Failure Signs

- The first line does not tell the reader the conclusion or recommendation.
- The summary layer includes detail that does not affect the decision.
- Large prose block before any visual
- A table uses sentence-style cells where keywords would scan faster
- Diagram included but not used to drive the explanation
- File lists or implementation detail dominate the answer
- Recommendation appears late or is ambiguous
- The diagram mixes too many concerns at once
- Summary layer replaces the original `superpowers` detail instead of prefixing it
- Required `superpowers` sections or task structures are missing after overlay is applied
