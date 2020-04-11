Feature: Error Mode


  Scenario: Default Error Mode is warn
    Given I have a file 'graphviz.md' with content:
      """
      ---
      ---

      {% graphviz %}
      whatever
      {% endgraphviz %}
      """
    When I run jekyll build
    Then the file '_site/graphviz.html' should exist
    And I should see 'Rendering Failed' in '_site/graphviz.html'

  Scenario: Global Liquid Error Mode
    Given I have a file '_config.yml' with content:
      """
      liquid:
        error_mode: lax
      """
    And I have a file 'graphviz.md' with content:
      """
      ---
      ---

      {% graphviz %}
      whatever
      {% endgraphviz %}
      """
    When I run jekyll build
    Then the file '_site/graphviz.html' should exist