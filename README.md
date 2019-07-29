# README

Recommend ruby 2.6.1 BUT not required in Gemfile
Rails 6.0.0.beta3

## STEPS
  1. bundle install
  2. rspec spec
  3. rails s

Endpoint for testing in DEV

POST http://localhost:3000/convert

Tested with [POSTMAN](https://www.getpostman.com/)

### EXAMPLE JSON array
```JSON
[
  {
    "name": "John Snow",
    "age": 29,
    "height": 22
  },
  {
    "name": "Iron Man",
    "age": 39
  }
]
```
### CSV expected format

```CSV
name,age,height
John Snow,29,22
Iron Man,39,
```
