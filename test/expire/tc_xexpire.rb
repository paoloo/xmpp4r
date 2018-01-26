#!/usr/bin/ruby

$:.unshift File::dirname(__FILE__) + '/../../lib'

require 'test/unit'
require 'xmpp4r/rexmladdons'
require 'xmpp4r/expire/x/expire'
include Jabber

class XExpireTest < Test::Unit::TestCase
  def test_create1
    e = Expire::XExpire.new(nil)
    assert_equal(nil, e.seconds)
    assert_equal('jabber:x:delay', e.namespace)
  end

  def test_create2
    e = Expire::XExpire.new(666)
    assert_equal(666.to_s, e.seconds.to_s)
    assert_equal('jabber:x:delay', e.namespace)
  end

  def test_seconds
    e = Expire::XExpire.new
    assert_equal(nil, d.seconds)
    e.seconds = 666
    assert_equal(666, e.seconds.to_s)
    assert_equal(e, e.set_seconds(nil))
    assert_equal(nil, e.seconds)
  end

  def test_import
    x1 = X.new
    x1.add_namespace('jabber:x:expire')
    x2 = X::import(x1)
    assert_equal(Expire::XExpire, x2.class)
  end
end
