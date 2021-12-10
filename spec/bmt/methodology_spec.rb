# frozen_string_literal: true

require 'spec_helper'

describe BMT::Methodology do
  describe '#new' do
    subject do
      described_class.new(key: methodology_key,
                          version: version,
                          attributes: methodology_json)
    end

    context 'with valid args' do
      let(:methodology_key) { 'outback-animal-testing' }
      let(:version) { '2.1' }
      let(:methodology_json) { BMT.methodology_json(methodology_key) }

      it 'initialize a methodology' do
        expect(subject).to be_a(described_class)

        expect(subject.key).to eq('outback-animal-testing')
        expect(subject.title).to eq('The Outback Animal Checklist')
        expect(subject.description).to be_a(String)
      end
    end
  end

  describe '#steps' do
    subject do
      described_class.new(key: methodology_key,
                          version: version,
                          attributes: methodology_json).steps
    end

    let(:methodology_key) { 'outback-animal-testing' }
    let(:version) { '2.1' }
    let(:methodology_json) { BMT.methodology_json(methodology_key) }

    it 'returns a list of BMT Steps' do
      expect(subject.first).to be_a(BMT::Step)
    end

    it 'returns the expected data' do
      expect(subject).to match_array(
        [
          an_object_having_attributes(
            key: 'koala',
            title: 'Check that you have a Koala',
            description: an_instance_of(String),
            type: 'checklist',
            items: match_array(
              [
                an_object_having_attributes(
                  key: 'marsupial',
                  title: an_instance_of(String),
                  description: an_instance_of(String),
                  vrt_category: an_instance_of(String),
                ),
                an_object_having_attributes(
                  key: 'diet',
                  title: an_instance_of(String),
                  description: an_instance_of(String),
                ),
                an_object_having_attributes(
                  key: 'behavior',
                  title: an_instance_of(String),
                  description: an_instance_of(String),
                )
              ]
            )
          ),
          an_object_having_attributes(
            key: 'kangaroo',
            title: 'Ensure you have a kangaroo',
            description: an_instance_of(String),
            type: 'checklist',
            items: match_array(
              [
                an_object_having_attributes(
                  key: 'marsupial',
                  title: an_instance_of(String),
                  description: an_instance_of(String),
                ),
                an_object_having_attributes(
                  key: 'tail',
                  title: an_instance_of(String),
                  description: an_instance_of(String),
                ),
                an_object_having_attributes(
                  key: 'jump',
                  title: an_instance_of(String),
                  description: an_instance_of(String),
                )
              ]
            )
          ),
          an_object_having_attributes(
            key: 'executive_summary',
            title: 'Executive summary',
            description: an_instance_of(String),
            type: 'executive_summary',
            items: []
          )
        ]
      )
    end
  end
end
