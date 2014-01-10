#= require components/jquery/jquery.js
#= require components/handlebars/handlebars.js
#= require components/ember/ember.js
#= require components/ember-data/ember-data.js
#= require components/ember-simple-auth/ember-simple-auth.js
#= require components/underscore/underscore.js

#= require_tree ./config/initializers
#= require_self
#= require_tree ./config

#= require_tree ./tmpl
#= require_tree ./common

#= require_tree ./auth
#= require_tree ./admin
#= require_tree ./nights
#= require_tree ./songs

App = Ember.Application.create
  LOG_TRANSITIONS: true
  LOG_TRANSITIONS_INTERNAL: true
  LOG_ACTIVE_GENERATION: true
  LOG_VIEW_LOOKUPS: true