# Template: Automation Run Report

Use this template for Codex automation run reports.

## Goal

Make each automation result easy to scan in the first screen, while preserving the original command or script output for debugging.

## Rules

- The summary layer must be written in Chinese.
- The raw output section must preserve the original output language.
- Put the summary first and the raw output last.
- Keep the report concise, but do not omit failure causes or required follow-up.
- Include the script or command exit code in `执行结论`.

## Required Sections

1. `执行结论`
2. `关键结果`
3. `需要关注`
4. `下一步`
5. `原始输出`

## Section Expectations

### 执行结论

- One-line status: `成功`, `需处理`, or `失败`
- Task name
- Run time
- Exit code

### 关键结果

- 3 to 5 Chinese bullets
- Prefer outcome-level statements over raw log restatements
- Include the most important updated, skipped, or validated results

### 需要关注

- Failure items
- Warnings
- Manual follow-up items
- If nothing needs attention, say `- 无`

### 下一步

- Concrete next action for the user
- If no action is needed, say `- 无`

### 原始输出

- Keep the original stdout/stderr or original script summary
- Do not translate
- Use fenced code blocks when multi-line output is shown

## Skeleton

```md
## 执行结论
- 状态：成功 | 需处理 | 失败
- 任务：<task name>
- 时间：<run time>
- Exit code：<code>

## 关键结果
- ...
- ...

## 需要关注
- ...

## 下一步
- ...

## 原始输出
```text
<original output>
```
```
