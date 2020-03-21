Feature: Svgbob


  Scenario: Basic Rendering
    Given I have a file 'svgbob.md' with content:
      """
      ---
      ---

      {% svgbob %}
      +--+
      |  |
      +--+
      {% endsvgbob %}
      """
    When I run jekyll build
    Then the file '_site/svgbob.html' should exist
    And I should see svg output in '_site/svgbob.html'
