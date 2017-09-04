class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :brand, :description, :cost, :collection_id, :user_id, :purchase_date
  belongs_to :collection
end
