require_relative( '../db/sql_runner' )

class Class

attr_reader( :id,)
attr_accessor( :name, :genre, :capacity)

def initalize( options )
  @id = options['id'].to_i if options['id']
  @name = options['name']
  @genre = options['genre'].to_i
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

def self.all()
  sql = "SELECT * FROM classes"
  results = SqlRunner.run(sql)
  return results.map( |booking| Booking.new( booking ))
end

def self.delete_all
  sql = "DELETE FROM classes"
  SqlRunner.new( sql )
end

end
