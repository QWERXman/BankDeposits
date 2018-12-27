RSpec.describe 'add subscriber', type: :feature do
  it 'new' do
    visit('/')
    click_on('Добавить вклад')
    expect(page).to have_content('Введите данные для добавленя вклада')

    fill_in('Название', with: 'Первый')
    fill_in('Процент', with: '13')
    fill_in('Id вкладчика', with: '3')
    fill_in('Баланс', with: '975')
    fill_in('Дата', with: '20.12.18')

    click_on('Добавить')
    expect(page).to have_content('Первый')
    expect(page).to have_content('13')
    expect(page).to have_content('3')
    expect(page).to have_content('975')
    expect(page).to have_content('20.12.18')
  end

end
