class Star.LeftPanel extends Backbone.View
  el: $("#left-panel")    
  initialize:(@option)->
    super(@option)
  events:
    "click a":'onNavItemlick'
  onNavItemlick:(e)=>
    @$('li.active').removeClass('active')
    @$(e.target).parent().addClass('active')
    @option.eventBus.trigger('changeView', e.target.href)
    @