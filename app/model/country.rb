require_relative '../../config/environment'


class Country < ActiveRecord::Base

  def self.rand_country
    rand_num = rand(Country.count)
    self.all[rand_num]
  end

end
