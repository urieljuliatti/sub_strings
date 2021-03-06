# frozen_string_literal: true

RSpec.describe Start do
  subject(:start) { described_class.new(phrase, dictionary) }
  let(:main) { build(:main) }
  let(:dictionary) { main.dictionary }
  let(:phrase) { main.phrase }

  describe '.start' do
    subject(:generate) { start.generate }

    context 'when a empty string is given' do
      let(:phrase) { ' ' }

      it { is_expected.to be_blank }
    end

    context 'when a valid word is given' do
      it { is_expected.to eq({ 'below' => 1, 'low' => 1 }) }
    end

    context 'when an invalid word is given' do
      let(:phrase) { build(:main, :bender).phrase }

      it { is_expected.to be_blank }
    end

    context 'when a valid phrase is given' do
      let(:main) { build(:main, :howdy) }

      it { is_expected.to include('i' => 3) }
      it { is_expected.to eq main.result }
    end
  end
end
