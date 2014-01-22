App.Activity = DS.Model.extend
  description: DS.attr 'string'

  shortDescription: (->
    shortLen = 50
    desc = @get 'description'
    if desc.length > shortLen then "#{desc.substring(0, shortLen)} ..." else desc
  ).property 'description'

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