require 'fastlane/action'
require_relative '../helper/ding_talk_msg_push_helper'

module Fastlane
  module Actions
    class DingTalkMsgPushAction < Action
      def self.run(params)
        UI.message("The ding_talk_msg_push plugin is working!")
        # UI.message(params.to_json)
        token = params[:token]
        text = params[:text]
        at_all = params[:at_all] == nil ? false : params[:at_all]
        
        curl = %Q{
          curl 'https://oapi.dingtalk.com/robot/send?access_token=#{token}' \
             -H 'Content-Type: application/json' \
             -d ' {
              "msgtype": "text", 
              "text": {
                  "content": "#{text}",
               },
               "at": {
                  "isAtAll": #{at_all}
              }
            }'
        }
        UI.message(curl)
        system curl
      end
# "atMobiles": [
#   #{mobiles.map { |m| %Q["#{m}"] }.join(',')}
# ], 
      

      def self.description
        "dingTalk robot msg push tool"
      end

      def self.authors
        ["lingyou"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "钉钉推送工具"
      end

      def self.available_options
        [
           FastlaneCore::ConfigItem.new(key: :token,
                                   env_name: "DING_TALK_MSG_PUSH_TOKEN",
                                description: "the dingtalk robot token",
                                   optional: false,
                                       type: String),
           FastlaneCore::ConfigItem.new(key: :text,
                                        env_name: "DING_TALK_MSG_PUSH_TEXT",
                                     description: "the content text send",
                                        optional: false,
                                            type: String),
           FastlaneCore::ConfigItem.new(key: :at_all,
                                              env_name: "DING_TALK_MSG_PUSH_AT_ALL",
                                           description: "at all user",
                                              optional: true,
                                                  type: Boolean)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
