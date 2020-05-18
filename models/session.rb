require_relative( '../db/sql_runner' )

class Session

  attr_reader( :id,)
  attr_accessor( :name, :genre, :capacity, :session_time, :session_date)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @genre = options['genre']
    @capacity = options['capacity'].to_i
    @session_time = options['session_time']
    @session_date = options['session_date']
  end

  # Instance methods

# Define save function,
# include sql command indicating an insertion into the sessions table with the data of name,
# genre, capacity, session time and date.
# Assign these to value placeholders and return id.
# Assign the placeholders to the values defined in initialize
# Run the runner file with the sql and values inserted and push to results.
# Bring the id out from the results file (should be in the first index of the array) and convert to integer

  def save()
    sql = "INSERT INTO sessions
    (name, genre, capacity, session_time, session_date)
    VALUES
    ($1, $2, $3, $4, $5)
    RETURNING id"
    values = [@name, @genre, @capacity, @session_time, @session_date]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end


  def update()
    sql = "UPDATE sessions SET
    (name, genre, capacity, session_time, session_date) = ($1, $2, $3, $4, $5)
    where id = $6"
    values = [@name, @genre, @capacity, @session_time, @session_date, @id]
    SqlRunner.run(sql, values)
  end

  def booked_members()
    sql = "SELECT members.* FROM
    members INNER JOIN bookings
    ON bookings.member_id = members.id
    WHERE bookings.session_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    result = results.map{|member| Member.new( member )}
    return result
  end

  def reduce_capacity()
    @capacity -=1
  end

  def increase_capacity()
    @capacity +=1
  end

  def member()
    sql = "SELECT * FROM members WHERE id = $1"
    values=[@member_id]
    results = SqlRunner.run(sql, values)
    return Member.new(result.first)
  end

  # Class methods

  def self.all()
    sql = "SELECT * FROM sessions"
    results = SqlRunner.run(sql)
    return results.map {|session| Session.new( session )}
  end

  def self.delete(id)
    sql = "DELETE FROM sessions where id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM sessions"
    SqlRunner.run( sql )
  end

  def self.find ( id )
    sql = "SELECT * FROM sessions
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Session.new (results.first )
  end

end
