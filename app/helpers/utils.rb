module Utils
  def convert_to_dollars(amount)
    amount / 100.00
  end

  def convert_to_cents(amount)
    (amount.to_f * 100).to_i
  end
end
