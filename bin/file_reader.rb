require 'csv'
require_relative('./depositor')
require_relative('./constants')
# require_relative('./helpers')

# Module for working with files
module FileReader
  # Read contacts from a file
  # Returns an array of contacts
  # def self.read_contacts
  #   contacts = []
  #
  #   CSV.foreach(FILE_NAME, headers: true) do |row|
  #     contacts << Contact.new(
  #       row['name'],
  #       row['soname'],
  #       row['patronumic'],
  #       row['phone'],
  #       row['homephone'],
  #       row['address'],
  #       row['status']
  #     )
  #   end
  #
  #   contacts
  # end

  # Adds a new contact to the file
  def self.add_depositor(depositor)
    last_id = self.get_max_id()
    CSV.open(DEPOSITORS_DB, 'a') do |file|
      file.add_row([last_id + 1, depositor.name])
    end
  end

  # id of last depositor
  def self.get_max_id
    table = CSV.table(DEPOSITORS_DB)
    id = 0
    table.each do |row|
      id = row[:id] if row[:id] > id
    end
    id
  end

end
