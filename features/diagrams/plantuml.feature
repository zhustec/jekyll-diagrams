@diagrams
Feature: PlantUML


  Background:
    Given I have a file named 'plantuml.md' with:
      """
      ---
      ---

      {% plantuml %}
      Bob->Alice : hello
      {% endplantuml %}
      """

  Scenario: Basic Rendering
    When I run jekyll build
    Then the file '_site/plantuml.html' should exist
    And I should see svg output in '_site/plantuml.html'
