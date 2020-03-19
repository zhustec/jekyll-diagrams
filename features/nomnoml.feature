Feature: Nomnoml


  Scenario: Default configuration
    Given I have a file 'nomnoml.md' with content:
      """
      ---
      ---

      {% nomnoml %}
      [Pirate|eyeCount: Int|raid();pillage()|
        [beard]--[parrot]
        [beard]-:>[foul mouth]
      ]

      [<abstract>Marauder]<:--[Pirate]
      [Pirate]- 0..7[mischief]
      [jollyness]->[Pirate]
      [jollyness]->[rum]
      [jollyness]->[singing]
      [Pirate]-> *[rum|tastiness: Int|swig()]
      [Pirate]->[singing]
      [singing]<->[rum]

      [<start>st]->[<state>plunder]
      [plunder]->[<choice>more loot]
      [more loot]->[st]
      [more loot] no ->[<end>e]

      [<actor>Sailor] - [<usecase>shiver me;timbers]
      {% endnomnoml %}
      """
    When I run jekyll build
    Then the file '_site/nomnoml.html' should exist
    And I should see 'diagrams nomnoml' in '_site/nomnoml.html'
    And I should see svg output in '_site/nomnoml.html'
