# coding: utf-8

require "#{File.dirname(__FILE__)}/test_helper"

module MockAttributes
  def self.included(base)
    base.column :foo, :string
    base.column :bar, :string
    base.column :biz, :string
    base.column :baz, :string
    base.column :bob, :string
    base.column :alice, :string
  end
end

class ConvertAllMockRecord < ActiveRecord::Base
  include MockAttributes
  dumb_quotes!
end

class ConvertOnlyOneMockRecord < ActiveRecord::Base
  include MockAttributes
  dumb_quotes! :only => :foo
end

class ConvertOnlyThreeMockRecord < ActiveRecord::Base
  include MockAttributes
  dumb_quotes! :only => [:foo, :bar, :biz]
end

class ConvertExceptOneMockRecord < ActiveRecord::Base
  include MockAttributes
  dumb_quotes! :except => :foo
end

class ConvertExceptThreeMockRecord < ActiveRecord::Base
  include MockAttributes
  dumb_quotes! :except => [:foo, :bar, :biz]
end

class DumbQuotesTest < Test::Unit::TestCase
  def setup
    @init_params = { :foo => "foo‘", :bar => "bar’", :biz => "bizʼ", :baz => "baz“", :bob => "bob”", :alice => "aliceˮ" }
  end

  def test_should_exist
    assert Object.const_defined?(:DumbQuotes)
  end

  def test_should_fix_all_fields
    record = ConvertAllMockRecord.new(@init_params)
    record.valid?
    assert_equal "foo'", record.foo
    assert_equal "bar'", record.bar
    assert_equal "biz'", record.biz
    assert_equal "baz\"", record.baz
    assert_equal "bob\"", record.bob
    assert_equal "alice\"", record.alice
  end

  def test_should_convert_only_one_field
    record = ConvertOnlyOneMockRecord.new(@init_params)
    record.valid?
    assert_equal "foo'", record.foo
    assert_equal "bar’", record.bar
    assert_equal "bizʼ", record.biz
    assert_equal "baz“", record.baz
    assert_equal "bob”", record.bob
    assert_equal "aliceˮ", record.alice
  end

  def test_should_convert_only_three_fields
    record = ConvertOnlyThreeMockRecord.new(@init_params)
    record.valid?
    assert_equal "foo'", record.foo
    assert_equal "bar'", record.bar
    assert_equal "biz'", record.biz
    assert_equal "baz“", record.baz
    assert_equal "bob”", record.bob
    assert_equal "aliceˮ", record.alice
  end

  def test_should_convert_all_except_one_field
    record = ConvertExceptOneMockRecord.new(@init_params)
    record.valid?
    assert_equal "foo‘", record.foo
    assert_equal "bar'", record.bar
    assert_equal "biz'", record.biz
    assert_equal "baz\"", record.baz
    assert_equal "bob\"", record.bob
    assert_equal "alice\"", record.alice
  end

  def test_should_convert_all_except_three_fields
    record = ConvertExceptThreeMockRecord.new(@init_params)
    record.valid?
    assert_equal "foo‘", record.foo
    assert_equal "bar’", record.bar
    assert_equal "bizʼ", record.biz
    assert_equal "baz\"", record.baz
    assert_equal "bob\"", record.bob
    assert_equal "alice\"", record.alice
  end
end
