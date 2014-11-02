# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

require './candidates'

def find(id)
  @candidates.detect { |candidate| candidate[:id] == id.to_i }
end

def language_contains?(candidate, *req_languages)
  languages = get_languages(candidate)
  req_languages.each { |lang| return languages.include?(lang) }
end

def get_languages(candidate)
  candidate[:languages]
end

def experienced?(candidate)
  candidate[:years_of_experience] >= 2 
end

def github_points(candidate)
  candidate[:github_points] >= 100
end

def submit_date(candidate)
  candidate[:date_applied] > 15.day.ago.to_date
end

def min_age(candidate)
  candidate[:age] > 17
end


def qualified_candidates
  @candidates.select do |candidate|
    experienced?(candidate) && github_points(candidate) && min_age(candidate) && language_contains?(candidate, "Ruby", "Python") && submit_date(candidate)
  end
end

def ordered_by_qualifications(candidates)
  ordered_candidates = candidates.sort do |first_candidate, second_candidate|
     if first_candidate[:years_of_experience] == second_candidate[:years_of_experience] 
       second_candidate[:github_points] <=> first_candidate[:github_points]
    else
       second_candidate[:years_of_experience] <=> first_candidate[:years_of_experience]
    end
  end
end

