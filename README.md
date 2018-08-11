# Jekyll Diagrams

[![Travis](https://img.shields.io/travis/zhustec/jekyll-diagrams.svg?style=flat-square)](https://travis-ci.com/zhustec/jekyll-diagrams)
[![Gem](https://img.shields.io/gem/v/jekyll-diagrams.svg?style=flat-square)](https://rubygems.org/gems/jekyll-diagrams)
[![Coveralls github](https://img.shields.io/coveralls/github/zhustec/jekyll-diagrams/master.svg?style=flat-square)](https://coveralls.io/github/zhustec/jekyll-diagrams)
[![Depfu](https://img.shields.io/depfu/zhustec/jekyll-diagrams.svg?style=flat-square)](https://depfu.com/repos/zhustec/jekyll-diagrams)
[![license](https://img.shields.io/github/license/zhustec/jekyll-diagrams.svg?style=flat-square)](https://github.com/zhustec/jekyll-diagrams/blob/master/LICENSE)

Jekyll Diagrams is a jekyll plugins for creating amazing diagrams, including:

- Graphviz
- Blockdiag, Seqdiag, Actdiag and Nwdiag

## Installation

### When using bundler

Add these lines to your application's `Gemfile` file:

```ruby
group :jekyll_plugins do
  gem 'jekyll-diagrams'
end
```

And then execute:

```bash
$ bundle
```

### Or installing manually

```bash
$ gem install jekyll-diagrams
```

And then add this line to your application's `_config.yml` file:

```yaml
plugins:
  - jekyll-diagrams
```

## Usage

### Graphviz

You need first install graphviz with package manager on your system. e.g.

* Gentoo Linux : `emerge graphviz`
* Arch Linux : `pacman -S graphviz`

Then you can use `graphviz`, `graph`, and `digraph` Liquid Tag for creating amazing Graphviz images!

```
{% graphviz %}
digraph {
  node [shape=circle, style=filled];
  S [fillcolor=green];
  A [fillcolor=yellow];
  B [fillcolor=yellow];
  C [fillcolor=yellow];
  D [shape=doublecircle, fillcolor=green];
  S -> A [label=a];
  S -> B [label=b];
  A -> D [label=c];
  B -> D [label=d];
}
{% endgraphviz %}
```

You can also use `diagraph` and `graph` tag. e.g.

```
{% digraph %}
node [shape=circle, style=filled];
S [fillcolor=green];
A [fillcolor=yellow];
B [fillcolor=yellow];
C [fillcolor=yellow];
D [shape=doublecircle, fillcolor=green];
S -> A [label=a];
S -> B [label=b];
A -> D [label=c];
B -> D [label=d];
{% endgraphviz %}
```

### Blockdiag

Blockdiag contains:

* `blockdiag` : simple block-diagram image generator
* `seqdiag` : simple sequence-diagram image generator
* `actdiag` : simple activity-diagram image generator
* `nwdiag` : simple network-diagram image generators

Fisrt you should install them via `pip`:

```bash
$ pip install blockdiag seqdiag actdiag nwdiag
```

And set `$PATH` to make sure your system can find it in `$PATH`.

Then you can use `blockdiag`, `seqdiag`, `actdiag` and `nwdiag` Liquid Tag. e.g.

```
{% blockdiag %}
blockdiag {
   A -> B -> C -> D;
   A -> E -> F -> G;
}
{% endblockdiag %}
```

And `seqdiag`:

```
{% seqdiag %}
seqdiag {
  browser  -> webserver [label = "GET /index.html"];
  browser <-- webserver;
  browser  -> webserver [label = "POST /blog/comment"];
              webserver  -> database [label = "INSERT comment"];
              webserver <-- database;
  browser <-- webserver;
}
{% endseqdiag %}
```

## Configuration

A simple configuration shows below:

```yaml
diagrams:
  graphviz:
    engine: dot
    options: '-Tsvg'
  diag:
    options: '-Tsvg --nodoctype'
```

### Graphviz

`engine` is the default image render engine. Default is set to `dot`. You can also specify for every single image via:

```
{% graphviz neato %}
digraph {
  node [shape=circle, style=filled];
  S [fillcolor=green];
  A [fillcolor=yellow];
  B [fillcolor=yellow];
  C [fillcolor=yellow];
  D [shape=doublecircle, fillcolor=green];
  S -> A [label=a];
  S -> B [label=b];
  A -> D [label=c];
  B -> D [label=d];
}
{% endgraphviz %}
```

`options` is the command line options, and will be appended to the command. Default is set to '-Tsvg'.

### Blockiag

`options` is the command line options, and will be appended to the command. Default is set to '-Tsvg --nodoctype'.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/zhustec/jekyll-diagrams. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
