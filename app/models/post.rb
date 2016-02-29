class Post < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :user

  def post_type_enum
    PostType.pluck(:name, :id).to_h
  end
end
