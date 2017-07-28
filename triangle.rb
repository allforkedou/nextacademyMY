def triangle_up(height,char)
  for i in 1..height
    puts char*i
  end
end

def triangle_down(height,char)
  if (height==0)
    return
  else
    puts char*height
    return triangle_down(height-1,char)
  end
end