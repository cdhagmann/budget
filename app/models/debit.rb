class Debit < Transaction
  def amount=(value)
    super(value.to_f.abs)
  end
end
