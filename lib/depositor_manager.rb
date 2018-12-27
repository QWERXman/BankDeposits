require_relative('./deposit')
require_relative('./file_reader')

# Depositor Manager
module DepositorManager
  # Add a depositor
  def self.add_depositor
    # puts 'Enter depositor name:'
    #
    # name = $stdin.gets.chomp
    #
    # FileReader.add_depositor(Depositor.new(1, name))
    true
  end

  def self.new_depositor(depositor)
    FileReader.add_depositor(depositor)
  end

  def self.show_depositors
    # deps = FileReader.read_depositors
    # deps.each do |dep|
    #   puts dep.to_s
    # end
    true
  end

  def self._get_depositors_list
    FileReader.read_depositors
  end

  def self.delete_depositor
    # puts 'Enter depositor id:'
    # id = Integer($stdin.gets.chomp)
    # FileReader.delete_depositor(id)
    id
  end

  def self._get_depositor(id)
    FileReader._get_depositor(id)
  end

  def self.edit_depositor(id, depositor)
    FileReader.edit_depositor(id, depositor)
  end
end
