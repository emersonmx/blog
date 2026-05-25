---
title: "Building Charlene"
date: 2026-05-25T11:59:20-03:00
---

Charlene is a modern HTTP/HTTPS request inspector with a TUI, created to help
developers analyze traffic between clients and servers. This post is a general
overview of the project and serves as an introduction to a series of future
posts, where each technical aspect will be explored in detail.

## What is Charlene?

An open source HTTP/HTTPS proxy with a terminal user interface for real-time
inspection of requests and responses. Inspired by tools like Charles, but free
and cross-platform.

## Why build Charlene?

Although there are alternatives on the market, I wanted a free, simple, and
easily extensible tool tailored to my workflow.

## What will be covered in future posts?

In the upcoming posts, I will dive deeper into the main aspects of Charlene's
development:

- **HTTP/HTTPS Proxy with Rust:** How I implemented the proxy using tokio and
  hyper.
- **HTTPS Traffic Interception:** Certificate generation and management.
- **Proxy and TUI Communication:** Using async channels for real-time
  integration.
- **Elm-like Architecture:** Code organization and message flow.
- **TUI with ratatui:** Building the interface and user experience.
- **Challenges and Lessons Learned:** Problems faced and solutions found.

Each of these topics will be explored in detail in future posts.

Stay tuned for the complete series on building Charlene!
