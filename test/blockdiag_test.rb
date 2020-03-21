# frozen_string_literal: true

require 'test_helper'

class BlockdiagTest < Minitest::Test
  def setup
    @block = Jekyll::Diagrams::BlockdiagBlock.parse(
      'blockdiag',
      '',
      Liquid::Tokenizer.new('{% endblockdiag %}'),
      Liquid::ParseContext.new
    )
  end

  def test_build_command_with_default_config
    config = {}
    assert_equal 'blockdiag -T svg --nodoctype', @block.build_command(config)

    config = { 'antialias' => true }
    assert_match '--antialias', @block.build_command(config)

    config = { 'antialias' => false }
    refute_match '--antialias', @block.build_command(config)

    config = { 'size' => 3 }
    assert_match '--size=3', @block.build_command(config)
  end
end
