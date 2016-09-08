module Utils
  def convert_to_dollars(amount)
    '%.2f' % (amount / 100.00)
  end

  def convert_to_cents(amount)
    (amount.to_f * 100).round().to_i
  end
end
