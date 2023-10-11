class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: true

  after_save :update_counter

  def update_counter
    post.update(likes_counter: post.likes.size)
  end
end
