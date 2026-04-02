# Template: Writing-Plans Readable Summary

Use this as an additive section in a `writing-plans` plan document.

## Placement

Insert after the required `superpowers` plan header and before the first task or chunk.

## Required Sections

- `Reader Summary`
- `Execution Recommendation`
- `What This Changes`
- `Execution Flow`
- `Architecture Snapshot` when applicable
- `Main Risks`

## Skeleton

````md
## Reader Summary
- Short description of the change in user-facing terms.

## Execution Recommendation
- The recommended implementation path before the detailed tasks begin.

## What This Changes
- The highest-signal changes only.

## Execution Flow
```mermaid
flowchart LR
  A["Current State"] --> B["Task Sequence"]
  B --> C["Verification"]
  C --> D["Expected Outcome"]
```

## Architecture Snapshot
```mermaid
graph LR
  A["Entry"] --> B["Core Change"]
  B --> C["Dependency / Data"]
```

## Main Risks
- Main implementation risk
- Main verification risk
````
