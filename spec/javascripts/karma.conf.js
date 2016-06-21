module.exports = function(config){
  config.set({

    basePath: '../',

    files: [
      'app/assets/bower_components/angular/angular.js',
      'app/assets/bower_components/angular-mocks/angular-mocks.js',
      'app/assets/bower_components/ngmap/build/scripts/ng-map.min.js',
      'app/assets/javascripts/*.js',
      'spec/javascripts/unit/*.js',
    ],

    autoWatch: true,
    frameworks: ['jasmine'],
    browsers: ['Chrome'],
    reporters: ['progress', 'coverage', 'coveralls'],

    coverageReporter: {
      type: 'lcov',
      dir: 'coverage/'
    },

    plugins: [
      'karma-chrome-launcher',
      'karma-firefox-launcher',
      'karma-jasmine',
      'karma-junit-reporter',
      'karma-phantomjs-launcher',
      'karma-coverage',
      'karma-coveralls'
    ],

    junitReporter: {
      outputFile: 'test_out/unit.xml',
      suite: 'unit'
    }
  });
};
