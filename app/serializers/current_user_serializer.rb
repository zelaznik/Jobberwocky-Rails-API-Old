class CurrentUserSerializer < ActiveModel::Serializer
  attributes :id, :email, :created_at, :updated_at, :auth_token
  has_many :products, serializer: ProductOnlySerializer
end
