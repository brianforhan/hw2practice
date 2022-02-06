# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy
# - Movie data includes the movie title, year released, MPAA rating,
#   and director
# - A movie has a single director
# - A person can be the director of and/or play a role in a movie
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Execute the migration files to create the tables in the database. Add the
#   relevant association methods in each model. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids and
#   delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through it to display output similar to the following
#   sample "report". (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time, before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Christopher Nolan
# The Dark Knight        2008           PG-13  Christopher Nolan
# The Dark Knight Rises  2012           PG-13  Christopher Nolan

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

Movie.destroy_all
Person.destroy_all
Moviesv2.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model
# TODO!

# Insert data into your database that reflects the sample data shown above
# Do not use hard-coded foreign key IDs.
# TODO!


values = { Name: "Christian Bale"}
people = Person.new(values)
people.save

values = { Name: "Christopher Nolan"}
people = Person.new(values)
people.save

values = { Name: "Michael Caine"}
people = Person.new(values)
people.save

values = { Name: "Liam Neeson"}
people = Person.new(values)
people.save

values = { Name: "Katie Holmes"}
people = Person.new(values)
people.save

values = { Name: "Gary Oldman"}
people = Person.new(values)
people.save

values = { Name: "Heath Ledger"}
people = Person.new(values)
people.save

values = { Name: "Aaron Eckhart"}
people = Person.new(values)
people.save

values = { Name: "Maggie Gyllenhaal"}
people = Person.new(values)
people.save

values = { Name: "Tom Hardy"}
people = Person.new(values)
people.save

values = { Name: "Joseph Gordon-Levitt"}
people = Person.new(values)
people.save

values = { Name: "Anne Hathaway"}
people = Person.new(values)
people.save

director = Person.where({ Name: "Christopher Nolan" })[0]
director_id = director.read_attribute(:id)

cb = Person.where({ Name: "Christian Bale" })[0]
cb_id = cb.read_attribute(:id)

mc = Person.where({ Name: "Michael Caine" })[0]
mc_id = mc.read_attribute(:id)

ln = Person.where({ Name: "Liam Neeson" })[0]
ln_id = ln.read_attribute(:id)

kh = Person.where({ Name: "Katie Holmes" })[0]
kh_id = kh.read_attribute(:id)

go = Person.where({ Name: "Gary Oldman" })[0]
go_id = go.read_attribute(:id)

hl = Person.where({ Name: "Heath Ledger" })[0]
hl_id = hl.read_attribute(:id)

ae = Person.where({ Name: "Aaron Eckhart" })[0]
ae_id = ae.read_attribute(:id)

mg = Person.where({ Name: "Maggie Gyllenhaal" })[0]
mg_id = mg.read_attribute(:id)

th = Person.where({ Name: "Tom Hardy" })[0]
th_id = th.read_attribute(:id)

jgl = Person.where({ Name: "Joseph Gordon-Levitt" })[0]
jgl_id = jgl.read_attribute(:id)

ah = Person.where({ Name: "Anne Hathaway" })[0]
ah_id = ah.read_attribute(:id)

values = { title: "Batman Begins", year_released: "2005", rated: "PG-13", person_id: director_id}
moviesv2 = Moviesv2.new(values)
moviesv2.save

values = { title: "The Dark Knight", year_released: "2008", rated: "PG-13", person_id: director_id}
moviesv2 = Moviesv2.new(values)
moviesv2.save

values = { title: "The Dark Knight Rises", year_released: "2012", rated: "PG-13", person_id: director_id}
moviesv2 = Moviesv2.new(values)
moviesv2.save

bb = Moviesv2.where({ title: "Batman Begins" })[0]
bb_id = bb.read_attribute(:id)

dk = Moviesv2.where({ title: "The Dark Knight" })[0]
dk_id = dk.read_attribute(:id)

dkr = Moviesv2.where({ title: "The Dark Knight Rises" })[0]
dkr_id = dkr.read_attribute(:id)

values = { character_name: "Bruce Wayne", movie_id: bb_id, person_id: cb_id}
role = Role.new(values)
role.save

values = { character_name: "Bruce Wayne", movie_id: dk_id, person_id: cb_id}
role = Role.new(values)
role.save

values = { character_name: "Bruce Wayne", movie_id: dkr_id, person_id: cb_id}
role = Role.new(values)
role.save

values = { character_name: "Alfred", movie_id: bb_id, person_id: mc_id}
role = Role.new(values)
role.save

values = { character_name: "Alfred", movie_id: dk_id, person_id: mc_id}
role = Role.new(values)
role.save

values = { character_name: "Ra's Al Ghul", movie_id: bb_id, person_id: ln_id}
role = Role.new(values)
role.save

values = { character_name: "Rachel Dawes", movie_id: bb_id, person_id: kh_id}
role = Role.new(values)
role.save

values = { character_name: "Rachel Dawes", movie_id: dk_id, person_id: mg_id}
role = Role.new(values)
role.save

values = { character_name: "Commissioner Gordon", movie_id: bb_id, person_id: go_id}
role = Role.new(values)
role.save

values = { character_name: "Commissioner Gordon", movie_id: dkr_id, person_id: go_id}
role = Role.new(values)
role.save

values = { character_name: "Joker", movie_id: dk_id, person_id: hl_id}
role = Role.new(values)
role.save

values = { character_name: "Harvey Dent", movie_id: dk_id, person_id: ae_id}
role = Role.new(values)
role.save

values = { character_name: "Bane", movie_id: dk_id, person_id: th_id}
role = Role.new(values)
role.save

values = { character_name: "John Blake", movie_id: dkr_id, person_id: jgl_id}
role = Role.new(values)
role.save

values = { character_name: "Selina Kyle", movie_id: dkr_id, person_id: ah_id}
role = Role.new(values)
role.save


# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output
# TODO!



# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie
# TODO!
