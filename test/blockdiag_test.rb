# frozen_string_literal: true

require 'test_helper'

class BlockdiagTest < Minitest::Test
  def setup
    @renderer = Jekyll::Diagrams::Blockdiag::Renderer.new(
      Liquid::ParseContext.new,
      '',
      'blockdiag'
    )
  end

  def test_build_command_with_default_config
    config = {}
    assert_equal 'blockdiag -T svg --nodoctype', @renderer.build_command(config)

    config = { 'antialias' => true }
    assert_match '--antialias', @renderer.build_command(config)

    config = { 'antialias' => false }
    refute_match '--antialias', @renderer.build_command(config)

    config = { 'size' => 3 }
    assert_match '--size=3', @renderer.build_command(config)
  end
end
