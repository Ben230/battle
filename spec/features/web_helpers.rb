def sign_in_and_play
  visit '/'
  fill_in :player_1_name, with: 'Maisie'
  fill_in :player_2_name, with: 'Tillie'
  click_button 'Submit'
end
