Feature: Graphviz Block


  Background: I have a file with Graghviz
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

  Scenario: It Remove XML Heading
    When I run jekyll build
    Then the file '_site/graphviz.html' should exist
    And I should not see '<\?xml' in '_site/graphviz.html'
    And I should not see '<!DOCTYPE' in '_site/graphviz.html'