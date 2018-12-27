RSpec.describe 'show subscribers', type: :feature do
  it 'all subscribers' do
    visit('/')
    expect(page).to have_content('dep_namqwe')
    expect(page).to have_content('12')
    expect(page).to have_content('123')
    expect(page).to have_content('06.12.18')
  end
end
