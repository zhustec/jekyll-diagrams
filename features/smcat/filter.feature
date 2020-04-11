Feature: SMCat Filter


  Scenario: Basic Rendering
    Given I have a file 'smcat.md' with content:
      """
      ---
      ---

      {% capture diagram %}
      initial => smcat;
      {% endcapture %}

      {{ diagram | as_smcat }}
      """
    When I run jekyll build
    Then the file '_site/smcat.html' should exist
    And I should see svg output in '_site/smcat.html'