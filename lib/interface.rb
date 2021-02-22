require_relative "webpage_history"

webhis = WebpageHistory.new("webserver.log")

puts "\n\n*** VIEW YOUR WEBPAGE HISTORY HERE ***\n\n"

running = true

while running
  puts "What do you want to see? type 'a' for total page views history OR 'b' for unique page views:"
  puts "Type 'exit' if you've finished!"

  user_answer = gets.chomp  
  if user_answer == 'a'
    puts "****************************"
    webhis.display_total_views
    puts "****************************"
  elsif user_answer == 'b'
    puts "****************************"
    webhis.display_unique_views
    puts "****************************"
  elsif user_answer == 'exit'
    puts "See you next time!"
    running = false
  end
end