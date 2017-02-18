'use strict';

const config = require('../config');
const gulp = require('gulp');
const runSequence = require('run-sequence');

gulp.task('default', (callback) => {
    runSequence(
        'build',
        ['serve', 'watch'],
        callback
    );
});
