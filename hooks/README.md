# Hooks (OpenClaw Adaptation)

This folder provides a portable hook intent mapping adapted from ECC.

## Purpose

Translate hook-driven quality/safety intent into OpenClaw-compatible workflows.

## Files

- `hooks.json` — hook profile intent and mapped actions

## Notes

- OpenClaw runtime behavior differs from ECC/Claude hook lifecycle.
- Use these definitions as policy references and workflow defaults.
- Prefer script-backed checks in `scripts/` for reproducible behavior.
