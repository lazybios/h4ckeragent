#!/usr/bin/env ruby
# encoding: utf-8

require 'slack-notifier'

class BearyChatService

  def initialize(webhook)
    @webhook = webhook
  end

  def deliver(recruiter, resume)
    message = "*#{recruiter}* 查看了你的简历 *#{resume}*"
    begin
      notifier = Slack::Notifier.new @webhook
      notifier.username = "h4keragent"
      notifier.ping message, icon_emoji: ":ghost:"
    rescue => e
       Rails.logger.error("SlackService: Error when sending: #{e.message}")
    end
  end

end
