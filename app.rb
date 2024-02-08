require "sinatra"
require "sinatra/reloader"

# Home
get("/") do

  
  erb(:hello)
end

# Square
get("/square/new") do

  
  erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num ** 2
  
  erb(:square_results)
end

# Square Root
get("/square_root/new") do
  erb(:new_square_root_calc)
end

get("/square_root/results") do
  @the_num = params.fetch("users_number").to_f

  @the_result = Math.sqrt(@the_num)
  
  erb(:square_root_results)
end


# Random
get("/random/new") do
  erb(:rand_calc)
end

get("/random/results") do
  @min = params.fetch("min_number").to_f
  @max = params.fetch("max_number").to_f


  @the_result = rand(@min..@max)
  
  erb(:rand_results)
end


# Payment
get("/payment/new") do
  erb(:payment_calc)
end 

get("/payment/results") do
  @apr = params.fetch("apr").to_f
  @yrs = params.fetch("years").to_f
  @pv = params.fetch("pv").to_f


  @apr = (@apr /100) /12
  @yrs *= 12


  @the_result = @pv * (@apr * (1 + @apr)** @yrs) / ((1 + @apr)** @yrs - 1)

  erb(:payment_results)
end 
