class Notifier::Base
  attr_accessor :data, :attribute, :comparison_operator, :threshold_value

  def initialize(options = {})
    @data = options[:data]
    @attribute = options[:attribute]
    @comparison_operator = options[:comparison_operator]
    @threshold_value = options[:threshold_value]
  end

  def run
    return unless condition
    format_message
    notify
  end

  def condition
    #
    # Override me to skip condition checking
    #   See sample at lib/notifier/stdout.rb
    #
    condition = "data[:#{attribute}].to_f #{comparison_operator} #{threshold_value}"
    eval(condition)
  end

  def format_message
    #
    # Override me to format your message
    #   See sample at lib/notifier/telegram.rb
    #
  end

  def notify
    #
    # Override me to send your notification
    #   See sample at lib/notifier/telegram.rb
    #
  end
end
