require_relative( '../db/sql_runner' )

class Booking

  attr_reader( :id )
  attr_accessor( :class_id, :member_id)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @class_id = options['class_id'].to_i
    @member_id = options['member_id'].to_i
  end

  def save()
    sql = "INSERT INTO bookings
    (class_id, member_id)
    VALUES
    ($1, $2)
    RETURNING id"
    values = [@class_id, @member_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE bookings SET
    (class_id, member_id) = ($1, $2)
    where id = $3"
    values = [@class_id, @member_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM bookings where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM bookings"
    results = SqlRunner.run(sql)
    return results.map {|booking| Booking.new( booking )}
  end

  def self.delete_all
    sql = "DELETE FROM bookings"
    SqlRunner.run(sql)
  end

end
