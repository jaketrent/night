App.Activity = DS.Model.extend
  description: DS.attr 'string'

App.Activity.FIXTURES = [
  {
    id: 1
    description: 'Watch your kids run in circles, spinning really fast until they fall down.'
  },
  {
    id: 2
    description: 'Go to the library.'
  }
]