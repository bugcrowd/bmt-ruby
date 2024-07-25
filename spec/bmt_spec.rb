require 'spec_helper'

describe BMT do
  describe '#versions' do
    subject { described_class.versions }

    it 'return all of the versions in the filesystem in reverse semver order' do
      expect(subject).to eq(['2.1', '1.0'])
    end
  end

  describe '#current_version' do
    subject { described_class.current_version }

    it 'return the most recent version number for the vrt' do
      expect(subject).to eq('2.1')
    end
  end

  describe '#methodology_keys' do
    context 'without specified version' do
      subject { described_class.methodology_keys }

      it 'returns methodologies for the latest version' do
        expect(subject).to match_array(%w[website-testing outback-animal-testing])
      end
    end

    context 'with custom version' do
      subject { described_class.methodology_keys(version: '1.0') }

      it 'returns methodologies for the specified version' do
        expect(subject).to match_array(['website-testing'])
      end
    end
  end

  describe '#find' do
    context 'without specified version' do
      subject(:methodology) { described_class.find(key) }

      let(:key) { 'website-testing' }

      it 'returns latest version of the methodology' do
        expect(methodology).to be_a(BMT::Methodology)
        expect(methodology.title).to eq('Bugcrowd Website Testing')
        expect(methodology.release_date).to eq(
          Date.parse('2021-06-15')
        )
      end
    end

    context 'specifing version' do
      subject(:methodology) { described_class.find(key, version:) }

      let(:key) { 'website-testing' }

      context 'with wrong version number' do
        let(:version) { '3.0' }

        it 'raises VersionNotFoundError' do
          expect { subject }.to raise_error BMT::VersionNotFoundError
        end
      end

      context 'with existing version number' do
        let(:version) { '1.0' }

        context 'and merhodology key not available on that version' do
          let(:key) { 'mobile-app-testing' }

          it 'raises MethodologyNotFoundError' do
            expect { subject }.to raise_error BMT::MethodologyNotFoundError
          end
        end

        context 'and available methodology' do
          it 'returns the correct version of the methodology' do
            expect(methodology).to be_a(BMT::Methodology)
            expect(methodology.title).to eq('Website Testing')
            expect(methodology.release_date).to eq(
              Date.parse('2021-05-31')
            )
          end
        end
      end
    end
  end
end
