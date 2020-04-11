Feature: Graphviz Filter


  Scenario: Filter
    Given I have a file 'graphviz.md' with content:
      """
      ---
      ---

      {% capture diagram %}
      digraph {
        A -> B;
      }
      {% endcapture %}

      {{ diagram | as_graphviz }}
      """
    When I run jekyll build
    Then the file '_site/graphviz.html' should exist
    And I should see svg output in '_site/graphviz.html'