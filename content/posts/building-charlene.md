---
title: "Building Charlene"
date: 2026-05-25T11:59:20-03:00
draft: true
---

Pontos gerais sobre o desenvolvimento:

## O que é charlene?

Um inspetor de requisições http para auxiliar devs que precisam analisar
requisições e respostas entre cliente e servidor

## Porque criar um app para analisar requisições HTTP entre cliente e servidor

No mercado já existe o charles, porém como é um app pago resolvi implementar o
meu.

## Porque usar Rust?

Porque sim :)
Eu poderia usar Go, mas eu prefiro Rust para esse tipo de aplicação.

## Porque usar tokio, hyper e ratatui?

Porque é o que eu tenho alguma experiência e eu não precisava aprender algo
novo sem necessidade. Aí o meu único problema a resolver seria implementar o
proxy.

## Porque uma aplicação TUI?

No início eu comecei sem qualquer TUI, era apenas um proxy que fazia log das
requisições que iam chegando. Migrar para TUI foi apenas o próximo passo.
Porém, eu ainda espero implementar uma versão GUI. Espero usar tauri + leptos
para isso.

## Porque usar a arquitetura Elm?

A ideia de centralizar o processamento das mensagens no app acabou resolvendo
alguns problemas por causa do uso de async/await e quem é o dono da verdade de
alguns dados. Então no fim ficou algo mais simples do que eu tava fazendo
quando não estava usando a arquitetura Elm.

## Porque charlene?

O nome vem do meme "não acredito não charlene". E como charlene é um nome
próximo do nome charles. Logo, charlene.

Respositório: https://github.com/emersonmx/charlene
