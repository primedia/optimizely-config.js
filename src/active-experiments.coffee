'use strict'
define [], ->

  collection = ->
    window.rentPathExperiments ?= load()
    (window.rentPathExperiments || {})

  exists = (experimentName, notMatch) ->
    soTestRegex      = new RegExp(experimentName, "i")
    soVariationRegex = new RegExp(notMatch, "i")

    for experiment, variation of collection()
      if (experiment.match(soTestRegex) and not variation.match(soVariationRegex))
        return true

    false

  load = ->
    return {} unless window.optimizely

    experiments        = {}
    optimizelyObj      = window.optimizely
    oData              = optimizelyObj.data
    oActiveExperiments = oData.state.activeExperiments
    allExperiments     = optimizelyObj.allExperiments

    for mExp in oActiveExperiments
      if allExperiments[mExp].enabled
        curTest = oData.experiments[mExp].name
        curVar  = oData.state.variationNamesMap[mExp]

        experiments[curTest] = curVar

    experiments

  exists: exists
