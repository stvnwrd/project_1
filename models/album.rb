require_relative('../db/sql_runner')
require_relative('./artist.rb')

class Album

  attr_accessor :id, :title, :artist_id, :stock_level

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @artist_id = options['artist_id'].to_i
    @stock_level = options['stock_level'].to_i
  end


  def save()
    sql = "INSERT INTO albums (title, artist_id, stock_level) VALUES ($1, $2, $3) RETURNING id"
    values = [@title, @artist_id, @stock_level]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE albums SET (title, artist_id, stock_level) = ($1, $2, $3) WHERE id = $4"
    values = [@title, @artist_id, @stock_level, @id]
    SqlRunner.run( sql, values )
  end


  def crude_stock_status()
    return "In Stock" if @stock_level >= 5
    return "Low Stock - Re-Order Now" if @stock_level >= 2
    return "Only 1 left!!!" if @stock_level == 1
    return "Out of Stock" if @stock_level <= 0
  end

  # crude_stock_status method
  # if the stock level is greater than or equal to 5 return "In Stock"
  # if the stock level is between 2 and 5 return "Low Stock"
  # if the stock level is equal to 1 return "Only 1 left"
  # if the stock level is zero return "Out of Stock"



  def self.delete(id)
    sql = "DELETE FROM albums WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Album.new(results.first)

  end

  def self.find_all()
    sql = "SELECT * FROM albums"
    results = SqlRunner.run(sql)
    return results.map {|album| Album.new(album)}
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    results = SqlRunner.run(sql, values)
    return Artist.new(results.first)
  end
end
