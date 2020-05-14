@diagrams
Feature: Smcat


  Background:
    Given I have a file named 'smcat.md' with:
      """
      ---
      ---

      {% smcat %}
      initial => smcat;
      {% endsmcat %}
      """

  Scenario: Basic Rendering
    When I run jekyll build
    Then the file '_site/smcat.html' should exist
    And I should see svg output in '_site/smcat.html'
