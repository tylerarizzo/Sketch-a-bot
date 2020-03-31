require 'discordrb'
require 'rubygems'

module JoinAnnouncer
  extend Discordrb::EventContainer

  member_join do |event|
    event.server.general_channel.send_message "#{event.user.name} joined!"
  end
end
bot = Discordrb::Bot.new token: 'token', application_id: app_id

bot.message(with_text: 'Marco!') do |event|
  event.respond 'Polo!'
end

bot.include! JoinAnnouncer

bot.run :async

bot.profile.avatar = File.new('./Sketch-a-bot.png')

bot.send_message(channel, "I'm here!")
bot.sync
