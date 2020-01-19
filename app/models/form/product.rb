class Form::Income < Income
    REGISTRABLE_ATTRIBUTES = %i(register category price date memo)
    attr_accessor :register
  end