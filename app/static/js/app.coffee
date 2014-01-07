#= require js/components/jquery/jquery.js
#= require js/components/handlebars/handlebars.js
#= require js/components/ember/ember.js
#= require js/components/ember-data/ember-data.js

#= require_self
#= require_tree ./../templates
#= require_tree ./common
#= require_tree ./nights

App = Ember.Application.create()