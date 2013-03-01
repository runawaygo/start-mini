Star.LeftPanel = Backbone.View.extend
  el: $("#left-panel")    
  initialize:(@option)->
  events:
    "click a":'onNavItemlick'
  onNavItemlick:(e)=>
    @$('li.active').removeClass('active')
    @$(e.target).parent().addClass('active')
    @option.eventBus.trigger('changeView', e.target.href)
    @