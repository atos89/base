'use strict';

const config = require('../config');
const gulp = require('gulp');
const stylus = require('gulp-stylus');
const ignore = require('gulp-ignore');
const plumber = require('gulp-plumber');
const notify = require('gulp-notify');
const rename = require('gulp-rename');

gulp.task('stylus', () => {
    return gulp.src(config.paths.src.stylus + '/main.styl')
    .pipe(ignore.exclude([
        '**/_*.styl'
    ]))
    .pipe(plumber({
        errorHandler: notify.onError('Error: <%= error.message %>')
    }))
    .pipe(stylus())
    .pipe(rename({
        basename: 'media',
        extname: '.css'
    }))
    .pipe(gulp.dest(config.paths.dst.css));
});
