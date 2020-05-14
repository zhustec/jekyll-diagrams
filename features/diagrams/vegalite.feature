@diagrams
Feature: Vegalite


  Background:
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

  Scenario: Basic Rendering
    When I run jekyll build
    Then the file '_site/vegalite.html' should exist
    And I should see svg output in '_site/vegalite.html'
