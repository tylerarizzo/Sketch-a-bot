require 'discordrb'
require 'rubygems'

module JoinAnnouncer
  extend Discordrb::EventContainer

  member_join do |event|
    event.server.general_channel.send_message "#{event.user.name} joined!"
  end
end
bot = Discordrb::Bot.new token: 'MjA2MDI2NTMxNDAxNjI5Njk2.CnOkqA.m0vDp9h0cUoiS-3HeychUIj2r_o', application_id: 206026321975967757

bot.message(with_text: 'Marco!') do |event|
  event.respond 'Polo!'
end

bot.include! JoinAnnouncer

bot.run :async

bot.profile.avatar = File.new('./Sketch-a-bot.png')

bot.send_message(199664376934825985, "I'm here!")
bot.sync
