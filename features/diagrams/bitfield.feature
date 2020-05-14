@diagrams
Feature: Bitfield


  Background:
    Given I have a file named 'bitfield.md' with:
      """
      ---
      ---

      {% bitfield %}
      [
        { "name": "IPO",   "bits": 8, "attr": "RO" },
        {                  "bits": 7 },
        { "name": "BRK",   "bits": 5, "attr": "RW", "type": 4 },
        { "name": "CPK",   "bits": 1 },
        { "name": "Clear", "bits": 3 },
        { "bits": 8 }
      ]
      {% endbitfield %}
      """

  Scenario: Basic Rendering
    When I run jekyll build
    Then the file '_site/bitfield.html' should exist
    And I should see svg output in '_site/bitfield.html'
