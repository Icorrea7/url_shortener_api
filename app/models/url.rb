# == Schema Information
#
# Table name: urls
#
#  id             :integer          not null, primary key
#  long_url       :string
#  short          :string
#  complete_short :string
#  click_count    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  base_url       :string
#
class Url < ApplicationRecord
    validates :long_url, presence: true, on: :create 

    before_create :generate_short, :generate_complete_short

    private

    def generate_short
        self.short = SecureRandom.hex(3) if self.short.nil? || self.short.empty?
    end

    def generate_complete_short
        self.complete_short = "#{self.base_url}/#{short}"
    end
end
