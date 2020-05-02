Feature: Blockdiag Block


  Scenario: Basic Rendering
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
    When I run jekyll build
    Then the file '_site/blockdiag.html' should exist
    And I should see svg output in '_site/blockdiag.html'
