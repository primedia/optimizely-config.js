'use strict'
define ['./active-experiments'], (activeExperiments) ->

  activateExperiment = (experimentName, notMatch, callback, callbackArgs) ->
    if activeExperiments.exists(experimentName, notMatch)
      return callback.apply(null, callbackArgs)

  isExperimentActive = (experimentName, notMatch) ->
    activeExperiments.exists(experimentName, notMatch)

  activateExperiment: activateExperiment
  isExperimentActive: isExperimentActive
