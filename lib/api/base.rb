require 'httparty'

module Api
  class Base
    def initialize(options = {})
      @url = options[:url]
    end

    def run
      fetch
      parse_response
      data
    end

    private

    def fetch
      #
      # Do not override me! Override Api::Base#fetch_from_url
      # instead if you absolutely need to.
      #
      begin
        fetch_from_url
      rescue HTTParty::Error => e
        puts "Caught #{e}"
        # TODO log me!
        exit 1
      rescue SocketError => e
        puts "No network #{e}"
        # TODO log me!
        exit 1
      end
    end

    def parse_response
      #
      # Override me to parse the response from your URL
      #   See sample at lib/api/exchange/coins_ph.rb
      #
      @data = @response
    end

    def data
      #
      # Override me to format the data to be returned
      #   See sample at lib/api/exchange/base.rb
      #
      { data: @data }
    end

    def fetch_from_url
      #
      # Override me if you need to call multiple API endpoints
      # This is so we can still override the fetch method without repeating the code to rescue exceptions
      #   See sample at lib/api/exchange/coinbase.rb
      #
      @response = HTTParty.get(@url).parsed_response
    end
  end
end
