---
layout: home
title: Graphviz Test
---

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

