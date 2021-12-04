# frozen_string_literal: true

RSpec.describe Support do
  subject(:dictionary) { described_class.dictionary }

  context 'when invoked' do
    it { is_expected.not_to be_empty }
    it { is_expected.to include 'below' }
    it { is_expected.to(satisfy { |dic| dic.size == 14 }) }
  end
end
