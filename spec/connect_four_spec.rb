require_relative '../lib/connect_four'
require_relative '../lib/symbols'


describe Game do
  include Symbols
  subject(:game) { described_class.new }
  it 'create new game' do
    expect(game).to be_truthy
  end
  describe '#verify(color)' do
    it 'verify color with red' do
      color = 'r'
      # allow(game).to receive(:verify)
      expect(game.verify(color)).to be_truthy
    end
    it 'verify color with yellow' do
      color = 'y'
      expect(game.verify(color)).to be_truthy
    end
  end
  describe '#pick_color' do
    context 'when user inputs an incorrect value once then a valid value' do
      before do
        number = '3'
        valid_input = 'r'
        allow(game).to receive(:gets).and_return(number, valid_input)
      end
      it 'completes loop and displays error message once' do
        error_message = "Input error! Please enter an 'R' or a 'Y'."
        expect(game).to receive(:puts).with(error_message).once
        game.pick_color
      end
    end
    context 'when user inputs two incorrect values, then a valid one' do
      before do
        number = '3'
        valid_input = 'r'
        symbol = '*'
        allow(game).to receive(:gets).and_return(number, symbol, valid_input)
      end
      it 'completes loop and displays error message twice' do
        error_message = "Input error! Please enter an 'R' or a 'Y'."
        expect(game).to receive(:puts).with(error_message).twice
        game.pick_color
      end
    end
  end

  describe '#give_color' do
    it "returns 'y' when other player is 'r'" do
      p1 = double
      allow(p1).to receive(:color).and_return(red_space)
      expect(game.give_color(p1)).to eq(yellow_space)
    end
    it "returns 'r' when other player is 'y'" do
      p1 = double
      allow(p1).to receive(:color).and_return(yellow_space)
      expect(game.give_color(p1)).to eq(red_space)
    end
  end
  describe '#player_select' do
    subject(:turn_ver) { described_class.new }
    let(:@p1) { double(name: 'John') }
    let(:@p2) { double(name: 'Fred') }
    it 'returns p2' do
      result = turn_ver.player_select(@p1)
      expect(result).to eq(@p2)
    end
  end
  describe '#move_selection' do
    context 'user inputs invalid selection once then valid selection' do
      it 'completes loop and returns error message once' do
        error_message = 'Input error! Please enter a number between 1 and 7.'
        expect(game).to receive(:puts).with(error_message).once
        game.move_selection
      end
    end
  end
end
