Feature: Mermaid Block


  Scenario: Basic Rendering
    Given I have a file named 'mermaid.md' with:
      """
      ---
      ---

      {% mermaid %}
      sequenceDiagram
          participant John
          participant Alice
          Alice->>John: Hello John, how are you?
          John-->>Alice: Great!
      {% endmermaid %}
      """
    When I run jekyll build
    Then the file '_site/mermaid.html' should exist
    And I should see svg output in '_site/mermaid.html'
