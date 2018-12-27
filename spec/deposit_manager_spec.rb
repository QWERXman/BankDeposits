require_relative('../lib./deposit_manager')
require_relative('../lib./deposit')

RSpec.describe DepositManager do
  include DepositManager

  describe '#add_deposit' do
    it 'add deposit to file' do
      expect($stdin).to receive(:gets).and_return('test_name', '12', '1', '32')
      expect(DepositManager.add_deposit).to eq(true)
    end
  end

  describe '#delete_deposit' do
    it 'delete deposit from file' do
      expect($stdin).to receive(:gets).and_return('1')
      expect(DepositManager.delete_deposit).to eq(1)
    end
  end

  describe '#refill' do
    it 'refill deposit' do
      expect($stdin).to receive(:gets).and_return('test_name', '1')
      expect(DepositManager.refill).to eq(true)
    end
  end

  describe '#refill_dep' do
    it 'refill deposit by id' do
      expect($stdin).to receive(:gets).and_return('1')
      expect(DepositManager.refill_dep(1)).to eq(true)
    end
  end
  # describe '#delete_depositor' do
  #   it 'delete depositor from file' do
  #     expect($stdin).to receive(:gets).and_return('1')
  #     expect(DepositorManager.delete_depositor()).to eq(1)
  #   end
  # end
  #
  # describe '#show_depositors' do
  #   it 'show_depositors' do
  #     expect(DepositorManager.show_depositors()).to eq(true)
  #   end
  # end
end
