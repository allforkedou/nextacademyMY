def diamond(int,char)
  if (int==0)
    return
  else
    max_n = 2*int-1
    for i in 0..int-1
      puts " "*(max_n/2 - i)+char*(2*i+1)+" "*(max_n/2 - i)
    end
    for i in 1..int-1
      puts " "*(i)+char*(max_n-2*(i))+" "*(i)
    end
   end
end


#Testcases
diamond(0,'*')
diamond(1,'*')
diamond(5,'*')
