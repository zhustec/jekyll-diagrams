Feature: Wavedrom Filter


  Scenario: Basic Rendering
    Given I have a file 'wavedrom.md' with content:
      """
      ---
      ---

      {% capture diagram %}
      {signal: [{wave: '.'}]}
      {% endcapture %}

      {{ diagram | as_wavedrom }}
      """
    When I run jekyll build
    Then the file '_site/wavedrom.html' should exist
    And I should see svg output in '_site/wavedrom.html'
