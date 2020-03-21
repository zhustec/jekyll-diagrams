Feature: Graphviz


  Background: I have a file with Graghviz
    Given I have a file 'graphviz.md' with content:
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

  Scenario: Remove XML Heading
    When I run jekyll build
    Then the file '_site/graphviz.html' should exist
    And I should not see '<\?xml' in '_site/graphviz.html'
    And I should not see '<!DOCTYPE' in '_site/graphviz.html'

  Scenario: Global Configugration
    Given I have a file '_config.yml' with content:
      """
      jekyll-diagrams:
        graphviz:
          graph_attributes: bgcolor=red
          edge_attributes:
            - color=green
          node_attributes:
            color: blue
      """
    When I run jekyll build
    Then the file '_site/graphviz.html' should exist
    # Graph
    And I should see '<polygon fill="#ff0000"' in '_site/graphviz.html'
    # Edge
    And I should see '<path .*? stroke="#00ff00"' in '_site/graphviz.html'
    # Node
    And I should see '<ellipse .*? stroke="#0000ff"' in '_site/graphviz.html'

  Scenario: Page Configugration Will Overwite Site Configuration
    Given I have a file '_config.yml' with content:
      """
      jekyll-diagrams:
        graphviz:
          edge_attributes:
            color: blue
      """
    And I have a file 'graphviz.md' with content:
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
    And I should not see '<path .*? stroke="#0000ff"' in '_site/graphviz.html'
