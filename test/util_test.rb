# frozen_string_literal: true

require 'test_helper'

class UtilTest < Minitest::Test
  include Jekyll::Diagrams::Util

  def test_normalized_attrs
    attrs = 'color=red'
    assert_equal ' -Ecolor=red', normalized_attrs(attrs, prefix: ' -E')

    attrs = %w[color=red background=green]
    assert_equal ' -Gcolor=red -Gbackground=green',
                 normalized_attrs(attrs, prefix: ' -G')

    attrs = { 'color' => 'red', 'background' => 'green' }
    assert_equal ' -Ncolor=red -Nbackground=green',
                 normalized_attrs(attrs, prefix: ' -N')
  end
end
