namespace :date_time_picker do
  task :install do
    File.open('config/date_time_picker.yml', 'w') do |f|
      f.puts 'test started at #{Time.now}'
      f.puts 'test ended at #{Time.now}'
    end
  end
end
