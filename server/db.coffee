Datastore = require('nedb')

db = {}

db.items = new Datastore
  filename: './data/items'
  autoload: true

module.exports = db
