require_relative('../db/sql_runner')

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

  def delete()
    sql = "DELETE FROM albums WHERE id = $1"
    values = [@id]
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

end
