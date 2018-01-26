# =XMPP4R - XMPP Library for Ruby
# License:: Ruby's license (see the LICENSE file) or GNU GPL, at your option.
# Website::http://xmpp4r.github.io

require 'xmpp4r/x'

module Jabber
  module Expire
    ##
    # Implementation of JEP 0023
    # for <x xmlns='jabber:x:expire' seconds='...' .../>
    # applied on <message/> and <presence/> stanzas
    #
    # IMPORTANT
    # XEP-0023 has been marked obsolete and replaced by XEP-0079
    #
    # Please note that you must require 'xmpp4r/xexpire' to use
    # this class as it's not required by a basic XMPP implementation.
    # <x/> elements with the specific namespace will then be
    # converted to XDelay automatically.
    class XExpire < X
      name_xmlns 'x', 'jabber:x:expire'

      ##
      # Initialize a new XExpire element
      #
      def initialize(seconds=nil)
        super()
        set_seconds(seconds.to_s)
      end

      ##
      # Get the seconds
      # result:: [int] or nil
      def seconds
        if attributes['seconds']
          attributes['seconds']
        else
          nil
        end
      end

      ##
      # Set the seconds
      # s:: [int] or 604800
      def seconds=(s)
        if s.nil?
          attributes['seconds'] = 604800.to_s # 7(days)*24(hours)*60(minutes)*60(seconds)=604800
        else
          attributes['seconds'] = s.to_s
        end
      end

      ##
      # Set the seconds (chaining-friendly)
      def set_seconds(s)
        self.seconds = s.to_s
        self
      end
    end
  end
end
