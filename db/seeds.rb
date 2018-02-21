require_relative("../models/album")
require_relative("../models/artist")

require("pry-byebug")

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  "name" => "Suzanne Ciani",
  })

artist1.save()

artist2 = Artist.new({
  "name" => "Craig Leon",
  })

artist2.save()

artist3 = Artist.new({
  "name" => "Dinosaur Jr.",
  })

artist3.save()

artist4 = Artist.new({
  "name" => "Scooter",
  })

artist4.save()

artist5 = Artist.new({
  "name" => "The Monks",
  })

artist5.save()

artist6 = Artist.new({
  "name" => "Carla dal Forno",
  })

artist6.save()

artist7 = Artist.new({
  "name" => "Swans",
  })

artist7.save()

artist8 = Artist.new({
  "name" => "Francis Bebey",
  })

artist8.save()

album1 = Album.new({
  "title" => "Lixiviation",
  "artist_id" => artist1.id,
  "stock_level" => 4
  })

album1.save()

album2 = Album.new({
  "title" => "Buchla Concerts 1975",
  "artist_id" => artist1.id,
  "stock_level" => 2
  })

album2.save()

album3 = Album.new({
  "title" => "Early Electronic Works",
  "artist_id" => artist2.id,
  "stock_level" => 5
  })

album3.save()

album4 = Album.new({
  "title" => "You're Living All Over Me",
  "artist_id" => artist3.id,
  "stock_level" => 1
  })

album4.save()

album5 = Album.new({
  "title" => "Jumping All Over The World",
  "artist_id" => artist4.id,
  "stock_level" => 1
  })

album5.save()

album6 = Album.new({
  "title" => "Black Monk Time",
  "artist_id" => artist5.id,
  "stock_level" => 0
  })

album6.save()

album7 = Album.new({
  "title" => "You Know What It's Like",
  "artist_id" => artist6.id,
  "stock_level" => 10
  })

album7.save()

album8 = Album.new({
  "title" => "Psychedelic Sanza",
  "artist_id" => artist6.id,
  "stock_level" => 10
  })

album8.save()



binding.pry
nil
