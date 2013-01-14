class Star.BlogView extends Backbone.View
  tagName:'section'
  template:'''
      <h1>${title}</h1>
      <div>${description}</div>
  '''
  events:
    'click h1': "removeSelf"
  removeSelf:=>
    @remove()
  render:=>
    @$el.html($.tmpl(@template, @model.toJSON()))
    @

class Star.BlogListView extends Backbone.View
  tagName:'div'
  initialize:(@options)->
    @model = Star.blogCollection
    @model.on('reset', @addAll)
  addAll:=>
    @model.each(@addOne)
    @
  addOne:(model)=>
    @$el.append(new Star.BlogView({model:model}).render().el)
    @
  render:=>
    @