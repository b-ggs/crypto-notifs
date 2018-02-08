module AmountHelper
  def format_amount(amount, decimal_places)
    sprintf_param =  "%.#{decimal_places}f"
    # https://stackoverflow.com/a/10541870
    # https://stackoverflow.com/a/11466770
    amount =
      sprintf(sprintf_param, number).
      to_s.
      reverse.
      gsub(/(\d{3})(?=\d)/, '\\1,').
      reverse
  end

  def pretty_fiat(amount, currency, options = {})
    "#{currency} #{format_amount(amount, 2)}"
  end

  def pretty_crypto(amount, currency, options = {})
    "#{currency} #{format_amount(amount, 8)}"
  end
end
