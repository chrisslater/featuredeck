Datastore = require('nedb')

db = {}

db.app = new Datastore
  filename: '../data/app'
  autoload: true

db.features = new Datastore
  filename: '../data/features'
  autoload: true

module.exports = db
