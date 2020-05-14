@diagrams
Feature: Blockdiag


  Background:
    Given I have a file named 'blockdiag.md' with:
      """
      ---
      ---

      {% blockdiag %}
      blockdiag {
        A -> B -> C -> D;
        A -> E -> F -> G;
      }
      {% endblockdiag %}
      """

  Scenario: Basic Rendering
    When I run jekyll build
    Then the file '_site/blockdiag.html' should exist
    And I should see svg output in '_site/blockdiag.html'
