LeftPanel = Star.LeftPanel
RightPanel = Star.RightPanel

leftPanel = new LeftPanel({eventBus:Star.eventBus})
leftPanel.render()

rightPanel = new RightPanel({eventBus:Star.eventBus})
rightPanel.render()