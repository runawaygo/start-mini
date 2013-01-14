class Star.RightPanel extends Backbone.View
  el: $("#right-panel")		
  initialize:(@option)->
    super(@option)
    @blogListView = new Star.BlogListView
    @initEvent()
  initEvent:->
    @option.eventBus.on('changeView',(e)=>
      @$('#right-panel-header').html(e)
    )
  render:=>
    @$el.append(@blogListView.render().el)
    @