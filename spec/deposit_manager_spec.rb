require 'deposit_manager'
require 'deposit'

RSpec.describe Dao do
  include Dao

  describe '#shedule_create' do
    it 'creates the correct schedule from a file' do
      file_path = './spec/test_base.yml'
      file_item_first = SheduleItem.new('Monday', 4, 'Mathematics', 220, 'IT-32')
      file_item_sec = SheduleItem.new('Wednesday', 1, 'History', 400, 'PMI-11')
      expect(shedule_create(file_path).items).to eq([file_item_first, file_item_sec])
    end
  end
end
