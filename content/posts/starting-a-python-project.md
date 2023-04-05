---
title: "Starting a Python \"project\""
date: 2023-03-27T14:00:00Z
---

Lately I've been creating a lot of [cookiecutter templates][1] to use in my
throw away projects. I even created a [script][2] (`cocu`) to simplify the
process, but I rarely remember to use it. During this period I struggled a
lot with the `cookiecutter`, but in the end I came to the conclusion that it
is simpler to document the process of creating a new project than to depend
blindly on it.

The process I'm following is quite simple, just follow these steps:

- Create and change to a new directory (`mkdir yolo && cd yolo`)
- Create a `direnv` file (`.envrc`) and allow it to run (`cocu python/direnv &&
  direnv allow .`)
- Create a `virtualenv` (`python -m venv .venv`)
- Create a simple `main.py` with a "Hello World" and start hacking

Until I find a simpler way to do this for more complex projects, I'll keep
creating projects manually.

[1]: https://github.com/emersonmx/cookiecutters
[2]: https://github.com/emersonmx/dotfiles/blob/main/dot_local/bin/executable_cocu
