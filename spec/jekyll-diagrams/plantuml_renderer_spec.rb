# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Jekyll::Diagrams::PlantUMLRenderer do
  subject(:renderer) do
    described_class.new(Liquid::ParseContext.new, '')
  end

  describe '#render_svg' do
    it 'call build_command' do
      allow(renderer).to receive(:build_command)
      allow(renderer).to receive(:render_with_stdin_stdout).and_return(+'')

      renderer.render_svg('', {})

      expect(renderer).to have_received(:render_with_stdin_stdout)
    end
  end

  describe '#build_command' do
    context 'when config is empty' do
      subject { renderer.build_command(config) }

      let(:config) { {} }

      it { is_expected.to match 'plantuml' }
      it { is_expected.to match '-tsvg -pipe' }
      it { is_expected.not_to match '-Dplantuml.include.path=' }
    end

    context 'when a custom jar path is set' do      
      subject { renderer.build_command(config) }
      
      let(:config) { {"jar_path" => '/foo/bar/some.jar'} }

      it { is_expected.to match '/foo/bar/some.jar' }
      it { is_expected.to match '-tsvg -pipe' }
    end

    context 'when a custom inlude path is set' do      
      subject { renderer.build_command(config) }
      
      let(:config) { {"include_path" => 'buzz/include/'} }
      
      it { is_expected.to match '-Dplantuml.include.path=' }
      it { is_expected.to match 'buzz/include/' }
      it { is_expected.to match '-tsvg -pipe' }
    end
  end
end
