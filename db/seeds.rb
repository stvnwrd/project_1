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

binding.pry
nil
