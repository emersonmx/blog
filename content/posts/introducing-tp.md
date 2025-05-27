---
title: "Introducing tp: Effortless Tmux Session Management"
date: 2024-08-16T10:00:00-03:00
---

Managing `tmux` sessions can sometimes involve a repetitive dance of
`new-session`, `new-window`, `split-window`, and `send-keys` commands. While
powerful, this manual setup can become cumbersome, especially for complex
project layouts or when you need to quickly spin up a consistent development
environment across different machines.

This is where `tp` comes in. Inspired by the desire for a simpler, more
declarative way to handle `tmux` sessions, `tp` is a command-line tool written
in Rust designed to streamline this process. It allows you to define your
entire `tmux` session, including multiple windows and panes with specific
directories and commands, in simple YAML configuration files, and then load
them with a single command.

## How tp Streamlines Your Workflow

`tp` tackles the problem of `tmux` session management by shifting from
imperative commands to declarative configurations. Instead of typing out every
`tmux` command, you describe your desired session structure in a file, and `tp`
brings it to life.

Here are its core features:

*   **Create New Sessions**: Quickly scaffold a new session configuration file
    with a default structure.
*   **Load Sessions**: Load a pre-defined `tmux` session. If the session
    doesn't exist, `tp` creates it; if it already exists, `tp` switches to it.
*   **List Sessions**: Easily view all available session configurations in your
    designated sessions directory.
*   **Shell Completions**: Generate shell completion scripts for various
    shells, improving discoverability and speed.

## Configuration: Defining Your Session

`tp` looks for session configuration files (YAML files with a `.yaml`
extension) in `TP_SESSIONS_DIR` environment variable, or falling back to
`$HOME/.config/tp/`.

A session file allows you to define the session's name, its base directory, and
a detailed structure of windows and panes within it.

Here’s an example structure:

```yaml
# my-project-session.yaml
name: my-project-session
directory: ~/Code/my-project
windows:
  - name: editor
    directory: ~/Code/my-project/src
    panes:
      - focus: true
        command: nvim .
  - name: server
    panes:
      - command: cargo run
  - name: tests
    panes:
      - command: cargo test
      - command: watch cargo test
```

*   **`name`**: The unique identifier for your `tmux` session.
*   **`directory`**: (Optional) The base directory for the session. This can be
    overridden at the window or pane level. Tilde `~` expansion is supported.
*   **`windows`**: (Optional) A list of window configurations.
    *   **`name`**: (Optional) The name of the `tmux` window.
    *   **`directory`**: (Optional) Overrides the session directory for this window.
    *   **`panes`**: (Optional) A list of pane configurations within the window.
        *   **`focus`**: (Optional, default: `false`) If `true`, `tp` selects
            this pane after session creation.
        *   **`directory`**: (Optional) Overrides window and session
            directories for this pane.
        *   **`command`**: (Optional) A command to execute in this pane upon
            creation.

If `windows` or `panes` are omitted, `tp` defaults to creating a single window
with a single pane.

## Usage Examples

### Create a New Session File

This command scaffolds a new session configuration file with a default
structure:

```bash
tp new my-new-session
```

Example Output:
```text
Created new session configuration at: /home/user/.config/tp/my-new-session.yaml
```

### Load a Session

Load a session defined in a configuration file. `tp` intelligently creates it
if it doesn't exist, or switches to it if it's already running.

```bash
tp load my-project-session
```

### List Sessions

See all available `tmux` session configuration files:

```bash
tp list
```

Example Output:
```text
my-project-session
another-session
my-new-session
```

### Generate Shell Completions

Integrate `tp` with your shell for autocompletion:

```bash
tp completions zsh > _tp
```

Then source it in your zshrc, e.g., `source ~/.zsh_completions/_tp`.
Replace `zsh` with your preferred shell.

## Behind the Scenes

`tp` is built with Rust, known for its performance and reliability, ensuring
that your sessions are managed swiftly and dependably. It interacts directly
with the `tmux` command-line interface, providing a robust integration without
unnecessary overhead.

## Conclusion

`tp` aims to simplify your daily `tmux` workflow by providing a powerful, yet
easy-to-use, declarative approach to session management. By defining your
sessions in clean, human-readable YAML files, you gain reproducibility,
shareability, and a significant boost in productivity. Give `tp` a try and
streamline your `tmux` experience!
