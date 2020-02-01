require_relative( '../db/sql_runner' )

require_relative( '../db/sql_runner' )

class Member

attr_reader( :id,)
attr_accessor( :first_name, :last_name, :premium)

def initalize( options )
  @id = options['id'].to_i if options['id']
  @first_name = options['first_name']
  @last_name = options['last_name']
  @premium = options['premium']
end


def save()
  sql = "INSERT INTO members
  (first_name, last_name, premium)
  VALUES
  ($1, $2, $3)
  RETURNING id"
  values = [@first_name, @last_name, @genre]
  results = SqlRunner.run(sql, values)
  @id = results.first()['id'].to_i
end

def self.all()
  sql = "SELECT * FROM members"
  results = SqlRunner.run(sql)
  return results.map( |booking| Booking.new( booking ))
end

def self.delete_all
  sql = "DELETE FROM members"
  SqlRunner.new( sql )
end

end
