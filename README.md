# WEBSERVER PAGE HISTORY

### INTRODUCTION
- The aim of this challenge was use a webserver log file to present the total number of views of each of the webserver routes, and the number of unique views for each of these routes. The web-pages needed to be listed in order from most viewed to least.
- Each line of the log file comprises the web-path visited and the ip address of the visitor.
- An interface.rb file was created which outputs either the list of total views for each page, or the unique views; depending on what the user wants to see.

### APPROACH
- As stated above each line of the log file contained web-path visited and the ip address of the visitor.
- I initially understood that the total views of a particular web-path would be equal to the count of all of all lines in which that webpath appeared (disregarding the ip address) and the unique views would be the total views of a particular web-path accounting for any revisits of the same ip address.

- I created a WebpageHistory class initialised with the log_file_name required as a parameter, but also initialised two counter hashes as I knew a separate count would be needed for total and unique page views.
- I read in the file line by line (creating an array for each line) once only and this minimises memory usage. 
- From here I was able to create two arrays: one to store all lines of the log (for total views) and the other, the same but with duplicates removed (ie same ip address and web-path).
- The two hashes could now be produced where if the web-path (key of hash) was in an element of the array, then it's hash value was incremented by one. These keys and values are what are outputted in the final list, but were first sorted.

- I created a DisplayViews class to keep the implementation organised. This contains the methods concerned with how the results would be outputted, including a pluralise method.

#### OTHER NOTES
- In the WebpageHistory class the only necessary public methods are to display the total views and unique views, so all others are private methods.
- The arrays and hashes for total views and unique views are returned from these methods for test purposes.

- In order to not reread the file in, which deters increased storage in memory, and also messes up the hash count, the 'views_counter_condition' method checks if the file has already been read and if so outputs the already formed hashes from the previous method call.

### TESTING
- A test.log file was created that had the exact format of webserver.log provided, but an a lot smaller file, where tests could easily be written for.
- The tests cover the public methods in WebpageHistory class and also instance methods in the DisplayViews class.

### HOW TO USE
- Run ```ruby lib/interface.rb``` from the app directory.
- Run ```rspec``` to check tests.
