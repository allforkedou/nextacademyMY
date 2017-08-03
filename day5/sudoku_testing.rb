board_string = '619030040270061008000047621486302079000014580031009060005720806320106057160400030'
board_string.split('').each_slice(9) do |row|
  	new_row = row.map do |cell|
  		if (cell == '0')
  			cell = '-'
  		else
  			#do nothing
  			cell = cell
  		end
  	end
  	p new_row.join(' ')
 end