module DumbQuotes
  # Strips whitespace from model fields and converts blank values to nil.
  def dumb_quotes!(options = nil)
    before_validation do |record|
      attributes = DumbQuotes.narrow(record.attributes, options)
      attributes.each do |attr, value|
        if value.respond_to?(:gsub)
          # single quotes
          value.gsub!("\xE2\x80\x98","'") # U+2018
          value.gsub!("\xE2\x80\x99","'") # U+2019
          value.gsub!("\xCA\xBC","'")     # U+02BC

          #  double quotes
          value.gsub!("\xE2\x80\x9C",'"') # U+201C
          value.gsub!("\xE2\x80\x9D",'"') # U+201D
          value.gsub!("\xCB\xAE",'"')     # U+02EE

          record[attr] = value
        end
      end
    end
  end

  # Necessary because Rails has removed the narrowing of attributes using :only
  # and :except on Base#attributes
  def self.narrow(attributes, options)
    if options.nil?
      attributes
    else
      if except = options[:except]
        except = Array(except).collect { |attribute| attribute.to_s }
        attributes.except(*except)
      elsif only = options[:only]
        only = Array(only).collect { |attribute| attribute.to_s }
        attributes.slice(*only)
      else
        raise ArgumentError, "Options does not specify :except or :only (#{options.keys.inspect})"
      end
    end
  end
end
