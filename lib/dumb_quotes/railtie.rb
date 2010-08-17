require 'dumb_quotes'
require 'rails'

module DumbQuotes
  class Railtie < Rails::Railtie

    initializer "dumb_quotes.active_record" do |app|
      if defined?(::ActiveRecord)
        ::ActiveRecord::Base.extend(DumbQuotes::ArExtend)

      end
    end

  end
end
