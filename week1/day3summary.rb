#Enumerables: reduce and inject are the same
# Sum some numbers
(5..10).reduce(:+)                             #=> 45
# Same using a block and inject
(5..10).inject { |sum, n| sum + n }            #=> 45
# Multiply some numbers
(5..10).reduce(1, :*)                          #=> 151200
# Same using a block
(5..10).inject(1) { |product, n| product * n } #=> 151200
(5..10).inject {|sum, n| sum + n } #=> 45# Multiply some numbers
(5..10).inject(1) {|product, n| product * n } #=> 151200# find the longest word
longest = %w{ cat sheep bear }.inject do |memo,word|
  memo.length > word.length ? memo : word
end
longest #=> "sheep"# find the length of the longest word
longest = %w{ cat sheep bear }.inject(0) do |memo,word|
  memo >= word.length ? memo : word.length
end
longest #=> 5
# find the longest word
longest = %w{ cat sheep bear }.inject do |memo, word| 
	#memo takes first index, word takes second index
	#next, memo takes second index, word takes third index
	puts 1 #this will run 2 times
   memo.length > word.length ? memo : word
end
longest#=> "sheep"

#Regex from regexone.com
abc…	Letters
123…	Digits
\d	Any Digit
\D	Any Non-digit character
.	Any Character
\.	Period
[abc]	Only a, b, or c
[^abc]	Not a, b, nor c
[a-z]	Characters a to z
[0-9]	Numbers 0 to 9
\w	Any Alphanumeric character
\W	Any Non-alphanumeric character
{m}	m Repetitions
{m,n}	m to n Repetitions
*	Zero or more repetitions
+	One or more repetitions
?	Optional character
\s	Any Whitespace
\S	Any Non-whitespace character
^…$	Starts and ends
(…)	Capture Group
(a(bc))	Capture Sub-group
(.*)	Capture all
(abc|def)	Matches abc or def

Problem 1: Matching a decimal numbers

Task	Text	 
Match	3.14529	Success
Match	-255.34	Success
Match	128	Success
Match	1.9e10	Success
Match	123,340.00	Success
Skip	720p	To be completed
My solution: ^-?\d+(\,\d+)*(\.\d+)?(e\d+)?$
Sample solution: ^-?\d+(,\d+)*(\.\d+(e\d+)?)?$

Problem 2: Matching phone numbers

Task	Text	Capture Groups	 
Capture	415-555-1234	415	Success
Capture	650-555-2345	650	Success
Capture	(416)555-3456	416	Success
Capture	202 555 4567	202	Success
Capture	4035555678	403	Success
Capture	1 416 555 9292	416	Success
My solution:(\d{3})
Sample solution: 1?[\s-]?\(?(\d{3})\)?[\s-]?\d{3}[\s-]?\d{4}

Problem 3: Matching emails

Task	Text	Capture Groups	 
Capture	tom@hogwarts.com	tom	Success
Capture	tom.riddle@hogwarts.com	tom.riddle	Success
Capture	tom.riddle+regexone@hogwarts.com	tom.riddle	Success
Capture	tom@hogwarts.eu.com	tom	Success
Capture	potter@hogwarts.com	potter	Success
Capture	harry@hogwarts.com	harry	Success
Capture	hermione+regexone@hogwarts.com	hermione	Success
My solution: ([\w\.]*)
Sample solution: ^([\w\.]*)

Problem 4: Matching HTML

Task	Text	Capture Groups	 
Capture	<a>This is a link</a>	a	Success
Capture	<a href='https://regexone.com'>Link</a>	a	Success
Capture	<div class='test_style'>Test</div>	div	Success
Capture	<div>Hello <span>world</span></div>	div	Success
My solution: ([\w]+)
Sample solutions:  <(\w+),  >([\w\s]*)<,  ([\w://.]*)


Problem 5: Matching specific filenames
Task	Text	Capture Groups	 
Skip	.bash_profile		To be completed
Skip	workspace.doc		To be completed
Capture	img0912.jpg	img0912 jpg	Success
Capture	updated_img0912.png	updated_img0912 png	Success
Skip	documentation.html		To be completed
Capture	favicon.gif	favicon gif	Success
Skip	img0912.jpg.tmp		To be completed
Skip	access.lock		To be completed
My solution: (.*)\.(jpg|gif|png)$
Sample solutions: (\w+)\.(jpg|png|gif)$

Problem 6: Trimming whitespace from start and end of line
Task	Text	Capture Groups	 
Capture				The quick brown fox...	The quick brown fox...	Success
Capture	   jumps over the lazy dog.	jumps over the lazy dog.	Success
My solution: \s*(\w.*)
Sample solution: ^\s*(.*)\s*$

Problem 7: Extracting information from a log file
Task	Text	Capture Groups	 
Skip	W/dalvikvm( 1553): threadid=1: uncaught exception		To be completed
Skip	E/( 1553): FATAL EXCEPTION: main		To be completed
Skip	E/( 1553): java.lang.StringIndexOutOfBoundsException		To be completed
Capture	E/( 1553):   at widget.List.makeView(ListView.java:1727)	makeView ListView.java 1727	Success
Capture	E/( 1553):   at widget.List.fillDown(ListView.java:652)	fillDown ListView.java 652	Success
Capture	E/( 1553):   at widget.List.fillFrom(ListView.java:709)	fillFrom ListView.java 709	Success
My solution: (\w+)\((\w+.\w+):(\d+)\)
Sample solution: (\w+)\(([\w\.]+):(\d+)\)

Problem 8: Parsing and extracting data from a URL
Exercise 8: Extracting Data From URLs
Task	Text	Capture Groups	 
Capture	ftp://file_server.com:21/top_secret/life_changing_plans.pdf	ftp file_server.com 21	Success
Capture	https://regexone.com/lesson/introduction#section	https regexone.com	Success
Capture	file://localhost:4040/zip_file	file localhost 4040	Success
Capture	https://s3cur3-server.com:9999/	https s3cur3-server.com 9999	Success
Capture	market://search/angry%20birds	market search	Success

My solution: (\w+)://(\w+-?\w+(.com)?):?(\d+)?
Sample solution:  (\w+)://([\w\-\.]+)(:(\d+))? 

p "hello".gsub(/[aeiou]/, '*')                  
# => this will return "h*ll*"

# 8. Given the string "12-34-56", substitute the middle portion with "*":
puts "Example 8:"
string = "12-34-56"
p string.gsub(/(\d{2})-\d{2}-(\d{2})/, '\1-**-\2')

# 9. Given the strings "12-34-56, 98-76-54", substitute the middle portion with "*":
puts "Example 9:"
string = "12-34-56, 98-76-54"
p string.gsub(/(\d{2})-\d{2}-(\d{2})/, '\1-**-\2')

# 10. Replace any non-word characters in a string with *A*:
puts "Example 10:"
string = "name@example.com"
p string.gsub(/\W/, "A")

