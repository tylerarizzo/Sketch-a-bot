require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

array = IO.readlines("./themes.txt")

new = array.sample(array.length)

i = 0

scheduler.cron '* * * * *' do
  puts new[i]
  i += 1
end
