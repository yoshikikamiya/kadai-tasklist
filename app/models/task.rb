class Task < ApplicationRecord
    validates:content,presence: true, length:{macimum:255}
    validates :status,presence: true, length:{maximum:255}
end
