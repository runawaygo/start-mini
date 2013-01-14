class Star.Blog extends Backbone.Model

class Star.BlogCollection extends Backbone.Collection
  model: Star.Blog
  sync:(method, collection, options)->
    if method is "read"
      $.getJSON('/news',(data)->
        options.success(collection, data.channel.item, options)
      )