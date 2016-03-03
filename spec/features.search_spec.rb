require 'spec_helper.rb'

feature 'looking for recipes', js: true do
  scenario 'finding recipes' do
    visit '/'
    fill_in 'keywords', with: 'baked'
    click_on 'Search'

    expect(page).to have_content('Baked Potato')
    expect(page).to have_content('Baked Brussels Sprouts')
  end
end
