# Rewrite your Table of Contents program (from the chapter on methods). Start the program with an array holding all of the information for your Table of Contents (chapter names, page numbers, etc.). Then print out the information from the array in a beautifully formatted Table of Contents. 
width = 40
puts 'Table of Contents'.center(width)
chapters = ['Numbers', 'Letters', 'Variables']
pages = ['1','72','118']
chapters.zip pages
i = 1
chapters.zip(pages).each do |chap,pg|
	puts (('Chapter '+ i.to_s + ': '+chap).ljust(width/2) + ('page '+pg).rjust(width/2))
	i = i+1
end
