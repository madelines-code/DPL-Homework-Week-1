# a resturuant looks like this
# res_data = {
#   id: INTEGER *MUST BE UNIQUE,
#   name: STRING,
#   location: {
#     city: STRING,
#     state: STRING,
#   },
#   delivery: BOOLEAN,
#   days_open: STRING *DAYS SEPERATED BY COMMAS(NO SPACES) ie 'mon,tue,wed',
#   likes: INTEGER,
#   dishes: ARRAY OF OBJECTS/HASHES
#     { name: STRING, price: FLOAT, ingredients: ARRAY OF STRINGS },
#   ],
#   reviews: ARRAY OF HASHES [
#     {user_id: INTEGER *id of user object, rating: INTEGER 0-5}
#   ]
# }
user1 = {
  id: 1,
  name: "Tony",
}
user2 = {
  id: 2,
  name: "Sally",
}
res1 = {
  id: 1,
  name: "Spicy Thai",
  location: {
    city: "SLC",
    state: "UT",
  },
  delivery: true,
  days_open: "mon,tues,wed,thur,fri,sat,sun",
  likes: 1000,
  dishes: [
    { name: "Pad Thai", price: 10.25, ingredients: ["noddles", "peppers"] },
    { name: "Drunken Noodle", price: 9.25, ingredients: ["noddles", "chicken"] },
  ],
  reviews: [
    { user_id: 1, rating: 5 },
    { user_id: 2, rating: 3 },
  ],
}
res2 = {
  id: 2,
  name: "Albertos",
  location: {
    city: "SLC",
    state: "UT",
  },
  delivery: false,
  days_open: "mon,tues,wed,thur,fri,sat",
  likes: 508,
  dishes: [
    { name: "Tacos", price: 8.25, ingredients: ["tortilla", "carne"] },
    { name: "Quesidalla", price: 9.25, ingredients: ["tortilla", "cheese"] },
  ],
  reviews: [
    { user_id: 1, rating: 2 },
    { user_id: 2, rating: 4 },
  ],
}

# access user1 name through user1
def user_name(user) 
  user[:name]
end

puts user_name(user1)
puts 
# access user1 name through res2 (user1 data is in reviews)
# create array of users
@users = [user1,user2]
def user_name2(res)
# get user id of user 1 from restaurant
  user_id_of_reviewer = res[:reviews][0][:user_id]
  @users.each do |name|
    if  name[:id] === user_id_of_reviewer
      puts name[:name]
    end
  end
 end

 user_name2(res2)
puts 


# access res1 reviews

def print_reviews(res)
  res[:reviews].each do |reviews|
    puts "User #{reviews[:user_id]} Rating: #{reviews[:rating]}"
  end
end

print_reviews(res1)
puts

# what does this output res1[:dishes]
# {:name=>"Pad Thai", :price=>10.25, :ingredients=>["noddles", "peppers"]}
# {:name=>"Drunken Noodle", :price=>9.25, :ingredients=>["noddles", "chicken"]}

# print out just the name of res1 dishes (each loop)


def print_dish_names(res)
  dish_names = []
  res[:dishes].each { |name| dish_names.push(name[:name]) }
  puts dish_names
end
  
print_dish_names(res1)
puts 
# print out just the name of res1 dishes along with 
# ingredients (nested each loop)

 def print_name_ingredients(res)
  res[:dishes].each do |list|
    puts "#{list[:name]}"
    puts "Ingredients:"
    list[:ingredients].each do |ingredient|
      puts ingredient
    end
  end
 end

 print_name_ingredients(res1)

 # why doesn't this work??
#  def print_name_ingredients2(res)
#   list_of_dishes = res.slice(:name, :ingredients)
#  end

# puts print_name_ingredients2(res1)

# create a function that takes a user and return a string with the users name and id

def name_id(user)
  puts "name: #{user[:name]} id: #{user[:id]}"
end 

name_id(user1)

# create a method that takes a res and returns the menu of that res
def restaurant_menu(res)
  puts "#{res[:name]} Menu"
  puts
  res[:dishes].each do |list|
    puts "#{list[:name]}"
    puts "Contains:"
    list[:ingredients].each do |ingredient|
      puts ingredient 
    end
    puts "Price: #{list[:price]}"
    puts
  end
end 

restaurant_menu(res1)

# create a method that takes a res and returns average review
def avg_review(res)
  rating_arr = []
  total_rating = 0
  res[:reviews].each do |rating|
    rating_arr.push(rating[:rating])
  end
  res[:reviews].each do |rating|
    total_rating += rating[:rating]
  end
  average = total_rating / (rating_arr.length)
  puts average
end

avg_review(res2)
avg_review(res1)

# create an array of restaurants and do CRUD actions

# a simple that takes a restaurants and adds to your array
@restaurants = [res1,res2]
@res3 = {
  id: 3,
  name: "Papa Johns",
  location: {
    city: "SLC",
    state: "UT",
  },
  delivery: true,
  days_open: "mon,tues,wed,thur,fri,sat,sun",
  likes: 510,
  dishes: [
    { name: "Supreme Pizza", price: 11.25, ingredients: ["crust", "peppers","onions"] },
    { name: "Cheese Pizza", price: 12.25, ingredients: ["crust", "cheese"] },
  ],
  reviews: [
    { user_id: 1, rating: 6 },
    { user_id: 2, rating: 3 },
  ] }


 def add_restaurant(res)
  @restaurants.push(res)
 end

 add_restaurant(@res3)

# read - list restaurants
def print_restaurants(arr)
  arr.each do |list|
    p "#{list[:name]}, #{list[:location][:city]}"
  end
end

print_restaurants(@restaurants)

# update - a simple method that takes restaurants and updates that to your array
def update_restaurant(res)
  res[:days_open] = "bugsday, noobsday, funday"
end

update_restaurant(res1)
p "#{res1}"

# delete - delete a restaurant
def delete_restaurant(res)
  @restaurants.delete(res)
end

delete_restaurant(res1)
print_restaurants(@restaurants)

# loop through your restaurants and return those with likes > 500 (select/filter)
def likes_over_500(arr)
  arr.each do |fivehund|
    if fivehund[:likes] > 500 
      puts fivehund[:name]
    end

  end
end

likes_over_500(@restaurants)
