class Kid < ActiveRecord::Base
    belongs_to :parent

    accepts_nested_attributes_for :parent

    def parents
        self.parent.family_name
    end
    
    def service_time
        self.parent.service_time
    end

    def parents_phone
        self.parent.phone
    end

    
end