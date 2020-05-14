@diagrams
@slow
Feature: Erd


  Background:
    Given I have a file named 'erd.md' with:
      """
      {% erd %}
        [Person]
        name
        height
      {% enderd %}
      """

  Scenario: Basic Rendering
    When I run jekyll build
    Then the file '_site/erd.html' should exist
    And I should see svg output in '_site/erd.html'
