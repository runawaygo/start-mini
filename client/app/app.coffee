$(->
  LeftPanel = Star.LeftPanel
  RightPanel = Star.RightPanel
  blogCollection = Star.blogCollection = new Star.BlogCollection()

  leftPanel = new LeftPanel({eventBus:Star.eventBus})
  leftPanel.render()

  rightPanel = new RightPanel({eventBus:Star.eventBus})
  rightPanel.render()
)