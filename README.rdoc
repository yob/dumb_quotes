== Dumb Quotes

For some reason I'm yet discern, I'm irrationally annoyed by "smart quotes",
the non-ASCII single and double quotes imposed on our databases by windows
users.

There's no real reason to hate them, but I do. Maybe it's the extra few bytes
they consume when encoded as UTF-8, or maybe it's the way they get converted to
numeric entities in my XML exports. In any case, this ActiveRecord plugin makes
the following changes to your model attributes before validation:

  U+2018 (‘) -> '
  U+2019 (’) -> '
  U+02BC (ʼ) -> '
  U+201C (“) -> "
  U+201D (”) -> "
  U+02EE (ˮ) -> "

=== Examples

  class Product < ActiveRecord::Base
    dumb_quotes!
  end

  class Product < ActiveRecord::Base
    dumb_quotes!, :except => :title
  end

  class Product < ActiveRecord::Base
    dumb_quotes!, :only => :description
  end

=== Installation

Option 1. Load the plugin as a gem

  gem install dumb_quotes
  add "config.gem 'dumb_quotes'" to your environment.rb

Option 2. Use the standard Rails plugin install (assuming Rails 2.1).

  ./script/plugin install git://github.com/yob/dumb_quotes.git

=== Caveats

The translation is done with raw bytes. If you happen to be using anything other than
UTF-8 in your models, you're likely to munge data.

This also means it's almost certainly not ruby 1.9 compatible. Patches welcome.

=== Credits

This plugin is essentially a fork of the strip attributes plugin, released
under the MIT License by Ryan McGeary.

http://github.com/rmm5t/strip_attributes

=== License

Copyright (c) 2007-2008 Ryan McGeary released under the MIT license
Copyright (c) 2009 James Healy released under the MIT license

http://en.wikipedia.org/wiki/MIT_License
