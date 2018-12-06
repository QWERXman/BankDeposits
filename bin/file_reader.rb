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
    last_id = get_max_id(DEPOSITORS_DB)
    CSV.open(DEPOSITORS_DB, 'a') do |file|
      file.add_row([last_id + 1, depositor.name])
    end
  end

  def self.add_deposit(deposit)
    return unless find_depositor(deposit.id)

    last_id = get_max_id(DEPOSITS_DB)
    CSV.open(DEPOSITS_DB, 'a') do |file|
      file.add_row([last_id + 1,
                    deposit.name,
                    deposit.percent,
                    deposit.depositor_id,
                    deposit.amount,
                    deposit.date])
    end
  end

  def self.delete_deposit(id)
    table = CSV.table(DEPOSITS_DB)

    table.delete_if do |row|
      row[:id] == id
    end

    File.open(DEPOSITS_DB, 'w') do |file|
      file.write(table.to_csv)
    end
  end

  def self.delete_depositor(id)
    table = CSV.table(DEPOSITORS_DB)

    table.delete_if do |row|
      row[:id] == id
    end

    File.open(DEPOSITORS_DB, 'w') do |file|
      file.write(table.to_csv)
    end
  end

  # check depositor
  def self.find_depositor(id)
    table = CSV.table(DEPOSITORS_DB)
    table.each do |row|
      return true if row[:id] == id
    end
    false
  end

  # id of last depositor
  def self.get_max_id(file_path)
    table = CSV.table(file_path)
    id = 0
    table.each do |row|
      id = row[:id] if row[:id] > id
    end
    id
  end

  def self.read_depositors
    depositors = []
    CSV.foreach(DEPOSITORS_DB, headers: true) do |row|
      depositors << Depositor.new(
        row['id'],
        row['name']
      )
    end
    depositors
  end

  def self.refill_deposit(id, amount)
    table = CSV.table(DEPOSITS_DB)

    table.each do |row|
      row[:amount] = row[:amount] + amount if row[:id] == id
    end

    File.open(DEPOSITS_DB, 'w') do |file|
      file.write(table.to_csv)
    end
  end

  def self.find_depositor_by_name(name)
    table = CSV.table(DEPOSITORS_DB)
    table.each do |row|
      return row[:id] if row[:name] == name
    end
  end

  def self.get_deposits_by_depositor(id)
    deposits = []
    CSV.foreach(DEPOSITS_DB, headers: true) do |row|
      if row['depositor_id'].to_s == id.to_s
        deposits << Deposit.new(
          row['id'],
          row['name'],
          row['percent'],
          row['depositor_id'],
          row['amount'],
          row['date']
        )
      end
    end
    deposits
  end
end
