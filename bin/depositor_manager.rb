require_relative('./deposit')
require_relative('./file_reader')

# Depositor Manager
module DepositorManager
  # Add a depositor
  def self.add_depositor
    puts 'Enter depositor name:'

    name = gets.chomp

    FileReader.add_depositor(Depositor.new(1, name))
  end

  def self.show_depositors
    deps = FileReader.read_depositors
    deps.each do |dep|
      puts dep.to_s
    end
  end

  def self.delete_depositor
    puts 'Enter depositor id:'
    id = Integer(gets.chomp)
    FileReader.delete_depositor(id)
  end
end
