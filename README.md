# Instructions for coding test

You will need a desktop machine with Ruby 2.1.2 and Postgres installed. If
either of these are not possible, after cloning the repo make the necessary
changes to `Gemfile` and `config/database.yml`. The test does not depend
on any Ruby 2.1.x or database-specific code.

## To install

```
git clone git@github.com:evvnt/sep1-test.git
cd sep1-test
./bin/setup
```

## The exercise

In this exercise, you'll be cleaning up controller called
`ExpensesController`. This controller can do a few things:

* List out existing expenses for a user
* Filter expenses by amount and approval status
* Create a new expense
* Email an admin after expenses are created
* Change name or amount unapproved expenses
* Mark expenses as deleted

Your task is to refactor the controller code.

* All public methods should be as RESTful as possible
* Make sure the only logic that lives in your controller is related to handling
your requests and responses

You may add new classes of any description to assist you. Any new classes
should have accompanying tests.

Make sure all tests are passing by running:

`rake`

**There is no time limit for this test.**

_Test is based on an exercise provided on [Upcase by Thoughtbot](http://upcase.com/)._
