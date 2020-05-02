Feature: Vega Block


  Scenario: Basic Vega Rendering
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

  Scenario: Basic Vegalite Rendering
    Given I have a file named 'vegalite.md' with:
      """
      ---
      ---

      {% vegalite %}
      {
        "data": {
          "values": [
            {"a": "A", "b": 28}
          ]
        },
        "mark": "bar"
      }
      {% endvegalite %}
      """
    When I run jekyll build
    Then the file '_site/vegalite.html' should exist
    And I should see svg output in '_site/vegalite.html'
