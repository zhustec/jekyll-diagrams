# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Jekyll::Diagrams::Utils do
  describe '.config_for' do
    context 'when the key is not found' do
      subject do
        described_class.config_for(context_with_config, 'not_exist_key')
      end

      it { is_expected.to eq({}) }
    end

    context 'when the key is found' do
      subject do
        described_class.config_for(
          context_with_config(
            Jekyll::Diagrams.config_name => { 'key' => 'value' }
          ),
          'key'
        )
      end

      it { is_expected.to eq 'value' }
    end
  end

  describe '.error_mode' do
    context 'when not specified' do
      subject do
        described_class.error_mode(context_with_config)
      end

      it { is_expected.to eq :warn }
    end

    context 'when specified to `lax` under `liquid` key' do
      subject do
        described_class.error_mode(
          context_with_config(liquid: { 'error_mode' => 'lax' })
        )
      end

      it { is_expected.to eq :lax }
    end

    context 'when specified to `strict` under `jekyll-diagrams` key' do
      subject do
        described_class.error_mode(
          context_with_config(
            'liquid' => { 'error_mode' => 'lax' },
            'jekyll-diagrams' => { 'error_mode' => 'strict' }
          )
        )
      end

      it { is_expected.to eq :strict }
    end
  end

  describe '.handle_error' do
    let(:error) { StandardError.new('TestError') }

    context 'when error mode is lax' do
      it 'show error info and skip this rendering' do
        expect(
          described_class.handle_error(
            context_with_config(liquid: { 'error_mode' => 'lax' }), error
          )
        ).to eq ''
      end
    end

    context 'when error mode is warn' do
      it 'show warn message about error' do
        expect(
          described_class.handle_error(
            context_with_config(liquid: { 'error_mode' => 'warn' }), error
          )
        ).to eq error
      end
    end

    context 'when error mode is strict' do
      it 'abort with an error' do
        expect do
          described_class.handle_error(
            context_with_config(liquid: { 'error_mode' => 'strict' }), error
          )
        end.to raise_error(SystemExit).and output(/TestError/).to_stderr
      end
    end

    context 'with unkown error mode' do
      it 'raise unkown error mode error' do
        expect do
          described_class.handle_error(
            context_with_config(liquid: { 'error_mode' => 'unkown' }), error
          )
        end.to raise_error(Jekyll::Diagrams::Errors::UnkownErrorModeError)
      end
    end
  end

  describe '.vendor_path' do
    context 'with no input' do
      subject { described_class.vendor_path }

      it { is_expected.to end_with 'vendor/' }
    end

    context 'with the input is "test_file' do
      subject { described_class.vendor_path('test_file') }

      it { is_expected.to end_with 'vendor/test_file' }
    end
  end

  describe '.run_jar' do
    context 'when the input is "test.jar"' do
      subject { described_class.run_jar('test.jar') }

      it { is_expected.to match '-Djava.awt.headless=true' }
      it { is_expected.to match '-jar test.jar' }
    end
  end

  describe '.normalized_attrs' do
    context 'when the input is string' do
      subject do
        described_class.normalized_attrs('auto', prefix: '--color ')
      end

      it { is_expected.to eq '--color auto' }
    end

    context 'when the input is array' do
      subject do
        described_class.normalized_attrs(%w[a b], prefix: ' --include ')
      end

      it { is_expected.to eq ' --include a --include b' }
    end

    context 'when the input is hash' do
      subject do
        described_class.normalized_attrs(
          { scales: 2, color: 'red' }, prefix: ' --', sep: ' '
        )
      end

      it { is_expected.to eq ' --scales 2 --color red' }
    end
  end

  describe '.wrap_class' do
    subject { described_class.wrap_class('content', 'active') }

    it { is_expected.to match(/class=.*active/) }
    it { is_expected.to match('content') }
  end
end
