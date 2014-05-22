'use strict'
define ['./active-experiments'], (activeExperiments) ->

  activateExperiment = (versionName, callback, callbackArgs) ->
    if activeExperiments.exists(versionName)
      return callback.apply(null, callbackArgs)

  isExperimentActive = (versionName) ->
    activeExperiments.exists(versionName)

  activateExperiment: activateExperiment
  isExperimentActive: isExperimentActive
