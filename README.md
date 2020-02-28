# Jekyll Diagrams

[![Gem](https://img.shields.io/gem/v/jekyll-diagrams.svg?style=flat-square)](https://rubygems.org/gems/jekyll-diagrams)
[![Travis](https://img.shields.io/travis/zhustec/jekyll-diagrams.svg?style=flat-square)](https://travis-ci.com/zhustec/jekyll-diagrams)
[![Depfu](https://img.shields.io/depfu/zhustec/jekyll-diagrams.svg?style=flat-square)](https://depfu.com/repos/zhustec/jekyll-diagrams)
[![license](https://img.shields.io/github/license/zhustec/jekyll-diagrams.svg?style=flat-square)](https://github.com/zhustec/jekyll-diagrams/blob/master/LICENSE)

Jekyll Diagrams is a jekyll plugins for creating amazing diagrams, including:

- Blockdiag(Blockdia, Seqdiag, Actdiag, Nwdiag, Rackdiag and Packatdiag)
- Erd
- Graphviz
- Mermaid
- PlantUML
- State Machine cat
- Syntrax

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

### Blockdiag

Blockdiag contains:

* `blockdiag` : generates block diagram image
* `seqdiag` : generates sequence diagram image
* `actdiag` : generates activity diagram image
* `nwdiag` : generates network diagram image
* `rackdiag` : generates rack structure diagram
* `packetdiag` : generates packet header diagram

#### Prerequisites

- Install it via pip or other methods
- Set path properly, make sure your system can find it

```bash
$ pip install blockdiag seqdiag actiag nwdiag
```

#### Examples

```text
{% blockdiag %}
blockdiag {
   A -> B -> C -> D;
   A -> E -> F -> G;
}
{% endblockdiag %}
```

And `seqdiag`:

```text
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

#### Configurations

```yaml
jekyll-diagrams:
  blockdiag:
    antialias: true
    config: configuration_file
    font: your_custom_font
    fontmap: your_custom_font
    size: 320x400
```

### Erd

#### Prerequisites

- Install Graphviz
- [**Install Erd**](https://github.com/BurntSushi/erd#installation)

#### Examples

```text
{% erd %}
[Person]
*name
height
weight
`birth date`
+birth_place_id

[`Birth Place`]
*id
`birth city`
'birth state'
"birth country"

Person *--1 `Birth Place`
{% enderd %}
```

#### Configurations

```yaml
jekyll-diagrams:
  erd:
    config: path_to_config_file
    edge: 'one type of edge: compound, noedge, ortho, poly, spline'
```

### Graphviz

#### Prerequisites

- Install it.

#### Examples

```text
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

#### Configurations

```yaml
jekyll-diagrams:
  graphviz:
    default_layout: dot
    graph_attribute: color=red
    node_attribute:
      - color=blue
      - fillcolor=red
    edge_attribute:
      color: red
      fillcolor: blue
```

- `default_layout`: Change the default layout here.
- `graph/node/edge_attribute`: Default graph/node/edge attribute, can be String(when just one attribute), Array or Hash.

### Mermaid

#### Prerequisites

- [**Install mermaid.cli**](https://github.com/mermaidjs/mermaid.cli#mermaidcli)

#### Configurations

```yaml
jekyll-diagrams:
  mermaid:
    theme: default,
    width: 800,
    height: 600,
    backgroundColor: white
```

- `theme`: Theme of the chart, could be default, forest, dark or neutral. (default: default)
- `width`: Width of the page. (default: 800)
- `height`: Height of the page. (default: 600)
- `backgroundColor`: Background color. Example: transparent, red, '#F0F0F0'. (default: white)

### PlantUML

#### Prerequisites

- Java Runtime

#### Examples

```text
{% plantuml %}
@startuml
class Car

Driver - Car : drives >
Car *- Wheel : have 4 >
Car -- Person : < owns

@enduml
{% endplantuml %}
```

### State Machine cat

#### Prerequisites

- Nodejs Runtime
- Install it `npm install [-g] state-machine-cat`
- Set path

#### Examples

```text
{% smcat %}
initial,
"tape player off",
"tape player on" {
  stopped => playing : play;
  playing => stopped : stop;
  playing => paused  : pause;
  paused  => playing : pause;
  paused  => stopped : stop;
};

initial           => "tape player off";
"tape player off" => stopped           : power;
"tape player on"  => "tape player off" : power;
{% endsmcat %}
```

#### Configuration

```yaml
jekyll-diagrams:
  smcat:
    input-type: smcat
    engine: dot
    direction: top-down
```

- `input-type`: smcat|scxml|json (default: "smcat")
- `engine`: dot|circo|fdp|neato|osage|twopi (default: "dot")
- `direction`: top-down|bottom-top|left-right|right-left (default: "top-down")

### Syntrax

#### Prerequisites

- [Install it with Pango and PangoCairo](https://kevinpt.github.io/syntrax/#requirements)

#### Examples

```text
{% syntrax %}
indentstack(10,
  line(opt('-'), choice('0', line('1-9', loop(None, '0-9'))),
    opt('.', loop('0-9', None))),

  line(opt(choice('e', 'E'), choice(None, '+', '-'), loop('0-9', None)))
)
{% endsyntrax %}
```

#### Configurations

```yaml
jekyll-diagrams:
  syntrax:
    scale: 'Scale image'
    style: 'Style config file'
    transparent: 'Transparent background'
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/zhustec/jekyll-diagrams. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).