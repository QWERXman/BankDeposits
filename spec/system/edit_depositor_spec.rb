RSpec.describe 'edit depositor', type: :feature do
  it 'new' do
    visit('/')
    click_on('depositor-id-2')
    expect(page).to have_content('Введите данные для изменения вкладчика')

    fill_in('Имя', with: 'Иван')

    click_on('Изменить')
    expect(page).to have_content('Иван')
  end
end
