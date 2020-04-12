Feature: Mermaid Filter


  Scenario: Basic Rendering
    Given I have a file 'mermaid.md' with content:
      """
      ---
      ---

      {% capture diagram %}
      sequenceDiagram
          participant John
          participant Alice
          Alice->>John: Hello John, how are you?
          John-->>Alice: Great!
      {% endcapture %}

      {{ diagram | as_mermaid }}
      """
    When I run jekyll build
    Then the file '_site/mermaid.html' should exist
    And I should see svg output in '_site/mermaid.html'
