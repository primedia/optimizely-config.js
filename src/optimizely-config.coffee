'use strict';
define ['./active-experiments'], (activeExperiments) ->
  # For use as a mixin
  optimizelyConfig = ->

    activateExperiment = (experimentName, notMatch, callback, callbackArgs) ->
      if activeExperiments().isExperimentMatch(experimentName, notMatch)
        return callback.apply(null, callbackArgs)

    isExperimentActive = (experimentName, notMatch) ->
      activeExperiments().isExperimentMatch(experimentName, notMatch)

    return {
      activateExperiment: activateExperiment
      isExperimentActive: isExperimentActive
    }

  return optimizelyConfig
