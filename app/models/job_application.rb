class JobApplication < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
  belongs_to :status
end
