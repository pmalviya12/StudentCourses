class Blog < ApplicationRecord
  belongs_to :student
  before_destroy :log_deletion

  private
  def log_deletion
    Rails.logger.info("Blog Destroyed")
  end
end
