Ruby 2.0 introduced keyword arguments, and ** acts like *, but for keyword arguments. It returns a Hash with key / value pairs.

For this code:

def foo(a, *b, **c)
  [a, b, c]
end
Here's a demo:

> foo 10
=> [10, [], {}]
> foo 10, 20, 30
=> [10, [20, 30], {}]
> foo 10, 20, 30, d: 40, e: 50
=> [10, [20, 30], {:d=>40, :e=>50}]
> foo 10, d: 40, e: 50
=> [10, [], {:d=>40, :e=>50}]