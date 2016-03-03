require 'spec_helper.rb'

feature 'looking for recipes', js: true do
  before do
    Recipe.create!(name: 'Baked Potato w/ Cheese')
    Recipe.create!(name: 'Garlic Mashed Potatoes')
    Recipe.create!(name: 'Potatoes Au Gratin')
    Recipe.create!(name: 'Baked Brussels Sprouts')
  end

  scenario 'finding recipes' do
    visit '/'
    fill_in 'keywords', with: 'baked'
    click_on 'Search'

    expect(page).to have_content('Baked Potato')
    expect(page).to have_content('Baked Brussels Sprouts')
  end
end
