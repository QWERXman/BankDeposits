# Deposit
class Deposit
  attr_accessor :name, :percent, :type, :amount, :date

  def initialize(name, percent, can_replenish = true)
    # First name
    # type: string
    # @require
    @name = name

    # Percent
    # type: int
    # @require
    @percent = percent

    # Possibility of replenishment
    # type: bolean
    @can_replenish = can_replenish

    # Type of deposit
    # type: enum
    @type = type

    # Balance
    # type: int
    @amount = amount

    # Date of deposit
    # type: bolean
    @date = date

  end

  def prepare_for_file_write
    [
      @name,
      @percent,
      @type,
      @amount,
      @date
    ]
  end
  # def to_s
  #   @name +
  #     ' ' + @soname +
  #     ' ' + @patronumic +
  #     ' ' + @phone +
  #     ' ' + @home_phone +
  #     ' ' + @address +
  #     ' ' + @status
  # end
end
