class Task < ApplicationRecord
    validates:content,presence: true, length:{macimum:255}
end
