'use strict';

const gulp = require('gulp');
const runSequence = require('run-sequence');

gulp.task('build', (callback) => {
    runSequence(
        'call',
        ['build:css'],
        ['copy'],
        callback
    );
});

gulp.task('call', () => {
    console.log('build called.');
});

gulp.task('build:css', ['stylus']);

gulp.task('copy', ['copy']);
