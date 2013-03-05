Star.RightPanel = Backbone.View.extend
  el: $("#right-panel")		

  initialize:(@option)->
    @blogListView = new Star.BlogListView
    @sendChatForm = new Star.SendChatForm
    @initEvent()
  initEvent:->
    @option.eventBus.on('changeView',(e)=>
      @$('#right-panel-header').html(e)
    )
  render:->
    @$el.append(@blogListView.render().el)
    @$el.append(@sendChatForm.render().el)
    @