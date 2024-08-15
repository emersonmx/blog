---
title: "Skelly: A Scaffold Tool"
date: 2024-08-15T16:30:11-03:00
---

I've been facing issues with scaffold tools for a long time, whether because
they’re slow or missing essential features. But one day, I got tired of these
limitations and decided to create my own tool 😁.

I chose a trendy language ([Rust][1]) and started looking for libraries that could
help me implement what I had in mind. I wanted something easy to install, with
a template engine similar to [Jinja2][2], that could work with pipes and offer
only the essentials.

I won’t say it was easy, as I barely knew [clap][3] and [tera][4]. I struggled
a lot with the borrow checker 😅, but in the end, I managed to finish
[Skelly][5]! To complement it, I also started creating my own templates in the
[ossuary][6].

[1]: https://www.rust-lang.org/
[2]: https://jinja.palletsprojects.com/en/2.10.x/
[3]: https://docs.rs/clap/latest/clap/
[4]: https://docs.rs/tera/latest/tera/
[5]: https://github.com/emersonmx/skelly
[6]: https://github.com/emersonmx/ossuary
