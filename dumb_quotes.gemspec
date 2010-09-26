Gem::Specification.new do |s|
  s.name              = "dumb_quotes"
  s.version           = "2.0"
  s.summary           = "a small ActiveRecord plugin that converts 'smart quotes' to their ASCII equivalents"
  s.description       = "a small ActiveRecord plugin that converts 'smart quotes' to their ASCII equivalents"
  s.author            = "James Healy"
  s.email             = "james@yob.id.au"
  s.homepage          = "http://github.com/yob/dumb_quotes"
  s.has_rdoc          = true
  s.rdoc_options      << "--title" << "Dumb Quotes" << "--line-numbers"
  s.test_files        = [ "test/dumb_quotes_test.rb", "test/test_helper.rb" ]
  s.files             = [ "lib/dumb_quotes.rb", "lib/dumb_quotes/ar_extend.rb", "lib/dumb_quotes/railtie.rb", "Rakefile", "MIT-LICENSE", "README.rdoc" ]
  s.add_dependency("activerecord", ">= 3.0.0")
end
