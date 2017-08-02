def harsh(arr1,arr2)
	[arr1, arr2].inject({}) do |r, s|
	  r.merge!({s[0] => s[1]})
	end
end

p harsh(["Number", "Name", "Position", "Points per Game"],[12, "Joe Schmo", "Center", [14, 32, 7, 0, 23] ])