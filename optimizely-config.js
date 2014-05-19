// Generated by CoffeeScript 1.7.1
(function() {
  'use strict';
  define(['./experiment-utils'], function(util) {
    var optimizelyConfig;
    optimizelyConfig = function() {
      var activateExperimentWithCallback, isExperementActive;
      activateExperimentWithCallback = function(experimentName, notMatch, callback, callbackArgs) {
        if (util().isExperientMatch(experimentName, notMatch)) {
          return callback.apply(null, callbackArgs);
        }
      };
      isExperementActive = function(experimentName, notMatch) {
        return util().isExperientMatch(experimentName, notMatch);
      };
      return {
        activateExperimentWithCallback: activateExperimentWithCallback,
        isExperementActive: isExperementActive
      };
    };
    return optimizelyConfig;
  });

}).call(this);
