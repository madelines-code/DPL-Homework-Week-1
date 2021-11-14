// a resturuant looks like this
// res_data = {
//   id: INTEGER *MUST BE UNIQUE,
//   name: STRING,
//   location: {
//     city: STRING,
//     state: STRING,
//   },
//   delivery: BOOLEAN,
//   days_open: STRING *DAYS SEPERATED BY COMMAS(NO SPACES) ie 'mon,tue,wed',
//   likes: INTEGER,
//   dishes: ARRAY OF OBJECTS/HASHES
//     { name: STRING, price: FLOAT, ingredients: ARRAY OF STRINGS },
//   ],
//   reviews: ARRAY OF HASHES [
//     {user_id: INTEGER *id of user object, rating: INTEGER 0-5}
//   ]
// }
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
  likes: 500,
  dishes: [
    { name: "Tacos", price: 8.25, ingredients: ["tortilla", "carne"] },
    { name: "Quesidalla", price: 9.25, ingredients: ["tortilla", "cheese"] },
  ],
  reviews: [
    { user_id: 1, rating: 2 },
    { user_id: 2, rating: 4 },
  ],
}
// access user1 name through user1
const userName = (user) => {
  console.log(user.name)
}

userName(user1)

// access user1 name through res2 (user1 data is in reviews)
const userName2 = (res) => {
  res.reviews.user_id.get(user_id);
  console.log(userId);
};

console.log(userName2(res2, 1))