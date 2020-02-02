require_relative( '../db/sql_runner' )

class Member

  attr_reader( :id,)
  attr_accessor( :first_name, :last_name, :premium)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @premium = options['premium']
  end

# Instance methods

  def save()
    sql = "INSERT INTO members
    (first_name, last_name, premium)
    VALUES
    ($1, $2, $3)
    RETURNING id"
    values = [@first_name, @last_name, @premium]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE members SET
    (first_name, last_name, premium) = ($1, $2, $3)
    where id = $4"
    values = [@first_name, @last_name, @premium, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM members where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def booked_sessions()
    sql = "SELECT * FROM sessions
          INNER JOIN bookings on bookings.session_id = session.id
          WHERE bookings.member_id = $1"
          values = [@id]
          results = SqlRunner.run(sql, values)
          return results.map{|session| Session.new( session )}
  end

  # Class methods

  def self.all()
    sql = "SELECT * FROM members"
    results = SqlRunner.run(sql)
    return results.map {|member| Member.new( member )}
  end

  def self.delete_all
    sql = "DELETE FROM members"
    SqlRunner.run(sql)
  end

  def self.find ( id )
    sql = "SELECT * FROM members
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Member.new (results.first )
  end
end
