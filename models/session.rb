require_relative( '../db/sql_runner' )

class Session

  attr_reader( :id,)
  attr_accessor( :name, :genre, :capacity)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @genre = options['genre']
    @capacity = options['capacity'].to_i
  end

# Instance methods

  def save()
    sql = "INSERT INTO sessions
    (name, genre, capacity)
    VALUES
    ($1, $2, $3)
    RETURNING id"
    values = [@name, @genre, @capacity]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE sessions SET
    (name, genre, capacity) = ($1, $2, $3)
    where id = $4"
    values = [@name, @genre, @capacity, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM sessions where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def members()
    sql = "SELECT * FROM members
          INNER JOIN bookings on bookings.member_id = member.id
          WHERE bookings.session_id = $1"
          values = [@id]
          results = SqlRunner.run(sql, values)
          return results.map{|session| Session.new( session )}
        end

  # Class methods

  def self.all()
    sql = "SELECT * FROM sessions"
    results = SqlRunner.run(sql)
    return results.map {|booking| Booking.new( booking )}
  end

  def self.delete_all
    sql = "DELETE FROM sessions"
    SqlRunner.run( sql )
  end

end
