# Superpowers Overlay Contract

Use this contract when a `superpowers` skill is active and the output needs to be easier to scan.

## Core Rule

`superpowers` owns the workflow.
This overlay only adds a reader-friendly layer before the original detailed content.

## Overlay Outcomes

The reader should be able to understand, within the first screen:

- what the work is trying to achieve
- what the recommended path is
- what the main risk is
- which diagram to look at first

## Allowed Additions

- reader summary sections
- high-level diagrams
- recommendation-first framing
- short risk callouts

## Forbidden Changes

- deleting required `superpowers` sections
- rewriting `superpowers` task structure
- removing TDD or verification steps
- replacing detailed engineering content with summary-only prose

## Completion Bar

The overlay is incomplete if:

- the summary appears but the original `superpowers` body is missing
- the original plan/spec structure is altered instead of prefixed
- the reader cannot identify the main path in the first screen
- a diagram is needed but omitted
