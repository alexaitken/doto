require 'spec_helper'

describe Todo do

     it { should ensure_length_of(:description).
                    is_at_least(1).
                    is_at_most(500) }
  
  
end
