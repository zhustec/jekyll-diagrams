Feature: PlantUML Block


  Background: I have a file with PlantUML
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

  Scenario: It Remove XML Heading
    When I run jekyll build
    Then the file '_site/plantuml.html' should exist
    And I should not see '<\?xml' in '_site/plantuml.html'
    And I should not see '<!DOCTYPE' in '_site/plantuml.html'
