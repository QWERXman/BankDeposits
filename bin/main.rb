require_relative('./constants')
require_relative('./depositor_manager')
require_relative('./deposit_manager')

# Starting point in the application

module Main
  def self.run
    self.show_menu
  end

  def self.show_menu
    puts 'Select action'
    puts '1) Add depositor'
    puts '2) Add deposite'
    puts '3) Delete deposit'
    puts '4) Delete depositor'
    puts '5) Interest payment'
    puts '6) Close Deposite'

    begin
      action_id = Integer(gets.chomp)
    rescue
      return
    end

    case action_id
    when ACTION_TYPES[:add_deposit]
      DepositorManager.add_depositor
    when ACTION_TYPES[:add_depositor]
      DepositManager.add_deposit
    when ACTION_TYPES[:delete_deposit]
      DepositManager.delete_deposit
    when ACTION_TYPES[:delete_depositor]
      DepositorManager.delete_depositor
    # when ACTION_TYPES[:interest_payment]
    #   Manager.interest_payment
    # when ACTION_TYPES[:close_deposite]
    #   Manager.close_deposite
    else return
    end

    self.show_menu
  end
end

Main.run
