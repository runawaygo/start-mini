Star.Blog = Backbone.Model.extend({})

Star.BlogCollection = Backbone.Collection.extend
  model: Star.Blog
  url: '/blogs'
  pageSize:3
  refresh:->
    @fetch
      update: false
      data:
        pageSize: @pageSize

  more:->
    @fetch
      update: true
      add:true
      merge:true
      remove:false
      data:
        pageSize: @pageSize
        lastId: @length