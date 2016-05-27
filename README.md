# Materialize::Form

This is a generator gem for [SimpleForm](https://github.com/plataformatec/simple_form) to make it works with [MaterializeCSS](http://materializecss.com/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simple_form', "~> 3.2.1"
gem 'materialize-sass', "~> 0.97.6"
gem 'materialize-form'
```

And then run the bundler and restart your server to make the files available through the pipeline:
```console
$ bundle install
```

Run the generator:
```console
$ rails generate simple_form:materialize:install
```

Import Materialize Form javascript in `app/assets/javascripts/application.js`:

```js
//= require jquery
//= require materialize-sprockets
//= require materialize-form

$(document).ready(function() {
  window.materializeForm.init()
});
```

Import Materialize styles in `app/assets/stylesheets/application.scss`:

```scss
@import "materialize";
```

**NOTE:** If you have just generated a new Rails application, it  may come with a `.css` file instead. If this file exists, it will be served instead of Sass, so remove it.

```console
$ rm app/assets/stylesheets/application.css
```

## Usage
### Assume you are using SLIM

To start using Materialize Form you just have to use the helper it provides:

```slim
= simple_form_for @user do |f|  
  .row
    = f.input :name, wrapper_html: { class: 'm6 s12' }

  = f.button :submit
```

#### Selectbox

```slim
  = f.input :gender, include_blank: 'Select your gender', wrapper_html: { class: 'm6 s12' }
```

#### File Input

File input will be generated automatically if the type of the field is attachment.

```slim
  = f.input :avatar, wrapper_html: { class: 'm6 s12' }
```

#### Date Input

Date picker will be generated automatically if the type of the field is date.

```slim
  = f.input :dob, wrapper_html: { class: 'm6 s12' }
```

#### Checkboxes
```slim
  = f.input :hobbies, as: :check_boxes, wrapper_html: { class: 'm6 s12' }
```

#### Multi-Selectbox
```slim
  = f.input :hobbies,  include_blank: 'What are your hobbies?', wrapper_html: { class: 'm6 s12' }
```

#### Toggle Boolean
```slim
  = f.input :featured, wrapper_html: { class: 'm6 s12' }
```

#### Boolean
```slim
  = f.input :featured, wrapper: :materialize_boolean, wrapper_html: { class: 'm6 s12 ' }
```

#### Radio Buttons
```slim
  = f.input :featured, as: :radio_buttons, wrapper_html: { class: 'm6 s12' }
```

## Working with [Nested Form](https://github.com/ryanb/nested_form)

In `app/assets/javascripts/application.js`:

```js
$(document).on('nested:fieldAdded', function(event){
  window.materializeForm.init()
})
```

# Example:
```slim
= simple_nested_form_for @category do |category_form|  
  .row
    = category_form.input :title, wrapper_html: { class: 'm6 s12' }
    = category_form.input :picture, wrapper_html: { class: 'm6 s12' }

  #articles.row
    = category_form.simple_fields_for :articles do |article_form|
      .col.s12.m6
        .row
          = article_form.input :title, wrapper_html: { class: 'm6 s12'' }
          = article_form.input :picture, wrapper_html: { class: 'm6 s12'' }
        .row
          = article_form.input :content, wrapper_html: { class: 's12' }

  .right-align
    = category_form.link_to_add "Add an article", :articles, class: 'btn', data: {target: "#articles"}
  = category_form.button :submit
```
