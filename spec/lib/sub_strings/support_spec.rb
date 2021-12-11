# frozen_string_literal: true

RSpec.describe Support do
  let(:start) { Start.new(phrase, dictionary) { include Support } }
  let(:main) { build(:main, :support) }
  let(:dictionary) { main.dictionary }
  let(:phrase) { main.phrase }

  describe '.prepare' do
    subject(:prepare) { start.prepare }

    context 'when Bender visited the moon' do 
      let(:prepared) { %w[im going to build my own theme park] }

      it { is_expected.to eq prepared }
    end

    context 'when someone removes his memory card' do
      let(:phrase) { "I'm Bender, Baby! Oh God, Please Insert Liquor!" }
      let(:prepared) { %w[im bender baby oh god please insert liquor] }

      it { is_expected.to eq prepared }
    end
  end

  describe '.increment' do
    subject(:increment) { start.increment(item) }
    let(:item) { 'ng' }
    let(:phrase) { 'Howdy partner, sit down! How\'s it going? Hong?' }

    context 'when is a single item' do
      it { is_expected.to eq 1 }
      it { expect(start.result).to_not include({ 'ng' => 1 }) }
    end

    context 'when proceeds after .generate call' do
      before do
        start.generate
        increment
      end

      it { is_expected.to eq 3 }
      it { expect(start.result).to include({ 'ng' => 3 }) }
    end
  end
end
