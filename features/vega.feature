Feature: Vega


  Scenario: Default configuration
    Given I have a file 'vega.md' with content:
      """
      ---
      ---

      {% vega %}
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
      {% endvega %}
      """
    When I run jekyll build
    Then the file '_site/vega.html' should exist
    And I should see 'diagrams vega' in '_site/vega.html'
