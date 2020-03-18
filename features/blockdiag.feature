Feature: Blockdiag


  Scenario: Default configuration
    Given I have a file 'blockdiag.md' with content:
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
    When I run jekyll build
    Then the file '_site/blockdiag.html' should exist
    And I should see 'diagrams blockdiag' in '_site/blockdiag.html'
