@diagrams
Feature: Graphviz


  Background:
    Given I have a file named 'graphviz.md' with:
      """
      ---
      ---

      {% graphviz %}
      digraph {
        A -> B;
      }
      {% endgraphviz %}
      """

  Scenario: Basic Rendering
    When I run jekyll build
    Then the file '_site/graphviz.html' should exist
    And I should see svg output in '_site/graphviz.html'
