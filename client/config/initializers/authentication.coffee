Ember.Application.initializer
  name: 'authentication'
  initialize: (container, application) ->
    Ember.SimpleAuth.setup container, application,
      routeAfterLogin: 'admin'
      routeAfterLogout: 'index'
      loginRoute: 'login'
      serverTokenEndpoint: '/token'
      autoRefreshToken: false