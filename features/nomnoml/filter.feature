Feature: Nomnoml Filter


  Scenario: Basic Rendering
    Given I have a file 'nomnoml.md' with content:
      """
      ---
      ---

      {% capture diagram %}
      [Jekyll Diagrams Feature Test]
      {% endcapture %}

      {{ diagram | as_nomnoml }}
      """
    When I run jekyll build
    Then the file '_site/nomnoml.html' should exist
    And I should see svg output in '_site/nomnoml.html'
