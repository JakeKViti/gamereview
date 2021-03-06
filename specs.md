# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project (Project is built with Rails)
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) (a has_many relationship is found in the game and user models) 
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User) (a belongs_to relationship is found in the review model)
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients) (a has_many through relationship is found in the game and user models)
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients) (a has_many through relationship is found in the game, user, and review models)
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity) (the review part of the relationship can be given a "title", "body", and "rating")
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) (there are various validations found in the game, user, and review models)
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) (There is a scope method in the game and review models)
- [x] Include signup (There is a signup method in the user controller)
- [x] Include login (There is a login method in the session controller)
- [x] Include logout (There is a logout method in the session controller)
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) (OmniAuth uses FaceBook as a third party login)
- [x] Include nested resource show or index (URL e.g. users/2/recipes)  (The nested show is games/:id/reviews/:id and users/:id/reviews/:id)
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new) (The nested "new" form is found here games/:id/reviews/new)
- [x] Include form display of validation errors (form URL e.g. /recipes/new) (All the forms have validation errors to show what the site won't accept)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate