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

  def to_s
    @id + ' ' + @name
  end
end
