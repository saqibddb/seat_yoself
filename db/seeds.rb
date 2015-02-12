puts "Creating admin..."
User.create!(
  email: "admin@example.com",
  password: "password",
  name: "Andy Admin",
  admin: true
)

puts "\nCreating users..."
30.times do
  User.create!(
    email: Faker::Internet.email,
    password: "example",
    name: Faker::Name.name,
    admin: false
  )
  print "|"
end

puts "\nCreating Restaurants..."
Restaurant.create!(
  name: "Panera Bread",
  city: "Toronto",
  address: "322 Yonge Street, Toronto ON M5B 1R8",
  phone_number: "(416) 205-9371",
  picture_url: "https://irs3.4sqi.net/img/general/width960/li15FXSLR1pgr2xhIVfsdVOCab7zOOrPkB-44FF9fXY.jpg",
  capacity: 50
)
Restaurant.create!(
  name: "Canoe",
  city: "Toronto",
  address: "66 Wellington St West (at Bay Street), Toronto ON M5K 1H6",
  phone_number: "(416) 364-0054",
  picture_url: "https://irs2.4sqi.net/img/general/width960/40552945_TQEFLo-g71a0_bGBAviojaNRHYq39CwT5bZ2ZGAfSX0.jpg",
  menu_url: "https://foursquare.com/v/canoe/4ad4c05df964a52059f620e3/menu",
  capacity: 50
)
Restaurant.create!(
  name: "Black Camel",
  city: "Toronto",
  address: "4 Crescent Rd (Yonge), Toronto ON M4W 1S9",
  phone_number: "(416) 929-7518",
  picture_url: "https://irs3.4sqi.net/img/general/width960/9447341_dpaK1WCVNeIqCtz-cFNxAxiDu3OxxHi6nZbAHiXi06Q.jpg",
  menu_url: "https://foursquare.com/v/black-camel/4ad88fa9f964a520511221e3/menu",
  capacity: 50
)
Restaurant.create!(
  name: "Pizzeria Libretto",
  city: "Toronto",
  address: "221 Ossington Ave (at Dundas St W), Toronto ON M6J 2Z8",
  phone_number: "(416) 532-8000",
  picture_url: "https://irs0.4sqi.net/img/general/width960/4877207_QoLCk98K0h-MHWrCv7IhXSIbiFp8cS_Mlx69NNvMZaM.jpg",
  menu_url: "https://foursquare.com/v/pizzeria-libretto/4ada6d36f964a520802221e3/menu",
  capacity: 50
)
Restaurant.create!(
  name: "Banh Mi Boys",
  city: "Toronto",
  address: "392 Queen St. W, Toronto ON M5V 2A6",
  phone_number: "(416) 363-0588",
  picture_url: "https://irs2.4sqi.net/img/general/width960/3Ljxkc15eYgVHa3fTa2lKVTK8S6yzmYzNFSRT1e-vec.jpg",
  menu_url: "https://foursquare.com/v/banh-mi-boys/4edeae9d61af80fe89aa3f54/menu",
  capacity: 50
)
Restaurant.create!(
  name: "Dhaba Indian express",
  city: "Toronto",
  address: "300 Queen St. W, Toronto ON M5V 2A6",
  phone_number: "(416) 333-0588",
  picture_url: "http://www.opentable.com/img/restimages/12808.jpg",
  menu_url: "http://www.dhaba.ca/menus/",
  capacity: 50
)
Restaurant.create!(
  name: "Amsterdam Brewhouse & Restaurant",
  city: "Toronto",
  address: "120 Queen St. E, Toronto ON M5V 2A6",
  phone_number: "(416) 433-1298",
  picture_url: "http://www.opentable.com/img/restimages/107884.jpg",
  menu_url: "http://amsterdambrewhouse.com/in-the-kitchen/",
  capacity: 50
)
Restaurant.create!(
  name: "BlowFish on Bay",
  city: "Toronto",
  address: "200 Bay St., Toronto ON M5V 2A6",
  phone_number: "(416) 335-0548",
  picture_url: "http://www.opentable.com/img/restimages/76546.jpg",
  menu_url: "http://www.blowfishrestaurant.com/menu/",
  capacity: 50
)

puts "\nCreating Reservations..."
100.times do
  Reservation.create!(
    time: Faker::Time.forward(14, :evening),
    party_size: Faker::Number.digit,
    user_id: User.all.sample.id,
    restaurant_id: Restaurant.all.sample.id
  )
end