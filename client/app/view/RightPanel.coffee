Star.RightPanel = Backbone.View.extend
  el: $("#right-panel")		

  initialize:(@option)->
    @blogListView = new Star.BlogListView
    @initEvent()
  initEvent:->
    @option.eventBus.on('changeView',(e)=>
      @$('#right-panel-header').html(e)
    )
  render:->
    @$el.append(@blogListView.render().el)
    blv = new Star.BlogListView
    $('#middle-panel').append(blv.render().el)
    scf = new Star.SendChatForm
    $('#middle-panel').prepend(scf.render().el)
    @