# Jekyll Diagrams

[![Gem](https://img.shields.io/gem/v/jekyll-diagrams.svg?style=flat-square)](https://rubygems.org/gems/jekyll-diagrams)
[![Travis](https://img.shields.io/travis/zhustec/jekyll-diagrams.svg?style=flat-square)](https://travis-ci.com/zhustec/jekyll-diagrams)
[![Depfu](https://img.shields.io/depfu/zhustec/jekyll-diagrams.svg?style=flat-square)](https://depfu.com/repos/zhustec/jekyll-diagrams)
[![license](https://img.shields.io/github/license/zhustec/jekyll-diagrams.svg?style=flat-square)](https://github.com/zhustec/jekyll-diagrams/blob/master/LICENSE)

Jekyll Diagrams is a jekyll plugins for creating diagrams, currently support for [**Blockdiag**](http://blockdiag.com/en/), [**Erd**](https://github.com/BurntSushi/erd), [**GraphViz**](http://graphviz.org/), [**Mermaid**](https://mermaid-js.github.io/mermaid/), [**Nomnoml**](http://nomnoml.com/), [**PlantUML**](https://plantuml.com/), [**Svgbob**](https://ivanceras.github.io/svgbob-editor/), [**Syntrax**](https://kevinpt.github.io/syntrax/), [**Vega**](https://vega.github.io/vega/), [**Vega-Lite**](https://vega.github.io/vega-lite/) and [**WaveDrom**](https://wavedrom.com/). More diagrams support will be added in future versions.

**NOTICE:** This plugin render **SVG** format image and directly **embed into html file**, so you don't need to worry about where to store the image. But, please feel free to tell me if you **unlikely** want other image format.

- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
  - [Blockdiag](#blockdiag)
  - [Erd](#erd)
  - [Graphviz](#graphviz)
  - [Mermaid](#mermaid)
  - [Nomnoml](#nomnoml)
  - [PlantUML](#plantuml)
  - [State Machine Cat](#state-machine-cat)
  - [Svgbob](#svgbob)
  - [Syntrax](#syntrax)
  - [Vega](#vega)
  - [Wavedrom](#wavedrom)
- [Contributing](#contributing)
- [License](#license)

## Installation

Add the following to your site's `_config.yml`:

```yaml
plugins:
  - jekyll-diagrams
```

And the following to your site's `Gemfile`:

```ruby
group :jekyll_plugins do
  gem 'jekyll-diagrams'
end
```

Finally run:

```bash
$ bundle install
```

## Configuration

All configurations are under `jekyll-diagrams`, e.g:

```yaml
jekyll-diagrams:
  graphviz:
    # configurations for graphviz
  blockdiag:
    # configurations for blockdiag
  syntrax:
    # configurations for syntrax
  # and so on
```

## Usage

### Blockdiag

#### Prerequisites

Install it.

```bash
$ pip3 install blockdiag seqdiag actiag nwdiag
```

Then you can use following tags:

* `blockdiag`
* `seqdiag`
* `actdiag`
* `nwdiag`
* `rackdiag`
* `packetdiag`

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

| Config      | Default     | Description                             |
| ----------- | ----------- | --------------------------------------- |
| `antialias` | unspecified | Pass diagram image to anti-alias filter |
| `font`      | unspecified | use FONT to draw diagram                |
| `fontmap`   | unspecified | use FONTMAP file to draw diagram        |
| `size`      | unspecified | Size of diagram (ex. 320x240)           |

### Erd

#### Prerequisites

- Install Graphviz
- Install Erd

```bash
$ sudo apt install graphviz cabal-install
$ cabal update && cabal install erd
```

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

| Config       | Default     | Description                                                                                             |
| ------------ | ----------- | ------------------------------------------------------------------------------------------------------- |
| `config`     | unspecified | Configuration file                                                                                      |
| `edge`       | unspecified | Select one type of edge: compound, noedge, ortho, poly, spline                                          |
| `dot-entity` | unspecified | When set, output will consist of regular dot tables instead of HTML tables. Formatting will be disabled |

### Graphviz

#### Prerequisites

Install it.

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

| Config             | Default     | Description                 |
| ------------------ | ----------- | --------------------------- |
| `default_layout`   | dot         | Set default layout engine   |
| `graph_attributes` | unspecified | Set default graph attribute |
| `node_attributes`  | unspecified | Set default node attribute  |
| `edge_attributes`  | unspecified | Set default edge attribute  |

**NOTICE:** attributes can be `String`(when just one attribute), `Array` or `Hash`.

### Mermaid

#### Prerequisites

Install `mermaid.cli`.

```bash
$ npm install -g mermaid.cli
```

**Notice:** You may need to install some missing libraries, follow the output of `mmdc`.

#### Examples

```text
{% mermaid %}
sequenceDiagram
    participant John
    participant Alice
    Alice->>John: Hello John, how are you?
    John-->>Alice: Great!
{% endmermaid %}
```

#### Configurations

| Config            | Default | Description                                                   |
| ----------------- | ------- | ------------------------------------------------------------- |
| `theme`           | default | Theme of the chart, could be default, forest, dark or neutral |
| `width`           | 800     | Width of the page                                             |
| `height`          | 600     | Height of the page                                            |
| `backgroundColor` | white   | Background color. Example: transparent, red, '#F0F0F0'        |

### Nomnoml

#### Prerequisites

Install it.

```bash
$ npm install -g nomnoml
```
#### Examples

```text
{% nomnoml %}
[Pirate|eyeCount: Int|raid();pillage()|
  [beard]--[parrot]
  [beard]-:>[foul mouth]
]

[<abstract>Marauder]<:--[Pirate]
[Pirate]- 0..7[mischief]
[jollyness]->[Pirate]
[jollyness]->[rum]
[jollyness]->[singing]
[Pirate]-> *[rum|tastiness: Int|swig()]
[Pirate]->[singing]
[singing]<->[rum]

[<start>st]->[<state>plunder]
[plunder]->[<choice>more loot]
[more loot]->[st]
[more loot] no ->[<end>e]

[<actor>Sailor] - [<usecase>shiver me;timbers]
{% endnomnoml %}
```

### PlantUML

#### Prerequisites

Install java runtime.

```bash
$ sudo apt install default-jre
```

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

### State Machine Cat

#### Prerequisites

Install it.

```bash
$ npm install -g state-machine-cat
```

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

| Config       | Default    | Description                                                                         |
| ------------ | ---------- | ----------------------------------------------------------------------------------- |
| `input-type` | `smcat`    | Input type. `smcat|scxml|json`                                                      |
| `engine`     | `dot`      | Layout engine to use. `dot|circo|fdp|neato|osage|twopi`                             |
| `direction`  | `top-down` | Direction of the state machine diagram. `top-down|bottom-top|left-right|right-left` |

### Svgbob

#### Prerequisites

Install `svgbob_cli`.

```bash
$ sudo apt install cargo
$ cargo install svgbob_cli
```

#### Examples

```text
{% svgbob %}
                           .--->  F
  A       B      C  D     /
  *-------*-----*---*----*----->  E
           \            ^ \
            v          /   '--->  G
             B --> C -'
{% endsvgbob %}
```

#### Configuration

| Config         | Default | Description                                                |
| -------------- | ------- | ---------------------------------------------------------- |
| `font-family`  | arial   | Font                                                       |
| `font-size`    | 12      | Font size                                                  |
| `scale`        | 1       | Scale the entire svg (dimensions, font size, stroke width) |
| `stroke-width` | 2       | stroke width for all lines                                 |

### Syntrax

#### Prerequisites

- Install Pango, Cairo and PangoCairo support
- Install `syntrax`

```bash
$ sudo apt install libpango1.0-dev python3-cairo python3-gi python3-gi-cairo
$ pip3 install syntrax
```

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

| Config        | Default     | Description            |
| ------------- | ----------- | ---------------------- |
| `scale`       | 1           | Scale image            |
| `style`       | unspecified | Style config file      |
| `transparent` | false       | Transparent background |

### Vega

#### Prerequisites

Install `vega-cli` and `vega-lite`.

```bash
$ npm install -g vega-cli vega-lite
```

The you can use `vega` and `vegalite` tag.


#### Examples

```text
{% vegalite %}
{
  "": "https://vega.github.io/schema/vega-lite/v4.json",
  "description": "A simple bar chart with embedded data.",
  "data": {
    "values": [
      {"a": "A", "b": 28}, {"a": "B", "b": 55}, {"a": "C", "b": 43},
      {"a": "D", "b": 91}, {"a": "E", "b": 81}, {"a": "F", "b": 53},
      {"a": "G", "b": 19}, {"a": "H", "b": 87}, {"a": "I", "b": 52}
    ]
  },
  "mark": "bar",
  "encoding": {
    "x": {"field": "a", "type": "ordinal"},
    "y": {"field": "b", "type": "quantitative"}
  }
}
{% endvegalite %}
```

#### Configurations

| Config  | Default | Description         |
| ------- | ------- | ------------------- |
| `scale` | 1       | Scale image[Number] |

### Wavedrom

#### Prerequisites

Install `wavedrom-cli`.

```bash
$ npm install -g wavedrom-cli
```

#### Examples

```text
{% wavedrom %}
{signal: [
  {name: 'clk', wave: 'p.....|...'},
  {name: 'dat', wave: 'x.345x|=.x', data: ['head', 'body', 'tail', 'data']},
  {name: 'req', wave: '0.1..0|1.0'},
  {name: 'ack', wave: '1.....|01.'}
]}
{% endwavedrom %}
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/zhustec/jekyll-diagrams. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).