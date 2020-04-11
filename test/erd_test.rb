# frozen_string_literal: true

require 'test_helper'

class ErdTest < Minitest::Test
  def setup
    @renderer = Jekyll::Diagrams::ErdRenderer.new(
      Liquid::ParseContext.new, '', 'erd'
    )
  end

  def test_build_command_with_default_config
    config = {}
    assert_equal 'erd --fmt=svg', @renderer.build_command(config)

    config = { 'edge' => 'compound' }
    assert_match 'edge', @renderer.build_command(config)

    config = { 'dot-entity' => true }
    assert_match 'dot-entity', @renderer.build_command(config)
  end
end
