class Order < ActiveRecord::Base
  belongs_to :person
  belongs_to :supplier
end
