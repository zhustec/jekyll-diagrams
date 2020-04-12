Feature: Blockdiag Filter


  Scenario: Basic Rendering
    Given I have a file 'blockdiag.md' with content:
      """
      ---
      ---

      {% capture diagram %}
      blockdiag {
         A -> B -> C -> D;
         A -> E -> F -> G;
      }
      {% endcapture %}

      {{ diagram | as_blockdiag }}
      """
    When I run jekyll build
    Then the file '_site/blockdiag.html' should exist
    And I should see svg output in '_site/blockdiag.html'
