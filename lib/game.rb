require_relative 'player'

class Game
  attr_reader :player_1, :player_2, :current_turn, :opponent

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @current_turn = player_1
    @opponent = player_2
  end

  def attack(player)
    player.receive_damage
  end

  def switch_turns
    if @current_turn == player_1
      @current_turn = player_2
      @opponent = player_1
    else
      @current_turn = player_1
      @opponent = player_2
    end
  end

  def game_over?
    return true if any_player_on_0HP
    return false
  end

  def loser
    return @player_1 if @player_1.hit_points == 0
    return @player_2
  end

  private

  def any_player_on_0HP
    @player_1.hit_points == 0 || @player_2.hit_points == 0
  end
end
