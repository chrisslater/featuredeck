# Vendor dependencies
gulp        = require('gulp')
gutil       = require('gulp-util')
source      = require('vinyl-source-stream')
watchify    = require('watchify')
browserify  = require('browserify')

reactify    = require('coffee-reactify')
livereload  = require('gulp-livereload')

require('coffee-react/register')

# Project dependencies
server      = require('./server/server')

entryFile = './client/client'
distPath = './public/js'
bundleName = 'bundle.js'

bArgs =
  cache: {}
  packageCache: {}
  fullPaths: true
  extensions: ['.cjsx', '.coffee']
  debug: true

bundler = watchify browserify(entryFile, bArgs)
bundler.transform(reactify)

bundle = () ->
  bundler.bundle()
    .on 'error', (err) ->
      gutil.log(err.message)
      @.emit('end')

    .pipe source(bundleName)
    .pipe gulp.dest(distPath)
    .pipe(livereload())

bundler.on('update', bundle)
bundler.on 'log', (msg) ->
  gutil.log msg

gulp.task 'develop', ['server'], () ->
  bundle()

gulp.task 'server', () ->
  server.start()
  livereload.listen()
