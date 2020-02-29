---
layout: post
title: Graphviz Test
date: 2020-01-01 00:00:00 +0800
---

# Graphviz Test

{% graphviz %}
digraph {
  node [shape=circle, style=filled];
  S ;
  A ;
  B ;
  C ;
  D [shape=doublecircle, fillcolor=green];
  S -> A [label=a];
  S -> B [label=b];
  A -> D [label=c];
  B -> D [label=d];
}
{% endgraphviz %}

