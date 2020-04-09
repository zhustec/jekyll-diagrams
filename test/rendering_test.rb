# frozen_string_literal: true

require 'test_helper'

class RenderingTest < Minitest::Test
  def test_raise_command_not_found_error
    assert_raises Jekyll::Diagrams::CommandNotFoundError do
      Jekyll::Diagrams::Rendering.render_with_command('not_exist_command')
    end
  end

  def test_raise_rendering_failed_error
    assert_raises Jekyll::Diagrams::RenderingFailedError do
      Jekyll::Diagrams::Rendering.render_with_command('bash -c "exit 1"')
    end
  end
end
