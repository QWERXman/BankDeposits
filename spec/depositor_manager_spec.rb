require_relative('../bin./depositor_manager')
require_relative('../bin./depositor')

RSpec.describe DepositorManager do
  include DepositorManager

  describe '#add_depositor' do
    it 'add depositor to file' do
      # file_path = './spec/test_base_depositor.csv'
      expect($stdin).to receive(:gets).and_return('test_name')
      expect(DepositorManager.add_depositor()).to eq(true)
    end
  end

  describe '#delete_depositor' do
    it 'delete depositor from file' do
      # file_path = './spec/test_base_depositor.csv'
      expect($stdin).to receive(:gets).and_return('1')
      expect(DepositorManager.delete_depositor()).to eq(1)
    end
  end

  describe '#show_depositors' do
    it 'show_depositors' do
      expect(DepositorManager.show_depositors()).to eq(true)
    end
  end

end
