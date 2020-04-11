Feature: Nomnoml Block


  Scenario: Basic Rendering
    Given I have a file 'nomnoml.md' with content:
      """
      ---
      ---

      {% nomnoml %}
      [Jekyll Diagrams Feature Test]
      {% endnomnoml %}
      """
    When I run jekyll build
    Then the file '_site/nomnoml.html' should exist
    And I should see svg output in '_site/nomnoml.html'
