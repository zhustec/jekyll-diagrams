# frozen_string_literal: true

require 'spec_helper'

RSpec.describe JekyllDiagrams do
  describe '.config_name' do
    subject { described_class.config_name }

    it { is_expected.to eq 'jekyll-diagrams' }
  end

  describe '.logger_topic' do
    subject { described_class.logger_topic }

    it { is_expected.to eq 'Jekyll Diagrams:' }
  end

  describe '.jekyll_configuration' do
    it 'read jekyll configurations from context' do
    end
  end

  describe '.configuration' do
    it 'read configurations from jekyll configurations' do
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
        end.to raise_error StandardError
      end
    end
  end

  describe '.wrap_class' do
    subject { described_class.wrap_class('content', 'active') }

    it { is_expected.to match(/class=.*active/) }
    it { is_expected.to match('content') }
  end
end
