class Book < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  # Though `copies` is a PrintedBook attribute, we define it in the base class
  # so we can render a proper form.
  has_many :copies, dependent: :destroy do
    def borrowables
      proxy_association.owner.copies.filter(&:'borrowable?')
    end
  end
  accepts_nested_attributes_for :copies, allow_destroy: true

  class << self
    def policy_class
      BookPolicy
    end
  end

  # Currently there's no need to define a view partial for both e-book and printed book
  # so in both cases we use the same partial.
  # This may change is the future.
  def to_partial_path
    'books/book'
  end
end
