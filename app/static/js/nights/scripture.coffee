App.Scripture = DS.Model.extend
  reference: DS.attr 'string'

App.Scripture.FIXTURES = [
  {
    id: 1
    reference: '1 Corinthians 13:1'
  },
  {
    id: 2
    reference: 'Genesis 3:22'
  },
  {
    id: 3
    reference: '1 Nephi 3:17'
  }
]