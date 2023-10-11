  belongs_to :user, foreign_key: 'author_id', counter_cache: true
  has_many :likes
  has_many :comments

