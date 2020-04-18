Feature: Wavedrom Block


  Scenario: Basic Rendering
    Given I have a file named 'wavedrom.md' with:
      """
      ---
      ---

      {% wavedrom %}
      {signal: [{wave: '.'}]}
      {% endwavedrom %}
      """
    When I run jekyll build
    Then the file '_site/wavedrom.html' should exist
    And I should see svg output in '_site/wavedrom.html'
