// Generated by CoffeeScript 1.7.1
(function() {
  'use strict';
  define(['./active-experiments'], function(activeExperiments) {
    var optimizelyConfig;
    optimizelyConfig = function() {
      var activateExperiment, isExperementActive;
      activateExperiment = function(experimentName, notMatch, callback, callbackArgs) {
        if (activeExperiments().isExperientMatch(experimentName, notMatch)) {
          return callback.apply(null, callbackArgs);
        }
      };
      isExperementActive = function(experimentName, notMatch) {
        return activeExperiments().isExperientMatch(experimentName, notMatch);
      };
      return {
        activateExperiment: activateExperiment,
        isExperementActive: isExperementActive
      };
    };
    return optimizelyConfig;
  });

}).call(this);
