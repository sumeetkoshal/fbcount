desc "This task will increment likecount every day"
task :cron => :environment do
  if Time.now.min%5 == 0 # run every 5 minutes - for testing only
    #if Time.now.hour == 0 # run at midnight
    Company.update_all("likecount=likecount+1")
  end
end