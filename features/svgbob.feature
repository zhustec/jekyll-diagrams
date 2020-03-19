Feature: Svgbob


  Scenario: Default configuration
    Given I have a file 'svgbob.md' with content:
      """
      ---
      ---

      {% svgbob %}
                                 .--->  F
        A       B      C  D     /
        *-------*-----*---*----*----->  E
                 \            ^ \
                  v          /   '--->  G
                   B --> C -'
      {% endsvgbob %}
      """
    When I run jekyll build
    Then the file '_site/svgbob.html' should exist
    And I should see 'diagrams svgbob' in '_site/svgbob.html'
    And I should see svg output in '_site/svgbob.html'
