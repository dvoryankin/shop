class Cart < ApplicationRecord
  belongs_to :user
  validates :user,    presence: true
  validates :user_id, uniqueness: true

  has_many :positions
  has_many :items, through: :positions

  has_and_belongs_to_many :items

  def add_item(i)
    if items.include?(i)
      positions.where(item_id: i.id).first.increment!(:quantity)
    else
      positions.create(item: i, quantity: 1)
    end
  end

  def remove_position(position_to_remove_id)
    positions.where(item_id: position_to_remove_id).first.try(:destroy)
  end

  def remove_item(i)
    if items.include?(i)
      positions.where(item_id: i.id).first.decrement!(:quantity)
    else
      positions.delete(item: i, quantity: 1)
    end
  end
end
