feature 'hitpoints' do
  scenario 'view player 2 hitpoints' do
    sign_in_and_play
    expect(page).to have_content 'Tillie: 100HP'
  end
end
