class Alert < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :school
end
