# frozen_string_literal: true

require 'test_helper'

class SvgbobTest < Minitest::Test
  def setup
    @block = Jekyll::Diagrams::SvgbobBlock.parse(
      'svgbob',
      '',
      Liquid::Tokenizer.new('test {% endsvgbob %}'),
      Liquid::ParseContext.new
    )
  end

  def test_build_command_with_default_config
    config = {}
    assert_equal 'svgbob', @block.build_command(config)

    config = { 'scale' => '2' }
    assert_match '--scale 2', @block.build_command(config)
  end
end
