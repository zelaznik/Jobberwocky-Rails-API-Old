class JobApplicationSerializer < ActiveModel::Serializer
  attributes :id, :job_title, :url, :first_applied, :last_update
  has_one :company
  has_one :user
  has_one :status
end
