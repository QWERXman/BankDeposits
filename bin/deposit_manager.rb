require_relative('./deposit')
require_relative('./depositor_manager')
require_relative('./file_reader')

# Deposit Manager
module DepositManager
  # Add a deposit
  def self.add_deposit
    puts 'Enter deposit name:'
    name = $stdin.gets.chomp
    puts 'Enter deposit percent:'
    percent = Integer($stdin.gets.chomp)
    puts 'Select depositor:'
    DepositorManager.show_depositors
    depositor_id = Integer($stdin.gets.chomp)
    date = Time.now.strftime('%d.%m.%y')
    puts 'Enter amount:'
    amount = Integer($stdin.gets.chomp)
    FileReader.add_deposit(Deposit.new(1, name, percent, depositor_id, amount, date))
    true
  end

  def self.delete_deposit
    puts 'Enter deposit id:'
    id = Integer($stdin.gets.chomp)
    FileReader.delete_deposit(id)
    id
  end

  def self.refill
    puts 'Enter depositor name:'
    name = $stdin.gets.chomp
    dep_id = FileReader.find_depositor_by_name(name)
    deps = show_deposits_by_depositor(dep_id)
    puts 'Enter deposit id:'
    deposit_id = Integer($stdin.gets.chomp)
    refill_dep(deposit_id) if deps.include? deposit_id.to_s
    true
  end

  def self.show_deposits_by_depositor(id)
    deps = FileReader.get_deposits_by_depositor(id)
    deps_ids = []
    deps.each do |dep|
      puts dep.id + ' ' + dep.name
      deps_ids.push(dep.id)
    end
    deps_ids
  end

  def self.refill_dep(deposit_id)
    puts 'Enter amount'
    amount = Integer($stdin.gets.chomp)
    FileReader.refill_deposit(deposit_id, amount)
    true
  end
end
