describe Fastlane::Actions::DingTalkMsgPushAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The ding_talk_msg_push plugin is working!")

      Fastlane::Actions::DingTalkMsgPushAction.run(nil)
    end
  end
end
