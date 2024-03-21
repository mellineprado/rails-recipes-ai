# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).


Recipe.destroy_all

Recipe.create(name: "Guacamole", ingredients: "avocado,cilantro,lime")
Recipe.create(name: "Ratatouille", ingredients: "eggplant,zucchini,bell pepper")
