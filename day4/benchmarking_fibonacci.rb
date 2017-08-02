require 'benchmark'
load 'fibonacci.rb'
n = 1000
Benchmark.bm do |x|
	x.report {n.times do ; fibonacci_iterative(10); end} #0.000668
	x.report {n.times do ; fibonacci_recursive(10); end} #0.007035
end
