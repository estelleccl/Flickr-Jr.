class User < ActiveRecord::Base
  has_many :albums
  has_many :photos

  def self.authenticate(username, password)
    # if email and password correspond to a valid user, return that user
    # otherwise, return nil
    user = self.find_by username: username #find_by can't use count
    if !user.nil?
      if user.password == password
        return user
      end
    end
    return nil
  end

end
