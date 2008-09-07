require "active_record"
require "active_support"

# Utilties
require "searchgasm/version"
require "searchgasm/config"
require "searchgasm/utilities"

# ActiveRecord
require "searchgasm/active_record/base"
require "searchgasm/active_record/associations"

# Search
require "searchgasm/search/ordering"
require "searchgasm/search/pagination"
require "searchgasm/search/conditions"
require "searchgasm/search/base"
require "searchgasm/search/protection"

# Conditions
require "searchgasm/conditions/protection"
require "searchgasm/conditions/base"

# Condition
require "searchgasm/condition/base"
require "searchgasm/condition/begins_with"
require "searchgasm/condition/contains"
require "searchgasm/condition/does_not_equal"
require "searchgasm/condition/ends_with"
require "searchgasm/condition/equals"
require "searchgasm/condition/greater_than"
require "searchgasm/condition/greater_than_or_equal_to"
require "searchgasm/condition/keywords"
require "searchgasm/condition/less_than"
require "searchgasm/condition/less_than_or_equal_to"
require "searchgasm/condition/tree"
require "searchgasm/condition/child_of"
require "searchgasm/condition/descendant_of"
require "searchgasm/condition/inclusive_descendant_of"
require "searchgasm/condition/sibling_of"

# Helpers
require "searchgasm/helpers/utilities_helper"
require "searchgasm/helpers/form_helper"
require "searchgasm/helpers/search_helper"

# Lets do it!
module Searchgasm
  module Search
    class Base
      include Conditions
      include Ordering
      include Pagination
      include Protection
    end
  end
  
  module Conditions
    class Base
      include Protection
    end
    
    [:begins_with, :child_of, :contains, :descendant_of, :does_not_equal, :ends_with, :equals, :greater_than, :greater_than_or_equal_to, :inclusive_descendant_of, :keywords, :less_than, :less_than_or_equal_to, :sibling_of].each do |condition|
      Base.register_condition("Searchgasm::Condition::#{condition.to_s.camelize}".constantize)
    end
  end
end