class User < ActiveRecord::Base
  has_many :sales
  has_many :staff_events
  
  validates_length_of  :username,  :within  =>  3..40 
  #validates_length_of  :pin,  :is  =>  5 
  #validates_presence_of  :first_name, :last_name, :username, :pin,  :pin_confirmation,  :salt
  validates_uniqueness_of  :username
  #validates_confirmation_of  :pin
  #validates_numericality_of :pin
  
  attr_protected  :id
  attr_accessor  :password,  :password_confirmation 
  
def pin=(p)
  @pin = p
  self.hashed_pin = Digest::SHA1.hexdigest(@pin)
end

def admin_password=(p)
  @admin_password = p
  self.hashed_admin_password = Digest::SHA1.hexdigest(@admin_password)
end

def pin
  ""
end

def self.authenticate(username,  pin) 
 u=find(:first,  :conditions=>["username  =  ?",  username]) 
   return  nil  if  u.nil? 
   return  u  if  Digest::SHA1.hexdigest(pin) == u.hashed_pin 
   nil 
end

def self.authenticate_admin(username, password)
  u = find(:first, :conditions=> ["username = ?", username])
  return nil if u.nil?
  return u if Digest::SHA1.hexdigest(password) == u.hashed_admin_password
end
 
def self.get_recent(current_user)
  us = User.find(:all)
  
  for i in 0..(us.size - 1)
    if (us[i].id == current_user.id) or (us[i].last_login == nil or (us[i].last_login <=> 10.minutes.ago) == -1) then
      us[i] = nil
    end
  end
  us.compact!
  us.sort! {|a,b| 
    b.last_login <=> a.last_login
  }
  us.unshift(current_user)
   
  if us.size > 3
    us = [us[0], us[1],us[2]]
  end
 
  us.sort! {|a,b| 
    a.last_name <=> b.last_name
  }

  us
end

def is_admin
  return hashed_admin_password != nil
end
 
def full_name
   first_name + " " + last_name
end
 
def initials
   first_name[0,1] + ". " + last_name
end

def is_clocked_in
  events = self.staff_events.sort {|a,b| b.time <=> a.time}
  return false if events.size == 0
  
  return (events[0].class.to_s == "ClockIn")
end

def clock_in
  clock_out if is_clocked_in
  ClockIn.new(:user_id => self.id, :time => Time.now).save
end

def clock_out
  if is_clocked_in then
    ClockOut.new(:user_id => self.id, :time => Time.now).save
  end
end

end
