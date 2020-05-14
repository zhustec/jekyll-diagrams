@diagrams
Feature: Nomnoml


  Background:
    Given I have a file named 'nomnoml.md' with:
      """
      ---
      ---

      {% nomnoml %}
        [Jekyll Diagrams]
      {% endnomnoml %}
      """

  Scenario: Basic Rendering
    When I run jekyll build
    Then the file '_site/nomnoml.html' should exist
    And I should see svg output in '_site/nomnoml.html'
