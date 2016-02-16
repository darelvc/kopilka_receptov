class Post < ActiveRecord::Base
	include TheComments::Commentable
	belongs_to :user

	has_attached_file :post_image, styles: { large: "780x585#", medium: "325x244#", small: "270x203#" }
	validates_attachment_content_type :post_image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	# Denormalization methods
  # Check the documentation for information on advanced usage
  def commentable_title
    "Undefined Post Title"
  end

  def commentable_url
    "#"
  end

  def commentable_state
    "published"
  end

end
