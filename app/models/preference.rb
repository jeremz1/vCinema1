class Preference < ActiveRecord::Base
  
def self.get(setting)
  p = Preference.find(:first, :conditions => {:setting => setting})
  if p == nil then
    return ""
  else
    return p.value
  end
end

def self.set(setting, value)
  p = Preference.find(:first, :conditions => {:setting => setting})
  if p == nil then
    Preference.new(:setting => setting, :value => value).save
  else
    p.value = value
    p.save
  end
end
end
