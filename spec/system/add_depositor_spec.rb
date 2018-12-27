RSpec.describe 'add subscriber', type: :feature do
  it 'new' do
    visit('/')
    click_on('Добавить вкладчика')
    expect(page).to have_content('Введите данные для добавленя вкладчика')

    fill_in('Имя', with: 'Иван')

    click_on('Добавить')
    expect(page).to have_content('Иван')
  end
end
