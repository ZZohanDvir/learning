class CargoCar < Car
  attr_reader :number, :type
  attr_accessor :hooked

  def initialize(number)
    super
    @type = :cargo
  end
  
end