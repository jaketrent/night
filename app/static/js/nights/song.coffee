App.Song = DS.Model.extend
  number: DS.attr 'number'
  title: DS.attr 'string'

App.Song.FIXTURES = [
  {
    id: 1
    number: 201
    title: 'Joy to the World'
  },
  {
    id: 2
    number: 202
    title: 'Oh Come All Ye Faithful'
  },
  {
    id: 2
    number: 193
    title: 'Once There Was a Snowman'
  }
]