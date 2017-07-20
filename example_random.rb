require 'set'
require 'rubygems'
require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

#def rand_n(n, max)
#    randoms = Set.new
#    loop do
#        randoms << rand(max)
#        return randoms.to_a if randoms.size >= n
#    end
#end

scheduler.cron '* * * * *' do
#    example = rand_n(1,25)
#    puts example
end
