require_relative( '../db/sql_runner' )

class Class

  attr_reader( :id,)
  attr_accessor( :name, :genre, :capacity)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @genre = options['genre']
    @capacity = options['capacity'].to_i
  end


  def save()
    sql = "INSERT INTO classes
    (name, genre, capacity)
    VALUES
    ($1, $2, $3)
    RETURNING id"
    values = [@name, @genre, @capacity]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE classes SET
    (name, genre, capacity) = ($1, $2, $3)
    where id = $4"
    values = [@name, @genre, @capacity, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM classes where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM classes"
    results = SqlRunner.run(sql)
    return results.map {|booking| Booking.new( booking )}
  end

  def self.delete_all
    sql = "DELETE FROM classes"
    SqlRunner.run( sql )
  end

end
