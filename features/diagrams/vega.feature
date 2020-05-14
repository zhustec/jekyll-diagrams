@diagrams
Feature: Vega


  Scenario: Basic Rendering
    Given I have a file named 'vega.md' with:
      """
      ---
      ---

      {% vega %}
      {
        "data": {
          "values": [
            {"a": "A", "b": 28}
          ]
        },
        "mark": "bar"
      }
      {% endvega %}
      """
    When I run jekyll build
    Then the file '_site/vega.html' should exist
    And I should see svg output in '_site/vega.html'
