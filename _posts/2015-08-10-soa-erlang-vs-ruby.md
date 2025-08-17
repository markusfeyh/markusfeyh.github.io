---
layout: post
title: "SOA: Erlang vs Ruby"
date: 2015-08-10
author: Markus Feyh
categories: [SOA, Erlang, Ruby]
tags: [soa, erlang, ruby, performance, latency]
---

What is the difference in the way Ruby and Erlang processes are scheduled? I explore the differences in latency and where this can lead to issues.

## Process Scheduling Differences

**Erlang:**
- Preemptive scheduling
- Lightweight processes
- Built-in concurrency model
- Predictable latency

**Ruby:**
- Cooperative scheduling (with GIL)
- Heavier processes
- External concurrency libraries needed
- Variable latency under load

## Latency Implications

The fundamental differences in process scheduling between these languages can lead to significant performance variations in service-oriented architectures, especially under high load conditions. 