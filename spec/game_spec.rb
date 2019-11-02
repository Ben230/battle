require 'game'

describe Game do
  subject(:game) { described_class.new(player_1, player_2) }
  subject(:finished_game) { described_class.new(player_1, dead_player) }
  let(:player_1) { double(:player, hit_points: 60) }
  let(:player_2) { double(:player, hit_points: 60) }
  let(:dead_player) { double(:player, hit_points: 0) }

  describe '#player_1' do
    it 'can show name of player 1' do
      expect(game.player_1).to eq player_1
    end
  end

  describe '#player_2' do
    it 'can show name of player 2' do
      expect(game.player_2).to eq player_2
    end
  end

  describe '#attack' do
    it 'damages the player' do
      expect(player_2).to receive(:receive_damage)
      game.attack(player_2)
    end
  end

  describe '#switch_turns' do
    it 'starts as player 1' do
      expect(game.current_turn).to eq player_1
    end

    it 'is player 2 after a switch' do
      game.switch_turns
      expect(game.current_turn).to eq player_2
    end

    it 'starts with opponent = player_2' do
      expect(game.opponent).to eq player_2
    end

    it 'has opponent = player_1 after a switch' do
      game.switch_turns
      expect(game.opponent).to eq player_1
    end
  end

  describe '#game_over?' do
    it 'returns false if no-one is at 0HP' do
      expect(game.game_over?).to be false
    end

    it 'returns true if at least 1 player is 0HP' do
      expect(finished_game.game_over?).to be true
    end
  end

  describe '#loser' do
    it 'returns a player less than 0HP' do
      expect(finished_game.loser).to eq dead_player
    end
  end

end
