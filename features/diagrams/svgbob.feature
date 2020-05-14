@diagrams
@slow
Feature: Svgbob


  Background:
    Given I have a file named 'svgbob.md' with:
      """
      {% svgbob %}
        +------+
        |      |
        +------+
      {% endsvgbob %}
      """

  Scenario: Basic Rendering
    When I run jekyll build
    Then the file '_site/svgbob.html' should exist
    And I should see svg output in '_site/svgbob.html'
