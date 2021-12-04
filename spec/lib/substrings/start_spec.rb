# frozen_string_literal: true

RSpec.describe Start do
  subject(:start) { described_class.new(phrase, dictionary) }
  let(:dictionary) { %w[below down go going horn how howdy it i low own part partner sit] }
  let(:phrase) { 'below' }
  let(:result) { { 'below' => 1, 'low' => 1 } }

  describe '.start' do
    subject(:generate) { start.generate }

    context 'when a empty string is given' do
      let(:phrase) { '' }

      it { is_expected.to be_falsey }
    end

    context 'when a valid word is given' do
      it { is_expected.to eq result }
    end

    context 'when an invalid word is given' do
      let(:phrase) { 'bender' }

      it { is_expected.to be_empty }
    end

    context 'when a valid phrase is given' do
      let(:phrase) { "Howdy partner, sit down! How's it going?" }
      let(:result) { { 'down' => 1, 'go' => 1, 'going' => 1, 'how' => 2, 'howdy' => 1, 'it' => 2, 'i' => 3, 'own' => 1, 'part' => 1, 'partner' => 1, 'sit' => 1 } }

      it { is_expected.to eq result }
    end
  end
end
