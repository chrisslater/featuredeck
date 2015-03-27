Datastore = require('nedb')

db = {}

db.app = new Datastore
  filename: './data/app'
  autoload: true

module.exports = db
