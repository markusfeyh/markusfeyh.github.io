---
layout: post
title: "SOA: Erlang vs Ruby"
date: 2015-08-10
author: Markus Feyh
categories: [SOA, Erlang, Ruby]
tags: [soa, erlang, ruby, performance, latency, process-scheduling, payments]
---

What is the difference in the way Ruby and Erlang processes are scheduled? I explore the differences in latency and where this can lead to issues in industries like payments.

This was from a presentation I gave at Erlounge, an Erlang Meetup In Berlin.

**Erlang vs Ruby SOA Scheduling** from **marfeyh**

You can see the application level code here:   
[https://github.com/marfeyh/soa_erlang_latency](https://github.com/marfeyh/soa_erlang_latency)   
[https://github.com/marfeyh/soa_ruby_latency](https://github.com/marfeyh/soa_ruby_latency)

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

### Why This Matters for Payments

In payment processing systems, predictable latency is crucial. Erlang's preemptive scheduling provides:

- **Consistent response times** even under high load
- **Better resource utilization** through lightweight processes
- **Built-in fault tolerance** with supervisor hierarchies
- **Predictable performance** regardless of system load

Ruby's cooperative scheduling can lead to:

- **Variable response times** as load increases
- **Potential blocking** when processes don't yield control
- **Memory overhead** from heavier process management
- **Unpredictable performance** under stress

## Real-World Impact

The differences become particularly apparent in:

- **High-frequency trading systems**
- **Payment processing platforms**
- **Real-time communication services**
- **Systems requiring 99.9%+ uptime**

## Conclusion

While both languages have their strengths, Erlang's process model provides significant advantages for building reliable, low-latency service-oriented architectures, especially in industries where predictable performance is critical.

For more details and code examples, check out the GitHub repositories linked above, which contain the actual implementation code used in the presentation. 