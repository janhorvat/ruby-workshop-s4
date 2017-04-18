class FullCatSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :name, :picture

  def picture
    object.picture.url
  end

end
