connect = require('connect')
require('coffee-script')

port = process.env.PORT || 8001
console.log("service run on " + port);

app = connect()
  .use(connect.logger({ format: ':method :url :status' }))
  .use(connect.bodyParser())
  .use(connect.query())
  .use(connect.cookieParser())
  .use(connect.session({ secret: 'superwolf' }))
  .use(connect.errorHandler({ dumpExceptions: true, showStack: true }))
  .use(connect.bodyParser())
  .use('/', connect.static(__dirname + '/client/', { maxAge: 0 }))
  .use('/client', connect.static(__dirname + '/client/', { maxAge: 0 }))
  .use('/news', (req,res)->
    data = require('./data/rss')
    res.end(JSON.stringify(data))
  )
  .use('/blogs', (req,res)->
    data = require('./data/rss')
    start = 0
    if req.query.lastId? then start = parseInt(req.query.lastId)
    res.end(JSON.stringify(data.channel.item[start...start+parseInt(req.query.pageSize)]))
  )
  .use('/chat', (req,res)->
    if req.method is 'POST'
      console.log 'Begin creating chat'

    res.end(JSON.stringify({id:'superwolf'}))
  )
  .listen(port)


