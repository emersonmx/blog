const path = require('path');
const themeDir = path.resolve(__dirname);

module.exports = {
    plugins: [
        require('postcss-import')({
            path: [
                path.resolve(themeDir, 'node_modules'),
                path.resolve(themeDir, 'assets/css')
            ]
        }),
        require('postcss-nested'),
        require('tailwindcss')(path.resolve(themeDir, 'tailwind.config.js')),
        require('autoprefixer'),
        ...(process.env.HUGO_ENVIRONMENT === 'production'
            ? [require('cssnano')]
            : [])
    ]
};
