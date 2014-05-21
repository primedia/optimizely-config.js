describe "activeExperiments", ->

  activeExperiments  = null
  fakeOptimizelyData = null
  specHelper = null

  beforeEach ->
    require ['../../active-experiments', '../helpers/optimizelyHelper'], (_activeExperiments, _specHelper) ->
      activeExperiments = _activeExperiments
      specHelper = _specHelper

  beforeEach ->
    spy = spyOn(window, "optimizely").andReturn specHelper.optimizelyData

  describe '#collection', ->
    it 'should collect experiments', ->
      experiments = {}
      activeExperiments.collection()
      expects(window.rentPathExperiments).toEqual experiments


