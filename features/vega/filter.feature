Feature: Vega Filter


  Scenario: Basic Vega Rendering
    Given I have a file 'vega.md' with content:
      """
      ---
      ---

      {% capture diagram %}
      {
        "data": {
          "values": [
            {"a": "A", "b": 28}
          ]
        },
        "mark": "bar"
      }
      {% endcapture %}

      {{ diagram | as_vega }}
      """
    When I run jekyll build
    Then the file '_site/vega.html' should exist
    And I should see svg output in '_site/vega.html'