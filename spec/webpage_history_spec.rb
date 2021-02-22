require "webpage_history"

describe WebpageHistory do
  let(:webhis_test) { WebpageHistory.new("test.log") }

  it "WebpageHistory constructor should only take one parameter" do
    initialize_parameters_count = WebpageHistory.allocate.method(:initialize).arity
    expect(initialize_parameters_count).to eq 1
  end

  it "An instance of WebpageHistory should have a log file-name which is a string" do
    expect(webhis_test).to respond_to :log_file_name
    expect(webhis_test.log_file_name).to be_a String
  end

  it "The number of pages visited and total number of views can be calculated" do
    expect(webhis_test.display_total_views[0].length).to eq 6
    expect(webhis_test.display_total_views[1].length).to eq 13
  end

  it "The total number of unique views can be calculated" do  
    expect(webhis_test.display_unique_views[1].length).to eq 10
  end
  
  it "The views are sorted by highest to lowest views" do
    expect(webhis_test.display_total_views[0]).to eq({"/help_page/1"=>5, "/contact"=>3, "/home"=>2, "/about/2"=>1, "/index"=>1, "/about"=>1})
  end  
end
