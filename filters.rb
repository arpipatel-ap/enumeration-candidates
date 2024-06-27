# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program
require './candidates'

def find(id)
  @candidates.each{ |candidate| return candidate if candidate[:id] == id }
  nil
  end
  
  def experienced?(candidate)
    candidate[:years_of_experience] >= 2
  end
  
  def qualified_candidates(candidates)
    qualified = []
    candidate.each do |candidate|
      if candidate[:years_of_experience] > 0 &&
        candidate[:github_points] >= 100 &&
        (candidate[:languages].include?("Ruby") || candidate[:languages].include?("Python")) &&
        candidate[:age] > 17 &&
        candidate[:applied_in_last_15_days]
        qualified << candidate
        end
      end
      qualified
  end

  def ordered_by_qualifications(candidates)

    candidates.sort_by do|candidate| [-candidate[:years_of_experience], -candidate[:github_points]] 
    end
  end
