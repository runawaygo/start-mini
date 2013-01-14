connect = require('connect')
require('coffee-script')

port = process.env.PORT || 8001
console.log("service run on " + port);

app = connect()
  .use(connect.logger({ format: ':method :url :status' }))
  .use(connect.bodyParser())
  .use(connect.cookieParser())
  .use(connect.session({ secret: 'superwolf' }))
  .use(connect.errorHandler({ dumpExceptions: true, showStack: true }))
  .use(connect.bodyParser())
  .use('/', connect.static(__dirname + '/client/'))
  .use('/client', connect.static(__dirname + '/client/'))
  .use('/news', (req,res)->
    data = require('./data/rss')
    res.end(JSON.stringify(data))
  )
  .use('/clip', (req,res)->

  )
  .listen(port)


