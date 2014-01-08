App.Night = DS.Model.extend
  subject: DS.attr 'string'
  songs: DS.hasMany 'song', { async: true }
  scriptures: DS.hasMany 'scripture', { async: true }
  activities: DS.hasMany 'activity', { async: true }

App.Night.FIXTURES = [
  {
    id: 1
    subject: 'The Power of Example'
    songs: [1, 2]
    scriptures: [2, 3]
    activities: [1]
  },
  {
    id: 2
    subject: 'Keeping the Faith'
    songs: [2]
    scriptures: [1]
    activities: [2]
  },
  {
    id: 3
    subject: 'Old Testament Prophets'
    songs: [2, 3]
    scriptures: [2]
    activities: [1]
  },
  {
    id: 4
    subject: 'Christmas Messages'
    songs: [1, 3]
    scriptures: [1, 2, 3]
    activities: [1, 2]
  }
]