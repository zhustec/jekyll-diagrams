# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Jekyll::Diagrams::Rendering do
  describe '#render_with_command' do
    context 'when command not found' do
      it 'raise error' do
        expect do
          described_class.render_with_command('not_exist_command')
        end.to raise_error Jekyll::Diagrams::Errors::CommandNotFoundError
      end
    end

    context 'when rendering failed' do
      it 'raise error' do
        expect do
          described_class.render_with_command('/bin/bash -c "exit 1"')
        end.to raise_error Jekyll::Diagrams::Errors::RenderingFailedError
      end
    end
  end
end
