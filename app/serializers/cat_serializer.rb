class CatSerializer < ActiveModel::Serializer
  attributes :name, :picture

  def picture
    object.picture.url
  end

end
