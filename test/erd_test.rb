# frozen_string_literal: true

require 'test_helper'

class ErdTest < Minitest::Test
  def setup
    @block = Jekyll::Diagrams::ErdBlock.parse(
      'erd',
      '',
      Liquid::Tokenizer.new('test {% enderd %}'),
      Liquid::ParseContext.new
    )
  end

  def test_build_command_with_default_config
    config = {}
    assert_equal 'erd --fmt=svg', @block.build_command(config)

    config = { 'edge' => 'compound' }
    assert_match 'edge', @block.build_command(config)

    config = { 'dot-entity' => true }
    assert_match 'dot-entity', @block.build_command(config)
  end
end
