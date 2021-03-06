class JourneySerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :title
  has_many :locations, serializer: LocationSerializer
end
