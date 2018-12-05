require_relative('./deposit')
require_relative('./file_reader')

module DepositorManager

  # Add a depositor
  def self.add_depositor
    puts 'Enter depositor name:'

    name = gets.chomp

    FileReader.add_depositor(Depositor.new(1, name))
  end

end
