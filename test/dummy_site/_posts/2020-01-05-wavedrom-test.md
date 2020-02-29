---
layout: post
title: Wavedrom Test
date: 2020-01-05 00:00:00 +0800
---

# Wavedrom Test

{% wavedrom %}
{signal: [
  {name: 'clk', wave: 'p.....|...'},
  {name: 'dat', wave: 'x.345x|=.x', data: ['head', 'body', 'tail', 'data']},
  {name: 'req', wave: '0.1..0|1.0'},
  {name: 'ack', wave: '1.....|01.'}
]}
{% endwavedrom %}