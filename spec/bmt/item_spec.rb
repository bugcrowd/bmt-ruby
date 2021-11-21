# frozen_string_literal: true

require 'spec_helper'

describe BMT::Item do
  let(:step) { methodology.steps.first }
  let(:methodology) { BMT.find(methodology_key) }
  let(:methodology_json) { BMT.methodology_json(methodology_key) }
  let(:attributes) { methodology_json.dig('content', 'steps', 0, 'items', 0) }
  let(:methodology_key) { 'outback-animal-testing' }

  describe '#new' do
    subject do
      described_class.new(
        step: step,
        attributes: attributes
      )
    end

    it 'initialize an item' do
      expect(subject).to be_a(described_class)

      expect(subject.key).to eq('marsupial')
      expect(subject.title).to be_a(String)
      expect(subject.description).to be_a(String)
      expect(subject.caption).to be_a(String)
      expect(subject.tools).to be_a(String)
      expect(subject.vrt_category).to be_a(String)
      expect(subject.step).to eq(step)
    end
  end
end
