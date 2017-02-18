'use strict';

const paths = {
    src: {
        root: './src',
        assets: './src/assets',
        js: './src/',
        stylus: './src/assets/stylus',
        img:          './src/assets/img',
        lib:          './src/assets/lib'
    },
    dst: {
        root:         './httpdocs',
        assets:       './httpdocs/assets',
        js:           './httpdocs/assets/js',
        css:          './httpdocs/assets/css',
        img:          './httpdocs/assets/img'
    }
};

module.exports = {
  paths: paths
};
