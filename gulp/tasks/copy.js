'use strict';

const config = require('../config');
const gulp = require('gulp');
const ignore = require('gulp-ignore');

gulp.task('copy', ['copy:html']);

gulp.task('copy:html', () => {
  return gulp.src(config.paths.src.root + '/**/*.html')
    .pipe(gulp.dest(config.paths.dst.root));
});
