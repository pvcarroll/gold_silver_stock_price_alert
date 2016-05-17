desc "This task is called by the Heroku scheduler add-on"
task :check_targets => :environment do
  puts 'SCHEDULER - CHECK_TARGETS'
  Alert.check_target_values
end