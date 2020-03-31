require 'discordrb'
require 'rubygems'
require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

$bot = Discordrb::Bot.new token: 'MjA2MDI2NTMxNDAxNjI5Njk2.CnOkqA.m0vDp9h0cUoiS-3HeychUIj2r_o', application_id: 206026321975967757

module JoinAnnouncer
  extend Discordrb::EventContainer
  member_join do |event|
    event.server.general_channel.send_message "#{event.user.name} joined!"
  end
end

$bot.include! JoinAnnouncer

$bot.message(with_text: 'Marco!') do |event|
  event.respond 'Polo!'
end

$bot.run :async

$bot.profile.avatar = File.new('./Sketch-a-bot.png')

$bot.send_message(199664376934825985, "I'm here!")

$array_themes = IO.readlines("./themes.txt")
$new_array = $array_themes.sample($array_themes.length)

class MyHandler
  attr_reader :count
  def initialize
    @count = 0
  end
  def call(job)
    $bot.server(197479353683148800).roles.each do |r|
      $bot.send_message(199664376934825985, "#{r.mention} Theme: #{$new_array[@count]}", tts = false,server_id = 197479353683148800) if r.name.include?('Sketch-a-Day')
    end  
    @count += 1
  end
end

class MyFridayHandler
  def call(job_fri)
    $bot.server(197479353683148800).roles.each do |r|
      $bot.send_message(199664376934825985, "#{r.mention} Theme: Free Draw Friday", tts = false,server_id = 197479353683148800) if r.name.include?('Sketch-a-Day')
    end
  end
end

class BirthdayHandler
  def call(job_birthday)
    $bot.server(197479353683148800).roles.each do |r|
      $bot.send_message(199664376934825985, "#{r.mention} Happy Birthday Cam!!!", tts = true, server_id = 197479353683148800) if r.name.include?('Administrator')
    end
  end
end

#for testing...
#job = scheduler.cron '* * * * *', MyHandler
job = scheduler.cron '0 0 * * 0-4,6', MyHandler

job_fri = scheduler.cron '0 0 * * 5', MyFridayHandler

job_birthday = scheduler.cron '0 0 2 9 *', BirthdayHandler
  
#scheduler.cron '* * * * *' do
#scheduler.cron '0 0 * * *' do
#  $bot.server(199664376934825985).roles.each do |r|
#    $bot.send_message(199664376934825985, "#{r.mention}", tts = false,server_id = 197479353683148800) if r.name.include?('Sketch-a-Day')
#  end
#end

#scheduler.cron '0 0 * * 5' do
#  $bot.send_message(199664376934825985, "Theme: Free Draw Friday!")
#end

$bot.sync
