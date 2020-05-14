# Jekyll Diagrams

[![Gem](https://img.shields.io/gem/v/jekyll-diagrams.svg?label=Gem&style=flat-square)](https://rubygems.org/gems/jekyll-diagrams)
[![Test](https://img.shields.io/github/workflow/status/zhustec/jekyll-diagrams/Test?label=Test&style=flat-square)](https://github.com/zhustec/jekyll-diagrams/actions?query=workflow%3ATest)
[![Feature](https://img.shields.io/travis/com/zhustec/jekyll-diagrams.svg?label=Feature&style=flat-square)](https://travis-ci.com/zhustec/jekyll-diagrams)
[![Coverage](https://img.shields.io/coveralls/github/zhustec/jekyll-diagrams?label=Coverage&style=flat-square)](https://coveralls.io/github/zhustec/jekyll-diagrams)
[![License](https://img.shields.io/github/license/zhustec/jekyll-diagrams.svg?label=License&style=flat-square)](https://github.com/zhustec/jekyll-diagrams/blob/master/LICENSE)

Jekyll Diagrams is a jekyll plugins for creating diagrams, it is based on [liquid-diagrams](https://github.com/zhustec/liquid-diagrams).

- [Installation](#installation)
- [Configurations](#configurations)
  - [Error Mode](#error-mode)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)
- [Code of Conduct](#code-of-conduct)

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
bundle install
```

## Configurations

Configurations can be set in your site's config file under `jekyll-diagrams` key as below:

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

You can override global config in the front matter of each page, e.g.

```text
---
title: Custom configurations per page

jekyll-diagrams:
  graphviz:
    # configurations for graphviz
---

# Your content
```

### Error Mode

You can use `error_mode` to configure how to response to errors. `jekyll-diagrams` respect the global [liquid options](https://jekyllrb.com/docs/configuration/liquid/):

```yaml
liquid:
  error_mode: 'mode'
```

Avaliable options:

- `lax`: Ignore all errors
- `warn`: Output a warning on the console for each error
- `strict`: Output an error message and stop the build

You can also override it for just `jekyll-diagrams`:

```yaml
jekyll-diagrams:
  error_mode: 'mode'
```

## Configurations

Form more configurations please refer to [Jekyll Diagrams](https://github.com/zhustec/jekyll-diagrams)

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/zhustec/jekyll-diagrams.> This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/zhustec/jekyll-diagrams/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the `jekyll-diagrams` project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](CODE_OF_CONDUCT.md).
