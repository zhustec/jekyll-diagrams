Feature: Graphviz Configuration


  Scenario: Global Configuration
    Given I have a file named '_config.yml' with:
      """
      jekyll-diagrams:
        graphviz:
          graph_attributes: bgcolor=red
          edge_attributes:
            - color=green
          node_attributes:
            color: blue
      """
    And I have a file named 'graphviz.md' with:
      """
      ---
      ---

      {% graphviz %}
      digraph {
        A -> B;
      }
      {% endgraphviz %}
      """
    When I run jekyll build
    Then the file '_site/graphviz.html' should exist
    # Graph
    And I should see '<polygon fill="#ff0000"' in '_site/graphviz.html'
    # Edge
    And I should see '<path .*? stroke="#00ff00"' in '_site/graphviz.html'
    # Node
    And I should see '<ellipse .*? stroke="#0000ff"' in '_site/graphviz.html'

  Scenario: Page Configuration Will Overwite Site Configuration
    Given I have a file named '_config.yml' with:
      """
      jekyll-diagrams:
        graphviz:
          edge_attributes:
            color: green
      """
    And I have a file named 'graphviz.md' with:
      """
      ---
      jekyll-diagrams:
        graphviz:
          edge_attributes:
            color: red
      ---

      {% graphviz %}
      digraph {
        A -> B;
      }
      {% endgraphviz %}
      """
    When I run jekyll build
    Then the file '_site/graphviz.html' should exist
    And I should see '<path .*? stroke="#ff0000"' in '_site/graphviz.html'
    And I should not see '<path .*? stroke="#00ff00"' in '_site/graphviz.html'
