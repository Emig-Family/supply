# AGENTS.md - AI Development Guide

## Project Knowledge

A content-driven static inventory/catalog site built with Astro and TypeScript that renders item pages from YAML content and is deployable via Cloudflare Workers (Wrangler).

**Technology Stack:**
- Astro
- TypeScript
- Tailwind CSS
- Node.js / npm
- Cloudflare Workers (Wrangler)
- GitHub Actions (CI)

**Core Features:**
- Content-driven inventory using YAML and `astro:content`
- Per-item pages with image galleries and modal viewer
- Static site generation (SSG) with dynamic routing (`[...slug].astro`)
- Simple request-by-email flow (mailto links)
- Deployable with Wrangler / Cloudflare Workers

### Basic Repo Layout
- **Site root:** `site/` — Astro project; run `npm install`, `npm run dev`, `npm run build` here.
- **Content:** `site/src/content/inventory/` — YAML item files consumed by `astro:content`.
- **Images:** `site/public/images/` — static images served at `/images/...`.

### GitHub Data Access

- **ALWAYS use GitHub CLI for GitHub data** - NEVER use webfetch for issues, PRs, or other GitHub information
- **Issue information**: Use `gh issue view <number>`
- **PR information**: Use `gh pr view <number>`
- **PR diff**: Use `gh pr diff <number>`
- **Examples**:
  - ✅ Good: `gh issue view 7` (clean, structured output)
  - ❌ Bad: `webfetch` with GitHub URL (scraped HTML, verbose output)

### Issue Specifications

- **File Naming**: Use format `{issue-number}-{brief-description}.md` in `specs/`
- **Structure**: 
  - Title with issue link: `# Title\n\nhttps://github.com/emig-family/supply/issues/{number}`
  - Brief plan description
  - Design decisions section (if applicable)
  - Task List with sections corresponding to atomic pull requests
    - Each section header represents one PR
    - Items within section are changes included in that PR (not necessarily atomic)
    - Use `[ ]` for pending and `[x]` for completed
- **Style**: 
  - ✅ Good: Simple, scannable checklist format
  - ✅ Good: Group related items logically
  - ❌ Avoid: Verbose descriptions, detailed explanations, multiple sections
- **TDD Approach**: Each task item should include tests first, then implementation
  - ✅ Good: "Add tests for X", "Implement X"
  - ❌ Bad: Separate testing section at the end
- **Task List Structure**: 
  - Each section = one atomic pull request
  - Items within section = changes included in that PR (can be multiple related changes)
  - ✅ Good: Section with multiple related implementation items
  - ❌ Bad: Each individual item as separate PR

### Specification Development Process

- **CRITICAL**: DO NOT make code changes while working on specifications
- **Specification phase**: Focus only on planning, design, and Task List creation
- **Implementation phase**: After spec is finalized, then proceed with code changes
- **Examples**:
  - ✅ Good: Discussing TDD approaches, test strategies, implementation order
  - ❌ Bad: Reading files, writing tests, or implementing code during spec phase
- **When in doubt**: If you're about to read/write code files, stop - you're still in spec phase

### TDD Implementation Process

**CRITICAL**: Always follow Test-Driven Development (TDD) when implementing features:

1. **Tests First**: Write tests BEFORE implementing any code
   - ✅ Good: "Add tests for X", then "Implement X" 
   - ❌ Bad: "Implement X", then "Add tests for X"
   - ✅ Good: Plan implementation order based on test requirements
   - ❌ Bad: Plan implementation without considering test structure

2. **Implementation Order**: 
   - Read the spec task list carefully - tests are always listed before implementation
   - Write failing tests first
   - Implement minimal code to make tests pass
   - Refactor if needed

3. **Examples**:
   - ✅ Good: "First I'll add tests for the new ACL storage methods, then implement the interface methods"
   - ❌ Bad: "I'll implement the ACL storage interface, then add tests for it"

4. **When in doubt**: If you're about to implement code without writing tests first, stop - you're violating TDD principles

### Git Workflow

- Feature branches for issues (e.g., `63-new-setting`)
- Use GitHub CLI for PR creation: `gh pr create`
- Commit messages follow conventional format: `feat:`, `refactor:`, `chore:`, `fix:`, etc.

### Opencode Commands

Opencode commands are defined as separate markdown files in `.opencode/command/`. Each command file should:
- Have a `description` and `agent` in the frontmatter
- Contain the command logic and usage instructions
- Follow the naming convention `{command-name}.md`

See `.opencode/command/` directory for examples.

**Common mistake to avoid:** Do NOT add command documentation to AGENTS.md. Commands belong in their own files in `.opencode/command/`.

### Naming Scheme

- **Code Names (variables, methods, functions)**: Don't put acronyms as all-caps in names. For example, use `AclRule` rather than `ACLRule` for an ACL rule.
  - This way, words are clearly differentiated by case.
  - Examples: `CreateApiKey`, `GetAclRules`, `UpdateAclRule` (NOT: `CreateAPIKey`, `GetACLRules`)
- **Documentation**: Use normal capitalization for acronyms in plain text, comments, and documentation.
  - Examples: "API key", "ACL rule", "REST API" (NOT: "ApiKey", "AclRule" in documentation)

### Standard Library Usage

**CRITICAL**: Always use functions from the standard library when possible, rather than creating custom helper functions.
