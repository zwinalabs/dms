class Ged < ActiveRecord::Base
  # Class used to represent the relations of an issue
  belongs_to :issue, :foreign_key => :issue_id
  belongs_to :user , :foreign_key => :user_id
  attr_accessible :url
  attr_accessible :title

end
