desc "This task is called by the Heroku scheduler add-on"
task :update_likecount => :environment do
  puts "Updating likecount..."
  Company.update_all("likecount=likecount+1")
  puts "done."
end
