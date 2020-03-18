Feature: Wavedrom


  Scenario: Default configuration
    Given I have a file 'wavedrom.md' with content:
      """
      ---
      ---

      {% wavedrom %}
      {signal: [
        {name: 'clk', wave: 'p.....|...'},
        {name: 'dat', wave: 'x.345x|=.x', data: ['head', 'body', 'tail', 'data']},
        {name: 'req', wave: '0.1..0|1.0'},
        {name: 'ack', wave: '1.....|01.'}
      ]}
      {% endwavedrom %}
      """
    When I run jekyll build
    Then the file '_site/wavedrom.html' should exist
    And I should see 'diagrams wavedrom' in '_site/wavedrom.html'
