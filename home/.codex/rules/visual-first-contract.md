# Visual-First Contract

Use this contract as the visual sub-rule inside the local additive overlay.
It helps the reader understand the main path quickly, but it does not replace `superpowers` workflow content.

## Outcome

The reader should understand the main path from the visual alone, then use the text to confirm:

- the goal
- the recommended path
- the main risks
- the decisions that still need confirmation

Use visuals to lower reading effort for relationship-heavy or dynamic information, not to decorate the answer.

## Required Structure

For non-trivial plans or proposals, the reader-facing overlay should use:

1. `Conclusion`
2. `Recommendation`
3. `Visuals`
4. `Risks And Decisions`
5. `Implementation Notes` when needed

Add `Implementation Notes` only when extra detail prevents mistakes.

## Diagram Selection

- Use `flowchart` for workflow, delivery phases, sequencing, branching, or dependencies.
- Use `graph` for system components, boundaries, interfaces, or architecture.
- Use visuals for hierarchies, ownership, and dependency shape when prose would force the reader to reconstruct relationships mentally.
- Use a before/after layout for change explanation.
- Use an option-comparison layout for meaningful tradeoffs.

## When Not To Visualize

- Do not add a diagram for isolated facts or a single recommendation with no meaningful structure.
- Do not add a diagram when a short sentence or compact table is faster.
- Do not make the reader decode a dense visual just to recover a simple conclusion.

## Completion Bar

The visual portion of the overlay is incomplete if:

- a complex process explanation has no flow visual
- a system design explanation has no architecture visual
- a relationship-heavy explanation forces the reader to reconstruct the model from prose alone
- the diagram appears after long explanation instead of before it
- the recommendation is not obvious in the first screen
- the text repeats the full diagram instead of interpreting it
