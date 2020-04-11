# frozen_string_literal: true

require 'test_helper'

class SvgbobTest < Minitest::Test
  def setup
    @renderer = Jekyll::Diagrams::Svgbob::Renderer.new(
      Liquid::ParseContext.new,
      '',
      'svgbob'
    )
  end

  def test_build_command_with_default_config
    config = {}
    assert_equal 'svgbob', @renderer.build_command(config)

    config = { 'scale' => '2' }
    assert_match '--scale 2', @renderer.build_command(config)
  end
end
