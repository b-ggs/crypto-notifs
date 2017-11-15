module PrettyMessageHelper
  def data_summary(data)
    market = data[:market]
    exchange = data[:exchange]
    buy = data[:pretty_buy]
    sell = data[:pretty_sell]
    message = ''
    message << "\n"
    message << "#{market} on #{exchange}"
    message << "\n"
    message << "Buy: #{buy} Sell: #{sell}"
    message
  end

  def code_block(message)
    message ||= ''
    resp = ''
    resp << '```'
    resp << message
    resp << "\n"
    resp << '```'
    resp
  end
end
