class DisplayViews
  def initialize;end
  
  def pluralise(num, string)
    num.to_i > 1 ? "#{string}s" : string
  end

  def sorted_log_list(arr_of_arr, string)
    arr_of_arr.each_with_index {|log, i| puts "#{i + 1}. #{log[0]} has #{log[1]} #{pluralise(log[1], string)}"}
  end

  def display_list(arr_of_arr, string)
    puts "Your ordered webserver log:"
    sorted_log_list(arr_of_arr, string)
  end
end