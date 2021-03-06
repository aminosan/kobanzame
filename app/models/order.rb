# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  user_id         :integer          not null
#  product_id      :integer          not null
#  title           :string(255)      not null
#  comment         :text(65535)
#  recipient_name  :string(255)      not null
#  tel             :string(255)      not null
#  postal_code     :integer          not null
#  address_1       :string(255)      not null
#  address_2       :string(255)      not null
#  shipping_type   :integer          not null
#  progress        :integer          not null
#  active          :boolean
#  created_user_id :integer
#  updated_user_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Order < ApplicationRecord
  # = Module & Configure
  enum progress: {
    ordered: 0,
    design_checking: 100,
    design_rejected: 110,
    design_accepted: 120,
    working: 200,
    work_stopped: 210,
    work_completed: 220,
    ship_preparing: 300,
    shipped: 310,
    canceled: 900,
  }

  enum shipping_type: {
    japanpost: 0,
    yamato: 1,
  }

  # = Association
  belongs_to :user
  belongs_to :product
  has_one :design, through: :product

  # = Validation
  # validates :title, presence: true, length: { maximum: 120 }
  # validates :comment, length: { maximum: 500 }
  # validate do
  # end

  # = Callback
  before_validation do
    self.progress ||= :ordered
    self.shipping_type ||= :japanpost
  end

  # = Instance method

  def can_cansel?
    ordered? || design_checking? || design_accepted? || work_stopped?
  end

  def design_image
    self.design.design_file
  end

  def shipping_address
    "〒#{postal_code} #{address_1} #{address_2} #{recipient_name} #{tel}"
  end

  # = Private method

  private
    def progress_transition(destination, allowed_progress = [])
    end

end
