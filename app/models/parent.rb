class Parent < ActiveRecord::Base
    has_many :kids

    accepts_nested_attributes_for :kids
end

