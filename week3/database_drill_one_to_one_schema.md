
Time
~ 30 minutes
Learning Goals	
Understanding one-to-one database relationships
One-to-one relationships are easy to understand, but it’s hard to see when to use one. We recommend that you solve the one-to-many challenge first, before moving into the one-to-one relationships.

An example of a one-to-one relationship is my connection to my liver. I have a liver, and my liver belongs only to me. We’ll ignore the world of conjoined twins, for now.

A more practical example might be a site that optionally lets a user connect his/her profile in an app. It might look like this:

One-to-One-Diagram

The user_id field might be NULL, which is a special value that signifies “nothing.” In this case, a NULL value in the user_id column means “this user hasn’t connected their profile to user login account.”

You can see from the way this is designed, a user can have at most one user profile, and the users table doesn’t reference the profiles table at all. This would be an example of a one-to-one relationship.

Of course, you could move all the fields in the profiles table directly into the users table.This is true of any one-to-one relationship, which is why it’s hard to see when to use one.The rule of thumb is this: if you have a logical grouping of fields which can all optionally be NULL,it’s a good idea to split those fields out into a separate table in a one-to-one relationship.

Objectives
Design the schema
Model the relationship between the users and facebook_accounts.

Use SQL Schema Designer, recreate this table yourself. When you are done, take a screenshot of your final schema design, and save it in your laptop for future reference. If you feel unsure about your database design, please feel free to check with a mentor.
