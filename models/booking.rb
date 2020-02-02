require_relative( '../db/sql_runner' )

class Booking

  attr_reader( :id )
  attr_accessor( :session_id, :member_id)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @session_id = options['session_id'].to_i
    @member_id = options['member_id'].to_i
  end

# Instance methods

  def save()
    sql = "INSERT INTO bookings
    (session_id, member_id)
    VALUES
    ($1, $2)
    RETURNING id"
    values = [@session_id, @member_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE bookings SET
    (session_id, member_id) = ($1, $2)
    where id = $3"
    values = [@session_id, @member_id, @id]
    SqlRunner.run(sql, values)
  end

  def booked_members()
    sql = "SELECT * FROM members
          INNER JOIN bookings ON bookings.member_id = members.id
          WHERE bookings.session_id = $1"
          values = [@id]
          results = SqlRunner.run(sql, values)
          return results.map{|member| Member.new( member )}
  end

  def sessions()
    sql = "SELECT * FROM sessions
    where id = $1"
    values = [@session_id]
    results = SqlRunner.run(sql, values)
    return Session.new(results.first)
  end

    # Class methods

  def self.all()
    sql = "SELECT * FROM bookings"
    results = SqlRunner.run(sql)
    return results.map {|booking| Booking.new( booking )}
  end

  def self.delete(id)
    sql = "DELETE FROM bookings where id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM bookings"
    SqlRunner.run(sql)
  end

  def self.find ( id )
    sql = "SELECT * FROM bookings
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Booking.new (results.first )
  end

  def self.members(id)
    sql = "SELECT members.* FROM members
    INNER JOIN bookings.member_id = members.id
    WHERE session_id = $1"
    results = SqlRunner.run(sql, values)
    return results.map {|member| Member.new(member)}
  end

end
