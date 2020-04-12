Feature: Syntrax Filter


  Scenario: Basic Rendering
    Given I have a file 'syntrax.md' with content:
      """
      ---
      ---

      {% capture diagram %}
      indentstack(10,
        line(opt('-'), choice('0', line('1-9', loop(None, '0-9'))),
          opt('.', loop('0-9', None))),

        line(opt(choice('e', 'E'), choice(None, '+', '-'), loop('0-9', None)))
      )
      {% endcapture %}

      {{ diagram | as_syntrax }}
      """
    When I run jekyll build
    Then the file '_site/syntrax.html' should exist
    And I should see svg output in '_site/syntrax.html'
