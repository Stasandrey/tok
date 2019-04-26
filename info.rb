#!/usr/local/rvm/rubies/ruby-2.6.0/bin/ruby
module Info
require 'sqlite3'

class Ttable
  
  def initialize( db, tbl_name )
    @db = db
    @tbl_name = tbl_name
=begin
Format for table
daten   DATE
timen   TIME
energy  FLOAT
power   FLOAT
cosfi   FLOAT
=end    
    result = @db.execute <<-SQL
    CREATE TABLE IF NOT EXISTS '#{@tbl_name}' (
      daten DATE,
      timen TIME,
      energy FLOAT,
      power FLOAT,
      cosfi FLOAT
    ) 
    SQL
    puts result.to_s
  end
  
  def print( dateg, timeg, energyg, powerg, cosfig )
    @db.execute "insert into  #{@tbl_name} values( '#{dateg}',
       '#{timeg}', #{energyg}, #{powerg}, #{cosfig} )"
  end

end

def db_init( file_name )
  db_name = SQLite3::Database.new file_name
end

end
