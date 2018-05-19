require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?("UI")

  module Helper
    class DingTalkMsgPushHelper
      # class methods that you define here become available in your action
      # as `Helper::DingTalkMsgPushHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the ding_talk_msg_push plugin helper!")
      end
    end
  end
end
