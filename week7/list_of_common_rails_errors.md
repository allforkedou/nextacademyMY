### Here is a list of common errors and suggested solutions:

Error: `ActiveRecord::StatementInvalid in SomeController#some_action Could not find table..`
Sol: Check if you already have a table and model for that controller

Error: `NoMethodError in SomeController#...`
Sol: Check if you have defined the method, and if you have, check your spelling

Error: `ActiveModel::MissingAttributeError in SomeController#...`
Sol: Check that you have that attribute or column in the said model. If you already have the attribute/column, check your spelling

Error: `MissingTemplate`
Sol: Check that you have the required view file

Error: `NoMethodError: undefined method 'each' for nil:NilClass`
Sol: 

A "NilClass" happens when our object has not been instantiated. Normally this happens when:

1. There are spelling mistakes in the attributes
2. The params are not passed in correctly
3. There are spelling mistakes in the variable name. For example, the variable was named as `@users` in the controller but in the views, the spelling was `@Users`

The best way to debug: `byebug`.

#Please add to the list here when you encounter any errors as you build your app. It will help you become faster with debugging :)