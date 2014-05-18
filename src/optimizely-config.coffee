'use strict';
define ['./experiment-utils'], (util) ->
  # For use as a mixin
  optimizelyConfig = ->

    @activateExperimentWithCallback = (experimentName, notMatch, callback, callbackArgs) ->
      if util().isExperientMatch(experimentName, notMatch)
        return callback.apply(null, callbackArgs)

    @isExperementActive = (experimentName, notMatch) ->
      util().isExperientMatch(experimentName, notMatch)

    return {
      activateExperimentWithCallback: @activateExperimentWithCallback
      isExperementActive: @isExperementActive
    }

  return optimizelyConfig
