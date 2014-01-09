#= require js/components/jquery/jquery.js
#= require js/components/handlebars/handlebars.js
#= require js/components/ember/ember.js
#= require js/components/ember-data/ember-data.js
#= require js/components/underscore/underscore.js

#= require_self
#= require_tree ./../tmpl
#= require_tree ./common
#= require_tree ./nights

App = Ember.Application.create
  LOG_TRANSITIONS: true
  LOG_TRANSITIONS_INTERNAL: true
  LOG_ACTIVE_GENERATION: true
  LOG_VIEW_LOOKUPS: true