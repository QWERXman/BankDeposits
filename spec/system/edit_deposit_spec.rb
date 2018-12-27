RSpec.describe 'edit depositor', type: :feature do
  it 'new' do
    visit('/')
    click_on('deposit-id-2')
    expect(page).to have_content('Введите данные для изменения вклада')

    fill_in('Название', with: 'Иван')
    fill_in('Процент', with: '56')
    fill_in('Id вкладчика', with: '4')
    fill_in('Баланс', with: '980')
    fill_in('Дата', with: '09.09.19')

    click_on('Изменить')
    expect(page).to have_content('Иван')
    expect(page).to have_content('56')
    expect(page).to have_content('4')
    expect(page).to have_content('980')
    expect(page).to have_content('09.09.19')
  end
end
