module Notifier
  class Base
    attr_accessor :data, :attribute, :comparison_operator, :threshold_value, :skip_condition

    def initialize(options = {})
      @data = options[:data]
      @attribute = options[:attribute]
      @comparison_operator = options[:comparison_operator]
      @threshold_value = options[:threshold_value]
      @skip_condition = options[:skip_condition]
    end

    def run
      return unless condition
      format_message
      notify
    end

    private

    def condition
      return true if skip_condition
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
end
