# Deposit
class Deposit
  attr_accessor :id, :name, :percent, :amount, :date, :depositor_id

  def initialize(id, name, percent, depositor_id, amount, date)
    # Primary key
    @id = id

    # First name
    # type: string
    # @require
    @name = name

    # Percent
    # type: int
    # @require
    @percent = percent

    # Id of depositor
    # type: int
    @depositor_id = depositor_id

    # Balance
    # type: int
    @amount = amount

    # Date of deposit
    # type: bolean
    @date = date
  end

  def prepare_for_file_write
    [
      @id,
      @name,
      @percent,
      @depositor_id,
      @amount,
      @date
    ]
  end

  def to_s
    @name.to_s + @id.to_s + @percent.to_s
  end
end
