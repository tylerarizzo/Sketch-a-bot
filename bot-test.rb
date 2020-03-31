require 'discordrb'
require 'rubygems'

bot = Discordrb::Bot.new token: 'token', application_id: app_id

bot.message(with_text: 'Marco!') do |event|
  event.respond 'Polo!'
end

bot.run :async

bot.profile.avatar = File.new('./Sketch-a-bot.png')

bot.server(server_id).roles.each do |r|
  bot.send_message(server_id,"#{r.mention} Test") if r.name.include?('butts')
end

bot.sync
