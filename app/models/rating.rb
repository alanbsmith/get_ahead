class Rating < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader

  validates :name, :attachment, presence: true

  belongs_to :program

end