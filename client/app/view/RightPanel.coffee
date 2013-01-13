class Star.RightPanel extends Backbone.View
	el: $("#right-panel")		
	initialize:(@option)->
		super(@option)
		@initEvent()
	initEvent:->
		@option.eventBus.on('changeView',(e)=>
			@$('#right-panel-header').html(e)
		)