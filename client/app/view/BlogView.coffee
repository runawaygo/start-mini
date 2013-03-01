Star.BlogView = Backbone.View.extend
  tagName:'section'
  template:'''
      <h1>${title}</h1>
      <div>${description}</div>
  '''
  events:
    'click h1': "removeSelf"
  removeSelf:->
    @model.destroy()
    @remove()
  render:->
    @$el.html($.tmpl(@template, @model.toJSON()))
    @

Star.BlogListView = Backbone.View.extend
  tagName:'div'
  template:'''
    <div class="btn btn-primary" id="btn-more">5 more</div>
    <div class="content"></div>
    <div class="btn btn-primary" id="btn-refresh">Refresh</div>
  '''
  events:
    'click #btn-more':'more'
    'click #btn-refresh':'refresh'
  initialize:(@options)->
    @model = Star.blogCollection
    @listenTo(@model, 'reset', @addAll)
    @listenTo(@model, 'add', @addOne)
    @model.refresh()
    @
  addAll:->
    @$content.html('')
    @model.each(@addOne, @)
    @
  addOne:(model)->
    @$content.prepend(new Star.BlogView({model:model}).render().el)
    @
  more:-> @model.more()
  refresh:-> @model.refresh()
  render:->
    @$el.html(@template)
    @$content = @$el.find('.content')
    @