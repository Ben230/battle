feature 'attacking' do
  scenario 'attack player 2 confirmation' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content 'Maisie attacked Tillie'
  end

  scenario 'an attack reduces player 2\'s health by 10HP' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).not_to have_content 'Tillie: 60HP'
    expect(page).to have_content 'Tillie: 50HP'
  end
end
