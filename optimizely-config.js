// Generated by CoffeeScript 1.7.1
(function() {
  'use strict';
  define(['./experiment-utils'], function(util) {
    var optimizelyConfig;
    optimizelyConfig = function() {
      this.activateExperimentWithCallback = function(experimentName, notMatch, callback, callbackArgs) {
        if (util().isExperientMatch(experimentName, notMatch)) {
          return callback.apply(null, callbackArgs);
        }
      };
      this.isExperementActive = function(experimentName, notMatch) {
        return util().isExperientMatch(experimentName, notMatch);
      };
      return {
        activateExperimentWithCallback: this.activateExperimentWithCallback,
        isExperementActive: this.isExperementActive
      };
    };
    return optimizelyConfig;
  });

}).call(this);
