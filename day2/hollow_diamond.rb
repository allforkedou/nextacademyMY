def hollow_diamond(int,char)
  if (int==0)
    return
  else
    max_n = 2*int-1
    if (max_n==1)
      puts char
    elsif(max_n>1)
      puts " "*(max_n/2)+char+" "*(max_n/2)
        for i in 1..int-1
          puts " "*(max_n/2 - i)+char+" "*(2*i-1)+char+" "*(max_n/2 - i)
        end
        for i in 1..int-2
          puts " "*(i)+char+" "*(max_n-2*(i)-2)+char+" "*(i)
        end
      puts " "*(max_n/2)+char+" "*(max_n/2)
    else
      return
    end
   end
end

#Testcases
hollow_diamond(0,'*')
hollow_diamond(1,'*')
hollow_diamond(5,'*')
