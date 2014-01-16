App.ApplicationAdapter = DS.RESTAdapter.extend()

DS.RESTAdapter.reopen
  host: 'http://thisisthenight-data.herokuapp.com'
#  host: 'http://localhost:3000'
  ajax: (url, method, hash) ->
    hash ?= {}
    hash.crossDomain = true
    hash.xhrFields =
      withCredentials: true
    return this._super(url, method, hash)