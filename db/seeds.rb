require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# ApplicationRecord.transaction do 
    puts "Destroying tables..."
    # Unnecessary if using `rails db:seed:replant`
    User.destroy_all
    Trail.destroy_all
  
    puts "Resetting primary keys..."
    # For easy testing, so that after seeding, the first `User` has `id` of 1
    ApplicationRecord.connection.reset_pk_sequence!('users')
    ApplicationRecord.connection.reset_pk_sequence!('trails')
  
    puts "Creating users..."
    # Create one user with an easy to remember username, email, and password:
    User.create!(
      username: 'Demo-lition', 
      email: 'demo@user.io', 
      password: 'password'
    )
    

    hemp = Trail.create!(
      name: 'Hempstead Lake Park',
      description: 'This is a beautiful lake side trail. Mainly dirt paths. Kid,pet,and bike friendly. Please do not grill in areas that are not desinated for grilling. Also, please do not swim in the lake.',
      location: 'West Hempstead',
      difficulty: 'Easy',
      length: 3.2,
      lat: 40.6831,
      lon: -73.6431

    )
    hemp.photo.attach(io: URI.open("https://sometrails-seeds.s3.amazonaws.com/hempsteadstatepark.webp"), filename: "hemp.jpeg")

    Trail.create!(
      name: "Brooklyn Bridge Walk via Manhattan",
      location: "New York",
      length: 2.4,
      difficulty: "Easy",
      description: "This is a fun and scenic walk from Manhattan to Brooklyn across one of the country's most famous bridges.",
      lat: 40.75989,
      lon: -74.0949082
    )

    high_line = Trail.create!(
      name: "High Line Park",
      location: "Manhattan",
      length: 1.2,
      difficulty: "Easy",
      description: "Experience this 1.2-mile point-to-point trail near New York City, New York. Generally considered an easy route, it takes an average of 21 min to complete. This is a very popular area for walking, so you'll likely encounter other people while exploring. The trail is open year-round and is beautiful to visit anytime. You'll need to leave pups at home — dogs aren't allowed on this trail.",
      lat: 40.761655,
      lon: -74.0965795
    )

    high_line.photo.attach(io: URI.open("https://sometrails-seeds.s3.amazonaws.com/high_line_park.webp"), filename: "highline.webp")

    Trail.create!(
      name: "Peaks of Prospect Park",
      location: "Brooklyn",
      length: 1.2,
      difficulty: "Moderate",
      description: "Experience this 5.0-mile loop trail near New York City, New York. Generally considered a moderately challenging route, it takes an average of 1 h 49 min to complete. This is a very popular area for birding, hiking, and running, so you'll likely encounter other people while exploring. The trail is open year-round and is beautiful to visit anytime. Dogs are welcome, but must be on a leash.",
      lat: 40.7461805,
      lon: -74.0815221


    )

    Trail.create!(
      name: "Central Park East and West Drive Loop",
      location: "Manhattan",
      length: 6.1,
      difficulty: "Easy",
      description: "Explore this 6.1-mile loop trail near New York City, New York. Generally considered an easy route, it takes an average of 2 h 2 min to complete. This is a very popular area for road biking, running, and walking, so you'll likely encounter other people while exploring. The trail is open year-round and is beautiful to visit anytime. Dogs are welcome, but must be on a leash.",
      lat: 40.7440492,
      lon: -74.0320115
    )

    Trail.create!(
      name: "Stillwell Woods Trail",
      location: "Woodbury",
      length: 4.3,
      difficulty: "Moderate",
      description: "Explore this 6.1-mile loop trail near New York City, New York. Generally considered an easy route, it takes an average of 2 h 2 min to complete. This is a very popular area for road biking, running, and walking, so you'll likely encounter other people while exploring. The trail is open year-round and is beautiful to visit anytime. Dogs are welcome, but must be on a leash.",
      lat: 40.8155816,
      lon: -73.6077985

    )

    Trail.create!(
      name: "Blydenburgh County Park Stump Pond Loop",
      location: "Smithtown",
      length: 6.1,
      difficulty: "Easy",
      description: "Head out on this 6.1-mile loop trail near Hauppauge, New York. Generally considered an easy route, it takes an average of 1 h 55 min to complete. This is a very popular area for birding, fishing, and hiking, so you'll likely encounter other people while exploring. The trail is open year-round and is beautiful to visit anytime. Dogs are welcome and may be off-leash in some areas.",
      lat: 40.7836807,
      lon: -73.7371351


    )

    Trail.create!(
      name: "Caumsett State Historic Park Perimeter Loop",
      location: "Lloyd Harbor",
      length: 6.1,
      difficulty: "Easy",
      description: "Experience this 5.2-mile loop trail near Huntington, New York. Generally considered an easy route, it takes an average of 1 h 49 min to complete. This is a very popular area for birding, hiking, and mountain biking, so you'll likely encounter other people while exploring. The trail is open year-round and is beautiful to visit anytime. You'll need to leave pups at home — dogs aren't allowed on this trail.",
      lat: 40.8571398,
      lon: -73.5956204

    )

    # Trail.create!(
    #   name: "Nassau-Suffolk Trail: Cold Spring Harbor to Uplands Farm Sanctuary",
    #   location: "Cold Spring Harbor",
    #   length: 5.2,
    #   difficulty: "Moderate",
    #   description: "Get to know this 5.2-mile out-and-back trail near Cold Spring Harbor, New York. Generally considered a moderately challenging route, it takes an average of 2 h 21 min to complete. This is a very popular area for birding, cross-country skiing, and hiking, so you'll likely encounter other people while exploring. The trail is open year-round and is beautiful to visit anytime."

    # )

    # Trail.create!(
    #   name: "Sunken Meadow Trail",
    #   location: "Kings Park",
    #   length: 3.5,
    #   difficulty: "Moderate",
    #   description: "Get to know this 3.5-mile loop trail near Kings Park, New York. Generally considered a moderately challenging route, it takes an average of 1 h 24 min to complete. This is a very popular area for hiking and running, so you'll likely encounter other people while exploring. The trail is open year-round and is beautiful to visit anytime. Dogs are welcome, but must be on a leash."
    # )

    # Trail.create!(
    #   name: "Cold Spring Harbor Trailhead to Lawrence Hill Road",
    #   location: "Cold Spring Harbor",
    #   length: 1.8,
    #   difficulty: "Moderate",
    #   description: "Explore this 1.8-mile out-and-back trail near Cold Spring Harbor, New York. Generally considered a moderately challenging route, it takes an average of 54 min to complete. This is a very popular area for hiking and running, so you'll likely encounter other people while exploring. The trail is open year-round and is beautiful to visit anytime. Dogs are welcome, but must be on a leash."

    # )

    # Trail.create!(
    #   name: "Massapequa Lake Trail",
    #   location: "Massapequa",
    #   length: 6.3,
    #   difficulty: "Easy",
    #   description: "Discover this 6.3-mile out-and-back trail near Massapequa Park, New York. Generally considered an easy route, it takes an average of 1 h 50 min to complete. This is a very popular area for fishing, road biking, and snowshoeing, so you'll likely encounter other people while exploring. The trail is open year-round and is beautiful to visit anytime. You'll need to leave pups at home — dogs aren't allowed on this trail."

    # )

    # Trail.create!(
    #   name: "Connetquot River State Park Preserve",
    #   location: "Great River",
    #   length: 3.0,
    #   difficulty: "Easy",
    #   description: "Discover this 6.3-mile out-and-back trail near Massapequa Park, New York. Generally considered an easy route, it takes an average of 1 h 50 min to complete. This is a very popular area for fishing, road biking, and snowshoeing, so you'll likely encounter other people while exploring. The trail is open year-round and is beautiful to visit anytime. You'll need to leave pups at home — dogs aren't allowed on this trail."
    # )

    # Trail.create!(
    #   name: "Connetquot River State Park Preserve",
    #   location: "Great River",
    #   length: 3.0,
    #   difficulty: "Easy",
    #   description: "Discover this 6.3-mile out-and-back trail near Massapequa Park, New York. Generally considered an easy route, it takes an average of 1 h 50 min to complete. This is a very popular area for fishing, road biking, and snowshoeing, so you'll likely encounter other people while exploring. The trail is open year-round and is beautiful to visit anytime. You'll need to leave pups at home — dogs aren't allowed on this trail."
    # )

    # Trail.create!(
    #   name: "Avalon/East Farm Preserve",
    #   location: "Stony Brook",
    #   length: 3.5,
    #   difficulty: "Easy",
    #   description: "Head out on this 3.5-mile loop trail near St. James, New York. Generally considered an easy route, it takes an average of 1 h 16 min to complete. This is a very popular area for birding, hiking, and running, so you'll likely encounter other people while exploring. The trail is open year-round and is beautiful to visit anytime. Dogs are welcome, but must be on a leash."
    # )

    # Trail.create!(
    #   name: "Belmont Lake Trail",
    #   location: "Babylon",
    #   length: 1.4,
    #   difficulty: "Easy",
    #   description: "Discover this 1.4-mile loop trail near North Babylon, New York. Generally considered an easy route, it takes an average of 25 min to complete. This is a very popular area for birding, hiking, and mountain biking, so you'll likely encounter other people while exploring. The trail is open year-round and is beautiful to visit anytime. Dogs are welcome, but must be on a leash."
    # )

    # Trail.create!(
    #   name: "Muttontown Preserve",
    #   location: "Muttontown",
    #   length: 2.5,
    #   difficulty: "Easy",
    #   description: "Explore this 2.5-mile loop trail near East Norwich, New York. Generally considered an easy route, it takes an average of 52 min to complete. This is a very popular area for cross-country skiing, hiking, and running, so you'll likely encounter other people while exploring. The trail is open year-round and is beautiful to visit anytime. You'll need to leave pups at home — dogs aren't allowed on this trail."
    # )

    # Trail.create!(
    #   name: "Bethpage Bikeway Trail",
    #   location: "Woodbury",
    #   length: 13.2,
    #   difficulty: "Easy",
    #   description: "Head out on this 13.2-mile point-to-point trail near Plainview, New York. Generally considered an easy route, it takes an average of 4 h 8 min to complete. This is a popular trail for road biking, running, and walking, but you can still enjoy some solitude during quieter times of day. The trail is open year-round and is beautiful to visit anytime. You'll need to leave pups at home — dogs aren't allowed on this trail."
    # )

    # Trail.create!(
    #   name: "Norman J. Levy Park and Preserve",
    #   location: "Merrick",
    #   length: 2.2,
    #   difficulty: "Easy",
    #   description: "Explore this 2.2-mile loop trail near Merrick, New York. Generally considered a moderately challenging route, it takes an average of 46 min to complete. This is a very popular area for birding, running, and walking, so you'll likely encounter other people while exploring. The trail is open year-round and is beautiful to visit anytime. You'll need to leave pups at home — dogs aren't allowed on this trail."
    # )



    



    

    
  
    # More users
    10.times do 
      User.create!({
        username: Faker::Internet.unique.username(specifier: 3),
        email: Faker::Internet.unique.email,
        password: 'password'
      }) 
    end
  
    puts "Done!"
  # end
  
