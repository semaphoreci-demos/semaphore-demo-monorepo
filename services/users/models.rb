# frozen_string_literal: true

# In-Memory store for users.
class Users
  def self.init
    @db = []
  end

  def self.list_all
    @db
  end

  def self.add(name)
    @db << { id: @db.count.to_i, name: name }
  end

  def self.clear!
    @db = []
  end
end
