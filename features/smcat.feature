Feature: SMCat


  Scenario: Default configuration
    Given I have a file 'smcat.md' with content:
      """
      ---
      ---

      {% smcat %}
      initial,
      "tape player off",
      "tape player on" {
        stopped => playing : play;
        playing => stopped : stop;
        playing => paused  : pause;
        paused  => playing : pause;
        paused  => stopped : stop;
      };

      initial           => "tape player off";
      "tape player off" => stopped           : power;
      "tape player on"  => "tape player off" : power;
      {% endsmcat %}
      """
    When I run jekyll build
    Then the file '_site/smcat.html' should exist
    And I should see 'diagrams smcat' in '_site/smcat.html'
    And I should see svg output in '_site/smcat.html'
