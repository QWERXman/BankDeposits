require_relative('./deposit')
require_relative('./file_reader')

module DepositManager

  # Add a deposit
  def self.add_deposit
    puts 'Enter deposit name:'
    name = gets.chomp
    puts 'Enter deposit name:'
    percent = Integer(gets.chomp)

    FileReader.add_depositor(Deposit.new(1, name, percent))
  end

end
