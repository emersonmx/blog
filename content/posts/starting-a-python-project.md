---
title: "Starting a Python \"project\""
date: 2023-03-27T14:00:00Z
---

Lately I've been creating a lot of [cookiecutter templates][1] to use in my throw
away projects. In my view it's useless, because I don't use the `cookiecutter`
tool and just copy and paste from GitHub. I even created a [script][2] (`cocu`)
to simplify the process, but I rarely use it for more complex templates. I
guess it is best to document the general process instead of just relying
only on `cookiecutter` templates blindly.

The process is quite simple, just follow this steps:

- Create and change to a new directory (`mkdir yolo && cd yolo`)
- Create a `direnv` file (`.envrc`) and allow it to run (`cocu python/direnv &&
  direnv allow .`)
- Create a `virtualenv` (`python -m venv .venv`)
- Create a simple `main.py` with a "Hello World" and start hacking

When I need a more complex project I copy the commands from my `cookiecutters`
repository and paste in a terminal. There is no mystery when I create a new
project or when I just fool around.

[1]: https://github.com/emersonmx/cookiecutters
[2]: https://github.com/emersonmx/dotfiles/blob/main/dot_local/bin/executable_cocu
