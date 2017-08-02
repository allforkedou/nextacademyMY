# 1. Tic-Tac-Toe Revisited - Populating a Board

# Take a look at the simple 2 dimensional array for Tic-Tac-Toe from the previous challenge. Let’s say we wanted to generate 10 sample boards with x’s and o’s. How would you do that? How do you make the x’s and o’s random? In the first iteration, it’s OK to create boards that don’t have logical ratio of x’s and o’s.

# Write some driver code with a test to make sure your method is working, and your resultant array has 9 elements. What Array method would you use?

# Extra Credit: Go ahead and populate a board with a realistic ratio of x’s and o’s. There should only be either 5 x’s or 4 o’s or vice versa. There’s an enumerable method that works on arrays that can help you! How could you write a good driver code test to make sure the array has the right number of x’s and o’s?

def generate_realistic_tic_tac_toe
  tic_tac_toe = Array.new(3){Array.new(3)}
  x_count = 0
  o_count = 0
  for i in 0..2
    for j in 0..2
      if (x_count==5 && o_count<4)
        tic_tac_toe[i][j] = 'O'
        o_count += 1
      elsif (o_count==5 && x_count<4)
        tic_tac_toe[i][j] = 'X'
        x_count += 1
      else
        if (rand(2)==0)
          tic_tac_toe[i][j] = 'O'
          o_count += 1
        else
          tic_tac_toe[i][j] = 'X'
          x_count += 1
        end
      end
    end
  end
  return tic_tac_toe
end

p generate_realistic_tic_tac_toe