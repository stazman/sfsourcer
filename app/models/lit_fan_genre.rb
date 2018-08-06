class LitFanGenre < ApplicationRecord
    has_many :lit_fan_work_lit_fan_genres
    has_many :lit_fan_works, through: :lit_fan_work_lit_fan_genres
end
