# frozen_string_literal: true

require 'test_helper'

class RenderingTest < Minitest::Test
  include Jekyll::Diagrams::Errors
  include Jekyll::Diagrams::Rendering

  def test_raise_command_not_found_error
    assert_raises CommandNotFoundError do
      render_with_command('not_exist_command')
    end
  end

  def test_raise_rendering_failed_error
    assert_raises RenderingFailedError do
      render_with_command('/bin/bash -c "exit 1"')
    end
  end
end
