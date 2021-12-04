# frozen_string_literal: true

RSpec.describe Start do
  subject(:generate) { described_class.new(word).generate }
  let(:word) { 'below' }
  let(:sub_strings) { { 'below' => 1, 'low' => 1 } }

  context 'when a valid word is given' do
    it { is_expected.to eq sub_strings }
  end

  context 'when an invalid word is given' do
    let(:word) { 'bender' }

    it { is_expected.to be_empty}
  end
end
