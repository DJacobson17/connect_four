require_relative '../lib/player'
require_relative '../lib/symbols'

describe Player do
  include Symbols
  subject(:player) { described_class.new }
  it 'create new player' do
    allow(player).to receive(:gets).and_return('john')
    
    expect(player).to be_truthy
  end
end
