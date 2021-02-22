require_relative 'display_views'

class WebpageHistory
  attr_reader :log_file_name

  def initialize(log_file_name)
    @log_file_name = log_file_name
    @total_views_arr = []
    @total_views_hash = Hash.new(0)
    @unique_views_hash = Hash.new(0)
    @view = DisplayViews.new
  end

  def display_total_views
    sorted_views(@total_views_hash, "total visit")
    return [@total_views_hash, @total_views_arr]
  end

  def display_unique_views
    sorted_views(@unique_views_hash, "unique view")
    return [@unique_views_hash, @unique_views_arr]
  end

  private

  def file_path
    File.dirname(__FILE__) + "/#{@log_file_name}"
  end
  
  def log_line_to_arr
    IO.foreach(file_path) do |line|
      @total_views_arr << line.split(' ')
      @unique_views_arr = @total_views_arr.uniq
    end
  end
  
  def create_hash_counter(arr, hash)
    arr.each { |element| hash[element[0]] += 1 }
  end

  def views_counter
    log_line_to_arr
    create_hash_counter(@total_views_arr, @total_views_hash)
    create_hash_counter(@unique_views_arr, @unique_views_hash)
  end

  def views_counter_condition
    (@total_views_arr.empty?) ? views_counter : @total_views_hash && @unique_views_hash
  end

  def sort_hash(hash)
    hash.sort_by {|_k, v| -v}
  end

  def sorted_views(hash, string)
    views_counter_condition
    arr_of_arr = sort_hash(hash)
    @view.display_list(arr_of_arr, string)
  end
end