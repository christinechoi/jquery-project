class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :brand, :description, :cost, :collection_id, :user_id
end
