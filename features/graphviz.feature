Feature: Graphviz


  Scenario: Default configuration
    Given I have a file 'graphviz.md' with content:
      """
      ---
      ---

      {% graphviz %}
      digraph {
        S -> A;
        S -> B;
        A -> D;
        B -> D;
      }
      {% endgraphviz %}
      """
    When I run jekyll build
    Then the file '_site/graphviz.html' should exist
    And I should see 'diagrams graphviz' in '_site/graphviz.html'
    And I should see svg output in '_site/graphviz.html'
