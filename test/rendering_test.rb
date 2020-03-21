# frozen_string_literal: true

require 'test_helper'

class RenderingTest < Minitest::Test
  def test_render_with_command
    assert_raises Jekyll::Diagrams::ProgramNotFoundError do
      Jekyll::Diagrams::Rendering.render_with_command('asdfghjkl')
    end
  end
end
