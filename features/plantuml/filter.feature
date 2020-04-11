Feature: PlantUML Filter


  Scenario: Basic Rendering
    Given I have a file 'plantuml.md' with content:
      """
      ---
      ---

      {% capture diagram %}
      Bob->Alice : hello
      {% endcapture %}

      {{ diagram | as_plantuml }}
      """
    When I run jekyll build
    Then the file '_site/plantuml.html' should exist
    And I should see svg output in '_site/plantuml.html'