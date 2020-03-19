Feature: PlantUML


  Scenario: Default configuration
    Given I have a file 'plantuml.md' with content:
      """
      ---
      ---

      {% plantuml %}
      @startuml
      class Car

      Driver - Car : drives >
      Car *- Wheel : have 4 >
      Car -- Person : < owns

      @enduml
      {% endplantuml %}
      """
    When I run jekyll build
    Then the file '_site/plantuml.html' should exist
    And I should see 'diagrams plantuml' in '_site/plantuml.html'
    And I should see svg output in '_site/plantuml.html'
