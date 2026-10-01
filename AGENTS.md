# AGENTS.md

Personal developer journal ("Emerson MX — Developer Journal") built with Hugo,
served at <https://blog.emersonmx.dev/>. All content is written in English.

## Layout

- `content/posts/` — blog posts, one Markdown file per post.
- `content/policies/` — privacy policies for the author's apps (GymNerd,
  TicTacToe), rendered by `layouts/policies/single.html`.
- `layouts/` — site-level overrides of the theme; a file here wins over the
  same path in `themes/simple/layouts/`.
- `themes/simple/` — the in-repo theme (not a submodule): Go templates plus
  Tailwind CSS v4 via PostCSS.
- `public/` — build output, git-ignored; never edit it.

Commands live in `justfile` (`just server` previews with drafts, `just build`
builds for production).

## Writing posts

- Create with `hugo new posts/<slug>.md`; the filename is the URL
  (`/posts/<slug>/`). Renaming a published post breaks its URL.
- Front matter is YAML with `title` (Title Case, quoted) and `date` (ISO 8601
  with `-03:00` offset). No tags, categories, or summary fields are used.
- `draft: true` marks unpublished posts. Empty drafts act as placeholders for
  planned posts in a series (e.g. the Charlene series announced in
  `building-charlene.md`). Publishing = write the body, remove `draft`, set
  `date` to the publish time.
- When a series post is published, link it from the series index post with the
  same reference-link style.
- Prose style, matching existing posts:
  - Hard-wrap lines at 80 columns.
  - Reference-style links (`[text][1]`) with the definitions at the end of the
    file; internal links as root-relative paths (`/posts/<slug>/`).
  - `##` for sections (the page title is the `h1`); fenced code blocks with an
    explicit language, since `guessSyntax` is off.
  - First-person, conversational, technical tone.
- `typographer` is disabled: quotes and dashes render exactly as typed.

## Theme changes

`themes/simple/assets/css/style.css` is generated from
`themes/simple/src/css/` by `just build-theme` and is committed. After changing
Tailwind classes in templates or the source CSS, rebuild and commit the
generated file alongside the change. Format templates with the theme's Prettier
config (`npx prettier --write` inside `themes/simple/`).

## Deploy

Every push to `main` triggers `.github/workflows/`, which runs `just build` and
commits `public/` to the `emersonmx/emersonmx.github.io` repository. A push to
`main` is a publish: confirm before pushing.

## Commits

Conventional Commits: `feat:` for new posts, `chore:` for drafts, reviews,
config, and dependency updates.
