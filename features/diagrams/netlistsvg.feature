@diagrams
Feature: Netlistsvg


  Background:
    Given I have a file named 'netlistsvg.md' with:
      """
      ---
      ---

      {% netlistsvg %}
      {
        modules: {
          up3down5: {
            cells: {
              "$add$input.v:17$3": {
                type: "$add",
                connections: {}
              }
            }
          }
        }
      }
      {% endnetlistsvg %}
      """

  Scenario: Basic Rendering
    When I run jekyll build
    Then the file '_site/netlistsvg.html' should exist
    And I should see svg output in '_site/netlistsvg.html'
