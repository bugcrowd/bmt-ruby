# frozen_string_literal: true

require 'spec_helper'

describe BMT::Step do
  let(:methodology) { BMT.find(methodology_key) }
  let(:methodology_json) { BMT.methodology_json(methodology_key) }
  let(:attributes) { methodology_json.dig('content', 'steps', 0) }
  let(:methodology_key) { 'outback-animal-testing' }

  describe '#new' do
    subject do
      described_class.new(
        methodology: methodology,
        attributes: attributes
      )
    end

    it 'initialize a step' do
      expect(subject).to be_a(described_class)

      expect(subject.key).to eq('koala')
      expect(subject.title).to be_a(String)
      expect(subject.description).to be_a(String)
      expect(subject.methodology).to eq(methodology)
    end
  end

  describe '#items' do
    subject do
      described_class.new(
        methodology: methodology,
        attributes: attributes
      ).items
    end

    it 'returns a list of BMT Items' do
      expect(subject.first).to be_a(BMT::Item)

      expect(subject).to match_array(
        [
          an_object_having_attributes(key: 'marsupial'),
          an_object_having_attributes(key: 'diet'),
          an_object_having_attributes(key: 'behavior')
        ]
      )
    end
  end
end
