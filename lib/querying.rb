def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT Books.title, Books.year
  FROM Books
  JOIN Series
  ON Series.id = Books.series_id
  WHERE Series.id = 1
  ORDER BY Books.year;"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT Characters.name, Characters.motto
   FROM Characters
   GROUP BY Characters.name
   ORDER BY LENGTH(Characters.motto) DESC LIMIT 1;"
end


def select_value_and_count_of_most_prolific_species
  "SELECT Characters.species, COUNT(Characters.species)
  FROM Characters
  GROUP BY Characters.species
  ORDER BY Characters.species DESC LIMIT 1;"
end

def select_name_and_series_subgenres_of_authors
  "SELECT Authors.name, Subgenres.name
  FROM Authors
  JOIN Series
  ON Authors.id = Series.author_id
  JOIN Subgenres
  ON Series.subgenre_id = Subgenres.id
  GROUP BY Authors.name;
  "
end

def select_series_title_with_most_human_characters
  "SELECT Series.title
  FROM Series
  JOIN Books
  ON Series.id = Books.series_id
  JOIN character_books
  ON character_books.book_id = Books.id
  JOIN Characters
  ON character_books.character_id = characters.id
  WHERE Characters.species = 'human'
  GROUP BY Series.title LIMIT 1;
   "
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT Characters.name, COUNT(character_books.book_id) 
   FROM character_books
   JOIN characters
   ON Characters.id = character_books.character_id
   GROUP BY Characters.name
   ORDER BY COUNT(character_books.book_id) DESC, Characters.name ASC;
    "
end
