# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) 
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients) LIT_FAN_WORKS HAS_MANY LIT_FAN_GENRES THROUGH LIT_FAN_WORK_LIT_FAN_GENRES
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity) "THROUGH": LIT_FAN_WORK_LIT_FAN_GENRES; USER SUBMITTABLE ATTRIBUTE: NAME
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) /LIT_FAN_AUTHORS/ALPHABETIZED
- [x] Include signup (how e.g. Devise) CUSTOM API
- [x] Include login (how e.g. Devise) CUSTOM API
- [x] Include logout (how e.g. Devise) CUSTOM METHOD
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) OMNIAUTH
- [x] Include nested resource show or index (URL e.g. users/2/recipes) LIT_FAN_AUTHORS/:1/LIT_FAN_WORKS
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients) LIT_FAN_AUTHORS/:1/LIT_FAN_WORKS/NEW
- [x] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
