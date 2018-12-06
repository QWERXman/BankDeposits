require_relative('./constants')
require_relative('./depositor_manager')
require_relative('./deposit_manager')

# Starting point in the application
module Main
  def self.run
    show_menu
  end

  def self.show_menu
    show_interface

    begin
      action_id = Integer(gets.chomp)
    rescue
      return
    end

    select_action(action_id)

    show_menu
  end

  def self.show_interface
    puts 'Select action'
    puts '1) Add depositor'
    puts '2) Add deposite'
    puts '3) Delete deposit'
    puts '4) Delete depositor'
    puts '5) Refill deposit '
  end

  def self.select_action(action_id)
    case action_id
    when ACTION_TYPES[:add_deposit]
      DepositorManager.add_depositor
    when ACTION_TYPES[:add_depositor]
      DepositManager.add_deposit
    when ACTION_TYPES[:delete_deposit]
      DepositManager.delete_deposit
    when ACTION_TYPES[:delete_depositor]
      DepositorManager.delete_depositor
    when ACTION_TYPES[:refill]
      DepositManager.refill
    end
  end
end

Main.run
