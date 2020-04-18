# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Jekyll::Diagrams do
  describe '.config_name' do
    subject { described_class.config_name }

    it { is_expected.to eq 'jekyll-diagrams' }
  end

  describe '.logger_topic' do
    subject { described_class.logger_topic }

    it { is_expected.to eq 'Jekyll Diagrams:' }
  end

  describe '.defaut_error_mode' do
    subject { described_class.default_error_mode }

    it { is_expected.to eq :warn }
  end
end
