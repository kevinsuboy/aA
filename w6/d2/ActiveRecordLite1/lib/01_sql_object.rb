require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
    col = DBConnection.execute2(<<-SQL)
      select * from #{self.table_name}
      limit 0
    SQL
    @columns = col[0].map!(&:to_sym)
  end

  def self.finalize!
      self.columns.each do |name|
        define_method(name) do
          self.attributes[name]
        end

        define_method("#{name}=") do |value|
          self.attributes[name] = value
        end
      end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= self.name.tableize
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
      select * from #{self.table_name}
    SQL
    self.parse_all(results)
  end

  def self.parse_all(results)
    results.map{|r| self.new(r)}
  end

  def self.find(id)
    # p id
    db = DBConnection.execute(<<-SQL, id)
      select #{self.table_name}.* from #{self.table_name}
      where #{self.table_name}.id = ?
    SQL
    return nil if db.empty? 
    self.parse_all(db).first
  end

  def initialize(params = {})
    params.each do |attr_name, value|
      attr_name = attr_name.to_sym
      if self.class.columns.include?(attr_name)
        self.send("#{attr_name}=", value)
      else
        raise "unknown attribute '#{attr_name}'"
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.class.columns.map{|v| self.send(v)}
  end

  def insert
    columns = self.class.columns.drop(1)
    col_names = columns.join(",")
    question_marks = Array.new(columns.count,"?").join(",")
    DBConnection.execute(<<-SQL, *attribute_values.drop(1))
      insert into 
      #{self.class.table_name} (#{col_names})
      values 
      (#{question_marks})
    SQL
    self.id = DBConnection.last_insert_row_id
  end

  def update
    columns = self.class.columns.drop(1)
    set = columns.map!{|m|"#{m} = ?"}.join(", ")
    DBConnection.execute(<<-SQL,*attribute_values.drop(1),self.id)
      update #{self.class.table_name}
      set #{set}
      where #{self.class.table_name}.id = ?
    SQL
  end

  def save
    if self.id
      self.update
    else
      self.insert
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  p DBConnection.execute2(<<-SQL)
    select *
    from cats
  SQL
end
