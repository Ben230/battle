feature 'Game over' do
  context 'when player 2 reaches 0HP first' do
    before do
      sign_in_and_play
      10.times { attack_and_return }
    end

    scenario 'player 2 loses' do
      click_button 'Attack'
      expect(page).to have_content 'Tillie IS THE LOSER!'
    end
  end
end
