require 'active_model'

class Notification
  include ActiveModel::Model
  attr_accessor :from, :to, :subject, :body
end