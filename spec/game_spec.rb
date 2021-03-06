require 'frappuccino'

describe 'Game' do
  before do
    player = YKWYA::Player::Player.new(0, 0, 0)
    @game = YKWYA::Game.new(player, Frappuccino::Stream.new)
  end

  it 'should end when player health is <= 0' do
    expect(@game.is_over?).to be(true)
  end

  it 'can provide the neighbourhood of a coord' do
    coord = [5, 5]
    expected = [[4, 4], [4, 5], [4, 6],
                [5, 4], [5, 6],
                [6, 4], [6, 5], [6, 6]]

    expect(@game.neighbourhood coord).to eq(expected)
  end

  it "won't lose any monsters as part of the world tick" do
    old_monsters = @game.monsters.clone
    @game.tick!
    new_monsters = @game.monsters.clone

    expect(old_monsters.size).to eq(new_monsters.size)
  end
end
