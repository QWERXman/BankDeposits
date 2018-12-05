# Depositor
class Depositor
  attr_accessor :id, :name

  def initialize(id, name)

    #Primary key
    @id = id

    # First name
    # type: string
    # @require
    @name = name

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
