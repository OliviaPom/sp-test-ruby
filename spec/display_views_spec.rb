require "display_views"

describe DisplayViews do
  let(:disview) { DisplayViews.new }

  it "Checks that that view/visit is pluralised if necessary" do
    arr = [["/home", "2"]]
    arr2 = [["/home", "1"]]
    string = "view"

    $stdout = StringIO.new
    disview.sorted_log_list(arr, string)
    $stdout.rewind 
    expect($stdout.gets.strip).to eq("1. /home has 2 views")

    $stdout = StringIO.new
    disview.sorted_log_list(arr2, string)
    $stdout.rewind 
    expect($stdout.gets.strip).to eq("1. /home has 1 view")
  end
end
