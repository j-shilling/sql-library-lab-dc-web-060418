def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT title, year FROM books WHERE series_id = 1"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto FROM characters ORDER BY LENGTH(motto) DESC LIMIT 1"
end

def select_value_and_count_of_most_prolific_species
  "SELECT species, COUNT(species) FROM characters GROUP BY species ORDER BY COUNT(species) DESC LIMIT 1"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name
   FROM (authors INNER JOIN series ON series.author_id = authors.id) INNER JOIN subgenres ON series.subgenre_id = subgenres.id"
end

def select_series_title_with_most_human_characters
  "SELECT series.title
   FROM series INNER JOIN (SELECT series_id, COUNT(species) FROM characters GROUP BY series_id HAVING species = 'human') ON series.id = series_id"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, nbooks
   FROM characters INNER JOIN (SELECT character_id, COUNT(book_id) AS nbooks FROM character_books GROUP BY character_id) ON characters.id = character_id
   ORDER BY nbooks DESC, characters.name"
end
