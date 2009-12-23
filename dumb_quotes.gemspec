Gem::Specification.new do |s|
  s.name              = "dumb_quotes"
  s.version           = "1.1"
  s.summary           = "a small ActiveRecord plugin that converts 'smart quotes' to their ASCII equivalents"
  s.description       = "a small ActiveRecord plugin that converts 'smart quotes' to their ASCII equivalents"
  s.author            = "James Healy"
  s.email             = "james@yob.id.au"
  s.homepage          = "http://github.com/yob/dumb_quotes/tree/master"
  s.has_rdoc          = true
  s.rdoc_options      << "--title" << "Dumb Quotes" << "--line-numbers"
  s.rubyforge_project = "yob-projects"
  s.test_files        = [ "test/dumb_quotes_test.rb", "test/test_helper.rb" ]
  s.files             = [ "init.rb", "rails/init.rb", "lib/dumb_quotes.rb", "Rakefile", "MIT-LICENSE", "README.rdoc" ]
end
