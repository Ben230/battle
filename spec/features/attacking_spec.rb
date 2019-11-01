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

  scenario 'be attacked by player 2' do
    sign_in_and_play
    click_button 'Attack'
    click_button 'Return'
    click_button 'Attack'
    expect(page).to have_content 'Tillie attacked Maisie'
  end

  scenario 'reduce player 1 HP by 10' do
    sign_in_and_play
    click_button 'Attack'
    click_button 'Return'
    click_button 'Attack'
    click_button 'Return'
    expect(page).not_to have_content 'Maisie: 60HP'
    expect(page).to have_content 'Maisie: 50HP'
  end
end
