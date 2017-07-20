require 'discordrb'
require 'rubygems'

bot = Discordrb::Bot.new token: 'MjA2MDI2NTMxNDAxNjI5Njk2.CnOkqA.m0vDp9h0cUoiS-3HeychUIj2r_o', application_id: 206026321975967757

bot.message(with_text: 'Marco!') do |event|
  event.respond 'Polo!'
end

bot.run :async

bot.profile.avatar = File.new('./Sketch-a-bot.png')

bot.server(206027295666864128).roles.each do |r|
  bot.send_message(206027295666864128,"#{r.mention} Test") if r.name.include?('butts')
end  

bot.sync
