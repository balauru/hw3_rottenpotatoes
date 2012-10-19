# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
     Fabricate(:movie, movie)
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  page.text =~ /#{e1}.*?#{e2}/
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(',').each do |rating|
    step %{I #{ uncheck ? "uncheck" : "check" } "ratings_#{rating.strip}"}
  end
end

When /I (un)?check all ratings/ do |uncheck|
  Movie.all_ratings.each do |rating|
    step %{I #{ uncheck ? "uncheck" : "check" } "ratings_#{rating.strip}"}
  end
end

Then /^I should see (no|all) movies?$/ do |see|
  Movie.select(:title).map(&:title).each do |movie|
    step %{I should#{see == "no" ? " not" : "" } see "#{movie}"}
  end
end