Star.SendChatForm = Backbone.View.extend
  tagName:'form'
  template:'''
      <textarea name='content' style='width:100%;height:200px;'></textarea>
      <div class="btn btn-primary send-btn">Send</div>
  '''
  events:
    'click .send-btn': "sendMessage"
  sendMessage:->
    chat = new Star.Chat(@$el.serializeObject())
    chat.save null, success:-> console.log chat.toJSON()
    @
  render:->
    @$el.html(@template)
    @