# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Jekyll::Diagrams::BasicRenderer do
  describe '#render_svg' do
    it 'raise not implemented error' do
      renderer = described_class.new(context_with_config, '')

      expect { renderer.render }.to raise_error NotImplementedError
    end
  end
end
